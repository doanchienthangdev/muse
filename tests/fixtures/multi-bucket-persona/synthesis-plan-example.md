# Example Synthesis Plan (for v2.13 fixture)

This is what `/muse:build` Step 3.5 should produce for the `multi-bucket-persona` fixture. If the actual produced plan differs materially, investigate the deterministic validator or the drafter.

## Plan for the fictional "essayist" persona

| slot              | candidate_name                  | primary_source                                         | bucket       | era    | confidence | cross_refs                       |
|-------------------|---------------------------------|--------------------------------------------------------|--------------|--------|------------|-----------------------------------|
| framing-1         | Frame-surfacing                 | articles/a1-frames-vs-judgement.md                     | articles     | n/a    | high       | books/book-excerpt-chapter3.md   |
| framing-2         | Compared-to-what                | notes/n1-working-notes.md                              | notes        | n/a    | medium     | transcripts/t1-interview.md      |
| inquiry-1         | Falsification-test              | articles/a1-frames-vs-judgement.md                     | articles     | n/a    | high       | books/book-excerpt-chapter3.md   |
| inquiry-2         | Walk-the-exit                   | articles/a2-on-exit-paths.md                           | articles     | n/a    | high       | transcripts/t1-interview.md      |
| test-probe-1      | Obvious-answer-audit            | articles/a2-on-exit-paths.md                           | articles     | n/a    | medium     | notes/n1-working-notes.md        |
| test-probe-2      | Three-moves-audit               | books/book-excerpt-chapter3.md                         | books        | n/a    | high       | articles/a1, notes/n1            |
| cognitive-1       | Every-decision-has-a-frame      | books/book-excerpt-chapter3.md                         | books        | n/a    | high       | articles/a1, articles/a2         |
| cognitive-2       | Obvious-answers-skip-scrutiny   | articles/a1-frames-vs-judgement.md                     | articles     | n/a    | high       | books/book-excerpt-chapter3.md   |
| cognitive-3       | Optionality-is-the-asset        | articles/a2-on-exit-paths.md                           | articles     | n/a    | high       | transcripts/t1-interview.md      |
| cognitive-4       | Identity-can't-be-updated       | books/book-excerpt-chapter3.md                         | books        | n/a    | medium     | —                                 |
| analogous-1       | Student-turned-position-into-identity | books/book-excerpt-chapter3.md                  | books        | n/a    | high       | —                                 |
| analogous-2       | Year-3-funding-refusal          | articles/a2-on-exit-paths.md                           | articles     | n/a    | medium     | —                                 |
| taglines-default  | "The frame determines the answer" | articles/a1                                          | articles     | n/a    | high       | —                                 |
| taglines-framing  | "Walk the exit before committing" | articles/a2                                          | articles     | n/a    | high       | —                                 |
| taglines-inquiry  | "What would change your mind?"  | books/book-excerpt-chapter3.md                         | books        | n/a    | high       | —                                 |

## Expected deterministic validator verdict

- **Check A (Coverage)**: plan has ~15 entries; pipeline returned ~10-15 verified findings (from multi-bucket small fixture). Coverage ratio ≈ 0.8-1.0 → PASS (exceeds 0.3 threshold for medium corpus).
- **Check B (Bucket balance)**: 3 buckets with findings (articles, books, transcripts, notes). Plan entries cite all 4 buckets. PASS.
- **Check C (No hallucinations)**: every `primary_source` above maps to a real fixture file. PASS.
- **Check D (Cross-bucket balance per move)**: every signature_move slot has ≥1 `cross_refs` from a different bucket. PASS.
- **Check E (Era coverage)**: fixture is not multi-era. Skip — not applicable.

Expected output: `Synthesis Plan validator: PASS (deterministic, 5/5 checks green)`.

## Contrast case

A BAD synthesis plan for this fixture (should FAIL) would:
- Only cite `articles/` as primary_source for all moves → FAIL Check B (bucket imbalance)
- Miss ≥50% of pipeline findings → FAIL Check A
- Invent a `cognitive-5: Third-option-instinct` not in the fixture → FAIL Check C
- Have `cross_refs` empty everywhere → FAIL Check D

This file is a golden reference for fixture-based testing.
