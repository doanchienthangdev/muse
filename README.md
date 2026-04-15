# Muse

**Think with the greats.** An agentic skill for Claude Code, Codex CLI, and Gemini CLI that lets you invoke the distinctive cognitive patterns of great thinkers as reusable thinking tools.

```
muse:feynman why is my code slow?
muse:socrates what do I actually mean by "community"?
muse:chain feynman→confucius→dieter-rams why is our product confusing?
muse:debate aristotle vs lao-tzu ship fast or ship polished?
muse:critic plan.md --persona=marcus-aurelius
```

Muse applies the **specific cognitive moves** each thinker is known for — Feynman's simplification test, Socrates's definition hunting, Rams's ten principles, Lao Tzu's value-of-emptiness — to your actual problem. Not character AI. Not a prompt template library. A thinking assistant that thinks WITH you using structured mental models.

---

## Install (5 seconds)

```
git clone https://github.com/doanchienthangdev/muse ~/.claude/skills/muse
```

That's it. No dependencies. No build step. No package manager. Claude Code discovers the skill on next session. Type `muse:feynman <question>` and you're in.

**For Codex CLI, Gemini CLI, and others**: see `adapters/<platform>/README.md` for invocation patterns.

---

## Why this works with zero deps

Muse is an **agentic skill framework**. The agent (Claude, Codex, Gemini) is the runtime. The agent reads markdown persona files with its own file-reading tool, parses them in its own context, and applies the cognitive frame natively. No yq, no jq, no bash scripting. The content IS the framework.

**This is the eureka**: agentic environments don't need the shell tool chain that non-agentic frameworks depend on. Ship markdown. The agent handles the rest.

---

## Commands

| Command | What it does |
|---|---|
| `muse:<person> <text>` | Single persona brainstorm |
| `muse:all <text>` | Runs the default 5-persona pipeline |
| `muse:chain persona1→persona2→persona3 <text>` | Custom pipeline |
| `muse:debate personA vs personB <text>` | Two personas tranh luận, surface tensions |
| `muse:critic <file> --persona=<id>` | Adversarial review of existing artifact |
| `muse:build --person=<id> --src=<folder>` | Build a custom persona from research |
| `muse:spike` | Run distinctiveness eval (requires ANTHROPIC_API_KEY) |
| `muse:list` | List installed personas, grouped |

All commands run **inside** your agent session. No separate CLI to install. No shell tooling to maintain.

---

## The 8 shipped personas

All historical/public-domain or shipped with interpretive disclaimers for legal safety.

| ID | Name | Distinctive move |
|---|---|---|
| `feynman` | Richard Feynman | "Explain it to a 6-year-old" |
| `socrates` | Socrates | Relentless definition hunting |
| `seneca` | Seneca | Separate controllable from uncontrollable |
| `marcus-aurelius` | Marcus Aurelius | "What's the next right action?" |
| `aristotle` | Aristotle | Four causes analysis + golden mean |
| `confucius` | Confucius | Rectification of names (正名) |
| `lao-tzu` | Lao Tzu | Wu wei — value of emptiness |
| `dieter-rams` | Dieter Rams *(interpretive)* | Ten principles + subtraction |

See `docs/PERSONAS.md` for detailed moves and benchmark prompts.

---

## How it's different from "prompt X as Feynman"

1. **Cognitive moves as reusable tools**, not personality imitation. `muse:feynman` asks "where are you fooling yourself?" — the specific Feynman move — rather than imitating his speaking style.

2. **Citation-grounded**. Claims about what the persona would say are traceable to documented source material (books, interviews, lectures).

3. **`muse:debate` and `muse:chain`** orchestrate multiple personas across rounds, surfacing disagreement. Character.ai can't do this. Static prompt libraries can't do this.

4. **`muse:critic` mode** — different from brainstorm mode. Points a persona at existing work to find flaws.

5. **Zero deps + multi-agent-runtime**. Runs natively in Claude Code, Codex CLI, and Gemini CLI without installing anything beyond git.

6. **User-extensible**. `muse:build` lets you create custom personas from your own research, interactively.

---

## Architecture (one-paragraph)

Muse is a content repository: markdown persona files + a single `SKILL.md` dispatcher. The agentic runtime (Claude Code, etc.) loads the SKILL.md when the user types `muse:<anything>`, parses the argument, reads the relevant persona markdown files via its Read tool, and applies the cognitive frame in its own context. Zero shell tooling needed for interactive use. See `docs/ARCHITECTURE.md` for details.

---

## Status

**v2.0.0-alpha** — Radical agentic refactor. Previously, Muse shipped as a bash CLI framework that plugged into Claude Code. That was wrong: it required installing yq, jq, bats, shellcheck, and check-jsonschema. The user rightfully pointed out that an agentic skill shouldn't need a shell tool chain. v2 fixes this by running 100% in the agent runtime.

- **v1 history**: `docs/archive/CEO-PLAN-v1.md` and `docs/archive/TODOS-v1.md`
- **v2 changelog**: `docs/CHANGELOG.md`

---

## Documentation

- [Getting Started](docs/GETTING_STARTED.md) — First-time user walkthrough
- [Personas](docs/PERSONAS.md) — Full list with moves and benchmarks
- [Architecture](docs/ARCHITECTURE.md) — Agentic system design
- [Contributing](docs/CONTRIBUTING.md) — How to add a new persona
- [Changelog](docs/CHANGELOG.md)
- [Adapter: Claude Code](adapters/claude-code/README.md)
- [Adapter: Codex CLI](adapters/codex/README.md)
- [Adapter: Gemini CLI](adapters/gemini/README.md)

---

## Contributing

See `docs/CONTRIBUTING.md`. Three ways:

1. **Add a new persona**: Research a thinker → `muse:build --person=<id> --src=.archives/personas/<id>` → PR with the new `personas/<id>.md`
2. **Sharpen an existing persona**: Improve signature_moves, add source citations, tighten benchmark prompts
3. **Report bugs / request features**: GitHub issues

---

## Legal & ethical

Muse uses **historical / public-domain figures** primarily (Feynman d. 1988, Socrates, Seneca, Marcus Aurelius, Aristotle, Confucius, Lao Tzu). Living figures (Dieter Rams) ship with explicit interpretive disclaimers acknowledging that outputs are not quotations and not affiliated.

Muse does NOT store user data. All processing happens in your agent session. Muse provides the cognitive framework as markdown content; the agent provides the reasoning.

---

## License

MIT. See `LICENSE`.

---

## Credits

Inspired by [gstack](https://github.com/garrytan/gstack) (Garry Tan's Claude Code framework), which taught me what an agentic skill framework looks like at the level of content. The eureka that differentiated Muse from gstack: **gstack has legitimate shell tooling needs (install checks, review dashboards, health checks) that Muse does not**. Muse is pure content. Ship markdown.

Persona research draws on public domain texts and documented interviews. Eval framework pattern owes to the reverse Turing literature.

---

*Think with the greats. Build something they would have respected.*
