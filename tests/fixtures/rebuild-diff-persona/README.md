# rebuild-diff-persona fixture (v2.15.0-alpha)

Exercises `/muse:rebuild` A/B comparison + user choice workflow.

## Scenario

An existing v2.1 persona file (`persona-v1.md`) with known gaps:
- Only 3 signature moves (2 framing, 1 inquiry, 0 test-probe) → C2 fail (missing test-probe)
- Only 4 taglines, all in `default` context → C9 drift
- `## Cognitive patterns` section is missing entirely → C11 fail
- Corpus folder has 5 files including a transcript that wasn't mined in v1

`/muse:rebuild` should:

1. Back up `persona-v1.md` to `persona-v1.md.bak.<ts>`
2. Preserve the old as `persona-v1.md.rebuild-preserved`
3. Invoke `/muse:build` over the 5-file corpus — should produce `persona-v2-draft.md` with:
   - 5+ signature moves covering all 3 categories
   - 5+ context-specific taglines
   - 7+ cognitive patterns
   - Full C1-C12 compliance
4. Present A/B comparison showing:
   - +2 signature moves, +1 category coverage
   - +3 taglines, +all missing contexts now covered
   - +7 cognitive patterns (section created)
   - +3 more citations from the transcript
5. User option A (accept new): `personas/rebuild-diff-test.md` = v2-draft, old kept at .bak.*
6. User option B (keep old): `personas/rebuild-diff-test.md` = v1, new draft discarded
7. User option C (merge): interactive walk-through of each diff

## Files

```
rebuild-diff-persona/
├── README.md                           # this file
├── persona-v1.md                       # pre-rebuild state (gaps documented above)
├── persona-v2-expected.md              # post-rebuild expected output (option A path)
├── corpus/
│   ├── articles/
│   │   ├── source-1.md                 # covered in v1
│   │   ├── source-2.md                 # covered in v1
│   │   └── source-3.md                 # covered in v1
│   ├── books/
│   │   └── book-excerpt.md             # covered in v1
│   └── transcripts/
│       └── interview.md                # NOT covered in v1 — gap
└── expected/
    ├── ab-diff.txt                     # expected A/B diff output
    └── compliance-delta.txt            # expected C-check before/after
```

## Running the test

```bash
# Pre: ensure no stale backups
rm -f tests/fixtures/rebuild-diff-persona/persona-v1.md.bak.*

# Rebuild (interactive)
/muse:rebuild rebuild-diff-test

# When prompted A/B/C:
#   A) accept new — produces persona-v2 matching persona-v2-expected.md
#   B) keep old — restores persona-v1
#   C) merge — walks each diff interactively
```

## Pass criteria

- Backup file `persona-v1.md.bak.<ts>` is created before any write
- A/B comparison output mentions the specific deltas listed above
- Option A: final persona matches `persona-v2-expected.md` structurally (signature-move names + category coverage + cognitive-pattern count)
- Option B: `persona-v1.md` is identical to original (no corruption)
- Option C: each diff item prompts individually, final merge produces user's choices
- Regression harness PASSes on all three paths (A/B/C produce valid v2.2-compliant personas)
- Analytics log entry written to `~/.muse/analytics/rebuild.jsonl`
