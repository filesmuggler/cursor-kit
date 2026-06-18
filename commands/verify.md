---
name: verify
description: Run typecheck, lint, and tests in a loop and fix until everything passes.
---

# /verify

Apply the `verify-until-green` skill to the current changes.

1. Detect the project's checks (package.json scripts, Makefile, pyproject, CI config).
2. Run typecheck, then lint, then tests.
3. For any failure, read the error, fix the root cause, and re-run.
4. Repeat until all checks are green.

Do not weaken tests or silence errors to pass. If you cannot reach green, stop and report exactly which check fails and why.
