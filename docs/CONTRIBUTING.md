# Contributing to Muse

Three ways to contribute:

1. **Add a new persona** (most impactful)
2. **Sharpen an existing persona** (improve distinctiveness, add citations, tighten moves)
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

### Step 2: Run muse:build

In your agent session:

```
muse:build --person=<your-id> --src=.archives/personas/<your-id>
```

The dispatcher will:
1. Read your research material via its Read tool
2. Extract candidate signature moves, thinking modes, debate positions, sources
3. Walk you through interactive brainstorming for each field
4. Generate a draft persona markdown
5. Save as `personas/<your-id>.md.draft`

### Step 3: Refine

Open `personas/<your-id>.md.draft` and review it critically. Ask yourself:

- **Are the signature moves DISTINCTIVE?** Would a reader distinguish this from Feynman / Socrates / anyone else? If moves are generic ("asks good questions"), sharpen them.
- **Are citations traceable?** Every factual claim in `On analogous problems` should reference a source in the `Sources` section.
- **Do benchmark prompts reveal the moves?** A good benchmark prompt is one where a generic agent response and a persona-framed response would be noticeably different.

When satisfied, rename:

```
mv personas/<your-id>.md.draft personas/<your-id>.md
```

### Step 4: Test distinctiveness (optional but encouraged)

Run the spike eval:

```
muse:spike --personas=<your-id>,<comparison-1>,<comparison-2>
```

This requires `ANTHROPIC_API_KEY`. The spike runs benchmark prompts through your persona and compares against comparison personas to check distinctiveness. If the test shows <60% distinguishability, revisit your signature moves.

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
- `disclaimer` field REQUIRED
- Interpretive framing only, no direct quotation
- If in doubt, open an issue before submitting the PR

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

### What we're NOT accepting in v2

(Noted so you don't spend time on these — they're v3+ roadmap.)

- **Community persona marketplace** (requires signing infrastructure)
- **`muse:scan` web research automation** (was in v1 plan, deferred due to 2-week rabbit hole)
- **Journal/memory across sessions** (v3)
- **`muse:mirror` (user's own thinking style)** (v3)
- **Auto-discovery adapters for Codex/Gemini** (v2.1)

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
