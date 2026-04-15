# Getting Started with Muse

A 5-minute walkthrough to your first productive session.

---

## 1. Install (5 seconds)

```
git clone https://github.com/doanchienthangdev/muse ~/.claude/skills/muse
```

That's it. No dependencies to install. No build step. No package manager.

**For Codex CLI and Gemini CLI users**: see `adapters/<your-platform>/README.md`. For now, you can invoke muse in natural language: *"Read ~/muse/personas/feynman.md and apply the cognitive frame to: <my question>"*.

After install, **restart Claude Code or open a new session** so it picks up the 8 new slash commands at `~/.claude/commands/muse:*.md`.

---

## 2. Your first structured session (v2.1, recommended)

The v2.1 structured session workflow is the deepest way to use Muse. Open Claude Code and type:

```
/muse:feynman explain why tests matter like I'm 10
```

The session walks you through 5 fixed stages:

1. **Frame** — Feynman reframes your question using the simplification test and forces you to pick which framing best matches what you actually feel. STOP, A/B/C/D options.
2. **Examine** — Feynman surfaces an unexamined assumption. You react in your own words. No menu, free-text.
3. **Test** — Feynman proposes a concrete probe (a number to calculate, a cargo-cult to detect). You pick which probe to actually run. STOP, A/B/C/D options.
4. **Decide** — Feynman forces you to commit to one side of the fork his debate positions surface. Option D is always an escape hatch (tell Feynman he's wrong). STOP, A/B/C/D options.
5. **Commit** — Collapse to ONE concrete next action. Accept or refine. The session is saved as a markdown file at `~/.muse/sessions/<YYYY-MM-DD-HHMMSS>-feynman-<slug>.md`.

Target duration: **10-15 minutes** of your time. The output is a markdown file you can re-read, grep, share, or resume.

To see all your past sessions:

```bash
ls -lt ~/.muse/sessions/
```

To find all sessions where Feynman's cargo-cult detection surfaced something:

```bash
grep -l "moves_used:.*cargo_cult" ~/.muse/sessions/*.md
```

See `docs/SESSIONS.md` for the full walkthrough, session file format, and tips on reading back old sessions.

---

## 3. First session (v2.0 free-text — quick path)

If you want a faster, conversational gut-check without the 5-stage structure and without saving a file, use the original v2.0 free-text invocation (no slash):

```
muse:feynman explain why tests matter like I'm 10
```

Claude will:
1. Load `personas/feynman.md`
2. Apply Feynman's signature moves (simplification test, cargo cult detector, hand calculation)
3. Enter an interactive dialogue with you

Don't expect a monologue. Feynman will ask you questions back. This is the core loop: surface the question behind the question. Response is 150-250 words, up to 6 rounds, and nothing is saved.

**When to use which**:
- **Slash `/muse:feynman`** — deep thinking, deserves a record, willing to spend 15 minutes
- **Free-text `muse:feynman`** — 2-minute gut check, don't care about a saved artifact

---

## 3. Try a harder problem

```
muse:socrates I need to build a community for my product
```

Socrates won't give you tactical advice. He'll ask you to **define what you mean by "community"**. If you can't, you learn something about your own thinking before any work happens.

---

## 4. Multi-persona pipeline

```
muse:all why isn't my SaaS converting?
```

Runs 5 personas in sequence (Feynman → Socrates → Seneca → Aristotle → Marcus Aurelius). Each builds on the previous, applying their distinctive frame.

Or pick your own chain:

```
muse:chain feynman→dieter-rams→lao-tzu why is my landing page confusing?
```

---

## 5. Try a debate

```
muse:debate aristotle vs lao-tzu should I add more features or cut features?
```

Two personas argue in 3 rounds. The framework synthesizes where they agree (often the robust insight) and where they diverge (often the interesting tension).

---

## 6. Try critic mode

Given a markdown doc you've written:

```
muse:critic my-roadmap.md --persona=dieter-rams
```

**Different** from brainstorm mode. Rams will audit your roadmap against the Ten Principles of Good Design and produce a structured critique with specific findings and fixes.

---

## 7. Build your own persona

Muse ships 8 core personas. To add your own (say, Jane Jacobs):

1. **Research**: collect articles, book excerpts, interviews into `.archives/personas/jane-jacobs/`
2. **Build**: `muse:build --person=jane-jacobs --src=.archives/personas/jane-jacobs`
3. **The dispatcher walks you through** interactively: identify signature moves, thinking mode, debate positions, critic frames, sources, and benchmark prompts
4. **Save**: framework writes `personas/jane-jacobs.md.draft`, shows you preview, asks to confirm

See `docs/CONTRIBUTING.md` for details.

---

## Troubleshooting

**"Persona not found: X"** — Run `muse:list` to see what's installed. Use fuzzy matching hints if you misspell.

**Muse doesn't seem to activate** — Claude Code may need a session restart to discover the new skill at `~/.claude/skills/muse/`. Exit Claude Code and start a new session.

**"Where do I put the repo?"** — For Claude Code, clone it to `~/.claude/skills/muse/`. For other agent CLIs, clone anywhere and invoke via natural language.

**"Do I need an ANTHROPIC_API_KEY?"** — Only for `muse:spike` (the persona distinctiveness eval). Not needed for regular `muse:<person>` brainstorm sessions.

---

## What to do next

- Read `docs/PERSONAS.md` to see what each persona is distinctive at
- Read `docs/ARCHITECTURE.md` for how the framework works internally
- Try `muse:chain feynman→socrates <hard question>` for any decision you've been avoiding
