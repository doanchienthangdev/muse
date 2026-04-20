# Fixture: large-corpus-persona

**Empty by default.** Drop your own large corpus here to stress-test the
pipeline's skim-then-deepen PDF strategy and 100-file-per-bucket cap.

## Recommended shape

```
large-corpus-persona/
├── articles/           # 10-20 .md files, each 500-2000 words
├── books/              # 3-5 PDFs, at least one >100 pages
├── transcripts/        # 5-10 .srt or .md files
└── notes/              # 2-3 personal note files
```

Minimum scale for meaningful stress test: 50 files total, at least one book
>100 pages, total folder size 50-100 MB.

## What to look for in the pipeline coverage report

- **Per-bucket subagent duration**: each bucket should return in <300s.
  If one takes >300s, the partial-failure path should kick in.
- **PDF budget enforcement**: books bucket should report `budget:100pg-cap`
  warnings for any book >100 pages.
- **Files skipped**: any file >50MB or with null bytes in first 1KB should
  appear in `files_skipped[]` with reason, not silently dropped.
- **Cross-bucket corroboration**: if the same cognitive pattern appears in
  articles and books, it should merge into ONE candidate with `bucket_count:
  2` in the verified pool.

## Why not ship files?

This fixture is intentionally empty. Large files (hundreds of MB) would bloat
the repo. Real stress testing requires your own corpus, ideally from an
existing `.archives/personas/<id>/` folder you have.

Quick setup: `cp -r .archives/personas/philip-kotler/* tests/fixtures/large-corpus-persona/`
(don't commit the copy — it's gitignored).
