---
name: retro
description: Reflect on a work session to capture what worked and what failed, then propose concrete edits to rules and skills. Use at the end of a significant session or when the agent repeated mistakes.
---

# Retro

Turn a session's lessons into durable improvements to this agentic kit.

## Workflow

```
- [ ] 1. Summarize what the session set out to do and the outcome
- [ ] 2. List what worked well (keep doing)
- [ ] 3. List friction, mistakes, and rework (and the root cause)
- [ ] 4. Map each lesson to a concrete change: a rule, a skill, or a command
- [ ] 5. Propose the edits as diffs the user can accept
```

## Where lessons go
- Recurring behavioral mistake -> tighten `rules/operating-doctrine.mdc` or a domain rule.
- Missing workflow knowledge -> new or updated skill under `skills/`.
- Frequently repeated prompt -> new command under `commands/`.

## Output format

```markdown
## Session summary
...

## Worked well
- ...

## Friction / mistakes (root cause)
- ... — cause: ...

## Proposed kit changes
- rules/<file>.mdc: <add/adjust> ...
- skills/<name>/SKILL.md: <new/update> ...
```

Keep proposals minimal and high-signal. Do not over-engineer; only encode patterns that recurred or caused real cost.
