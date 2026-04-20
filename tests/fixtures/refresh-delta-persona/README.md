# refresh-delta-persona fixture (v2.15.0-alpha)

Exercises `/muse:refresh` staleness detection + delta-mine + merge workflow.

## Scenario

A previously-mined persona file (`persona-before.md`) with a `corpus_fingerprint` frontmatter field pointing at a 3-file corpus. After the fingerprint was written, a 4th file was added to the corpus with a recent mtime. `/muse:refresh` should:

1. Read the fingerprint → `last_mined: "2026-03-15T10:00:00Z"`
2. Scan the corpus → finds 4 files
3. Compare counts: fingerprint says 3 articles, current is 4 → `stale`
4. Use `find -newermt "2026-03-15T10:00:00Z"` → returns `articles/post-2026-04-20.md`
5. Dispatch delta-mode subagent over just that file
6. Subagent emits envelope with 1 new cognitive_pattern candidate
7. `/muse:refresh` proposes the new pattern via AskUserQuestion
8. On accept: merges into `persona-before.md` → writes `persona-after.md` (expected output)
9. Updates fingerprint: `last_mined` → now(), `articles: 4`, `total_files: 4`

## Files

```
refresh-delta-persona/
├── README.md                           # this file
├── persona-before.md                   # pre-refresh state (3-file fingerprint)
├── persona-after-expected.md           # post-refresh expected output
├── corpus/
│   ├── articles/
│   │   ├── post-2026-01-10.md          # mtime: 2026-01-10 (in fingerprint)
│   │   ├── post-2026-02-14.md          # mtime: 2026-02-14 (in fingerprint)
│   │   ├── post-2026-03-05.md          # mtime: 2026-03-05 (in fingerprint)
│   │   └── post-2026-04-20.md          # mtime: 2026-04-20 (NEW — the delta)
│   └── books/                          # empty, count=0 in fingerprint
└── expected/
    ├── stale-state.txt                 # expected compare_fingerprint() output
    └── delta-file-list.txt             # expected newer-than-mtime file list
```

## Running the test

```bash
# Pre: set mtimes on corpus files to match the fingerprint's snapshot
touch -t 202601101000 corpus/articles/post-2026-01-10.md
touch -t 202602141000 corpus/articles/post-2026-02-14.md
touch -t 202603051000 corpus/articles/post-2026-03-05.md
touch -t 202604201000 corpus/articles/post-2026-04-20.md

# Dry-run check: should report "stale" with 1 newer file
/muse:refresh refresh-delta-test --check

# Full refresh: should propose 1 new cognitive pattern merge
/muse:refresh refresh-delta-test
```

## Pass criteria

- `--check` output contains "stale" and lists `post-2026-04-20.md`
- Full refresh mentions "+1 new findings merged" in close message
- Post-refresh persona frontmatter has `last_mined` updated to current time
- Post-refresh `bucket_counts.articles` = 4 (was 3)
- `persona-after.md` has the new cognitive pattern appended
- Regression harness PASSes (no signature moves removed from pre-state)
