# Fixture: semantic-collision-persona (v2.14.0-alpha)

Exercises the v2.14 LLM-judge semantic similarity check in `RESEARCH_PIPELINE.md` Stage 4 Test 3.

**Purpose**: verify that the two-tier filter catches semantic collisions that Jaccard would miss.

## Design

This fixture is constructed to fool a Jaccard lexical check but trigger the LLM-judge:
- Uses different vocabulary than existing shipped personas
- Describes cognitive moves that semantically overlap with existing personas

Specifically, one candidate expresses "make something people talk about" which semantically collides with Seth Godin's **Purple Cow** signature move but uses different words (low Jaccard, high semantic similarity).

## Expected behavior

Run: `/muse:build semantic-collision-fixture --src=tests/fixtures/semantic-collision-persona`

Expected envelope output at `.archives/personas/semantic-collision-fixture/_pipeline_output/*.json`:
- Stage 4 Test 3 should log `semantic_judge_calls: ≥1`
- The "Make-something-worth-talking-about" candidate should be rejected with:
  ```
  exclusive_fail: "seth-godin.Name the previously-unnamed (semantic similarity 0.85, Jaccard 0.22)"
  ```
- Other candidates (if any genuinely distinct) should pass.

**If Jaccard-only mode were active (v2.13 fallback)**: same candidate would PASS Jaccard 0.22 < 0.6 — showing the v2.14 upgrade caught what v2.13 would have missed.

**Not a real persona** — don't commit as `personas/semantic-collision-fixture.md`. Abort at Step 6 (Accept/Refine/Abort).
