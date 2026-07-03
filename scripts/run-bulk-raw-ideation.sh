#!/usr/bin/env bash
set -euo pipefail

# =============================================================================
# run-bulk-raw-ideation.sh
#
# Overnight bulk raw ideation runner for Big Game Hunting.
# Generates DRAFT ONLY game-idea research artifacts via OpenAI-compatible
# Chat Completions endpoint. Defaults to OpenCode Go with deepseek-v4-flash.
# Never modifies source-of-truth files. Never commits generated artifacts.
#
# Usage:
#   OPENCODE_GO_API_KEY=<API_KEY> ./scripts/run-bulk-raw-ideation.sh
#   LLM_API_KEY=<API_KEY>        ./scripts/run-bulk-raw-ideation.sh
#
# Examples:
#   # Dry run — print what would be done without calling the API
#   DRY_RUN=1 ./scripts/run-bulk-raw-ideation.sh
#
#   # Small run — 2 batches of 20 concepts each
#   BATCHES=2 CONCEPTS_PER_BATCH=20 ./scripts/run-bulk-raw-ideation.sh
#
#   # Overnight run — 10 batches of 30 concepts, 10s gap between batches
#   BATCHES=10 CONCEPTS_PER_BATCH=30 SLEEP_SECONDS=10 \
#     ./scripts/run-bulk-raw-ideation.sh
#
#   # Force re-run of all batches (overwrite existing files)
#   FORCE=1 ./scripts/run-bulk-raw-ideation.sh
#
#   # Custom endpoint and model
#   LLM_BASE_URL="https://api.example.com/v1/chat/completions" \
#     MODEL="gpt-4o" \
#     LLM_API_KEY=<API_KEY> \
#     ./scripts/run-bulk-raw-ideation.sh
#
# Note:
# Bulk raw ideation uses DeepSeek V4 Flash in non-thinking mode because thinking
# mode can consume the output budget in reasoning_content and return empty content.
#
# Environment variables (all optional except OPENCODE_GO_API_KEY / LLM_API_KEY):
#   LLM_API_KEY           API key (takes precedence over OPENCODE_GO_API_KEY)
#   OPENCODE_GO_API_KEY   OpenCode Go API key (fallback)
#   LLM_BASE_URL          API endpoint (default: https://opencode.ai/zen/go/v1/chat/completions)
#   MODEL                 Model name (default: deepseek-v4-flash)
#   (thinking is always disabled — see Note above)
#   BATCHES               Number of batches (default: 5; range 3-10 for 100-300 concepts)
#   CONCEPTS_PER_BATCH    Concepts per batch (default: 30)
#   OUTPUT_DIR            Artifact output directory (default: artifacts/research)
#   SLEEP_SECONDS         Seconds between batches to avoid rate limits (default: 5)
#   MAX_RETRIES           Max API retries per batch (default: 3)
#   FORCE                 Set to 1 to overwrite existing batch files (default: 0)
#   DRY_RUN               Set to 1 to print actions without executing (default: 0)
# =============================================================================

# --- Configuration -----------------------------------------------------------

: "${LLM_BASE_URL:=https://opencode.ai/zen/go/v1/chat/completions}"
: "${MODEL:=deepseek-v4-flash}"
: "${BATCHES:=5}"
: "${CONCEPTS_PER_BATCH:=30}"
: "${OUTPUT_DIR:=artifacts/research}"
: "${SLEEP_SECONDS:=5}"
: "${MAX_RETRIES:=3}"
: "${FORCE:=0}"
: "${DRY_RUN:=0}"

# API key resolution: LLM_API_KEY > OPENCODE_GO_API_KEY > error
if [ -n "${LLM_API_KEY:-}" ]; then
  API_KEY="$LLM_API_KEY"
elif [ -n "${OPENCODE_GO_API_KEY:-}" ]; then
  API_KEY="$OPENCODE_GO_API_KEY"
