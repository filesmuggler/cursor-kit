---
name: feature-planning
description: Plan a feature or change before implementing by discovering existing code and producing a concrete, testable plan. Use before building new pages, endpoints, components, or any non-trivial change.
---

# Feature Planning

Produce a grounded plan before writing implementation code.

## Workflow

```
- [ ] 1. Restate the goal and acceptance criteria
- [ ] 2. Discover existing code to reuse
- [ ] 3. Identify files to add/change
- [ ] 4. Define the test + types + UI plan
- [ ] 5. List risks and open questions
```

**1. Goal** — One or two sentences. What does done look like?

**2. Discover** — Search the codebase before designing. Look for:
- Existing components, hooks (e.g. `useAuth`), and utilities that already solve part of this.
- Data-fetching patterns, API/types definitions, and state conventions.
- Similar features to mirror for structure and naming.

**3. Files to touch** — List concrete paths to create or modify. Prefer extending existing modules over new ones.

**4. Test + types + UI plan**
- Tests: which behaviors, which framework (e.g. React Testing Library), happy path + edge cases.
- Types/API: new or updated types, API contracts, DB schema changes.
- UI: components and styling (e.g. Tailwind classes) to add or adjust.

**5. Risks / questions** — Anything ambiguous, irreversible, or needing user input. Ask before proceeding on those.

## Output format

```markdown
## Goal
...

## Reuse (found in codebase)
- path -> what it gives us

## Changes
- path/to/file — create/modify — why

## Test + types + UI plan
- Tests: ...
- Types/API: ...
- UI: ...

## Risks / open questions
- ...
```

Keep the plan proportional to the task. Do not over-plan trivial changes.
