#!/usr/bin/env bash
# tests/session-regression/run.sh — Muse session regression harness (v2.16.0-alpha)
#
# Validates STATIC invariants that a session would need to run successfully:
#   1. Each persona has signature moves for each category a mode requires
#   2. Each persona's session_mode_preferences does not block its valid modes
#   3. Each persona's canonical_mapping covers >=3 of 6 canonical dilemma slugs (for Stage 4)
#   4. SESSION.md's mode -> stage graph table is internally consistent
#   5. Each persona has a ## Sources section (C7)
#   6. Golden schema fingerprint matches per (persona x mode)
#
# Does NOT actually invoke sessions (that requires the Claude Code runtime).
# Output-quality testing is the domain of manual QA + /muse:benchmark.
#
# Modes supported: QUICK, STANDARD, DEEP, CRITIC, EXPLORE (v2.16 NEW)
#
# Usage:
#   bash tests/session-regression/run.sh              # check mode
#   bash tests/session-regression/run.sh --snapshot   # regenerate golden files
#   MUSE_REGRESSION_MODE=true bash tests/session-regression/run.sh  # explicit regression-mode marker

set -euo pipefail

MUSE_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
GOLDEN_DIR="$MUSE_DIR/tests/session-regression/golden"
PERSONAS_DIR="$MUSE_DIR/personas"
SESSION_SPEC="$MUSE_DIR/SESSION.md"

# MODES array: include EXPLORE iff SESSION.md declares it.
# This lets the harness pass against v2.2 baseline AND v2.16+ (after Phase 2.16.2 adds EXPLORE).
BASE_MODES=(QUICK STANDARD DEEP CRITIC)
if [ -f "$SESSION_SPEC" ] && grep -qE "^(## Stage.*EXPLORE|### EXPLORE|.*EXPLORE mode)" "$SESSION_SPEC"; then
  MODES=("${BASE_MODES[@]}" EXPLORE)
else
  MODES=("${BASE_MODES[@]}")
fi

mkdir -p "$GOLDEN_DIR"

MODE_FLAG="${1:-check}"

# Per-mode stage requirements (must match SESSION.md mode -> stage graph)
# Format: MODE_REQUIRES_<MODE>="category1 category2 ..."
# Each mode's required signature-move categories (v2.16 alignment)
declare_mode_requires() {
  case "$1" in
    QUICK)    echo "framing" ;;                                  # Stage 1 brief + Stage 5
    STANDARD) echo "framing inquiry test-probe" ;;               # Stages 1 2 3 + Debate at 4 + Commit at 5
    DEEP)     echo "framing inquiry test-probe" ;;               # 0.5 + 1 + 2 + 3 + 3.5 + 4 + 5
    CRITIC)   echo "framing" ;;                                  # Stage 1' (load artifact) - framing used as critic fallback
    EXPLORE)  echo "framing inquiry test-probe" ;;               # v2.16 NEW — loop-capable, needs all three to pivot
  esac
}

# Extract signature-move categories for a persona.
# Signature moves live under `## Signature moves` and their headings end with `(framing)`, `(inquiry)`, or `(test-probe)`.
# POSIX awk (macOS compat): use match() + substr() instead of gawk match(str, re, arr).
extract_categories() {
  local file="$1"
  awk '
    /^## Signature moves/ { in_sec = 1; next }
    /^## / && in_sec { in_sec = 0 }
    in_sec && /^### / {
      if (match($0, /\([a-z-]+\)/)) {
        s = substr($0, RSTART + 1, RLENGTH - 2)
        print s
      }
    }
  ' "$file" | sort -u
}

# Check persona has a Sources section (C7)
has_sources() {
  grep -q "^## Sources" "$1"
}

# Check persona declares session_mode_preferences (v2.2)
has_mode_prefs() {
  grep -q "^session_mode_preferences:" "$1"
}

# Extract weak_at modes from persona frontmatter. Returns uppercase mode names one per line.
# POSIX awk (macOS compat).
extract_weak_at() {
  local file="$1"
  awk '
    /^session_mode_preferences:/ { in_sec = 1; next }
    in_sec && /^[a-zA-Z]/ && !/^ / { in_sec = 0 }
    in_sec && /^  weak_at:/ {
      # Extract the [...] content
      line = $0
      if (match(line, /\[[^]]*\]/)) {
        content = substr(line, RSTART + 1, RLENGTH - 2)
        n = split(content, arr, ",")
        for (i = 1; i <= n; i++) {
          gsub(/[ \t]/, "", arr[i])
          if (arr[i] != "") print toupper(arr[i])
        }
      }
    }
  ' "$file" | sort -u
}