else
  echo "ERROR: No API key found. Set LLM_API_KEY or OPENCODE_GO_API_KEY." >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROMPTS_DIR="${SCRIPT_DIR}/prompts"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

# Derived paths
TOTAL_CONCEPTS=$(( BATCHES * CONCEPTS_PER_BATCH ))
INDEX_FILE="${PROJECT_DIR}/${OUTPUT_DIR}/INDEX.md"

# Validate configuration
if [ "$BATCHES" -lt 1 ] || [ "$BATCHES" -gt 50 ]; then
  echo "ERROR: BATCHES must be between 1 and 50 (got $BATCHES)" >&2
  exit 1
fi
if [ "$CONCEPTS_PER_BATCH" -lt 1 ] || [ "$CONCEPTS_PER_BATCH" -gt 100 ]; then
  echo "ERROR: CONCEPTS_PER_BATCH must be between 1 and 100 (got $CONCEPTS_PER_BATCH)" >&2
  exit 1
fi

# Check required tools
for cmd in curl jq; do
  if ! command -v "$cmd" &>/dev/null; then
    echo "ERROR: Required tool '$cmd' not found. Please install it." >&2
    exit 1
  fi
done

# --- Context Files -----------------------------------------------------------
# These are read at runtime and injected into the system prompt so the LLM
# has full project context. Never modified by this script.

CONTEXT_FILES=(
  "${PROJECT_DIR}/GAME_TRUTH.md"
  "${PROJECT_DIR}/DESIGN_PRINCIPLES.md"
  "${PROJECT_DIR}/MODEL_WORKFLOW.md"
  "${PROJECT_DIR}/docs/design-gates.md"
  "${PROJECT_DIR}/docs/artifact-authority.md"
  "${PROJECT_DIR}/docs/artifact-conventions.md"
  "${PROJECT_DIR}/templates/research-artifact.md"
  "${PROJECT_DIR}/artifacts/research/0001-first-game-shape-research.md"
  "${PROJECT_DIR}/workflows/big-game-hunting-roadmap.md"
)

# --- Functions ----------------------------------------------------------------

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

warn() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] WARNING: $*" >&2
}

die() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERROR: $*" >&2
  exit 1
}

