# Fixture: sparse-bucket-persona

Exercises v2.13 balanced-provenance sparse-corpus exception.

**Layout**: only `notes/` has content. `articles/`, `books/`, `transcripts/` absent or empty.

**Purpose**: validate that balanced-provenance gate warns (not blocks) when the corpus has <2 buckets with verified findings. The Synthesis Plan (Step 3.5) deterministic Check D should emit a warning, not a FAIL, for single-bucket corpora.

## Expected pipeline behavior

- Bucket detection: 1 bucket (`notes`) with findings, or 1 bucket + `root`
- Triple-verification: cross-domain test (Test 1) must be relaxed — single-bucket fallback requires ≥3 files within the same bucket
- Synthesis Plan validator: emits warning "sparse corpus, cross-bucket balance not enforceable" — does NOT fail

## Expected /muse:build behavior

- Step 3.5 Check D (cross-bucket balance per move): warn-not-fail
- Step 5.95b save-gate balanced-provenance: warn-not-fail
- Persona should save successfully despite single-bucket provenance

**DO NOT** invoke `/muse:build` against a real persona id with this fixture. Use throwaway id like `sparse-fixture-run`.
