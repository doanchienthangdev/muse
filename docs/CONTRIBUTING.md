# Contributing to Muse (v2.3.2-alpha)

Muse ships with a curated **starter pack of 8 personas**. The starter pack is a baseline, not a ceiling — the runtime is designed from day one to support arbitrary locally-authored personas, and a future catalog (v3+) will let users browse and clone individual personas without cloning the whole framework. Until the catalog ships, the path to expand muse's coverage is **local authoring + upstream PRs**.

Three ways to contribute:

1. **Add a new persona** to the starter pack (most impactful)
2. **Sharpen an existing persona** — improve distinctiveness, add citations, tighten moves
3. **Report bugs or request features** (GitHub issues)

---

## 1. Adding a new persona

### Step 1: Research

Before writing any markdown, collect material that documents the thinker's distinctive cognitive moves:

- **Books, articles, essays** they wrote
- **Interviews and talks** where they explain their thinking
- **Biographies** that document their approach (secondary sources)
- **Academic papers** if applicable
- **Observers' accounts** — people who worked with them describing HOW they thought

Save material to:

```
.archives/personas/<persona-id>/
├── books/                # Book excerpts (text)
├── transcripts/          # Video/podcast transcripts
├── articles/             # Blog posts, essays
└── notes/                # Your own observations
```

Note: `.archives/personas/**` is gitignored. Your research stays local.

### Step 2: Run /muse:build

In Claude Code (slash command, recommended):

```
/muse:build <your-id>
```

Or with an explicit source folder:

```
/muse:build <your-id> --src=.archives/personas/<your-id>
```

The skill will:
1. Read your research material via its Read tool
2. Extract candidate signature moves, thinking modes, debate positions, sources
3. Walk you through interactive brainstorming for ~15 fields (taglines, voice rules, cognitive patterns, signature moves with framing/inquiry/test-probe coverage, debate positions on 6 canonical dilemmas, when-to-reach triggers + avoid-when, session mode preferences, analogous problems with citations, sources, benchmark prompts, living_status + disclaimer if applicable)
4. Run a **spec review loop** — an adversarial reviewer subagent reads the draft and flags issues across 5 dimensions (completeness, consistency, clarity, scope, feasibility). Up to 3 iterations of fix-and-re-review.
5. Run **C1-C12 compliance validation** — every required section present, schema mirror OK, debate positions cover ≥3 canonical dilemmas, etc.
6. Run a **distinctiveness check** — compare the new persona's signature moves against the existing starter pack to flag clone risk before save.
7. Save as `personas/<your-id>.md.draft`, present a dry-run preview, and atomic `mv` to `personas/<your-id>.md` on confirmation.

For Codex CLI / Gemini CLI users, the free-text path works too:

```
muse:build <your-id> --src=.archives/personas/<your-id>
```

Both paths write to the same file on confirmation.

### Step 3: Refine

Open `personas/<your-id>.md.draft` and review it critically. Ask yourself:

- **Are the signature moves DISTINCTIVE?** Would a reader distinguish this from Feynman / Socrates / anyone else? If moves are generic ("asks good questions"), sharpen them.
- **Are citations traceable?** Every factual claim in `On analogous problems` should reference a source in the `Sources` section.
- **Do benchmark prompts reveal the moves?** A good benchmark prompt is one where a generic agent response and a persona-framed response would be noticeably different.

When satisfied, rename:

```
mv personas/<your-id>.md.draft personas/<your-id>.md
```

### Step 4: Test distinctiveness

**Preferred path** (no API key needed):

```
/muse:benchmark --diff
```

Runs the full benchmark (4 categories, 11 measures including blind Turing simulation via subagent judges) and compares to the baseline. If your new persona drops the aggregate Turing match rate below 90%, it's cannibalizing an existing persona's distinctiveness — sharpen the overlapping moves before landing.

For a single-persona deep dive:

```
/muse:benchmark --persona=<your-id>
```

This shows the full scoring breakdown for your new persona across all B1-B10 measures.

**Scientific path** (requires `ANTHROPIC_API_KEY` + human judges):

```
/muse:spike --personas=<your-id>,<comparison-1>,<comparison-2>
```

v2.3.0-alpha ships `gather` mode only (generates blind batch + dekey for human judges). Score mode (automated verdict) is v2.3.1+. If the test shows <70% human-judge distinguishability, revisit your signature moves.

### Step 5: Submit a PR

PR should include:
- `personas/<your-id>.md` (the new persona)
- Brief PR description:
  - Who the thinker is
  - Why they're distinctive (what moves don't already exist in the core 8)
  - Spike results if run

### Legal note for new personas

**For historical/public-domain figures** (deceased before ~1950 or out of copyright):
- Set `living_status: historical` in frontmatter
- No disclaimer needed
- Proceed without legal review

**For living figures or estate-protected names** (Jobs estate, Musk, Bezos, etc.):
- Set `living_status: living` or `estate_protected`
- `disclaimer` field REQUIRED in BOTH frontmatter AND a body blockquote immediately after the tagline (see `personas/dieter-rams.md` lines 7 and 15 for the format)
- Interpretive framing only, no direct quotation
- If in doubt, open an issue before submitting the PR

