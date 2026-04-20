# Fixture: multi-bucket-persona

Simulated source folder for a fictional essayist named "the essayist."

**Purpose**: exercise the v2.10 research pipeline's full 4-subagent fanout
with all conventional buckets populated plus a root README.

Expected extractions (3 signature moves across all buckets):
- Frame-surfacing (articles/a1, books/chapter3, transcripts/t1, notes/n1)
- Falsification test (articles/a1, books/chapter3, transcripts/t1, notes/n1)
- Exit-walk (articles/a2, books/chapter3, transcripts/t1, notes/n1)

All three should pass triple-verification (appear in ≥2 buckets each, have
trigger + example, and are unlikely to Jaccard-collide with shipped personas'
moves).

**Do not** invoke `/muse:build essayist-fixture --src=tests/fixtures/multi-bucket-persona/`
with a real persona id — use a throwaway id or abort at Step 6.