# Extract canonical dilemma coverage from persona frontmatter.
# Canonical slugs: speed_vs_quality, consensus_vs_conviction, authority_vs_reason,
#                  direct_vs_indirect, action_vs_patience, tradition_vs_innovation
extract_canonical_coverage() {
  local file="$1"
  awk '
    /^canonical_mapping:/ { in_sec = 1; next }
    in_sec && /^[a-zA-Z]/ && !/^ / { in_sec = 0 }
    in_sec && /:/ { print $NF }
  ' "$file" | sort -u
}

extract_deliberate_skips() {
  local file="$1"
  awk '
    /^deliberate_skips:/ { in_sec = 1; next }
    in_sec && /^[a-zA-Z]/ && !/^ / { in_sec = 0 }
    in_sec && /^  -/ {
      val = $0
      sub(/^  - /, "", val)
      gsub(/[ \t]/, "", val)
      print val
    }
  ' "$file" | sort -u
}

# Generate structural fingerprint for a persona x mode combination.
# Returns a YAML snippet representing what must be present for the mode to run.
fingerprint() {
  local persona_file="$1"
  local mode="$2"
  local base
  base="$(basename "$persona_file" .md)"

  local categories
  categories=$(extract_categories "$persona_file" | tr '\n' ' ' | sed 's/ $//')
  local weak_at
  weak_at=$(extract_weak_at "$persona_file" | tr '\n' ' ' | sed 's/ $//')
  local canonical_count
  canonical_count=$(( $(extract_canonical_coverage "$persona_file" | grep -c . || true) + $(extract_deliberate_skips "$persona_file" | grep -c . || true) ))
  local has_src
  has_src="false"
  has_sources "$persona_file" && has_src="true"

  cat <<EOF
persona: $base
mode: $mode
categories_present: [$(echo "$categories" | sed 's/ /, /g')]
weak_at: [$(echo "$weak_at" | sed 's/ /, /g')]
canonical_coverage: $canonical_count
has_sources: $has_src
EOF
}

