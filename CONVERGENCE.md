# Muse v2.16 — Convergence Detector

**This file is the load-bearing spec for convergence detection in EXPLORE mode and any loop-capable session context.**

Invoked from `SESSION.md` after each stage completes in EXPLORE mode (and optionally in DEEP mode's Stage 3 loop). Uses the shared LLM-judge primitive from `LLM_JUDGE.md`.

---

## Purpose

The convergence detector answers one question per stage: **has the thinking landed, or do we need more?**

Four possible verdicts:
- `converged` — thinking has landed; session should advance to Stage 5 artifact generation
- `deepen` — current stage produced useful output but needs more depth; loop back to re-run with additional probe
- `pivot` — framing or fork needs to change; loop back to Stage 1 with new framing
- `handoff` — current persona is wrong tool for what's emerging; suggest handoff to a different persona

---

## Two-tier architecture

Heuristic tier runs first (zero cost, ~0ms). If heuristic returns high-confidence verdict, LLM-judge is skipped. If uncertain, LLM-judge is dispatched.

### Tier 1 — Cheap heuristic

Zero-cost signals computed from the session state:

**1. Word-count delta** — compare the word count of the last stage output against the previous stage. If delta < 15% (agent is repeating itself), lean `converged`.

**2. Repetition score** — if the last 2 stages used the same signature_move AND produced similar structured output (Jaccard >= 0.7 on first 100 words), lean `deepen` or `handoff` (depending on pivot counter).

**3. Pivot counter** — if `pivots_so_far > 3` without convergence, the persona may be wrong. Force `handoff` suggestion.

**4. Session length safety cap** — if `stages_completed > 15` in EXPLORE mode, force `converged`. User warned, can `/rewind` if premature.

**5. Mode-specific policy** (v2.16 eng-review decision):
- **QUICK mode**: LLM-judge NEVER invoked (heuristic-only). Target 3-5 min total; judge adds ~30s × stages = too much overhead.
- **STANDARD, CRITIC**: heuristic first; LLM-judge only if heuristic uncertain (no rule fires with >=0.8 internal confidence).
- **DEEP, EXPLORE**: LLM-judge on every stage (depth > speed).
- **MUSE_REGRESSION_MODE=true**: LLM-judge DISABLED (per LLM_JUDGE.md deterministic_mode).

### Heuristic internal confidence

The heuristic tier computes a rough confidence for its own routing ("is heuristic sure enough to skip LLM-judge dispatch?"). This is NOT surfaced in the final verdict; it's internal state.

| Rule fired | Internal confidence |
|---|---|
| Safety cap (stages > 15) | 1.0 (always skip LLM-judge) |
| Pivot counter > 3 | 0.9 (mostly skip) |
| Word-count delta < 15% AND pivot_counter = 0 | 0.8 (skip) |
| Repetition score > 0.7 | 0.6 (borderline — may need LLM-judge) |
| Word-count delta 15-30% | 0.4 (uncertain — LLM-judge) |
| Word-count delta > 30% (persona producing new content) | 0.2 (definitely LLM-judge) |
| No rule fires | 0.0 (LLM-judge) |

If heuristic confidence >= 0.8, skip LLM-judge. Otherwise dispatch.

### Tier 2 — LLM-judge

Invoked via `LLM_JUDGE.md` shared primitive with:

- `caller`: `"session-convergence"`
- `prompt`: constructed from session state (see below)
- `schema`: `{ required_keys: ["verdict", "reason", "next_action"], enum_values: { verdict: ["converged", "deepen", "pivot", "handoff"] } }`
- `timeout_ms`: 30000
- `fallback_verdict`: `{ verdict: "deepen", reason: "judge timeout/fallback, defaulting to deepen", next_action: {} }`

**Prompt template**:

```
You are a thinking-convergence judge. Decide whether the current thinking 
session has landed, needs more depth, needs to pivot framing, or needs a 
different persona.

=== SESSION STATE ===
Persona: {persona_id} ({persona_name})
Mode: {mode}
Original question: {question}
Current framing (from Stage 1): {current_framing}
Stages completed so far: {stages_completed_count} stages — {stages_list}
Pivots so far: {pivots_so_far}
Last stage output (just produced):
---
{last_stage_output}
---

Prior stage outputs (compressed, most recent last):
---
{outputs_so_far_compressed}
---

=== DECIDE ===
Return ONLY a JSON object with this shape:
{
  "verdict": one of ["converged", "deepen", "pivot", "handoff"],
  "reason": "one sentence",
  "next_action": {
    "if_deepen": "which stage to loop back to, or 'stay at current + run another probe'",
    "if_pivot": "new framing to try",
    "if_handoff": "suggested persona-id (must be one of the installed personas)",
    "if_converged": "which artifact type fits: log | memo | rfc | onepager | spec"
  }
}

Rules:
- If the thinking has reached a clear committable decision with concrete next action: converged
- If output is getting more specific and fruitful but not yet actionable: deepen
- If the current framing keeps producing non-answers, surface a different framing: pivot
- If the persona is clearly the wrong tool (e.g., Feynman asked for Socratic elenchus): handoff
- When uncertain, prefer deepen over converged. Bad artifact from early convergence is worse than one more probe.
- NEVER propose handoff to a persona not installed. Check the installed list (provided below) before suggesting.

Installed personas: {persona_list}
```

**Per-persona context budget**: 500 tokens in + 100 tokens out expected. `outputs_so_far_compressed` is truncated to 1500 chars total, oldest-first dropped first. `last_stage_output` is full (not compressed).

---

## Loop-back protocol

The session orchestrator handles each verdict:

### `converged`
- Advance to Stage 5 (Commit + artifact)
- Use `next_action.if_converged` as the default artifact type for Stage 5's AskUserQuestion
- User still gets to pick a different type if they disagree

### `deepen`
- Stay at the current stage OR return to the stage specified in `next_action.if_deepen` (if the judge cites an earlier stage)
- Re-run the stage with a new probe derived from `reason`. Concrete approach:
  - Prepend `reason` to the stage's lens-selection prompt
  - Pick a DIFFERENT signature_move from the persona than the one just used (same category)
  - If no different move in category available, pick a move from an adjacent category (inquiry → test-probe)
  - Increment `deepen_loops` frontmatter counter
- Max 3 consecutive `deepen` verdicts → force `converged` (per LLM_JUDGE.md fallback rule + CEO plan)

### `pivot`
- Loop back to Stage 1 with `next_action.if_pivot` as the new framing
- Increment `pivots` counter
- Preserve prior stage outputs in `stages_run[]` (they're part of the history); next Stage 1 is a NEW stage with a higher index, not a replacement
- Print banner: `=== PIVOTING: <old framing> → <new framing> ===`

### `handoff`
- Offer handoff to `next_action.if_handoff` via AskUserQuestion:
  - A) Yes, handoff to `<suggested persona>` (Recommended if the reason is compelling)
  - B) No, stay with current persona, continue exploring (overrides judge)
  - C) Handoff to a different persona (user names it)
  - D) End session, no handoff (jump to Stage 5 with whatever we have)