**Important — disclaimer auto-printing at session start**: when a persona has `living_status: living` or `estate_protected`, `SESSION.md` pre-flight (v2.1+) will **automatically print the disclaimer** as a short italic note at the top of every session that uses this persona, before Stage 1 begins. This is a hard requirement of the v2.1 workflow. If you build a persona for a living figure without the disclaimer, `/muse:build` will refuse to save the file and `/muse:update` will flag it as a HARD-GAP (compliance check C5).

Disclaimer template (substitute `<Name>`):

> *"Interpretive frame based on publicly documented material about `<Name>`. Not affiliated with or endorsed by `<Name>`. Outputs are interpretive, not quotation."*

For `estate_protected`, replace "endorsed by `<Name>`" with "affiliated with the estate of `<Name>`".

Muse v2 primarily ships historical personas to avoid right-of-publicity issues. See `docs/ARCHITECTURE.md` for the trust tier model.

---

## 2. Sharpening existing personas

You don't need to write a new persona to contribute. Existing personas can always be improved.

**Good sharpening contributions**:

- **Add a citation** — Found a new source that documents an existing signature move? Add to the Sources section and reference it in the move.
- **Improve a signature move description** — Clearer wording, better example, tighter trigger pattern.
- **Add a benchmark prompt** — A new test prompt that reveals the persona's moves in a new domain.
- **Add an `On analogous problems` entry** — Specific documented case where the thinker's moves apply.
- **Fix typos / polish prose** — Markdown is human-readable, so minor edits are welcome.

### How to sharpen

1. Edit `personas/<id>.md` directly
2. Run `muse:spike --personas=<id>` if you have API access (to verify distinctiveness didn't regress)
3. Submit PR with a brief description of what changed and why

---

## 3. Bugs & feature requests

Use GitHub issues. Include:

- **For bugs**: steps to reproduce, expected behavior, actual behavior, which agent runtime you're using (Claude Code / Codex CLI / Gemini CLI)
- **For features**: the user scenario you want to solve, why existing functionality doesn't work, proposed API

### What we're NOT accepting in v2.3.x

(Noted so you don't spend time on these — they're v2.4+/v3+ roadmap.)

- **Public persona catalog infrastructure** (v3+) — browsing, cloning, signing, update notifications. Until the catalog ships, new personas land via PR to the starter pack, or stay local. See § v3 persona catalog vision in [`PERSONAS.md`](PERSONAS.md) for the long-term direction.
- **`/muse:spike --mode=score`** (v2.3.1+) — automated cross-reference of judge answers + GO/PIVOT/NO-GO verdict. Gather mode ships in v2.3.0; score mode is manual for now.
- **Routing accuracy benchmark** (v2.4+) — evaluating `/muse:who` picks against ground-truth labels.
- **CI integration** (v2.4+) — GitHub Actions workflow running `/muse:benchmark --diff` on PRs.
- **Continuous benchmarking dashboards** (v2.4+) — trend HTML from `analytics/benchmark-runs.jsonl`.
- **`muse:scan` web research automation** (was in v1 plan, deferred due to 2-week rabbit hole)
- **Journal/memory across sessions** (v3+)
- **`muse:mirror` (user's own thinking style)** (v3+)
- **Auto-improvement loop** — benchmark drop → auto-`/muse:update`. Deliberately never: too dangerous without human review.

---

## Content conventions

### Markdown persona files

- **Filename**: `personas/<id>.md` where `<id>` matches `^[a-z][a-z0-9-]{0,30}$`
- **Frontmatter**: YAML block at top with id, name, tagline, era, living_status, categories, optional disclaimer
- **Sections**: Use `##` headers for Signature moves, Thinking mode, Debate positions, Critic frames, On analogous problems, Sources, Benchmark prompts
- **Moves**: Each signature move is a `###` subsection with trigger, description, example, sources
- **Quoted material**: Use `> blockquote` for disclaimers, `*italics*` for tone flavor
- **Citations**: Reference by source ID (e.g., `feynman-lectures-vol1`) in the move's `Sources` line; resolve in the Sources section

### Chain files

- **Filename**: `chains/<name>.md`
- **Frontmatter**: id, name, description
- **Structure**: Ordered list of personas with roles and handoff notes, followed by synthesis prompt

### Benchmark files

- **Filename**: `benchmarks/<name>.md`
- **Frontmatter**: id, name, authored_before_personas (true/false), sources
- **Prompts**: Each prompt is a `##` subsection with prompt text, category, difficulty, distinctiveness reason

---

## Code of Conduct

Be kind. Assume good intent. Critique ideas, not people. When you push back on a persona contribution, focus on the distinctiveness bar, not the contributor's taste.

The framework is about applied mental models from great thinkers. Contributors should embody the best of those thinkers: rigor without arrogance, clarity without dogmatism, curiosity without condescension.

---

## Questions?

- Read `docs/ARCHITECTURE.md` to understand the v2 agentic model
- Read `personas/feynman.md` as a template for your own persona
- Read existing `chains/*.md` for examples
- Ask in GitHub Discussions (when the repo is public)
