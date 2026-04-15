# Muse adapter: Claude Code

Muse is designed around Claude Code's skill system. This is the **primary adapter** and requires zero configuration beyond the initial install.

---

## Install

```
git clone https://github.com/doanchienthangdev/muse ~/.claude/skills/muse
```

That's it. Claude Code auto-discovers the skill at `~/.claude/skills/muse/SKILL.md` on next session.

**Alternative**: use the install script wrapper (identical effect):

```
curl -fsSL https://raw.githubusercontent.com/doanchienthangdev/muse/main/install.sh | sh
```

---

## How Claude Code discovers Muse

Claude Code scans `~/.claude/skills/*/SKILL.md` at session start. Each directory under `~/.claude/skills/` with a `SKILL.md` file becomes an available skill.

Muse clones into `~/.claude/skills/muse/`, and the dispatcher lives at `~/.claude/skills/muse/SKILL.md`. The skill's frontmatter declares:

```yaml
---
name: muse
description: "Think with the greats..."
---
```

Claude Code reads the frontmatter, registers the skill, and invokes it when the user types something matching the skill's description.

---

## Invocation

Once installed, just type in any Claude Code session:

```
muse:feynman why is my code slow?
muse:all should I pivot?
muse:chain feynman→socrates→dieter-rams what should I cut?
muse:debate aristotle vs lao-tzu ship fast or polished?
muse:critic plan.md --persona=marcus-aurelius
muse:build --person=jane-jacobs --src=.archives/personas/jane-jacobs
muse:list
```

Claude will parse the argument, route to the right internal mode, and load the relevant persona markdown files using its Read tool.

---

## File layout (after install)

```
~/.claude/skills/muse/
├── SKILL.md                  # The dispatcher Claude discovers
├── skills/muse/SKILL.md      # Same file (symlink), for path compatibility
├── personas/                 # 8 persona markdown files
├── chains/                   # 3 preset chains
├── benchmarks/               # 2 benchmark files
├── adapters/                 # Platform notes (you are reading claude-code/)
├── docs/                     # Documentation
├── README.md
├── LICENSE
└── .archives/                # Local research vault (gitignored)
```

---

## Update

```
cd ~/.claude/skills/muse
git pull
```

Or via the framework:

```
muse:update
```

(v2.1+ will add this as a first-class muse command.)

---

## Uninstall

```
rm -rf ~/.claude/skills/muse
```

That's it. Muse does not install files outside `~/.claude/skills/muse/` in the default configuration. No system packages installed, no shell rc modifications.

If you used the optional `.archives/personas/<id>/` research vault, those files are under the Muse install dir and get removed with it.

---

## Troubleshooting

**"muse is not being discovered"**
- Exit Claude Code completely and start a new session. Skill discovery happens at session start.
- Verify install path: `ls ~/.claude/skills/muse/SKILL.md` should exist.

**"muse:feynman returns generic output"**
- Check that `~/.claude/skills/muse/personas/feynman.md` exists and has content.
- Start a fresh session. Claude may have cached an old skill definition.

**"I want muse at a different path"**
- Set `MUSE_ROOT=/path/to/muse` in your shell env before starting Claude Code.
- The dispatcher respects `MUSE_ROOT` for file lookups.

---

## Tested with

- Claude Code Desktop (macOS)
- Claude Code CLI (`claude` command)
- Claude Code in VS Code extension

If you use Claude Code in a different context and discovery fails, open an issue.
