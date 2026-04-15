---
description: List all installed muse personas grouped by category, with name, tagline, and living-status marker. Supports --category=<tag> filter for scoped views. Ephemeral output, no persistence. Reads persona frontmatter to build a dynamic category index so new personas appear automatically without hardcoded lists.
allowed-tools: Read, Glob, AskUserQuestion
argument-hint: "[--category=<tag>]"
---

# muse:list — list installed personas grouped by category (v2.3.0-alpha)

**Args**: $ARGUMENTS

## Step 0 — Parse arguments

Parse `$ARGUMENTS` into `(category_filter)`:

- `/muse:list` → `category_filter=None` (show all, grouped)
- `/muse:list --category=first-principles` → filter to category
- `/muse:list --category=design` → filter to category

**Validation**:

- If `--category=` is present, lowercase + trim its value.
- Do NOT hardcode a category whitelist. The valid set is whatever appears in the frontmatter `categories[]` of installed personas (computed dynamically in Step 2). Empty or unknown filter values produce a closest-match suggestion in Step 4.

**Security**: `category_filter` is a plain string, not a path. No traversal risk. Reject anything with `/`, `\`, `..`, or quotes.

## Step 1 — Discover installed personas

Use `Glob` on `~/.claude/skills/muse/personas/*.md` to list all installed persona files. Also check `${MUSE_DIR}/personas/*.md` if `$MUSE_DIR` is set (for forkers with alternate paths).

For each discovered path, extract the persona ID from the filename stem (e.g., `personas/feynman.md` → `feynman`). Store `{id, path}` in a list.

Parallel `Read` all persona files (max 10 concurrent). For each persona, parse the YAML frontmatter (between `---` fences). Extract these fields:

- `id` (required) — cross-check against filename stem; if mismatch, warn but continue
- `name` (required) — display name
- `tagline` (required) — default one-line tagline
- `categories[]` (required) — list of category slugs (e.g., `[first-principles, science, philosophy]`)
- `living_status` (optional) — one of `historical` / `living` / `estate_protected`

If any persona file fails to parse, print a warning — `⚠ persona/<id>.md failed to parse: <error>. Excluded from list.` — and continue. Do NOT abort the whole command; a single broken file should not hide the rest.

Store the extracted metadata in a structure like:

```
personas = [
  {id: "feynman", name: "Richard Feynman", tagline: "Explain it simply...",
   categories: ["first-principles", "science", "philosophy"], living: "historical"},
  {id: "dieter-rams", name: "Dieter Rams", tagline: "Less, but better",
   categories: ["design", "systems"], living: "living"},
  ...
]
```

## Step 2 — Build dynamic category index

Compute the union of `categories[]` values across all personas. For each unique category, collect the set of personas that include it. A persona with `[first-principles, science]` will appear in BOTH groups — this is intentional (a persona can legitimately belong to multiple categories).

**Canonical ordering** of categories in the output (if present):

1. `first-principles` → "FIRST PRINCIPLES THINKERS"
2. `systems` → "SYSTEMS THINKERS"
3. `philosophy` → "PHILOSOPHY"
4. `strategy` → "STRATEGY"
5. `execution` → "EXECUTION"
6. `science` → "SCIENCE"
7. `design` → "DESIGN"
8. (anything else, alphabetical) → `<UPPERCASE>`

Categories not in the canonical list are rendered uppercased + alphabetized at the end (e.g., a forker adds `categories: [mathematics]` → renders as `MATHEMATICS`).

**Apply filter** (if `--category=<tag>` set):

- Case-insensitive match against any category in any persona's `categories[]`
- If 0 matches, fall through to Step 4 closest-match suggestion
- If ≥1 matches, filter the render to only that category's group

## Step 3 — Render output

Ephemeral console output (no file write). Format:

```
MUSE :: INSTALLED PERSONAS

FIRST PRINCIPLES THINKERS
  feynman          Richard Feynman — Explain it simply, or you don't know it
  aristotle        Aristotle — Excellence is a habit, not a moment

SYSTEMS THINKERS
  aristotle        Aristotle — Excellence is a habit, not a moment
  confucius        Confucius — Govern by virtue, and the people will follow

PHILOSOPHY
  socrates         Socrates — The unexamined answer is not worth giving
  lao-tzu          Lao Tzu — The way that can be spoken is not the eternal way

STRATEGY
  marcus-aurelius  Marcus Aurelius — Govern yourself before governing anything else
  seneca           Seneca — Time, not money, is the scarcest currency

DESIGN
  dieter-rams      Dieter Rams — Less, but better  *(interpretive)*
  lao-tzu          Lao Tzu — The way that can be spoken is not the eternal way

SCIENCE
  feynman          Richard Feynman — Explain it simply, or you don't know it
```

**Formatting rules**:

- Category heading: UPPERCASE, blank line before
- Persona row: 2-space indent + `id` (width-padded to longest id in group + 2 spaces) + `name — tagline`
- Living persona: append ` *(interpretive)*` at end of line (pulled from `living_status ∈ {living, estate_protected}`)
- Sort within each group by `id` alphabetically

## Step 4 — Footer + filter feedback

After the rendered list, print a one-line footer:

```
<N> personas across <M> categories. Use /muse:list --category=<tag> to filter.
```

Where N = total unique personas, M = total unique categories. Example for v2.3.0 state: `8 personas across 7 categories. Use /muse:list --category=<tag> to filter.`

**If `--category=<tag>` was set but matched 0 categories**:

```
<tag> matched 0 categories. Closest matches: <tag-1>, <tag-2>, <tag-3>.

Available categories: <comma-separated alphabetical list>.
```

Use simple Levenshtein distance or substring match for closest suggestions. Show the full alphabetical list so the user can pick the right one.

**If `--category=<tag>` matched but returned 0 personas** (edge case — category exists but is empty, shouldn't happen in practice):

```
No personas in category "<tag>".
```

## Step 5 — Close

Print nothing else. No session file written. No analytics logged (list is a read-only, zero-side-effect command — tracking its usage would be overkill for a pure display).

---

## Notes

- **Dynamic category extraction** means new personas with new categories appear automatically without editing this file. Forkers who add a persona with `categories: [economics]` will see `ECONOMICS` as a new group on their next `/muse:list` run.
- **No persistence**. This command is intentionally ephemeral. It is the "table of contents" for the installed persona set.
- **No subagents**. Pure read + transform + render.
- **Failure-tolerant**. A single malformed persona file warns but does not abort the command — the rest of the list still renders. The warning tells the user which file to fix.
- **v2.3.0 behavior**: `--category=<tag>` is case-insensitive and does exact match against the frontmatter slug. Partial/fuzzy match is NOT supported (to avoid ambiguity — the suggestion footer handles that case).

---

## Related commands

- `/muse:<persona-id>` — run a single-persona session (e.g., `/muse:feynman "question"`)
- `/muse:chain p1→p2→p3 <question>` — sequential chain
- `/muse:all <question>` — default 5-persona Council
- `/muse:build <id>` — create a new persona
- `/muse:update <id>` — update an existing persona
- `/muse:benchmark` — measure persona distinctiveness + compliance

*Generated by muse v2.3.0-alpha*
