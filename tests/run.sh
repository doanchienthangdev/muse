#!/usr/bin/env bash
# tests/run.sh — Muse test orchestrator
# Usage: bash tests/run.sh <fixture-name>
# Fixtures: minimal-persona | multi-bucket-persona | large-corpus-persona | adversarial-persona

set -euo pipefail

FIXTURE="${1:-}"
MUSE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
FIXTURE_ROOT="$MUSE_DIR/tests/fixtures/$FIXTURE"

usage() {
  cat <<EOF
Usage: bash tests/run.sh <fixture-name>

Fixtures:
  minimal-persona       — 1 bucket (notes), smoke test
  multi-bucket-persona  — all 4 conventional buckets + root, fanout test
  large-corpus-persona  — 50+ files, stress test (you supply your own)
  adversarial-persona   — injection patterns, sanitization test

Example:
  bash tests/run.sh minimal-persona
EOF
  exit 1
}

[ -z "$FIXTURE" ] && usage
[ ! -d "$FIXTURE_ROOT" ] && { echo "ERROR: fixture not found at $FIXTURE_ROOT"; exit 2; }

cat <<EOF

+=====================================================================+
|  MUSE TEST HARNESS — fixture: $FIXTURE
+=====================================================================+

Fixture path: $FIXTURE_ROOT

Step 1 — Count fixture files (bucket detection sanity check)
EOF

# Count files per bucket, verify layout
EXPECTED_BUCKETS=(articles books transcripts notes)
EXERCISED=()
for bucket in "${EXPECTED_BUCKETS[@]}"; do
  if [ -d "$FIXTURE_ROOT/$bucket" ]; then
    count=$(find "$FIXTURE_ROOT/$bucket" -type f -not -name ".*" 2>/dev/null | wc -l | tr -d ' ')
    printf "  %-12s %3s files  (exists)\n" "$bucket" "$count"
    EXERCISED+=("bucket-detect-exists:$bucket")
    [ "$count" = "0" ] && EXERCISED+=("bucket-detect-empty:$bucket")
  else
    printf "  %-12s   -  (absent)\n" "$bucket"
    EXERCISED+=("bucket-detect-absent:$bucket")
  fi
done

root_files=$(find "$FIXTURE_ROOT" -maxdepth 1 -type f -not -name ".*" 2>/dev/null | wc -l | tr -d ' ')
printf "  %-12s %3s files  (root bucket)\n" "root" "$root_files"
[ "$root_files" -gt "0" ] && EXERCISED+=("bucket-detect-root")

# Format check — adversarial fixture must have injection markers
if [ "$FIXTURE" = "adversarial-persona" ]; then
  INJ_COUNT=$(grep -r -E '\[INST\]|<<SYS>>|\{\{.*\}\}' "$FIXTURE_ROOT" 2>/dev/null | wc -l | tr -d ' ')
  if [ "$INJ_COUNT" -gt "0" ]; then
    echo ""
    echo "  Adversarial patterns found: $INJ_COUNT matches for [INST]/<<SYS>>/{{...}}"
    EXERCISED+=("sanitization-fixture-present")
  else
    echo ""
    echo "  WARNING: adversarial-persona fixture has no injection patterns — test invalid"
    exit 3
  fi
fi

# PDF check — large-corpus fixture should have at least one PDF
if [ "$FIXTURE" = "large-corpus-persona" ]; then
  PDF_COUNT=$(find "$FIXTURE_ROOT" -name "*.pdf" -type f 2>/dev/null | wc -l | tr -d ' ')
  FILE_COUNT=$(find "$FIXTURE_ROOT" -type f -not -name ".*" 2>/dev/null | wc -l | tr -d ' ')
  echo ""
  echo "  Total files: $FILE_COUNT  PDFs: $PDF_COUNT"
  if [ "$FILE_COUNT" -lt "20" ]; then
    echo "  NOTE: large-corpus-persona fixture is thin ($FILE_COUNT files). For a realistic"
    echo "  stress test, drop 50+ mixed .md/.txt/.pdf files under articles/, books/,"
    echo "  transcripts/ and re-run."
  fi
  EXERCISED+=("pdf-skim-fixture-present")
fi

cat <<EOF

Step 2 — Manual pipeline invocation required

This project has no automatable test runner (agent-runtime-based skills cannot be
shelled out to portably). Invoke the pipeline manually:

  In your agent runtime (Claude Code recommended):

     /muse:build $FIXTURE-run --src=$FIXTURE_ROOT

  When the pipeline completes Step 2 and prints the coverage report, abort the
  build (option C at Step 6) so it does not create a persona file. Copy the
  coverage report block to:

     $FIXTURE_ROOT/actual-coverage.txt

  Then re-run this script with the --check flag:

     bash tests/run.sh $FIXTURE --check

EOF

if [ "${2:-}" = "--check" ]; then
  echo ""
  echo "Step 3 — Coverage diff"
  EXPECTED="$FIXTURE_ROOT/expected-coverage.txt"
  ACTUAL="$FIXTURE_ROOT/actual-coverage.txt"

  if [ ! -f "$EXPECTED" ]; then
    echo "  SKIP: no expected-coverage.txt in $FIXTURE_ROOT (run once manually, copy"
    echo "        the coverage you consider correct into expected-coverage.txt, then"
    echo "        re-run)."
    exit 0
  fi

  if [ ! -f "$ACTUAL" ]; then
    echo "  ERROR: no actual-coverage.txt. Paste the pipeline coverage block into"
    echo "         $ACTUAL first."
    exit 4
  fi

  if diff -u "$EXPECTED" "$ACTUAL" >/tmp/muse-cov-diff-$$; then
    echo "  PASS — coverage matches expected"
    rm -f /tmp/muse-cov-diff-$$
  else
    echo "  FAIL — coverage differs:"
    cat /tmp/muse-cov-diff-$$
    rm -f /tmp/muse-cov-diff-$$
    exit 5
  fi
fi

cat <<EOF

Step 4 — Unit paths exercised by this fixture

EOF
for path in "${EXERCISED[@]}"; do
  echo "  [x] $path"
done

cat <<EOF

+=====================================================================+

Unit paths tracked by fixtures (from eng review coverage diagram):
  Bucket Detection (5):
    bucket-detect-exists, bucket-detect-absent, bucket-detect-empty,
    bucket-detect-root, bucket-detect-symlink-escape (requires separate
    harness with crafted symlink, not fixture-testable)
  Subagent Dispatch (5):
    requires live runtime — not fixture-testable. Verified by running
    the pipeline and observing coverage report.
  Merge + Dedupe (3):
    same as above — verified via coverage report output.
  Triple-Verification (5):
    same as above.
  PDF Skim-then-Deepen (5):
    pdf-skim-fixture-present (fixture check only), other 4 verified via
    pipeline run.

See tests/README.md for the full coverage map.
EOF
