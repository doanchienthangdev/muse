# Fixture: timeout-resilience-persona (v2.14.0-alpha)

Documents the expected behavior when the v2.14 auto-retry path activates in `RESEARCH_PIPELINE.md` Stage 2 timeout-and-partial-failure section.

**Purpose**: describe what should happen when a subagent times out or returns malformed JSON. This fixture is documentation-only — it does not reliably trigger real timeouts (which depend on network + Agent tool state).

## Expected behavior

### Scenario 1 — Subagent times out on first attempt

Pipeline dispatches bucket subagent → wait 600s → timeout.

**v2.14 should**:
1. Log the timeout: `"subagent_timeout_bucket_X"` in warnings[]
2. Re-dispatch the same bucket with simplified prompt:
   - Drop findings categories beyond cognitive_patterns + sources + distinctive_questions
   - Reduce per-file budget by 40%
   - Shorter output envelope schema
3. Wait another 600s for the retry
4. On retry success: merge partial envelope with `subagent_retry_count: 1, retry_succeeded: true`
5. On retry failure: log `retry_failed`, skip bucket, envelope records `retry_succeeded: false`

### Scenario 2 — Subagent returns malformed JSON

Pipeline dispatches → receives non-JSON or schema-violating output.

**v2.14 should**:
1. Log the parse failure: `"malformed_json_bucket_X"` in warnings[]
2. Re-dispatch with simplified prompt emphasizing "Return ONLY valid JSON, no markdown code fences, no preamble"
3. Same retry logic as Scenario 1

### Scenario 3 — All buckets fail (after retries)

Pipeline dispatches all N buckets → all N fail → all N retry → all N fail again.

**v2.14 should**:
- Emit envelope with `status: "no_verified_patterns"`
- Caller (muse:build Step 2) prints: *"All N buckets failed to produce research output (including retries). Check the source folder, check Agent tool availability, and re-run."*
- Do not proceed to Stage 3 merge

## Why this fixture is documentation-only

Real timeout behavior depends on:
- Network latency
- Agent tool availability
- File size (large bucket → longer subagent work)
- Claude Code runtime version

These are not deterministic, so a pure fixture can't reliably trigger timeouts. Instead, this README documents the contract. A manual / exploratory test might:
1. Create a bucket with many large files to stress the subagent
2. Kill the Agent dispatch mid-flight via Claude Code stop-task
3. Verify the retry behavior engages

For repeatable testing, unit tests would need to mock the Agent dispatch — outside the scope of muse's markdown-only test philosophy.

## Fixture contents

Empty — this is doc-only. Marker files below demonstrate expected layout.
