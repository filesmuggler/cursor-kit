---
name: agent-review
description: Run a focused review pass over generated or changed code for correctness, security, and maintainability, reporting severity-tagged findings. Use after generating code or when asked to review a diff or pull request.
---

# Agent Review

A dedicated review pass to catch issues after generation. Review the diff, not the whole repo.

## Checklist

```
- [ ] Correctness: logic, edge cases, error handling, off-by-one, null/empty
- [ ] Security: injection, secrets, authz/authn, input validation, unsafe deserialization
- [ ] Data: migrations safe, no data loss, transactions where needed
- [ ] Tests: cover the change, including failure paths
- [ ] Maintainability: naming, dead code, duplication, clear boundaries
- [ ] Performance: obvious N+1, unbounded loops, large allocations
- [ ] Style: matches project conventions
```

## Reporting

Group findings by severity and reference exact `file:line`:

- Critical — must fix before merge (bugs, security, data loss)
- Suggestion — should improve (clarity, missing test, edge case)
- Nice-to-have — optional polish

For each finding: what is wrong, why it matters, and a concrete fix.

```markdown
### Critical
- `src/api/users.ts:42` — user-supplied `id` interpolated into SQL. Use a parameterized query.

### Suggestion
- `src/api/users.ts:58` — no test for the not-found path. Add a 404 case.
```

If nothing material is found, say so plainly rather than inventing nitpicks.
