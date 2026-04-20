# Muse tests

Behavioral tests for `/muse:build`, `/muse:update`, and the v2.10 research pipeline.

This is a markdown-skill project — there's no Node/Python/Ruby runner. "Running a test" means invoking a skill against a fixture folder with an agent runtime (typically Claude Code) and comparing output against a golden file.

The harnesses in this directory automate the comparison part. You still invoke `/muse:build` manually (the agent runtime is the thing under test; we can't shell out to it from bash portably).

## Layout

```
tests/
├── README.md                      # This file
├── run.sh                         # Orchestrator — prints what to run + invokes comparison
├── fixtures/
│   ├── minimal-persona/           # 1 bucket, 3 files — smoke test
│   ├── multi-bucket-persona/      # All 4 conventional buckets + root — full fanout
│   ├── large-corpus-persona/      # 50+ files — stress test (drop your own files)
│   └── adversarial-persona/       # Files with [INST]/<<SYS>>/{{...}} — sanitization test
└── build-regression/
    ├── run.sh                     # Regression harness over 11 shipped personas
    ├── golden/                    # Snapshot of signature-move names per persona
    └── README.md                  # What each golden file means
```

## How to run tests

### Smoke test (minimal-persona)

```
bash tests/run.sh minimal-persona
```

What it checks:
- RESEARCH_PIPELINE.md can handle a persona folder with only a `notes/` subfolder
- Empty-bucket handling for `articles/`, `books/`, `transcripts/`
- Pipeline returns `status: "ok"` even with one bucket

What you do:
1. `run.sh` prints the exact command to paste into Claude Code
2. You invoke `/muse:build minimal-fixture --src=tests/fixtures/minimal-persona`
3. When `/muse:build` finishes Step 2, copy the pipeline coverage report into `tests/fixtures/minimal-persona/actual-coverage.txt`
4. `run.sh` diffs against `tests/fixtures/minimal-persona/expected-coverage.txt`

### Multi-bucket test

```
bash tests/run.sh multi-bucket-persona
```

Exercises all 4 conventional buckets plus root. Verifies parallel subagent dispatch returns envelopes from each.

### Adversarial test

```
bash tests/run.sh adversarial-persona
```

Files contain `[INST]...[/INST]`, `<<SYS>>`, `{{malicious}}` patterns. Expected: pipeline still returns a valid envelope, sanitization is visible in subagent output, `possible_injection_attempt: true` flags appear in `warnings[]`.

**DO NOT actually `/muse:build` this fixture against a production persona id.** Use a throwaway id like `adversarial-fixture`.

### Regression harness

```
bash tests/build-regression/run.sh
```

Re-runs `/muse:build` against each of the 11 shipped personas' `.archives/personas/<id>/` folders. Diffs the new draft's `signature_moves` names against `tests/build-regression/golden/<id>.signatures.txt`. Flags if ≥30% of moves go missing or change.

This is the guard against semantic drift from the v2.3 pipeline rewrite. Run it after any change to RESEARCH_PIPELINE.md or commands/muse:build.md Step 2.

### Ghost-citation gate

Built into Step 5.95 of `/muse:build`. Any saved persona must have every `Example:` quote traceable to a source file. There's no separate test — if `/muse:build` completes without FAIL at Step 5.95, the gate passed.

## Unit-level checks (embedded in run.sh)

The 23 unit paths from the eng review coverage diagram are implemented as assertions inside `run.sh`:

- Bucket Detection (5 paths)
- Subagent Dispatch (5 paths)
- Merge + Dedupe (3 paths)
- Triple-Verification Filter (5 paths)
- PDF Skim-then-Deepen (5 paths)

Each fixture exercises a subset. `run.sh` records which paths were exercised and prints coverage at the end.

## When to run

- Before committing changes to RESEARCH_PIPELINE.md
- Before committing changes to commands/muse:build.md Step 2 or commands/muse:update.md C7/C8
- Before tagging a new release (v2.3.x)
- After pulling upstream changes to verify nothing drifted on your machine

## Dependencies

- `bash` 3.2+ (macOS default OK)
- `diff` (POSIX)
- `jq` (optional — pretty-print pipeline envelopes)
- An agent runtime that supports `/muse:build`: Claude Code, Codex CLI, or Gemini CLI

No other dependencies.