# Generate the next available artifact ID based on existing files in OUTPUT_DIR.
next_artifact_id() {
  local dir="$1"
  local max_id=0
  if [ -d "$dir" ]; then
    for f in "$dir"/[0-9][0-9][0-9][0-9]-*.md; do
      if [ -f "$f" ]; then
        local basename_f
        basename_f="$(basename "$f")"
        local num="${basename_f%%-*}"
        num=$((10#$num))
        if [ "$num" -gt "$max_id" ]; then
          max_id="$num"
        fi
      fi
    done
  fi
  printf "%04d" $((max_id + 1))
}

# Generate a URL-safe slug from a string
slugify() {
  echo "$1" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//;s/-$//'
}

# Read a prompt file and substitute template variables
interpolate_prompt() {
  local file="$1"
  local batch_number="$2"
  local concept_count="$3"
  local total_batches="$4"
  sed -e "s/{{BATCH_NUMBER}}/${batch_number}/g" \
      -e "s/{{CONCEPT_COUNT}}/${concept_count}/g" \
      -e "s/{{TOTAL_BATCHES}}/${total_batches}/g" \
      "$file"
}

# Build the system message: system instructions + project context from files
build_system_message() {
  local system_prompt
  system_prompt="$(cat "${PROMPTS_DIR}/bulk-raw-ideation-system.md")"

  echo "${system_prompt}"
  echo ""
  echo "---"
  echo ""
  echo "## Project Context"
  echo ""
  echo "The following files define the Big Game Hunting project. Read them carefully — your outputs must respect these constraints."
  echo ""

  local file
  for file in "${CONTEXT_FILES[@]}"; do
    if [ -f "$file" ]; then
      local rel_path="${file#"${PROJECT_DIR}/"}"
      echo "### ${rel_path}"
      echo ""
      cat "$file"
      echo ""
    else
      warn "Context file not found: ${file}"
    fi
  done
}

# Redact anything that looks like an API key from a string
redact_keys() {
  echo "$1" | sed 's/[A-Za-z0-9_-]\{20,\}/***/g'
}

# Save a failed response body to logs/ for debugging (API key redacted)
save_failed_response() {
  local body="$1"
  local suffix="$2"
  local log_dir="${PROJECT_DIR}/logs"
  mkdir -p "$log_dir"
  local dest="${log_dir}/failed-response-${suffix}.json"
  echo "$body" > "$dest"
  warn "Saved raw response to ${dest}"
}

# Call the LLM API with retry logic
call_llm() {
  local system_message="$1"
  local user_message="$2"
  local attempt=0
  local response_file=""
  local http_code

  while [ "$attempt" -lt "$MAX_RETRIES" ]; do
    attempt=$((attempt + 1))

    response_file="$(mktemp)"

    # Build JSON payload with jq to avoid heredoc nesting and quoting issues.
    # Bulk raw ideation uses DeepSeek V4 Flash in non-thinking mode because
    # thinking mode can consume the output budget in reasoning_content and
    # return empty content.
    local payload
    payload="$(jq -n \
      --arg model "$MODEL" \
      --arg system "$system_message" \
      --arg user "$user_message" \
      '{
        model: $model,
        messages: [
          {role: "system", content: $system},
          {role: "user", content: $user}
        ],
        temperature: 0.9,
        max_tokens: 8192,
        stream: false,
        thinking: {type: "disabled"}
      }'
    )"

    http_code="$(curl -s -o "$response_file" -w '%{http_code}' \
      "${LLM_BASE_URL}" \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer ${API_KEY}" \
      -d "$payload"
    )"

    local raw_body
    raw_body="$(cat "$response_file" 2>/dev/null || true)"

    if [ "$http_code" = "200" ]; then
      local content
      content="$(echo "$raw_body" | jq -r '.choices[0].message.content' 2>/dev/null || true)"
      rm -f "$response_file"

      if [ "$content" = "null" ] || [ -z "$content" ]; then
        local reasoning_content
        reasoning_content="$(echo "$raw_body" | jq -r '.choices[0].message.reasoning_content' 2>/dev/null || true)"
        if [ -n "$reasoning_content" ] && [ "$reasoning_content" != "null" ]; then
          warn "Received reasoning_content but empty content; thinking mode may still be enabled."
        fi
        local redacted_body
        redacted_body="$(redact_keys "$raw_body")"
        local ts
        ts="$(date '+%Y%m%d-%H%M%S')-attempt${attempt}"
        save_failed_response "$redacted_body" "$ts"
        local error_msg
        error_msg="$(echo "$raw_body" | jq -r '.error.message // "unknown error"' 2>/dev/null || echo "unknown")"
        if [ "$attempt" -lt "$MAX_RETRIES" ]; then
          local backoff=$(( attempt * 5 ))
          warn "Empty response (attempt $attempt/${MAX_RETRIES}). Retrying in ${backoff}s... Error: ${error_msg}"
          sleep "$backoff"
          continue
        else
          die "Empty response after ${MAX_RETRIES} attempts. Last error: ${error_msg}"
        fi
      fi
      echo "$content"
      return 0
    fi

    rm -f "$response_file"

    local redacted_body
    redacted_body="$(redact_keys "$raw_body")"
    local ts
    ts="$(date '+%Y%m%d-%H%M%S')-attempt${attempt}"
    save_failed_response "$redacted_body" "$ts"

    if [ "$attempt" -lt "$MAX_RETRIES" ]; then
      local backoff=$(( attempt * 5 ))
      warn "API call failed (HTTP $http_code, attempt $attempt/${MAX_RETRIES}). Retrying in ${backoff}s..."
      sleep "$backoff"
    else
      die "API call failed after ${MAX_RETRIES} attempts (HTTP ${http_code}). Response saved to logs/."
    fi
  done
}

