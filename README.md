# agentic-kit

A local Cursor plugin that bundles global **rules**, **skills**, and slash-command **prompts** for disciplined agentic workflows. Derived from `research.md`.

It encodes a single operating doctrine (research-first, verify-before-done, review every diff, run retros, layered security) plus domain support for React/Expo/Next.js, Drizzle/Postgres, ML & VLA research, model deployment, and robotics.

## What's inside

- `rules/` — `.mdc` rules. `operating-doctrine.mdc` always applies; the rest auto-attach by file globs.
- `skills/` — auto-surfacing skills for planning, verification, review, retro, security, UI QA, DB migrations, ML experiments, deployment, and robotics.
- `commands/` — slash-command prompts: `/plan`, `/verify`, `/review`, `/retro`, `/security-review`, `/experiment-plan`, `/deploy-plan`.

## Install (global)

Symlink this repo into your local plugins directory so edits stay live:

```bash
ln -s /Users/krzysztofstezala/Projects/Cursor ~/.cursor/plugins/local/agentic-kit
```

Then reload Cursor. Verify:

- Rules appear in the rule picker (`operating-doctrine` shows as always-applied).
- `/plan`, `/verify`, etc. appear in the command menu.
- Skills are listed and can be invoked with `/skill-name`.

Optionally, paste the contents of `rules/operating-doctrine.mdc` into Cursor Settings → Rules → User Rules as a backup so the doctrine applies even outside this plugin.

## Layout

```text
.cursor-plugin/plugin.json   # manifest
rules/                       # .mdc rules (doctrine + domain)
skills/<name>/SKILL.md       # auto-surfacing skills
commands/*.md                # slash-command prompts
```

## Philosophy

Start simple, iterate. The doctrine and cross-cutting skills are the core; domain rules and skills are layered on as projects need them. After significant sessions, run `/retro` to improve the rules and skills themselves.
