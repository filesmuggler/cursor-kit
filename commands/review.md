---
name: review
description: Run a focused review pass over the current diff with severity-tagged findings.
---

# /review

Apply the `agent-review` skill to the current diff (or the diff/PR referenced after the command).

Review for correctness, security, data safety, test coverage, maintainability, and performance. Report findings grouped by severity (Critical / Suggestion / Nice-to-have), each referencing `file:line` with a concrete fix.

If nothing material is found, say so plainly instead of inventing nitpicks.