# Generate a single batch artifact
generate_batch() {
  local batch_number="$1"
  local concept_count="$2"
  local total_batches="$3"
  local artifact_id="$4"
  local slug="$5"
  local output_file="$6"

  log "Batch ${batch_number}/${total_batches}: Generating ${concept_count} concepts (ID ${artifact_id})..."

  # Build messages
  local system_message
  system_message="$(build_system_message)"
  local user_message
  user_message="$(interpolate_prompt "${PROMPTS_DIR}/bulk-raw-ideation-user.md" \
    "${batch_number}" "${concept_count}" "${total_batches}")"

  if [ "$DRY_RUN" = "1" ]; then
    log "[DRY RUN] Would call LLM API with:"
    log "[DRY RUN]   URL: ${LLM_BASE_URL}"
    log "[DRY RUN]   Model: ${MODEL}"
    log "[DRY RUN]   Thinking: disabled"
    log "[DRY RUN]   System prompt: ${PROMPTS_DIR}/bulk-raw-ideation-system.md + project context"
    log "[DRY RUN]   User prompt: ${PROMPTS_DIR}/bulk-raw-ideation-user.md (batch ${batch_number}, ${concept_count} concepts)"
    log "[DRY RUN]   Context files (${#CONTEXT_FILES[@]}):"
    local cf
    for cf in "${CONTEXT_FILES[@]}"; do
      log "[DRY RUN]     ${cf#"${PROJECT_DIR}/"}"
    done
    log "[DRY RUN]   Output: ${output_file}"
    return 0
  fi

  local content
  content="$(call_llm "${system_message}" "${user_message}")"

  # Build artifact header
  cat > "$output_file" <<EOHEADER
# Bulk Raw Ideation Batch ${batch_number}: Game Concepts

ARTIFACT TYPE: Research Artifact
AUTHORITY: DRAFT ONLY — EXPLORATORY
STATUS: Draft
CREATED BY: ${MODEL} (bulk raw ideation runner via ${LLM_BASE_URL})
REVIEWED BY: (not yet reviewed)
DATE: $(date '+%Y-%m-%d')
RELATED TASK: Bulk raw ideation batch ${batch_number}/${total_batches}
SOURCE-OF-TRUTH FILES TOUCHED: (none — this artifact does not update project truth)

---

## Batch Metadata

- **Batch:** ${batch_number} of ${total_batches}
- **Concepts requested:** ${concept_count}
- **Model:** ${MODEL}
- **Endpoint:** ${LLM_BASE_URL}
- **Generated:** $(date '+%Y-%m-%d %H:%M:%S')
- **Total concepts across all batches (planned):** ${TOTAL_CONCEPTS}

## Concepts

EOHEADER

  echo "$content" >> "$output_file"

  log "Batch ${batch_number}: Wrote ${output_file}"
}

