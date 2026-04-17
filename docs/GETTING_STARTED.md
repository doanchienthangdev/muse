# Getting Started with Muse (v2.5.0-alpha)

A 5-minute walkthrough to your first productive session, including the cold-start entry point (`/muse:who`) and the 20 slash commands available.

---

## 1. Install (30 seconds)

```bash
curl -fsSL https://raw.githubusercontent.com/doanchienthangdev/muse/main/install.sh | sh
```

Or via git clone:

```bash
git clone https://github.com/doanchienthangdev/muse ~/.claude/skills/muse
cd ~/.claude/skills/muse
./install.sh
```

The installer:
1. Clones the repo to `~/.claude/skills/muse/`
2. Copies all 20 slash commands to `~/.claude/commands/muse:*.md`
3. Creates `~/.muse/sessions/` (and `chains/`, `debates/`, `critiques/`, `spike/`, `analytics/`, `benchmark-reports/`) for your artifacts

No dependencies to install. No build step. No package manager.

**For Codex CLI and Gemini CLI users**: see `adapters/codex/README.md` and `adapters/gemini/README.md`. Muse also supports free-text invocation (`muse:feynman <question>`, no slash) for platforms without slash command support.

After install, **restart Claude Code or open a new session** so it picks up the 18 new slash commands at `~/.claude/commands/muse:*.md`.

---

## 2. Your first command: `/muse:who`

You don't need to memorize the persona map. Type your question via `/muse:who` and muse will score every installed persona against your input and route you to the best-fit session:

```
/muse:who should I rewrite this service in Rust?
```

You'll see something like:

```
MUSE TRIAGE — scoring 10 personas against your question

  "should I rewrite this service in Rust?"

Top 5 matches (score out of 80):

  A) Richard Feynman       68/80   Direct trigger match on "rewrite" +
                                    question benefits from hand
                                    calculation + first principles
  B) Socrates              55/80   Definition hunting — what do you
                                    mean by "rewrite"? Preserve what?
  C) Marcus Aurelius       40/80   Dichotomy of control + next right
                                    action framing
  D) Seneca                35/80   Time accounting — is the rewrite a
                                    budget decision?
  E) Lao Tzu               30/80   Reversal — maybe the answer is
                                    "don't rewrite"

  F) Chain: Feynman → Socrates
     Reason: top 2 within 15 pts + complementary categories

  H) Council: run all 5 Council personas (/muse:all)
  I) See full 8-persona table
  J) Abort

Pick one (A-J):
```

Pick A through E and the chosen persona's 5-stage session runs inline on the same question. Pick F for a chain, H for the full 5-persona Council, I to see the full scoring breakdown, J to abort.

This is the cold-start entry point. Use it whenever you don't know who to ask.

---

## 3. Your first deep session

Once you know the map (or after `/muse:who` routed you), you can invoke any persona directly:

```
/muse:feynman explain why tests matter like I'm 10
```

Stage 0 detects the mode based on question shape:

- **QUICK** (3-5 min) — tactical, time-pressed questions
- **STANDARD** (10-15 min) — balanced depth, the default
- **DEEP** (20-30 min) — bet-the-company decisions with Premise Challenge + Alternative Paths
- **CRITIC** (5-10 min) — reviewing an existing artifact

You pick (or accept the detected mode), and the session walks through the matching stage graph:

1. **Frame** — the persona reframes your question using their distinctive opening move. `AskUserQuestion` with 4 options forces you to pick which pain is real.
2. **Examine** — the persona surfaces the unexamined assumption. Free-text response (no menu — sometimes you need to push back naturally).
3. **Test** — the persona applies a probe (hand calculation, premeditatio, ten principles audit, etc.). `AskUserQuestion` with 3 concrete tests + escape hatch.
4. **Decide** — the persona forces a commit on the real fork. `AskUserQuestion` with A/B/C + mandatory escape hatch D.
5. **Commit** — collapse everything into ONE concrete next action. Accept or refine.

Each session saves a markdown file at `~/.muse/sessions/<YYYY-MM-DD-HHMMSS>-<persona>-<slug>.md`. Re-read, grep, share, or resume later.

See [`SESSIONS.md`](SESSIONS.md) for the full walkthrough and session file format.

---

## 4. Browse the installed personas

```
/muse:list
```

Shows all installed personas grouped by category (first-principles, systems, philosophy, design, execution, etc.). Starter pack ships with 10 personas as of v2.5.0-alpha, but the list is dynamic — any persona you add locally via `/muse:build` appears automatically.

Filter by category:

```
/muse:list --category=design
# → dieter-rams, lao-tzu
```

---

## 5. Try a harder problem with a chain

```
/muse:chain feynman→socrates→dieter-rams why is our landing page confusing?
```

Runs 3 personas in sequence:
- **Feynman** surfaces the confusion (what does "confusing" actually mean in measurable terms?)
- **Socrates** defines the concept (what's the user's goal when they land here?)
- **Dieter Rams** audits the interface (ten principles check on the page itself)

Each persona sees the original question + a 2-3 sentence summary of prior personas' output. Final synthesis in framework voice.

Or use the 5-persona Council preset:

```
/muse:all why isn't my SaaS converting?
```

Feynman → Socrates → Seneca → Aristotle → Marcus Aurelius. 5 stages of cognitive work, one next action.

---

## 6. Try a debate

```
/muse:debate aristotle vs lao-tzu should I add more features or cut features?
```

