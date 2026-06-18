---
name: experiment-plan
description: Plan an ML/VLA experiment from a research objective.
---

# /experiment-plan

Apply the `ml-experiment-planning` skill to the objective that follows.

Research existing models, baselines, and prior results first. Then produce a reproducible plan covering: objective and primary metric, data (sources, preprocessing, splits, leakage checks), model architecture, training regimen, evaluation (metrics, baselines, ablations), and expected outcomes with decision criteria.

Every choice should map to a config value and a fixed seed. Do not start training in this step.
