#!/usr/bin/env bash
set -euo pipefail

# =============================================================================
# run-mac-native-digital-ideation.sh
#
# Governed PILOT runner for Big Game Hunting: Mac-native digital game concepts.
# Generates DRAFT ONLY, EXPLORATORY research artifacts via an OpenAI-compatible
# Chat Completions endpoint. One candidate per fixed lane (A-L), 12 lanes total.
#
# This is a separate script from scripts/run-bulk-raw-ideation.sh on purpose:
# it uses a different schema (20 compact fields vs. 10), a different output
# layout (dated run directory vs. flat numbered artifacts), fixed named lanes
# instead of generic numbered batches, and a richer INDEX.md. Adapting the
# existing runner in place would have risked the 55-artifact corpus it already
# maintains.
#
# Never modifies source-of-truth files. Never commits generated artifacts.
# Never ratifies the Mac-native-digital pivot — that requires a human decision
# and a matching DECISION_LOG.md entry.
#
# Usage:
#   OPENCODE_GO_API_KEY=<API_KEY> ./scripts/run-mac-native-digital-ideation.sh
#
# Examples:
#   # Dry run — print what would be done without calling the API
#   DRY_RUN=1 ./scripts/run-mac-native-digital-ideation.sh
#
#   # Real pilot run (12 lanes x 1 candidate each)
#   OPENCODE_GO_API_KEY=<API_KEY> ./scripts/run-mac-native-digital-ideation.sh
#
#   # Re-run into the same run directory (e.g. to retry failed lanes)
#   RUN_ID=20260704-120000 FORCE=1 OPENCODE_GO_API_KEY=<API_KEY> \
#     ./scripts/run-mac-native-digital-ideation.sh
#
# Note:
# Uses DeepSeek V4 Flash in non-thinking mode because thinking mode can
# consume the output budget in reasoning_content and return empty content.
#
# Environment variables (all optional except OPENCODE_GO_API_KEY / LLM_API_KEY):
#   LLM_API_KEY           API key (takes precedence over OPENCODE_GO_API_KEY)
#   OPENCODE_GO_API_KEY   OpenCode Go API key (primary; expected source)
#   LLM_BASE_URL          API endpoint (default: https://opencode.ai/zen/go/v1/chat/completions)
#   MODEL                 Model name (default: deepseek-v4-flash)
#   MAX_TOKENS            Max output tokens per candidate (default: 3000)
#   RUN_ID                Run directory timestamp/id (default: current UTC timestamp)
#   OUTPUT_ROOT           Root output dir (default: artifacts/research/mac-native-digital-ideation/runs)
#   SLEEP_SECONDS         Seconds between lanes to avoid rate limits (default: 5)
#   MAX_RETRIES           Max API retries per lane (default: 3)
#   FORCE                 Set to 1 to overwrite existing lane files (default: 0)
#   DRY_RUN               Set to 1 to print actions without executing (default: 0)
# =============================================================================

# --- Configuration -----------------------------------------------------------

: "${LLM_BASE_URL:=https://opencode.ai/zen/go/v1/chat/completions}"
: "${MODEL:=deepseek-v4-flash}"
: "${MAX_TOKENS:=3000}"
: "${OUTPUT_ROOT:=artifacts/research/mac-native-digital-ideation/runs}"
: "${SLEEP_SECONDS:=5}"
: "${MAX_RETRIES:=3}"
: "${FORCE:=0}"
: "${DRY_RUN:=0}"
: "${RUN_ID:=$(date -u '+%Y%m%d-%H%M%S')}"

# API key resolution: LLM_API_KEY > OPENCODE_GO_API_KEY > error.
# Never print or log the resolved key.
if [ -n "${LLM_API_KEY:-}" ]; then
  API_KEY="$LLM_API_KEY"
elif [ -n "${OPENCODE_GO_API_KEY:-}" ]; then
  API_KEY="$OPENCODE_GO_API_KEY"