# Update the index file
update_index() {
  local batch_number="$1"
  local output_file="$2"
  local artifact_id="$3"

  if [ "$DRY_RUN" = "1" ]; then
    log "[DRY RUN] Would update index: ${INDEX_FILE}"
    return 0
  fi

  local batch_slug
  batch_slug="$(basename "$output_file")"

  if [ ! -f "$INDEX_FILE" ]; then
    cat > "$INDEX_FILE" <<EOINDEX
# Bulk Raw Ideation Index

AUTHORITY: DRAFT ONLY — EXPLORATORY
STATUS: Running index of bulk raw ideation artifacts
SOURCE-OF-TRUTH FILES TOUCHED: (none)

---

Generated $(date '+%Y-%m-%d %H:%M:%S') by \`scripts/run-bulk-raw-ideation.sh\`

| Batch | Artifact ID | File | Concepts | Date | Status |
|-------|-------------|------|----------|------|--------|
EOINDEX
  fi

  local date_str
  date_str="$(date '+%Y-%m-%d')"

  if grep -q "| ${batch_number} | ${artifact_id} |" "$INDEX_FILE" 2>/dev/null; then
    log "Index entry for batch ${batch_number} already exists — skipping"
  else
    echo "| ${batch_number} | ${artifact_id} | ${batch_slug} | ${CONCEPTS_PER_BATCH} | ${date_str} | DRAFT |" >> "$INDEX_FILE"
    log "Index updated: ${INDEX_FILE}"
  fi
}

# --- Main --------------------------------------------------------------------

main() {
  log "=== Big Game Hunting — Bulk Raw Ideation Pass ==="
  log "Endpoint: ${LLM_BASE_URL}"
  log "Model: ${MODEL}"
  log "Thinking: disabled"
  log "Batches: ${BATCHES}"
  log "Concepts per batch: ${CONCEPTS_PER_BATCH}"
  log "Total concepts (planned): ${TOTAL_CONCEPTS}"
  log "Output directory: ${PROJECT_DIR}/${OUTPUT_DIR}"
  log "Index file: ${INDEX_FILE}"
  if [ "$DRY_RUN" = "1" ]; then
    log "*** DRY RUN MODE — no API calls, no files written ***"
  fi
  echo ""

  # Ensure output directory exists
  mkdir -p "${PROJECT_DIR}/${OUTPUT_DIR}"

  # Verify context files exist (warn but don't fail)
  for cf in "${CONTEXT_FILES[@]}"; do
    if [ ! -f "$cf" ]; then
      warn "Context file missing: ${cf#"${PROJECT_DIR}/"}"
    fi
  done

  local current_id
  current_id="$(next_artifact_id "${PROJECT_DIR}/${OUTPUT_DIR}")"

  local batch
  for batch in $(seq 1 "$BATCHES"); do
    local artifact_id="$current_id"
    local concept_count="$CONCEPTS_PER_BATCH"

    if [ "$batch" -eq "$BATCHES" ]; then
      local existing_total=$(( (batch - 1) * CONCEPTS_PER_BATCH ))
      local remainder=$(( TOTAL_CONCEPTS - existing_total ))
      if [ "$remainder" -gt 0 ]; then
        concept_count="$remainder"
      fi
    fi

    local slug
    slug="$(slugify "bulk-raw-ideation-batch-${batch}")"
    local output_file="${PROJECT_DIR}/${OUTPUT_DIR}/${artifact_id}-${slug}.md"

    if [ -f "$output_file" ] && [ "$FORCE" != "1" ]; then
      log "Batch ${batch}: ${output_file} exists — skipping (use FORCE=1 to overwrite)"
      update_index "$batch" "$output_file" "$artifact_id"
    else
      if [ -f "$output_file" ] && [ "$FORCE" = "1" ]; then
        log "Batch ${batch}: FORCE=1 — overwriting ${output_file}"
      fi
      generate_batch "$batch" "$concept_count" "$BATCHES" "$artifact_id" "$slug" "$output_file"
      update_index "$batch" "$output_file" "$artifact_id"
    fi

    current_id="$(printf "%04d" $((10#$current_id + 1)))"

    if [ "$batch" -lt "$BATCHES" ] && [ "$DRY_RUN" != "1" ]; then
      log "Sleeping ${SLEEP_SECONDS}s before next batch..."
      sleep "$SLEEP_SECONDS"
    fi
  done

  echo ""
  log "=== Bulk Raw Ideation Complete ==="
  log "Artifacts in: ${PROJECT_DIR}/${OUTPUT_DIR}"
  if [ -f "$INDEX_FILE" ]; then
    log "Index: ${INDEX_FILE}"
  fi
}

main "$@"
