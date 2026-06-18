---
name: experiment-reporting
description: Generate a structured experiment report (hyperparameters, training curves, evaluation metrics) and update the research log. Use after completing an ML training or evaluation run.
---

# Experiment Reporting

Capture each run as a reproducible report and append it to the research log.

## Report template

```markdown
# Experiment: <name> (<date>, commit <sha>)

## Objective
What this run tested and the primary metric.

## Config
- Key hyperparameters (or link to configs/<name>.yaml)
- Seed, hardware, framework versions

## Results
| Metric | Baseline | This run | Delta |
|--------|----------|----------|-------|
| ...    | ...      | ...      | ...   |

## Curves
- Training/val loss and metric curves (link to logs or attach plots)

## Observations
- What happened, surprises, failures

## Decision
- Promote / iterate / discard, and the next experiment
```

## Workflow

```
- [ ] 1. Collect config, seed, commit, and environment
- [ ] 2. Pull final + best metrics and compare to baseline
- [ ] 3. Generate/link training curves
- [ ] 4. Write observations and the decision
- [ ] 5. Append an entry to the research log (e.g. docs/research-log.md)
```

Every report must be reproducible: anyone should be able to rerun from the config, seed, and commit recorded.
