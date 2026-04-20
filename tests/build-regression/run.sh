#!/usr/bin/env bash
# tests/build-regression/run.sh — Muse build regression harness
#
# For each shipped persona in personas/*.md:
#   1. Extract signature_move names → current.txt
#   2. Compare against tests/build-regression/golden/<id>.signatures.txt
#   3. Flag if ≥30% of moves are missing or renamed
#
# Generate golden files on first run via:  bash tests/build-regression/run.sh --snapshot
# Run comparison via:                      bash tests/build-regression/run.sh

set -euo pipefail

MUSE_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
GOLDEN_DIR="$MUSE_DIR/tests/build-regression/golden"
PERSONAS_DIR="$MUSE_DIR/personas"

mkdir -p "$GOLDEN_DIR"

MODE="${1:-check}"

# Extract signature_move names from a persona markdown file.
# Signature moves are `###` headings under the `## Signature moves` section.
# Their names end before the inline category tag `(framing)`, `(inquiry)`, `(test-probe)`.
extract_signatures() {
  local file="$1"
  awk '
    /^## Signature moves/ { in_sec = 1; next }
    /^## / && in_sec { in_sec = 0 }
    in_sec && /^### / {
      name = $0
      sub(/^### /, "", name)
      sub(/ *\([a-z-]+\) *$/, "", name)
      gsub(/^[ \t]+|[ \t]+$/, "", name)
      print name
    }
  ' "$file" | sort
}

# Snapshot mode: write golden files from current personas/
if [ "$MODE" = "--snapshot" ]; then
  echo "== Taking signature-move snapshots =="
  for persona_file in "$PERSONAS_DIR"/*.md; do
    [ -f "$persona_file" ] || continue
    base="$(basename "$persona_file" .md)"
    # Skip backups
    case "$base" in *.bak.*) continue ;; esac
    case "$persona_file" in *.bak.*) continue ;; esac

    sigs=$(extract_signatures "$persona_file")
    count=$(printf '%s\n' "$sigs" | grep -c . || true)

    printf '%s\n' "$sigs" > "$GOLDEN_DIR/$base.signatures.txt"
    printf "  %-20s %2s moves snapshotted\n" "$base" "$count"
  done
  echo ""
  echo "Golden files written to $GOLDEN_DIR"
  echo "Commit them. Future runs will diff against these."
  exit 0
fi

# Check mode: diff current personas against golden
echo "== Build regression check =="
echo ""

FAILURES=0
TOTAL=0
for persona_file in "$PERSONAS_DIR"/*.md; do
  [ -f "$persona_file" ] || continue
  base="$(basename "$persona_file" .md)"
  case "$persona_file" in *.bak.*) continue ;; esac

  TOTAL=$((TOTAL + 1))
  golden="$GOLDEN_DIR/$base.signatures.txt"

  if [ ! -f "$golden" ]; then
    printf "  %-20s GOLDEN-MISSING  — run with --snapshot to create\n" "$base"
    FAILURES=$((FAILURES + 1))
    continue
  fi

  current=$(extract_signatures "$persona_file")
  golden_content=$(cat "$golden")

  # Count moves in golden and current
  golden_count=$(printf '%s\n' "$golden_content" | grep -c . || true)
  current_count=$(printf '%s\n' "$current" | grep -c . || true)

  # Moves in golden but not in current (dropped or renamed)
  missing=$(comm -23 <(printf '%s\n' "$golden_content") <(printf '%s\n' "$current") | grep -c . || true)
  added=$(comm -13 <(printf '%s\n' "$golden_content") <(printf '%s\n' "$current") | grep -c . || true)

  if [ "$golden_count" = "0" ]; then
    drift_pct=0
  else
    drift_pct=$(( missing * 100 / golden_count ))
  fi

  if [ "$drift_pct" -ge "30" ]; then
    printf "  %-20s DRIFT %d%%  (missing:%d  added:%d) FAIL\n" "$base" "$drift_pct" "$missing" "$added"
    FAILURES=$((FAILURES + 1))
  elif [ "$missing" -gt "0" ] || [ "$added" -gt "0" ]; then
    printf "  %-20s drift %d%%  (missing:%d  added:%d)\n" "$base" "$drift_pct" "$missing" "$added"
  else
    printf "  %-20s OK       %d moves\n" "$base" "$current_count"
  fi
done

echo ""
if [ "$FAILURES" -gt "0" ]; then
  echo "== FAIL: $FAILURES of $TOTAL personas drifted ≥30% from golden =="
  echo ""
  echo "If the drift is intentional (you rebuilt the persona deliberately),"
  echo "take a new snapshot with:  bash tests/build-regression/run.sh --snapshot"
  echo ""
  echo "Otherwise, investigate — signature moves should not silently disappear."
  exit 1
fi

echo "== PASS: $TOTAL personas match golden =="
