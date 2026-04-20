# Muse v2.16 — Shared LLM-judge dispatch primitive

**This file is the load-bearing spec for any Agent-based LLM-judge call in muse.**

Two callers in v2.16:
- `RESEARCH_PIPELINE.md` Stage 4 Test 3 — semantic similarity judge for exclusive filter (v2.14)
- `CONVERGENCE.md` — session convergence detector (v2.16)

Future callers (v2.17+) may include: session-replay consistency check, queryable-history relevance judge, council merge-quality judge.

---

## Why shared

All three callers have the same shape:
1. Build a prompt with input context
2. Dispatch Agent subagent with strict JSON output schema
3. Parse response; on parse failure → heuristic fallback
4. Log to `~/.muse/analytics/llm-judge.jsonl`
5. Return verdict

Factoring this primitive means fixes (new fallback, cost tracking, caching) apply to all callers at once.

---

## Contract

### Input

```typescript
{
  caller: "research-pipeline" | "session-convergence" | "council-merge" | ...,
  prompt: string,                          // full prompt with input filled in
  schema: {                                // expected JSON output shape
    required_keys: string[],               // keys that must appear
    enum_values?: { [key: string]: string[] }  // allowed values per key
  },
  timeout_ms?: number,                     // default 30000
  fallback_verdict?: any,                  // default per-caller (see below)
  deterministic_mode?: boolean             // MUSE_REGRESSION_MODE propagates here
}
```

### Output

```typescript
{
  verdict: { [key: string]: any },         // parsed JSON object, schema-validated
  source: "llm-judge" | "fallback" | "cache",
  latency_ms: number,
  fallback_reason?: "timeout" | "parse_error" | "schema_invalid" | "deterministic_mode"
}
```

### Dispatch algorithm

```
1. If deterministic_mode (MUSE_REGRESSION_MODE=true):
   → return fallback_verdict immediately with source:"fallback" fallback_reason:"deterministic_mode"

2. Build cache key: sha1(caller + prompt + schema.required_keys.join(','))
   If cache hit in ~/.muse/analytics/llm-judge-cache.jsonl (last 24h):
   → return cached verdict, source:"cache"

3. Dispatch Agent:
   Agent({
     description: `<caller> judge`,
     subagent_type: "general-purpose",
     prompt: prompt + "\n\nReturn ONLY a JSON object matching this schema: " + JSON.stringify(schema)
   })

4. Wait up to timeout_ms.
   - If timeout: return fallback_verdict, source:"fallback" fallback_reason:"timeout"
   - Else: proceed

5. Parse the Agent response:
   - Strip markdown code fences if present
   - Find the first { and last }; substring is the JSON candidate
   - JSON.parse that
   - If parse fails: return fallback_verdict, source:"fallback" fallback_reason:"parse_error"

6. Validate schema:
   - Every required_key present
   - If enum_values specified, each value matches one of the enum options
   - If invalid: return fallback_verdict, source:"fallback" fallback_reason:"schema_invalid"

7. Log to ~/.muse/analytics/llm-judge.jsonl:
   { ts, caller, input_hash, verdict, latency_ms, source, fallback_reason? }

8. Write to cache (24h TTL)

9. Return { verdict, source:"llm-judge", latency_ms }
```

### Caller-specific schemas

**session-convergence** (consumed by CONVERGENCE.md):
```json
{
  "required_keys": ["verdict", "reason", "next_action"],
  "enum_values": {
    "verdict": ["converged", "deepen", "pivot", "handoff"]
  }
}
```
Fallback verdict: `{ "verdict": "deepen", "reason": "judge timeout, defaulting to deepen", "next_action": {} }`

**research-pipeline** (consumed by Stage 4 Test 3):
```json
{
  "required_keys": ["SIMILARITY", "REASON"],
  "enum_values": {}
}
```
Fallback verdict: `{ "SIMILARITY": 0.0, "REASON": "judge timeout, defaulting to distinct" }`

### Budget guards

- **Latency**: soft limit 30s per call (configurable), hard abort at 60s
- **Cost**: ~500 tokens in + 100 tokens out per call. A 10-stage EXPLORE session = 10 judge calls = ~6000 tokens. Acceptable.
- **Rate**: no rate limit at the muse layer; Claude Code handles it

### Cache invalidation

Cache key includes prompt hash. If caller changes its prompt template, cache key changes automatically — no stale cache. Cache is 24h TTL; stale entries are pruned on next write.

Cache directory: `~/.muse/analytics/llm-judge-cache/` (one file per key). `jsonl` format: one JSON record per line.

Reset cache: `rm -rf ~/.muse/analytics/llm-judge-cache/`.

### Deterministic mode

When `MUSE_REGRESSION_MODE=true` env var is set:
- Every LLM-judge call returns `fallback_verdict` immediately
- `source: "fallback"`, `fallback_reason: "deterministic_mode"`
- Callers MUST handle the fallback verdict gracefully (this is the whole point)

For session convergence: fallback = `deepen`. This means EXPLORE mode in regression will simply loop the current stage up to the safety cap (15 stages), hit the cap, force `converged`. Deterministic, testable.

For research-pipeline: fallback = `similarity 0.0`. Exclusive filter passes (candidate is distinct). Deterministic.

### Versioning

- v2.14: RESEARCH_PIPELINE.md introduced pattern (ad-hoc, per-caller)
- v2.16: this shared spec; both callers refactored to use it
- v2.17+: additional callers (council merge, session replay) reuse

---

*Version: 2.16.0-alpha · part of muse-core · the shared LLM-judge primitive for CONVERGENCE.md and RESEARCH_PIPELINE.md.*
