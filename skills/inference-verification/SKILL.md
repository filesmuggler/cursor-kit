---
name: inference-verification
description: Verify a deployed or packaged model by running test inference on sample inputs, measuring latency and accuracy, auditing resource usage, and checking network requests. Use after packaging or deploying a model endpoint.
---

# Inference Verification

Confirm a served model is correct, fast enough, and well-behaved on the network.

## Checklist

```
- [ ] Correctness: outputs match the source model on sample inputs (parity)
- [ ] Accuracy: metric on a holdout sample within tolerance of training-time
- [ ] Latency: p50/p95 under load against the target SLO
- [ ] Resources: CPU/GPU/memory usage within budget
- [ ] Network: requests go only to expected hosts; payloads carry no secrets/PII
```

## Test inference

```bash
# Smoke test the endpoint
curl -s -X POST "$ENDPOINT/predict" \
  -H 'content-type: application/json' \
  -d @sample_input.json | jq .
```

Compare endpoint outputs to the original model on the same inputs; flag any divergence beyond export tolerance.

## Latency / load
- Measure single-request latency, then p50/p95 under concurrent load. Compare to the SLO. Note batching effects.

## Resource audit
- Track GPU/CPU utilization and memory during load; confirm no leaks across sustained requests.

## Network-request auditing
- Inspect outbound calls from the endpoint: assert they target only expected hosts, use TLS, and never include credentials or PII in logs or payloads.

Report measured numbers (latency, accuracy, utilization), not just pass/fail.
