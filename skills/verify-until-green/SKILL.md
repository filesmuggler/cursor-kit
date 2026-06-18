---
name: verify-until-green
description: Verify code changes by running typecheck, lint, and tests in a loop, fixing failures until everything passes. Use after editing code and before reporting a task complete.
---

# Verify Until Green

Never claim a change works without running it. Loop until all checks pass.

## Loop

```
- [ ] 1. Typecheck
- [ ] 2. Lint
- [ ] 3. Tests (unit, then integration)
- [ ] 4. If any fail: read the error, fix, restart the loop
- [ ] 5. Only stop when all are green
```

## Finding the commands

Detect the project's checks instead of assuming. Look in `package.json` scripts, `Makefile`, `pyproject.toml`, `noxfile`, or CI config. Common examples:

```bash
# JS/TS
npm run typecheck   # or: tsc --noEmit
npm run lint
npm test

# Python
mypy . ; ruff check . ; pytest -q
```

## Rules
- Fix the root cause, not the symptom. Do not silence errors by deleting assertions, adding broad `# type: ignore`, or weakening tests.
- Re-run the full relevant check after each fix; partial passes are not done.
- If a failure is pre-existing and unrelated, say so explicitly rather than fixing silently or ignoring a regression you introduced.
- If you cannot get to green, stop and report exactly which check fails and why.
