#!/usr/bin/env bash
set -euo pipefail

# =============================================================================
# run-deepseek-bulk-ideation.sh
#
# Overnight bulk raw ideation runner for Big Game Hunting.
# Generates DRAFT ONLY game-idea research artifacts via DeepSeek V4 Flash.
# Never modifies source-of-truth files. Never commits generated artifacts.
#
# Usage:
#   DEEPSEEK_API_KEY=sk-... ./scripts/run-deepseek-bulk-ideation.sh
#
# Examples:
#   # Dry run — print what would be done without calling the API
#   DRY_RUN=1 ./scripts/run-deepseek-bulk-ideation.sh
#
#   # Small run — 2 batches of 20 concepts each
#   BATCHES=2 CONCEPTS_PER_BATCH=20 ./scripts/run-deepseek-bulk-ideation.sh
#
#   # Overnight run — 10 batches of 30 concepts, 10s gap between batches
#   BATCHES=10 CONCEPTS_PER_BATCH=30 SLEEP_SECONDS=10 \
#     ./scripts/run-deepseek-bulk-ideation.sh
#
#   # Force re-run of all batches (overwrite existing files)
#   FORCE=1 ./scripts/run-deepseek-bulk-ideation.sh
#
# Environment variables (all optional except DEEPSEEK_API_KEY):
#   DEEPSEEK_API_KEY    Required. Your DeepSeek API key.
#   MODEL               Model name (default: deepseek-v4-flash)
#   BATCHES             Number of batches (default: 5; range 3-10 for 100-300 concepts)
#   CONCEPTS_PER_BATCH  Concepts per batch (default: 30)
#   OUTPUT_DIR          Artifact output directory (default: artifacts/research)
#   SLEEP_SECONDS       Seconds between batches to avoid rate limits (default: 5)
#   MAX_RETRIES         Max API retries per batch (default: 3)
#   FORCE               Set to 1 to overwrite existing batch files (default: 0)
#   DRY_RUN             Set to 1 to print actions without executing (default: 0)
# =============================================================================

# --- Configuration -----------------------------------------------------------

: "${DEEPSEEK_API_KEY:?DEEPSEEK_API_KEY is required}"
: "${MODEL:=deepseek-v4-flash}"
: "${BATCHES:=5}"
: "${CONCEPTS_PER_BATCH:=30}"
: "${OUTPUT_DIR:=artifacts/research}"
: "${SLEEP_SECONDS:=5}"
: "${MAX_RETRIES:=3}"
: "${FORCE:=0}"
: "${DRY_RUN:=0}"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROMPTS_DIR="${SCRIPT_DIR}/prompts"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

# Derived paths
TOTAL_CONCEPTS=$(( BATCHES * CONCEPTS_PER_BATCH ))
INDEX_FILE="${PROJECT_DIR}/${OUTPUT_DIR}/INDEX.md"

# API endpoint (DeepSeek OpenAI-compatible)
API_URL="https://api.deepseek.com/v1/chat/completions"

# Validate configuration
if [ "$BATCHES" -lt 1 ] || [ "$BATCHES" -gt 50 ]; then
  echo "ERROR: BATCHES must be between 1 and 50 (got $BATCHES)" >&2
  exit 1
fi
if [ "$CONCEPTS_PER_BATCH" -lt 1 ] || [ "$CONCEPTS_PER_BATCH" -gt 100 ]; then
  echo "ERROR: CONCEPTS_PER_BATCH must be between 1 and 100 (got $CONCEPTS_PER_BATCH)" >&2
  exit 1
