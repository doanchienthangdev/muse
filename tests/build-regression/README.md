# Build regression harness

Guards against semantic drift from the v2.10 research-pipeline rewrite.

## What it checks

For each shipped persona in `personas/*.md`:

1. Extracts `### ` heading names under `## Signature moves` (stripping the inline category tag like `(framing)`).
2. Compares against `golden/<id>.signatures.txt` — a snapshot of the current move names.
3. If ≥30% of golden moves are missing from the current file, fails with DRIFT.

## Why 30% and not 0%

The pipeline rewrite is expected to find *more* or *slightly different* patterns than the manual-curation era. A strict 0%-drift rule would fail on every persona, making the harness useless.

30% is a judgment call: below that threshold, the drift is noise (one move got renamed, one was rolled into another). Above it, the pipeline is materially changing what moves the persona has, and that deserves a human look.

If you intentionally re-run `/muse:build` and accept the new draft for an existing persona, take a fresh snapshot:

```
bash tests/build-regression/run.sh --snapshot
git add tests/build-regression/golden/
git commit -m "test(regression): refresh golden snapshot for <persona>"
```

## Golden file format

One signature-move name per line, sorted lexicographically. Example (`feynman.signatures.txt`):

```
Cargo cult detection
Curiosity
Hand calculation
Simplification test
View from the mountaintop
```

Sorted so the `comm` diff works deterministically. Category tags (`(framing)`, `(inquiry)`, `(test-probe)`) are stripped — we only track names.

## When to run

- After any edit to `RESEARCH_PIPELINE.md`
- After any edit to `commands/muse:build.md` Step 2
- Before committing a rebuild of any shipped persona
- As part of `/muse:benchmark` if that skill ever calls out to here

## Exit codes

- `0` — all personas match golden within tolerance
- `1` — one or more personas drifted ≥30% OR a golden file is missing
- other — usage error
