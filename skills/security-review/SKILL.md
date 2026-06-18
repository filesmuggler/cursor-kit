---
name: security-review
description: Perform a layered security review combining LLM analysis with deterministic SAST tooling, focused on injection, secrets, authz, and supply-chain risk. Use when reviewing security-sensitive code, handling untrusted input, or auditing dependencies.
---

# Security Review

Layered defense: LLM reasoning plus deterministic tools plus human oversight. No single layer is sufficient.

## Layers

```
- [ ] 1. LLM review of the diff against the threat checklist
- [ ] 2. Deterministic SAST / dependency scan
- [ ] 3. Summarize findings for human sign-off on risky items
```

## Threat checklist
- Injection: SQL/NoSQL, command, template, path traversal. Require parameterization and allow-lists.
- Secrets: no hardcoded keys/passwords/tokens; confirm they load from env/secret store; check that none are being committed.
- AuthN/AuthZ: every protected route/handler checks identity and permissions; no IDOR (object access without ownership check).
- Input validation: validate and sanitize all external input at the boundary; reject by default.
- Crypto: use vetted libraries, no homegrown crypto, no weak/legacy algorithms.
- Deserialization / SSRF / unsafe file ops on untrusted data.

## Deterministic tooling
Run the project's configured scanners; common defaults:

```bash
# Static analysis
semgrep --config auto .
bandit -r .            # Python

# Dependency / supply chain
npm audit --omit=dev
pip-audit
```

## Supply chain
Treat skills, hooks, MCP servers, and third-party packages as dependencies: verify source and trust level before adding, and pin/review updates.

## Output
List findings by severity (critical / high / medium / low) with `file:line`, the risk, and the fix. Explicitly flag anything that needs human judgment before merge or deploy.