- On A/C: spawn linked session per SESSION.md handoff protocol
- On B: mark `handoff_declined: true` in frontmatter; judge will not re-suggest same handoff for N stages (N=3)
- On D: advance to Stage 5

---

## Output logging

Every convergence call appends to `~/.muse/analytics/convergence.jsonl`:

```json
{
  "ts": "2026-04-22T14:00:00Z",
  "session_path": "~/.muse/sessions/...",
  "persona": "feynman",
  "mode": "EXPLORE",
  "stage": "stage_3_test",
  "stages_completed": 7,
  "pivots_so_far": 1,
  "heuristic_confidence": 0.6,
  "heuristic_verdict": null,
  "llm_judge_invoked": true,
  "verdict": "deepen",
  "reason": "probe revealed a specific anomaly but no measurement yet",
  "source": "llm-judge",
  "latency_ms": 4231
}
```

---

## Failure modes

| Mode | Handling |
|---|---|
| Heuristic computes with no data (first stage, no prior output) | Default `deepen` (continue session) |
| LLM-judge timeout | Fallback `deepen` (per LLM_JUDGE.md) |
| LLM-judge returns invalid JSON | Fallback `converged` (force stage 5; user can `/rewind` if premature) |
| LLM-judge suggests handoff to uninstalled persona | Filter out — re-ask judge once with updated persona list; if still suggests missing persona, treat as `deepen` |
| 3 consecutive `deepen` with no progress | Force `converged` (safety cap 2) |
| Session stages > 15 in EXPLORE | Force `converged` (safety cap 1) |

---

## Eval suite

The convergence detector is eval'd at Phase 2.16.9 via 10 labeled fixtures in `tests/session-regression/convergence-fixtures/`:
- 3 `converged-*.md` (clear landing points)
- 3 `deepen-*.md` (premature would-be convergence)
- 2 `pivot-*.md` (framing drift detectable)
- 2 `handoff-*.md` (obvious persona mismatch)

Each fixture is a session file with known correct verdict in filename. `tests/session-regression/convergence-eval.sh` invokes the heuristic + LLM-judge against each, measures verdict accuracy. Pass threshold: >= 70% overall accuracy (7 of 10 correct).

If below threshold, the judge prompt is wrong and must be iterated.

---

*Version: 2.16.0-alpha · part of muse-core · consumed by SESSION.md EXPLORE mode stage orchestrator. Uses LLM_JUDGE.md shared primitive.*
