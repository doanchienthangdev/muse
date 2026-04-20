# Convergence Detector Evaluation Fixtures

10 labeled fixtures for evaluating the convergence detector's verdict accuracy (v2.16).

Per `CONVERGENCE.md` §"Eval suite": pass threshold is ≥70% verdict accuracy (7 of 10 correct).

## Fixture file format

Each fixture is a YAML file with the input context + expected verdict:

```yaml
expected_verdict: converged | deepen | pivot | handoff
input:
  stage_id: stage_3_test
  persona_id: feynman
  mode: EXPLORE
  stages_completed: [stage_0, stage_0_5, stage_1, stage_2, stage_3_test]
  pivots_so_far: 0
  original_question: "..."
  current_framing: "..."
  last_stage_output: |
    <the agent output being evaluated>
  outputs_so_far: |
    <compressed history of prior stages>
notes: |
  Why this should return <expected_verdict>. Rationale for the label.
```

## Labeling rubric

### `converged` (3 fixtures)
The thinking has reached a clear, committable decision. The persona has produced a concrete next action with grounded reasoning. No open questions remain at the current depth.

### `deepen` (3 fixtures)
The output is getting more specific and fruitful but isn't yet actionable. Another probe from the same persona in the same category would likely produce the landing insight. The user isn't ready to commit.

### `pivot` (2 fixtures)
The current framing is producing non-answers or circular reasoning. A different framing would unlock the thinking. The persona should loop back to Stage 1 with the new frame.

### `handoff` (2 fixtures)
The persona is clearly the wrong tool for what's emerging. A specific other persona is better suited (e.g., Feynman asked for Socratic elenchus, or Paul Graham asked for Dieter Rams' subtractive design thinking).

## Fixture list

| File | Expected verdict | Scenario |
|---|---|---|
| converged-1.yaml | converged | Feynman at Stage 5 Commit with concrete number + deadline |
| converged-2.yaml | converged | Seth Godin at Stage 3 Test revealing the specific tribe |
| converged-3.yaml | converged | Paul Graham Stage 4 decision w/ clear rationale |
| deepen-1.yaml | deepen | Feynman Stage 3 probe revealed anomaly but no measurement |
| deepen-2.yaml | deepen | Socrates elenchus surfaced contradiction but user hasn't reacted |
| deepen-3.yaml | deepen | Aristotle Stage 2 named the cause but didn't connect to outcome |
| pivot-1.yaml | pivot | Seth Godin session that keeps producing generic "remarkable" advice |
| pivot-2.yaml | pivot | Feynman examining code but framing is about team dynamics |
| handoff-1.yaml | handoff | Paul Graham asked for rigorous math check — Feynman is better |
| handoff-2.yaml | handoff | Aristotle asked for product subtraction — Dieter Rams is better |

## Running the eval

Session invocation requires the Claude Code runtime; `convergence-eval.sh` documents the procedure for manual + automated runs.

```bash
bash tests/session-regression/convergence-eval.sh --fixture converged-1.yaml
```

See `convergence-eval.sh` for the full workflow.
