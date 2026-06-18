---
name: ml-experiment-planning
description: Plan a machine learning experiment from a research objective - data preprocessing, model architecture, training regimen, evaluation metrics, and expected outcomes. Use when starting a new ML/VLA experiment or research direction.
---

# ML Experiment Planning

Turn a research objective into a concrete, reproducible experiment plan. Research existing models and results first.

## Workflow

```
- [ ] 1. Research: existing models, baselines, and prior results in the repo/literature
- [ ] 2. Define the objective and success metric
- [ ] 3. Data: sources, preprocessing, splits, leakage checks
- [ ] 4. Model: architecture and rationale
- [ ] 5. Training regimen: optimizer, schedule, hardware, budget
- [ ] 6. Evaluation: metrics, baselines to beat, ablations
- [ ] 7. Expected outcomes and decision criteria
```

## Output format

```markdown
## Objective
... and the single primary metric

## Baselines / prior work
- ...

## Data
- Source, size, preprocessing, train/val/test split, leakage checks

## Model
- Architecture, key hyperparameters, why

## Training
- Optimizer, LR schedule, batch size, epochs/steps, hardware, est. cost/time
- Seeds fixed; config-driven (configs/<name>.yaml)

## Evaluation
- Metrics, baselines, ablations, what would falsify the hypothesis

## Expected outcome
- Predicted result and the decision it informs
```

Keep the plan reproducible: every choice should map to a config value and a fixed seed.