fi

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
# IDs are zero-padded 4-digit numbers based on existing NNNN-* files.
next_artifact_id() {
  local dir="$1"
  local max_id=0
  if [ -d "$dir" ]; then
    for f in "$dir"/[0-9][0-9][0-9][0-9]-*.md; do
      if [ -f "$f" ]; then
        local basename_f
        basename_f="$(basename "$f")"
        local num="${basename_f%%-*}"
        # Strip leading zeros for arithmetic
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

# Call the DeepSeek API with retry logic
call_deepseek() {
  local system_prompt="$1"
  local user_prompt="$2"
  local attempt=0
  local response=""
  local http_code

  while [ "$attempt" -lt "$MAX_RETRIES" ]; do
    attempt=$((attempt + 1))

    response="$(mktemp)"
    http_code="$(curl -s -o "$response" -w '%{http_code}' \
      "${API_URL}" \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer ${DEEPSEEK_API_KEY}" \
      -d "$(cat <<EOJSON
{
  "model": "${MODEL}",
  "messages": [
    {"role": "system", "content": $(echo "$system_prompt" | jq -Rs .)},
    {"role": "user", "content": $(echo "$user_prompt" | jq -Rs .)}
  ],
  "temperature": 0.9,
  "max_tokens": 8192,
  "stream": false
}
EOJSON
    )")"

    if [ "$http_code" = "200" ]; then
      local content
      content="$(jq -r '.choices[0].message.content' "$response" 2>/dev/null || true)"
      rm -f "$response"
      echo "$content"
      return 0
    fi

    local error_body
    error_body="$(cat "$response" 2>/dev/null || echo "unknown")"
    rm -f "$response"

    if [ "$attempt" -lt "$MAX_RETRIES" ]; then
      local backoff=$(( attempt * 5 ))
      warn "API call failed (HTTP $http_code, attempt $attempt/${MAX_RETRIES}). Retrying in ${backoff}s..."
      warn "Response: ${error_body}"
      sleep "$backoff"
    else
      die "API call failed after ${MAX_RETRIES} attempts (HTTP ${http_code}). Response: ${error_body}"
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

  # Build prompts
  local system_prompt
  local user_prompt
  system_prompt="$(cat "${PROMPTS_DIR}/deepseek-bulk-ideation-system.md")"
  user_prompt="$(interpolate_prompt "${PROMPTS_DIR}/deepseek-bulk-ideation-user.md" \
    "${batch_number}" "${concept_count}" "${total_batches}")"

  if [ "$DRY_RUN" = "1" ]; then
    log "[DRY RUN] Would call DeepSeek API with:"
    log "[DRY RUN]   Model: ${MODEL}"
    log "[DRY RUN]   System prompt: ${PROMPTS_DIR}/deepseek-bulk-ideation-system.md"
    log "[DRY RUN]   User prompt: ${PROMPTS_DIR}/deepseek-bulk-ideation-user.md (batch ${batch_number}, ${concept_count} concepts)"
    log "[DRY RUN]   Output: ${output_file}"
    return 0
  fi

  local content
  content="$(call_deepseek "${system_prompt}" "${user_prompt}")"

  # Build artifact header
  cat > "$output_file" <<EOHEADER
# Bulk Ideation Batch ${batch_number}: Game Concepts

ARTIFACT TYPE: Research Artifact
AUTHORITY: DRAFT ONLY — EXPLORATORY
STATUS: Draft
CREATED BY: ${MODEL} (bulk ideation runner)
REVIEWED BY: (not yet reviewed)
DATE: $(date '+%Y-%m-%d')
RELATED TASK: Bulk ideation batch ${batch_number}/${total_batches}
SOURCE-OF-TRUTH FILES TOUCHED: (none — this artifact does not update project truth)

---

## Batch Metadata

- **Batch:** ${batch_number} of ${total_batches}
- **Concepts requested:** ${concept_count}
- **Model:** ${MODEL}
- **Generated:** $(date '+%Y-%m-%d %H:%M:%S')
- **Total concepts across all batches (planned):** ${TOTAL_CONCEPTS}

## Concepts

EOHEADER

  # Append the model output
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

  local entry_header
  local batch_slug
  batch_slug="$(basename "$output_file")"

  if [ ! -f "$INDEX_FILE" ]; then
    cat > "$INDEX_FILE" <<EOINDEX
# Bulk Ideation Index

AUTHORITY: DRAFT ONLY — EXPLORATORY
STATUS: Running index of bulk ideation artifacts
SOURCE-OF-TRUTH FILES TOUCHED: (none)

---

Generated $(date '+%Y-%m-%d %H:%M:%S') by \`scripts/run-deepseek-bulk-ideation.sh\`

| Batch | Artifact ID | File | Concepts | Date | Status |
|-------|-------------|------|----------|------|--------|
EOINDEX
  fi

  local date_str
  date_str="$(date '+%Y-%m-%d')"

  # Append a row. If a row for this batch already exists, skip.
  if grep -q "| ${batch_number} | ${artifact_id} |" "$INDEX_FILE" 2>/dev/null; then
    log "Index entry for batch ${batch_number} already exists — skipping"
  else
    echo "| ${batch_number} | ${artifact_id} | ${batch_slug} | ${CONCEPTS_PER_BATCH} | ${date_str} | DRAFT |" >> "$INDEX_FILE"
    log "Index updated: ${INDEX_FILE}"
  fi
}

# --- Main --------------------------------------------------------------------

main() {
  log "=== Big Game Hunting — Bulk Ideation Pass ==="
  log "Model: ${MODEL}"
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

  current_id="$(next_artifact_id "${PROJECT_DIR}/${OUTPUT_DIR}")"

  for batch in $(seq 1 "$BATCHES"); do
    local artifact_id="${current_id}"
    local concept_count="${CONCEPTS_PER_BATCH}"

    # For the last batch, adjust count to hit exactly total if needed
    if [ "$batch" -eq "$BATCHES" ]; then
      local existing_total=$(( (batch - 1) * CONCEPTS_PER_BATCH ))
      local remainder=$(( TOTAL_CONCEPTS - existing_total ))
      if [ "$remainder" -gt 0 ]; then
        concept_count="$remainder"
      fi
    fi

    local slug
    slug="$(slugify "bulk-ideation-batch-${batch}")"
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

    # Increment artifact ID for next iteration
    current_id="$(printf "%04d" $((10#$current_id + 1)))"

    # Sleep between batches (unless it's the last batch or dry run)
    if [ "$batch" -lt "$BATCHES" ] && [ "$DRY_RUN" != "1" ]; then
      log "Sleeping ${SLEEP_SECONDS}s before next batch..."
      sleep "$SLEEP_SECONDS"
    fi
  done

  echo ""
  log "=== Bulk Ideation Complete ==="
  log "Artifacts in: ${PROJECT_DIR}/${OUTPUT_DIR}"
  if [ -f "$INDEX_FILE" ]; then
    log "Index: ${INDEX_FILE}"
  fi
}

main "$@"
