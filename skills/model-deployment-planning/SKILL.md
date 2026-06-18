---
name: model-deployment-planning
description: Plan how to package and deploy a trained model - export formats (ONNX/TensorRT), inference servers (FastAPI/Triton), containerization, scaling, and monitoring. Use when preparing a model for serving or deployment.
---

# Model Deployment Planning

Plan the path from a trained checkpoint to a monitored production endpoint.

## Workflow

```
- [ ] 1. Packaging: export format and optimization
- [ ] 2. Serving: inference server and API contract
- [ ] 3. Containerization: image, dependencies, GPU/CPU
- [ ] 4. Config: environment variables and secrets
- [ ] 5. Scaling: replicas, batching, autoscaling
- [ ] 6. Monitoring: latency, throughput, errors, drift
```

## Packaging
- Export to a portable/optimized format: ONNX for portability, TensorRT for NVIDIA-optimized inference. Verify numerical parity with the source model after export.

## Serving
- FastAPI for simple Python endpoints; Triton Inference Server for high-throughput, multi-model, or GPU batching. Define the request/response schema and versioning up front.

## Containerization
- Dockerfile pinned to a base image matching the runtime (CUDA version for GPU). Keep images lean; separate build and runtime stages. Kubernetes manifests for orchestration when needed.

## Config and secrets
- All endpoints, model paths, and credentials come from environment variables / secret store - never baked into the image.

## Scaling and monitoring
- Decide replica count, dynamic batching, and autoscaling triggers (latency/queue depth).
- Emit metrics for p50/p95 latency, throughput, error rate, and input/prediction drift.

## Output
A deployment plan covering each step above, plus a rollback strategy.
