#!/usr/bin/env bash
# tests/session-regression/convergence-eval.sh — Convergence detector eval suite (v2.16.0-alpha)
#
# Evaluates the convergence detector against 10 labeled fixtures in convergence-fixtures/.
# Pass threshold: >=70% verdict accuracy (7 of 10).
#
# NOTE: The convergence detector's LLM-judge tier requires the Claude Code runtime
# (Agent tool). This bash script validates fixture integrity + documents the eval
# procedure. Actual verdict measurement requires manual runs OR future automation
# hooks into Claude Code's Agent invocation.
#
# Usage:
#   bash tests/session-regression/convergence-eval.sh                # validate fixtures + print procedure
#   bash tests/session-regression/convergence-eval.sh --record <verdict>  # record a manual-run verdict (future)

set -euo pipefail

MUSE_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
FIXTURES_DIR="$MUSE_DIR/tests/session-regression/convergence-fixtures"
RESULTS_FILE="$MUSE_DIR/tests/session-regression/convergence-eval-results.jsonl"

PASS_THRESHOLD=7

echo "== Convergence Detector Eval Suite =="
echo ""
echo "Fixtures directory: $FIXTURES_DIR"
echo ""

# Step 1: validate fixture integrity
echo "== Step 1: Validate fixtures =="
FIXTURE_COUNT=0
INVALID=0

for fixture in "$FIXTURES_DIR"/*.yaml; do
  [ -f "$fixture" ] || continue
  FIXTURE_COUNT=$((FIXTURE_COUNT + 1))
  base=$(basename "$fixture" .yaml)

  # Must have expected_verdict field with valid value
  verdict=$(grep "^expected_verdict:" "$fixture" | awk '{print $2}' || echo "")
  case "$verdict" in
    converged|deepen|pivot|handoff) ;;
    *)
      echo "  INVALID: $base — expected_verdict must be converged|deepen|pivot|handoff, got '$verdict'"
      INVALID=$((INVALID + 1))
      continue
      ;;
  esac

  # Must have input + persona_id + stage_id
  if ! grep -q "^input:" "$fixture" || ! grep -q "persona_id:" "$fixture" || ! grep -q "stage_id:" "$fixture"; then
    echo "  INVALID: $base — missing required fields (input/persona_id/stage_id)"
    INVALID=$((INVALID + 1))
    continue
  fi

  printf "  %-25s expected=%s\n" "$base" "$verdict"
done

echo ""
echo "Total fixtures: $FIXTURE_COUNT"
echo "Invalid:        $INVALID"

if [ "$INVALID" -gt 0 ]; then
  echo ""
  echo "FAIL: fix invalid fixtures before running eval"
  exit 1
fi

if [ "$FIXTURE_COUNT" -lt 10 ]; then
  echo ""
  echo "WARN: eval spec expects 10 fixtures; found $FIXTURE_COUNT"
fi

# Step 2: print eval procedure
echo ""
echo "== Step 2: Eval procedure =="
cat <<'EOF'

The convergence detector runs inside the Claude Code runtime (it dispatches an
Agent subagent). Bash cannot invoke the detector directly. Follow this procedure
to run the eval:

For each fixture in convergence-fixtures/*.yaml:

  1. Open a Claude Code terminal at the muse repo.
  2. Read the fixture (input:) section.
  3. Construct the convergence detector prompt per CONVERGENCE.md §"LLM-judge tier".
     Substitute input.stage_id, persona_id, mode, stages_completed, pivots_so_far,
     original_question, current_framing, last_stage_output, outputs_so_far.
  4. Ask Claude Code to dispatch an Agent subagent with that prompt.
  5. Parse the Agent's JSON response: extract `verdict`.
  6. Compare against fixture's expected_verdict.
  7. Record result via:
     bash tests/session-regression/convergence-eval.sh --record <fixture-name> <actual-verdict>

After all 10 fixtures are recorded:

  8. Score = count of matches / 10.
  9. Pass threshold: score >= 7/10.
  10. If score < 7/10, iterate the judge prompt in CONVERGENCE.md.

EOF

# Step 3: score existing results if any
echo "== Step 3: Current score from recorded results =="

if [ ! -f "$RESULTS_FILE" ]; then
  echo "No results recorded yet. Run manual eval per the procedure above."
  exit 0
fi

TOTAL=0
CORRECT=0
while IFS= read -r line; do
  [ -z "$line" ] && continue
  fixture_name=$(echo "$line" | grep -o '"fixture":"[^"]*"' | cut -d'"' -f4)
  actual=$(echo "$line" | grep -o '"actual":"[^"]*"' | cut -d'"' -f4)
  expected=$(grep "^expected_verdict:" "$FIXTURES_DIR/$fixture_name.yaml" 2>/dev/null | awk '{print $2}' || echo "")
  TOTAL=$((TOTAL + 1))
  if [ "$actual" = "$expected" ]; then
    CORRECT=$((CORRECT + 1))
    printf "  [PASS] %-25s expected=%-10s actual=%s\n" "$fixture_name" "$expected" "$actual"
  else
    printf "  [FAIL] %-25s expected=%-10s actual=%s\n" "$fixture_name" "$expected" "$actual"
  fi
done < "$RESULTS_FILE"

echo ""
echo "Score: $CORRECT / $TOTAL (threshold: $PASS_THRESHOLD/10)"

if [ "$TOTAL" -lt "10" ]; then
  echo "Partial eval ($TOTAL of 10 fixtures recorded)."
  exit 2
fi

if [ "$CORRECT" -ge "$PASS_THRESHOLD" ]; then
  echo "PASS: convergence detector meets accuracy threshold."
  exit 0
fi

echo "FAIL: below threshold. Iterate judge prompt in CONVERGENCE.md."
exit 1