else
  echo "ERROR: No API key found. Set OPENCODE_GO_API_KEY (or LLM_API_KEY)." >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROMPTS_DIR="${SCRIPT_DIR}/prompts"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

SYSTEM_PROMPT_FILE="${PROMPTS_DIR}/mac-native-digital-ideation-system.md"
USER_PROMPT_FILE="${PROMPTS_DIR}/mac-native-digital-ideation-user.md"

RUN_DIR="${PROJECT_DIR}/${OUTPUT_ROOT}/${RUN_ID}"
INDEX_FILE="${RUN_DIR}/INDEX.md"

# --- Fixed pilot lanes (batch letter | lane name) ----------------------------

LANES=(
  "A|Tiny tactical roguelite"
  "B|Real-time-with-pause crisis management"
  "C|Single-screen arena strategy"
  "D|Programming-adjacent puzzle / automation"
  "E|Physics or geometry skill game"
  "F|Solo deduction with hidden state"
  "G|Procedural opponent / readable AI rival"
  "H|Deck, ability, or loadout microgame"
  "I|Simulation toy with win pressure"
  "J|Tactical stealth / pursuit"
  "K|Construction, routing, or logistics game"
  "L|Local-first party/score-chase game with strategic teeth"
)
TOTAL_BATCHES="${#LANES[@]}"

# Check required tools
for cmd in curl jq; do
  if ! command -v "$cmd" &>/dev/null; then
    echo "ERROR: Required tool '$cmd' not found. Please install it." >&2
    exit 1
  fi
done

# --- Context Files -----------------------------------------------------------
# Read at runtime and injected into the system prompt. Never modified.

