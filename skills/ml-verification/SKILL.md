---
name: ml-verification
description: Verify ML/VLA code via data-loader unit tests, training-loop integration tests, reproducibility checks, baseline evaluation, and tensor shape/format sampling. Use after changing models, data pipelines, or training code.
---

# ML Verification

Verify ML changes with tests and metrics, not just a clean run.

## Layers

```
- [ ] 1. Unit: data loaders return correct shapes, dtypes, ranges, and labels
- [ ] 2. Integration: a tiny training loop runs end-to-end and loss decreases
- [ ] 3. Reproducibility: same seed + config -> same result
- [ ] 4. Baseline: evaluate against the baseline metric; flag regressions
- [ ] 5. VLA: sample batches and assert shape/format consistency across modalities
```

## Examples

```python
def test_loader_shapes():
    x, y = next(iter(make_loader(split="train", batch_size=4)))
    assert x.shape == (4, 3, 224, 224)
    assert x.dtype == torch.float32 and x.min() >= 0.0

def test_overfits_one_batch():
    # A correct model+loss should drive loss down on a single batch
    losses = train_steps(model, one_batch, steps=50)
    assert losses[-1] < losses[0] * 0.1

def test_reproducible():
    a = run(seed=0); b = run(seed=0)
    assert a == b
```

## Reproducibility check
- Fix all seeds and enable deterministic algorithms; assert identical metrics across two runs of the same config.

## Baseline evaluation
- Run the eval entrypoint and compare to the recorded baseline. Treat a metric drop beyond noise as a failure to investigate, not to ignore.

## VLA shape/format
- For vision-language-audio data, sample N batches and assert each modality's shape, dtype, and alignment (e.g. matching sequence lengths / timestamps).

Report metrics with the config and seed used.
