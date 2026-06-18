---
name: deploy-plan
description: Plan packaging and deployment for a trained model.
---

# /deploy-plan

Apply the `model-deployment-planning` skill to the model/endpoint that follows.

Produce a plan covering: packaging (ONNX/TensorRT with parity check), serving (FastAPI/Triton with API contract), containerization (Docker/K8s, GPU/CPU runtime), config and secrets via environment, scaling (replicas, batching, autoscaling), monitoring (latency, throughput, errors, drift), and a rollback strategy.

Do not deploy in this step. Output the plan and surface any risky or irreversible actions for confirmation.