Two personas, three rounds:
- **Round 1** — opening statements (100-150 words each)
- **Round 2** — tension, each pushes on the other's specific claims
- **Round 3** — framework-voice synthesis: where they agree (robust), where they disagree (real tension), the question this raises for you

Perfect for decisions where you can feel the pull in two directions.

---

## 7. Try critic mode on an existing file

Given a markdown doc you've written:

```
/muse:critic my-roadmap.md --persona=dieter-rams
```

Rams will audit your roadmap against the Ten Principles and produce a structured critique with P0/P1/P2/P3 severity, line references, and concrete fixes.

For multi-angle review via parallel subagent dispatch:

```
/muse:critic my-roadmap.md --chain=feynman,socrates,dieter-rams
```

Produces per-persona critiques + a consensus/unique/disagreement synthesis. Consensus findings (all 3 flagged the same issue) are highest confidence.

---

## 8. Build your own persona

The starter pack is 10 personas. To add an 11th (say, Jane Jacobs on cities):

1. **Research**: collect articles, book excerpts, interviews into `.archives/personas/jane-jacobs/`
2. **Build**: `/muse:build jane-jacobs`
3. The workflow walks you through ~15 interactive fields — taglines, voice rules, cognitive patterns, signature moves, debate positions, when-to-reach, session mode preferences, sources, benchmark prompts, living_status + disclaimer if applicable
4. Spec review loop runs (max 3 iterations) + C1-C12 compliance validation + distinctiveness check
5. File lands at `personas/jane-jacobs.md` — immediately usable via `/muse:jane-jacobs <question>`, `/muse:who` triage, `/muse:all` chains, etc.

See [`CONTRIBUTING.md`](CONTRIBUTING.md) for details including legal notes for living figures.

---

## 9. Measure persona quality

```
/muse:benchmark
```

Runs the full benchmark: 4 categories, 11 measures, blind Turing simulation on 3 sample prompts. Writes a markdown report to `~/.muse/benchmark-reports/<timestamp>-benchmark.md` and a JSON metrics file.

The starter pack holds grade A (24/24 blind Turing, 100% static compliance) as of v2.2.3. Run `--diff` after editing a persona to check you didn't break distinctiveness:

```
/muse:benchmark --diff
# → 0 regressions / N improvements vs baseline
```

See [`BENCHMARKS.md`](BENCHMARKS.md) for the full methodology.

---

## 10. Full command reference

20 slash commands total. See the [README Commands reference](../README.md#commands-reference-18-total--v232-alpha) for the full table with attributes (interactive, persistent, multi-persona, requires-API, quick).

**Starter-pack personas (8)**: `/muse:feynman`, `/muse:socrates`, `/muse:seneca`, `/muse:marcus-aurelius`, `/muse:aristotle`, `/muse:confucius`, `/muse:lao-tzu`, `/muse:dieter-rams`

**Meta commands (10)**: `/muse:who`, `/muse:list`, `/muse:build`, `/muse:update`, `/muse:chain`, `/muse:all`, `/muse:debate`, `/muse:critic`, `/muse:benchmark`, `/muse:spike`

---

## Troubleshooting

**"Persona not found: X"** — Run `/muse:list` to see what's installed. `/muse:chain` and friends will fuzzy-match nearby IDs and suggest corrections if you misspell.

**"Muse doesn't seem to activate"** — Claude Code may need a session restart to discover the new commands at `~/.claude/commands/muse:*.md`. Exit Claude Code and start a new session.

**"Where do I put the repo?"** — For Claude Code, clone it to `~/.claude/skills/muse/`. For Codex CLI / Gemini CLI, clone anywhere and invoke via free-text (`muse:<command>` without slash). See `adapters/<your-platform>/README.md`.

**"Do I need an ANTHROPIC_API_KEY?"** — Only for `/muse:spike` (the scientific distinctiveness eval). Not needed for regular `/muse:<persona>` sessions, `/muse:benchmark`, or any of the other 17 commands. Benchmark uses subagent-based Turing simulation, which runs entirely in your existing agent session.

**"I built a persona and `/muse:who` doesn't see it"** — `/muse:list` is dynamic — it globs `personas/*.md`. If your new file is at `~/.claude/skills/muse/personas/<id>.md` and appears in `/muse:list`, it should appear in `/muse:who` triage automatically. If `/muse:list` doesn't show it, check the frontmatter parses (run `/muse:update <id>` — if the file is broken, it'll tell you why).

**"Benchmark grade dropped after I added a persona"** — Your new persona is cannibalizing an existing persona's distinctiveness. Run `/muse:benchmark --diff --persona=<new-id>` to see the confusion matrix, then sharpen the overlapping signature moves.

---

## What to do next

- Read [`PERSONAS.md`](PERSONAS.md) to see what each starter-pack persona is distinctive at, and the v2.4+ candidate roster
- Read [`SESSIONS.md`](SESSIONS.md) for the full 5-stage session workflow + saved file format
- Read [`ARCHITECTURE.md`](ARCHITECTURE.md) for how the framework works internally (agent runtime, content layer, dispatcher)
- Read [`BENCHMARKS.md`](BENCHMARKS.md) for the measurement methodology
- Try `/muse:chain feynman→socrates <hard question>` for any decision you've been avoiding
- Try `/muse:build <your-favorite-thinker>` to extend the starter pack

---

*v2.5.0-alpha · 20 slash commands · 9 starter-pack personas · extensible runtime*