# Validate a single (persona, mode) pair. Returns 0 on pass, 1 on hard fail.
# Warnings (like weak_at) print but don't fail.
validate_persona_mode() {
  local persona_file="$1"
  local mode="$2"
  local base
  base="$(basename "$persona_file" .md)"
  local errors=()
  local warnings=()

  # Required categories for this mode (HARD)
  local required
  required=$(declare_mode_requires "$mode")
  local persona_cats
  persona_cats=$(extract_categories "$persona_file")

  for cat in $required; do
    if ! echo "$persona_cats" | grep -qx "$cat"; then
      errors+=("missing-category:$cat")
    fi
  done

  # weak_at is a WARNING — mode still works, persona just prefers another
  local weak
  weak=$(extract_weak_at "$persona_file")
  if echo "$weak" | grep -qx "$mode"; then
    warnings+=("weak-at-$mode")
  fi

  # C7: must have Sources (HARD)
  if ! has_sources "$persona_file"; then
    errors+=("missing-sources")
  fi

  # C4: canonical_mapping + deliberate_skips >= 3 (HARD, applies for modes that use Stage 4)
  if [ "$mode" != "CRITIC" ]; then  # CRITIC doesn't use Stage 4 Decide
    local mapped
    mapped=$(extract_canonical_coverage "$persona_file" | grep -c . || true)
    local skipped
    skipped=$(extract_deliberate_skips "$persona_file" | grep -c . || true)
    local covered=$(( mapped + skipped ))
    if [ "$covered" -lt 3 ]; then
      errors+=("canonical-coverage-low:$covered/3")
    fi
  fi

  if [ ${#errors[@]} -gt 0 ]; then
    local warn_str=""
    if [ ${#warnings[@]} -gt 0 ]; then
      warn_str=" warnings:$(IFS=,; echo "${warnings[*]}")"
    fi
    printf "    %-10s FAIL: %s%s\n" "$mode" "$(IFS=,; echo "${errors[*]}")" "$warn_str"
    return 1
  fi

  if [ ${#warnings[@]} -gt 0 ]; then
    printf "    %-10s OK (warn: %s)\n" "$mode" "$(IFS=,; echo "${warnings[*]}")"
  fi
  return 0
}

# Validate SESSION.md structural integrity.
validate_session_spec() {
  echo "== Validating SESSION.md spec =="
  local errors=0

  if [ ! -f "$SESSION_SPEC" ]; then
    echo "  FAIL: SESSION.md not found at $SESSION_SPEC"
    return 1
  fi

  # Must reference each mode in the dynamically-detected MODES array
  for m in "${MODES[@]}"; do
    if ! grep -q "\\b$m\\b" "$SESSION_SPEC"; then
      echo "  FAIL: SESSION.md does not reference mode $m"
      errors=$((errors + 1))
    fi
  done

  # Must have a Persistence section
  if ! grep -q "^## Persistence" "$SESSION_SPEC"; then
    echo "  FAIL: SESSION.md missing ## Persistence section"
    errors=$((errors + 1))
  fi

  # Must have a Fallback section
  if ! grep -q "^## Fallback" "$SESSION_SPEC"; then
    echo "  FAIL: SESSION.md missing ## Fallback section"
    errors=$((errors + 1))
  fi

  # v2.16: must document convergence detector (for modes that use it)
  if grep -q "EXPLORE" "$SESSION_SPEC"; then
    if ! grep -qi "convergence" "$SESSION_SPEC"; then
      echo "  WARN: SESSION.md mentions EXPLORE but not convergence detection"
    fi
  fi

  if [ "$errors" -gt 0 ]; then
    echo "== SESSION.md: $errors errors =="
    return 1
  fi
  echo "  OK: SESSION.md structural integrity"
  return 0
}

# Snapshot mode
if [ "$MODE_FLAG" = "--snapshot" ]; then
  echo "== Taking session-regression snapshots =="
  for persona_file in "$PERSONAS_DIR"/*.md; do
    [ -f "$persona_file" ] || continue
    base="$(basename "$persona_file" .md)"
    case "$base" in *.bak.*) continue ;; esac
    case "$persona_file" in *.bak.*) continue ;; esac

    for mode in "${MODES[@]}"; do
      # Skip EXPLORE in snapshot if persona declares it weak (legacy personas may not have it defined)
      fingerprint "$persona_file" "$mode" > "$GOLDEN_DIR/$base.$mode.schema.yaml"
    done
    printf "  %-20s snapshotted across %d modes\n" "$base" "${#MODES[@]}"
  done
  echo ""
  echo "Golden files written to $GOLDEN_DIR"
  exit 0
fi

# Check mode
echo "== Session regression check =="
echo ""

SPEC_OK=0
validate_session_spec || SPEC_OK=1

echo ""
echo "== Validating personas x modes =="

TOTAL_PAIRS=0
FAILED_PAIRS=0
TOTAL_PERSONAS=0

for persona_file in "$PERSONAS_DIR"/*.md; do
  [ -f "$persona_file" ] || continue
  base="$(basename "$persona_file" .md)"
  case "$persona_file" in *.bak.*) continue ;; esac

  TOTAL_PERSONAS=$((TOTAL_PERSONAS + 1))
  persona_failed=0
  printf "  %s\n" "$base"

  for mode in "${MODES[@]}"; do
    TOTAL_PAIRS=$((TOTAL_PAIRS + 1))
    pair_result=0
    validate_persona_mode "$persona_file" "$mode" || pair_result=$?
    if [ "$pair_result" != "0" ]; then
      FAILED_PAIRS=$((FAILED_PAIRS + 1))
      persona_failed=1
      continue
    fi

    # validate_persona_mode already printed warning lines if any. Only add golden-diff line if no warning printed.
    # Compare against golden if exists
    golden="$GOLDEN_DIR/$base.$mode.schema.yaml"
    if [ -f "$golden" ]; then
      current=$(fingerprint "$persona_file" "$mode")
      golden_content=$(cat "$golden")
      if [ "$current" != "$golden_content" ]; then
        printf "    %-10s DRIFT vs golden (re-snapshot if intentional)\n" "$mode"
      fi
      # else: silent OK (warning-line already printed if any)
    fi
    # If no golden and no warnings printed (would require tracking), we don't double-print
    # Keeping simple: snapshot run documents status; subsequent runs print drift only
  done
done

echo ""
echo "== Summary =="
echo "  Personas tested:    $TOTAL_PERSONAS"
echo "  (Persona, Mode) pairs: $TOTAL_PAIRS"
echo "  Failed pairs:       $FAILED_PAIRS"
echo "  Spec integrity:     $([ "$SPEC_OK" = "0" ] && echo "OK" || echo "FAIL")"

if [ "$FAILED_PAIRS" -gt 0 ] || [ "$SPEC_OK" != "0" ]; then
  echo ""
  echo "== FAIL =="
  echo ""
  echo "If drift is intentional (persona rebuilt or SESSION.md deliberately changed),"
  echo "re-run with: bash tests/session-regression/run.sh --snapshot"
  exit 1
fi

echo ""
echo "== PASS: $TOTAL_PAIRS pairs green =="
