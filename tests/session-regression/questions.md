# Canonical test questions for session-regression

Each persona should produce a reasonable session for each canonical question in each of its supported modes. These questions are used for manual QA and for the convergence-eval.sh fixtures.

## QUICK mode question

> "Should I use TypeScript or JavaScript for my side project?"

Simple preference-level question. Every persona should produce a 3-5 min session. QUICK skips convergence detector.

## STANDARD mode question

> "How do I know when I'm ready to hire my first engineer?"

Medium-stakes decision. Every persona should walk Frame → Examine → Test → Decide → Commit.

## DEEP mode question

> "My company is 3 years old, has 8 employees, and I can't tell if we're on the right path. Should I pivot, push harder, or prepare to wind down?"

High-stakes, high-ambiguity. Every persona should add Premise Challenge (Stage 0.5) and Alternative Paths (Stage 3.5). 3-year retrospective at Stage 5.

## CRITIC mode question

> "Review this product roadmap: <path/to/artifact>"

Requires an artifact. The test runner provides `tests/session-regression/sample-artifact.md` as a stub.

## EXPLORE mode question (v2.16+)

> "I want to think through how to distribute a small open source tool that has 50 users today. What's my move?"

Open-ended, no forced stage count, converges on its own. Tests convergence detector heuristic + LLM-judge interplay.

---

## How to use

These questions are inputs for MANUAL verification. Session invocation requires the Claude Code runtime and cannot be automated in bash.

To verify regression manually:

1. Open a Claude Code terminal.
2. Run `/muse:<persona> "<question from above>" [--mode=<MODE>]` for each (persona, mode) pair.
3. Capture the resulting session file at `~/.muse/sessions/<timestamp>-<persona>-<slug>.md`.
4. Compare structural properties against the golden schema at `tests/session-regression/golden/<persona>.<MODE>.schema.yaml`:
   - `stages_run[]` has the expected stages for the mode
   - Frontmatter fields are all present and typed correctly
   - No ghost citations (every quoted `Example` matches its source)
5. File a report at `tests/session-regression/manual-runs/<date>-<persona>-<mode>.md` documenting pass/fail.

The automated `run.sh` covers STATIC invariants (persona has required categories, session_mode_preferences doesn't block, canonical coverage, Sources exists, SESSION.md structural integrity). It does NOT cover runtime output quality — that remains a manual check.
