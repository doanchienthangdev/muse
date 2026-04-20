# Fixture: large-year-archive

Exercises the v2.13 year-archive granularity heuristic in RESEARCH_PIPELINE.md Step 2B.

**Layout**: single file `articles/year-2026.md` containing ~50 concatenated short posts, each prefixed with a `##` heading. File size ~200KB.

**Heuristic detection**:
- `##` heading count: ~50 (well over 30)
- File size: ~200KB (well over 100KB)
- Expected: pipeline treats as MULTI-DOCUMENT, triggers Stratified Sampling

**Expected extraction behavior**:
- Subagent reads opening 1500-2500 lines, mid 1500-2000 lines, closing 1500-2000 lines
- Does NOT read end-to-end
- Extracted findings cite specific `## <post-title>` values, not just the filename

**Contrast with `tests/fixtures/multi-bucket-persona/`**: that fixture has short individual files (single-document each). The large-year-archive fixture triggers different code-path in Step 2B.

**Fixture content is fabricated** — do NOT invoke `/muse:build` against real persona id.
