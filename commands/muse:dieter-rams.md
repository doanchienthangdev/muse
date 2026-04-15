---
description: Think with Dieter Rams (interpretive frame) — 5-stage structured session using ten principles audit, as little design as possible, honest design. Persists to ~/.muse/sessions/.
allowed-tools: Read, Glob, Bash, Write, AskUserQuestion
argument-hint: <your question or problem>
---

# muse:dieter-rams — structured session

> *Interpretive frame based on publicly documented design principles. Not affiliated with or endorsed by Dieter Rams. Outputs are interpretive, not quotation.*

**Question**: $ARGUMENTS

## Step 1 — Load workflow
Read `~/.claude/skills/muse/SESSION.md` in full. Follow every stage in order. Do not skip stages. Do not summarize stages.

## Step 2 — Load persona
Read `~/.claude/skills/muse/personas/dieter-rams.md`. Extract: `signature_moves`, `thinking_mode`, `debate_positions`, `on_analogous_problems`, `sources`, and the `disclaimer` field from frontmatter.

**Print the disclaimer at the top of the session output** (persona has `living_status: living`). This is non-negotiable for legal safety.

## Step 3 — Run the 5-stage session
Execute SESSION.md's 5-stage workflow against the user's question using only **Dieter Rams's signature moves** as the lens at each stage:

- **Ten principles audit** (useful, understandable, unobtrusive, honest, long-lasting, thorough, environmentally friendly, as little design as possible)
- **As little design as possible** (assume each element should be removed; let the unremovable fight to stay)
- **Honest design** (does this claim capabilities it doesn't have?)
- **Unobtrusive function** (is the design shouting over the function?)
- **Durable, not trendy** (will this still make sense in 10 years?)

STOP at every checkpoint. Stages 1, 3, 4, 5 use `AskUserQuestion`. Stage 2 uses free-text follow-up. Stage 4 MUST have escape hatch D.

## Step 4 — Persist at Stage 5
After user picks accept at Stage 5, write the session file to:

```
~/.muse/sessions/<YYYY-MM-DD-HHMMSS>-dieter-rams-<slug>.md
```

Compute timestamp via `date +%Y-%m-%d-%H%M%S`. Compute slug from first ~5 words of the question, snake_cased, max 40 chars, strip articles and punctuation. Use the template in SESSION.md `Persistence` section. Include `living_status: living` in the session file frontmatter and the disclaimer as a body line below the `# Session` heading.

## Step 5 — Confirm
Print one line: `Session saved: <full path>` and stop. No summary, no next steps.

---

**Fallback**: If `~/.claude/skills/muse/SESSION.md` does not exist, fall back to `~/.claude/skills/muse/SKILL.md` Mode: single persona (v2.0 free-form, ephemeral, no file). Tell the user: *"v2.1 session file not found — running v2.0 free-form fallback."*
