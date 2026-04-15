# Muse adapter: Gemini CLI (Google)

Gemini CLI can run Muse **via manual invocation**. Auto-discovery adapter is v2.2+ roadmap.

**Note on v2.1**: The structured 5-stage session workflow added in v2.1 is exposed via Claude Code slash commands (`/muse:feynman`, `/muse:socrates`, etc.) that live in `~/.claude/commands/`. Gemini CLI doesn't consume those slash command files, so `/muse:*` syntax doesn't work there natively. The v2.0 free-text invocation pattern below continues to work in Gemini — it routes through `SKILL.md` Mode: single persona as before.

---

## Install (v2.0 — manual invocation)

```
git clone https://github.com/doanchienthangdev/muse ~/muse
```

Clones Muse to `~/muse`. Gemini CLI doesn't auto-discover it.

---

## Invocation (v2.0)

Use natural language to point Gemini at a persona file:

```
gemini "Read ~/muse/personas/feynman.md and apply its cognitive frame to this question: why is my code slow?"
```

Or with an input file:

```
gemini --file ~/muse/personas/feynman.md "Apply this cognitive frame to: <my question>"
```

(Exact flag names depend on Gemini CLI version; consult `gemini --help`.)

Gemini will read the persona markdown, parse the signature moves + thinking mode natively, and apply the frame.

**For chains**:

```
gemini "Read ~/muse/personas/feynman.md then ~/muse/personas/socrates.md then ~/muse/personas/seneca.md. Apply each cognitive frame in sequence to: <my question>. Produce a synthesis at the end."
```

**For debate**:

```
gemini "Read ~/muse/personas/aristotle.md and ~/muse/personas/lao-tzu.md. Put them in a 3-round debate on: <my question>. In round 3, synthesize where they agree and where they disagree."
```

---

## Limitations in v2.0

Same as Codex:
- No shortcut syntax
- No auto-routing
- No persona auto-list

---

## v2.1 roadmap

Proper Gemini CLI adapter with:

- Registration via Gemini's extensions or config file
- Shorthand invocation: `gemini muse feynman "<question>"`
- Auto-load from `~/.gemini/` config
- Same UX as Claude Code

If you're a Gemini CLI user and want to help build the adapter, open an issue.

---

## Known compatibility

Muse persona markdown files are 100% platform-agnostic. Gemini's native markdown parsing is excellent; no translation needed.

One note: Gemini's context window is generous, so chains with 5+ personas should work without truncation in most cases.
