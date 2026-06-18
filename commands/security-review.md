---
name: security-review
description: Run a layered security review of the current changes.
---

# /security-review

Apply the `security-review` skill to the current diff (or the code referenced after the command).

Run layered analysis: LLM review against the threat checklist (injection, secrets, authz, input validation, crypto, deserialization/SSRF), plus the project's deterministic SAST and dependency scanners. Treat skills, hooks, MCP servers, and packages as supply-chain dependencies.

Report findings by severity with `file:line` and a concrete fix. Explicitly flag anything needing human judgment before merge or deploy.
