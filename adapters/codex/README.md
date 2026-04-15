# Muse adapter: Codex CLI (OpenAI)

Codex CLI (OpenAI's agentic command-line tool) can run Muse **via manual invocation** in v2.0. Auto-discovery adapter is v2.1+ roadmap.

---

## Install (v2.0 — manual invocation)

```
git clone https://github.com/doanchienthangdev/muse ~/muse
```

That clones the Muse repo to `~/muse`. Codex CLI doesn't auto-discover it, but you can invoke it explicitly.

---

## Invocation (v2.0)

Use natural language to point Codex at a persona file:

```
codex exec "Read ~/muse/personas/feynman.md and apply its cognitive frame to this question: why is my code slow?"
```

Or:

```
codex exec --file ~/muse/personas/feynman.md "Apply this cognitive frame to: <my question>"
```

Codex will read the persona markdown, parse the signature moves + thinking mode in its context, and apply the frame to your question.

**For chains** (manually):

```
codex exec "Read ~/muse/personas/feynman.md then ~/muse/personas/socrates.md then ~/muse/personas/seneca.md. Apply each cognitive frame in sequence to this question: <my question>. Produce a synthesis at the end."
```

**For debate**:

```
codex exec "Read ~/muse/personas/aristotle.md and ~/muse/personas/lao-tzu.md. Put them in a 3-round debate on: <my question>. In round 3, synthesize where they agree and where they disagree."
```

---

## Limitations in v2.0

- **No shortcut syntax**: you have to spell out file paths in natural language
- **No auto-routing**: each command mode (chain, debate, critic, build, spike) requires a longer invocation
- **No persona auto-list**: `codex exec "ls ~/muse/personas/"` works but isn't friendly

---

## v2.1 roadmap

Proper Codex CLI adapter with:

- Registration via Codex's `AGENTS.md` or MCP server definition
- Shorthand invocation: `codex muse feynman "<question>"`
- Auto-load of the dispatcher from a config file in `~/.codex/`
- Same UX as Claude Code

If you're a Codex CLI power user and want to help build the adapter, open an issue on GitHub.

---

## Known compatibility

Muse persona markdown files are 100% platform-agnostic. Codex, Claude, and Gemini all parse markdown natively. The content works on any of them — only the invocation layer differs.
