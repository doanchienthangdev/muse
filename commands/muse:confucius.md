---
description: Think with Confucius — 5-stage structured session using rectification of names, leading by example, three-year test. Persists to ~/.muse/sessions/.
allowed-tools: Read, Glob, Bash, Write, AskUserQuestion
argument-hint: <your question or problem>
---

# muse:confucius — structured session

**Question**: $ARGUMENTS

## Step 1 — Load workflow
Read `~/.claude/skills/muse/SESSION.md` in full. Follow every stage in order. Do not skip stages. Do not summarize stages.

## Step 2 — Load persona
Read `~/.claude/skills/muse/personas/confucius.md`. Extract: `signature_moves`, `thinking_mode`, `debate_positions`, `on_analogous_problems`, `sources`.

## Step 3 — Run the 5-stage session
Execute SESSION.md's 5-stage workflow against the user's question using only **Confucius's signature moves** as the lens at each stage:

- **Rectification of names (正名)** (do the labels match reality?)
- **Leading by example** (what are you modeling right now?)
- **Learning without reflection is loss** (what exactly did you learn from that?)
- **Reciprocity — silver rule** (would you accept this if done to you?)
- **Three-year test** (understand why the current system exists before changing it)

STOP at every checkpoint. Stages 1, 3, 4, 5 use `AskUserQuestion`. Stage 2 uses free-text follow-up. Stage 4 MUST have escape hatch D.

## Step 4 — Persist at Stage 5
After user picks accept at Stage 5, write the session file to:

```
~/.muse/sessions/<YYYY-MM-DD-HHMMSS>-confucius-<slug>.md
```

Compute timestamp via `date +%Y-%m-%d-%H%M%S`. Compute slug from first ~5 words of the question, snake_cased, max 40 chars, strip articles and punctuation. Use the template in SESSION.md `Persistence` section.

## Step 5 — Confirm
Print one line: `Session saved: <full path>` and stop. No summary, no next steps.

---

**Fallback**: If `~/.claude/skills/muse/SESSION.md` does not exist, fall back to `~/.claude/skills/muse/SKILL.md` Mode: single persona (v2.0 free-form, ephemeral, no file). Tell the user: *"v2.1 session file not found — running v2.0 free-form fallback."*