CONTEXT_FILES=(
  "${PROJECT_DIR}/GAME_TRUTH.md"
  "${PROJECT_DIR}/DESIGN_PRINCIPLES.md"
  "${PROJECT_DIR}/docs/design-gates.md"
  "${PROJECT_DIR}/docs/artifact-authority.md"
  "${PROJECT_DIR}/docs/artifact-conventions.md"
  "${PROJECT_DIR}/workflows/governed-artifact-pipeline.md"
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

slugify() {
  echo "$1" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//;s/-$//'
}

interpolate_prompt() {
  local file="$1"
  local batch_number="$2"
  local total_batches="$3"
  local lane_letter="$4"
  local lane_name="$5"
  sed -e "s|{{BATCH_NUMBER}}|${batch_number}|g" \
      -e "s|{{TOTAL_BATCHES}}|${total_batches}|g" \
      -e "s|{{LANE_LETTER}}|${lane_letter}|g" \
      -e "s|{{LANE_NAME}}|${lane_name}|g" \
      "$file"
}

build_system_message() {
  local system_prompt
  system_prompt="$(cat "$SYSTEM_PROMPT_FILE")"

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

# Save a failed response body to logs/ for debugging (API key redacted).
# Never saves reasoning_content on its own.
save_failed_response() {
  local body="$1"
  local suffix="$2"
  local log_dir="${PROJECT_DIR}/logs"
  mkdir -p "$log_dir"
  local dest="${log_dir}/mac-native-digital-ideation-failed-${suffix}.json"
  echo "$body" > "$dest"
  warn "Saved raw response to ${dest}"
}

# Populated by call_llm on success/failure. Bash globals used because
# multi-line content doesn't survive a function "return" cleanly.
LAST_CONTENT=""
LAST_FINISH_REASON=""
LAST_FAILURE_REASON=""

# Call the LLM API with retry logic. Treats empty content, finish_reason=length,
# malformed JSON, missing choices, and missing message content as failures.
call_llm() {
  local system_message="$1"
  local user_message="$2"
  local attempt=0
  local response_file=""
  local http_code

  while [ "$attempt" -lt "$MAX_RETRIES" ]; do
    attempt=$((attempt + 1))
    response_file="$(mktemp)"

    local payload
    payload="$(jq -n \
      --arg model "$MODEL" \
      --arg system "$system_message" \
      --arg user "$user_message" \
      --argjson max_tokens "$MAX_TOKENS" \
      '{
        model: $model,
        messages: [
          {role: "system", content: $system},
          {role: "user", content: $user}
        ],
        temperature: 0.9,
        max_tokens: $max_tokens,
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
    rm -f "$response_file"

    local ts
    ts="$(date '+%Y%m%d-%H%M%S')-attempt${attempt}"

    if [ "$http_code" != "200" ]; then
      save_failed_response "$(redact_keys "$raw_body")" "$ts"
      LAST_FAILURE_REASON="http_${http_code}"
      if [ "$attempt" -lt "$MAX_RETRIES" ]; then
        local backoff=$(( attempt * 5 ))
        warn "API call failed (HTTP $http_code, attempt $attempt/${MAX_RETRIES}). Retrying in ${backoff}s..."
        sleep "$backoff"
        continue
      fi
      return 1
    fi

    if ! echo "$raw_body" | jq -e . >/dev/null 2>&1; then
      save_failed_response "$(redact_keys "$raw_body")" "$ts"
      LAST_FAILURE_REASON="malformed_json"
      if [ "$attempt" -lt "$MAX_RETRIES" ]; then
        warn "Malformed JSON response (attempt $attempt/${MAX_RETRIES}). Retrying in $(( attempt * 5 ))s..."
        sleep $(( attempt * 5 ))
        continue
      fi
      return 1
    fi

    local choices_len
    choices_len="$(echo "$raw_body" | jq '.choices | length' 2>/dev/null || echo 0)"
    if ! [[ "$choices_len" =~ ^[0-9]+$ ]] || [ "$choices_len" -lt 1 ]; then
      save_failed_response "$(redact_keys "$raw_body")" "$ts"
      LAST_FAILURE_REASON="missing_choices"
      if [ "$attempt" -lt "$MAX_RETRIES" ]; then
        warn "Response missing choices (attempt $attempt/${MAX_RETRIES}). Retrying in $(( attempt * 5 ))s..."
        sleep $(( attempt * 5 ))
        continue
      fi
      return 1
    fi

    local content finish_reason
    content="$(echo "$raw_body" | jq -r '.choices[0].message.content // empty' 2>/dev/null || true)"
    finish_reason="$(echo "$raw_body" | jq -r '.choices[0].finish_reason // "unknown"' 2>/dev/null || echo unknown)"

    if [ -z "$content" ]; then
      local reasoning_content
      reasoning_content="$(echo "$raw_body" | jq -r '.choices[0].message.reasoning_content // empty' 2>/dev/null || true)"
      if [ -n "$reasoning_content" ]; then
        warn "Received reasoning_content but empty content; thinking mode may still be enabled. (reasoning_content is not saved)"
      fi
      save_failed_response "$(redact_keys "$raw_body")" "$ts"
      LAST_FAILURE_REASON="empty_content"
      if [ "$attempt" -lt "$MAX_RETRIES" ]; then
        warn "Empty content (attempt $attempt/${MAX_RETRIES}). Retrying in $(( attempt * 5 ))s..."
        sleep $(( attempt * 5 ))
        continue
      fi
      return 1
    fi

    if [ "$finish_reason" = "length" ]; then
      save_failed_response "$(redact_keys "$raw_body")" "$ts"
      LAST_FAILURE_REASON="finish_reason_length"
      if [ "$attempt" -lt "$MAX_RETRIES" ]; then
        warn "finish_reason=length — output likely truncated (attempt $attempt/${MAX_RETRIES}). Retrying in $(( attempt * 5 ))s..."
        sleep $(( attempt * 5 ))
        continue
      fi
      return 1
    fi

    LAST_CONTENT="$content"
    LAST_FINISH_REASON="$finish_reason"
    return 0
  done

  return 1
}

# Generate a single lane's candidate artifact
generate_lane() {
  local batch_number="$1"
  local lane_letter="$2"
  local lane_name="$3"
  local output_file="$4"

  log "Batch ${batch_number}/${TOTAL_BATCHES} (lane ${lane_letter}: ${lane_name}): generating candidate..."

  local system_message
  system_message="$(build_system_message)"
  local user_message
  user_message="$(interpolate_prompt "$USER_PROMPT_FILE" "${batch_number}" "${TOTAL_BATCHES}" "${lane_letter}" "${lane_name}")"

  if [ "$DRY_RUN" = "1" ]; then
    log "[DRY RUN] Would call LLM API with:"
    log "[DRY RUN]   URL: ${LLM_BASE_URL}"
    log "[DRY RUN]   Model: ${MODEL}"
    log "[DRY RUN]   Thinking: disabled"
    log "[DRY RUN]   Max tokens: ${MAX_TOKENS}"
    log "[DRY RUN]   System prompt: ${SYSTEM_PROMPT_FILE} + project context"
    log "[DRY RUN]   User prompt: ${USER_PROMPT_FILE} (batch ${batch_number}, lane ${lane_letter}: ${lane_name})"
    log "[DRY RUN]   Context files (${#CONTEXT_FILES[@]}):"
    local cf
    for cf in "${CONTEXT_FILES[@]}"; do
      log "[DRY RUN]     ${cf#"${PROJECT_DIR}/"}"
    done
    log "[DRY RUN]   Output: ${output_file}"
    update_index "$batch_number" "$lane_letter" "$lane_name" "$output_file" "DRY_RUN" "n/a"
    return 0
  fi

  if call_llm "${system_message}" "${user_message}"; then
    cat > "$output_file" <<EOHEADER
# Mac-Native Digital Ideation — Lane ${lane_letter}: ${lane_name}

ARTIFACT TYPE: Research Artifact
AUTHORITY: DRAFT ONLY — EXPLORATORY
STATUS: Draft
CREATED BY: ${MODEL} (mac-native digital ideation pilot runner via ${LLM_BASE_URL})
REVIEWED BY: (not yet reviewed)
DATE: $(date '+%Y-%m-%d')
RELATED TASK: Mac-native digital ideation pilot, batch ${batch_number}/${TOTAL_BATCHES}, lane ${lane_letter} (${lane_name})
SOURCE-OF-TRUTH FILES TOUCHED: (none — this artifact does not update project truth; it does not ratify a Mac-native-digital pivot)

---

## Batch Metadata

- **Run ID:** ${RUN_ID}
- **Batch:** ${batch_number} of ${TOTAL_BATCHES}
- **Lane:** ${lane_letter} — ${lane_name}
- **Model:** ${MODEL}
- **Transport:** ${LLM_BASE_URL}
- **Finish reason:** ${LAST_FINISH_REASON}
- **Generated:** $(date '+%Y-%m-%d %H:%M:%S')

## Candidate

EOHEADER
    echo "$LAST_CONTENT" >> "$output_file"
    log "Batch ${batch_number} (lane ${lane_letter}): wrote ${output_file} (finish_reason=${LAST_FINISH_REASON})"
    update_index "$batch_number" "$lane_letter" "$lane_name" "$output_file" "OK" "$LAST_FINISH_REASON"
  else
    warn "Batch ${batch_number} (lane ${lane_letter}) FAILED after ${MAX_RETRIES} attempts: ${LAST_FAILURE_REASON}"
    update_index "$batch_number" "$lane_letter" "$lane_name" "$output_file" "FAILED" "$LAST_FAILURE_REASON"
  fi
}

# Update the run's index file incrementally
update_index() {
  local batch_number="$1"
  local lane_letter="$2"
  local lane_name="$3"
  local output_file="$4"
  local status="$5"
  local finish_reason="$6"

  mkdir -p "$RUN_DIR"

  if [ ! -f "$INDEX_FILE" ]; then
    cat > "$INDEX_FILE" <<EOINDEX
# Mac-Native Digital Ideation — Pilot Run Index

AUTHORITY: DRAFT ONLY — EXPLORATORY
STATUS: Running index of a pilot ideation pass. Does not ratify a Mac-native-digital pivot.
SOURCE-OF-TRUTH FILES TOUCHED: (none)

---

Run ID: ${RUN_ID}
Generated $(date '+%Y-%m-%d %H:%M:%S') by \`scripts/run-mac-native-digital-ideation.sh\`
Model: ${MODEL} · Transport: ${LLM_BASE_URL}

| Batch | Lane | Filename | Status | Finish Reason | Model | Transport |
|-------|------|----------|--------|----------------|-------|-----------|
EOINDEX
  fi

  local filename
  filename="$(basename "$output_file")"

  if grep -qF "| ${batch_number} | ${lane_letter} |" "$INDEX_FILE" 2>/dev/null; then
    # Replace existing row for this batch (e.g. on FORCE re-run)
    local tmp_index
    tmp_index="$(mktemp)"
    grep -vF "| ${batch_number} | ${lane_letter} |" "$INDEX_FILE" > "$tmp_index"
    echo "| ${batch_number} | ${lane_letter} | ${filename} | ${status} | ${finish_reason} | ${MODEL} | ${LLM_BASE_URL} |" >> "$tmp_index"
    mv "$tmp_index" "$INDEX_FILE"
    log "Index entry for batch ${batch_number} (lane ${lane_letter}) updated"
  else
    echo "| ${batch_number} | ${lane_letter} | ${filename} | ${status} | ${finish_reason} | ${MODEL} | ${LLM_BASE_URL} |" >> "$INDEX_FILE"
    log "Index updated: ${INDEX_FILE}"
  fi
}

# --- Main --------------------------------------------------------------------

main() {
  log "=== Big Game Hunting — Mac-Native Digital Ideation PILOT ==="
  log "Endpoint: ${LLM_BASE_URL}"
  log "Model: ${MODEL}"
  log "Thinking: disabled"
  log "Lanes: ${TOTAL_BATCHES} (1 candidate each)"
  log "Run ID: ${RUN_ID}"
  log "Run directory: ${RUN_DIR}"
  if [ "$DRY_RUN" = "1" ]; then
    log "*** DRY RUN MODE — no API calls, no files written except a dry-run INDEX.md ***"
  fi
  echo ""

  mkdir -p "$RUN_DIR"

  for cf in "${CONTEXT_FILES[@]}"; do
    if [ ! -f "$cf" ]; then
      warn "Context file missing: ${cf#"${PROJECT_DIR}/"}"
    fi
  done

  local batch_number=0
  local lane_entry lane_letter lane_name
  for lane_entry in "${LANES[@]}"; do
    batch_number=$((batch_number + 1))
    lane_letter="${lane_entry%%|*}"
    lane_name="${lane_entry#*|}"

    local slug
    slug="$(slugify "$lane_name")"
    local output_file="${RUN_DIR}/$(printf '%02d' "$batch_number")-${lane_letter}-${slug}.md"

    if [ -f "$output_file" ] && [ "$FORCE" != "1" ] && [ "$DRY_RUN" != "1" ]; then
      log "Batch ${batch_number} (lane ${lane_letter}): ${output_file} exists — skipping (use FORCE=1 to overwrite)"
      update_index "$batch_number" "$lane_letter" "$lane_name" "$output_file" "SKIPPED_EXISTING" "n/a"
    else
      generate_lane "$batch_number" "$lane_letter" "$lane_name" "$output_file"
    fi

    if [ "$batch_number" -lt "$TOTAL_BATCHES" ] && [ "$DRY_RUN" != "1" ]; then
      log "Sleeping ${SLEEP_SECONDS}s before next lane..."
      sleep "$SLEEP_SECONDS"
    fi
  done

  echo ""
  log "=== Mac-Native Digital Ideation Pilot Complete ==="
  log "Run directory: ${RUN_DIR}"
  log "Index: ${INDEX_FILE}"
  log "Reminder: outputs are DRAFT ONLY — not committed automatically, not ratified."
}

main "$@"
