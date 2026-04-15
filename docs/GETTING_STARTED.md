# Getting Started with Muse

A 5-minute walkthrough to your first productive session.

---

## 1. Install (5 seconds)

```
git clone https://github.com/doanchienthangdev/muse ~/.claude/skills/muse
```

That's it. No dependencies to install. No build step. No package manager.

**For Codex CLI and Gemini CLI users**: see `adapters/<your-platform>/README.md`. For now, you can invoke muse in natural language: *"Read ~/muse/personas/feynman.md and apply the cognitive frame to: <my question>"*.

---

## 2. First session

Open Claude Code and type:

```
muse:feynman explain why tests matter like I'm 10
```

Claude will:
1. Load `personas/feynman.md`
2. Apply Feynman's signature moves (simplification test, cargo cult detector, hand calculation)
3. Enter an interactive dialogue with you

Don't expect a monologue. Feynman will ask you questions back. This is the core loop: surface the question behind the question.

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
