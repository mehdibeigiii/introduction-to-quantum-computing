# Reproducibility and current status

The first stage organizes the supplied modernized notebooks and provides a
reading and setup route. Notebook code and saved outputs are preserved during
the reorganization. A complete clean-environment run has not yet been performed;
saved figures and execution counts are inherited examples.

[requirements.txt](../requirements.txt) is the single setup and dependency file.
It retains the supplied direct package versions and adds explicit PySCF and
circuit-drawing dependencies. Package availability does not establish that the
whole collection has been executed successfully. The intended Python starting
point is 3.13; the resolved packages and platform must be recorded with any
future validation or reported experiment.

## Running an experiment

Use the documented environment and restart the notebook kernel before running
cells in order. Keep optional IBM and D-Wave execution flags disabled for local
work. A backend snapshot used by a noisy simulator is a model of hardware, not
a new hardware measurement. Some examples, including the molecular distance
sweep and the 10,000 random circuits, are substantially larger than an initial
setup check.

When reporting a result, record the producing notebook and repository revision,
Python and package versions, platform, relevant parameters, seeds, shots, and
simulation method or device. Explain the expected result and the comparison
used to assess it. Random sampling and training can vary; conclusions should
respect that variation. Selected outputs belong under [results/](../results/README.md).

## Known limits to resolve

The CHSH winning-probability function currently constructs a local sampler
internally, even when a hardware sampler is passed to it. Its hardware-labelled
path therefore needs correction before it can support a hardware claim.

The quantum-kernel and variational-classifier notebooks currently fit PCA and
scaling before splitting the data. Fit these transformations on training data
only, then transform the held-out data, before reporting evaluation scores.
This follows [scikit-learn's guidance on data leakage](https://scikit-learn.org/stable/common_pitfalls.html#data-leakage).

Teleportation uses coherent corrections, illustrating the deferred-measurement
form of the protocol. The BB84 example covers preparation, measurement, and
sifting, rather than the complete security and post-processing procedure. Shor's
dense modular-multiplication matrices limit it to small educational instances.
These qualifications belong beside any conclusions drawn from those notebooks.

## Writing and completion

Use descriptive lowercase hyphenated filenames and relative documentation links.
Explain an experiment in prose, with the relevant equations before or beside its
code. State units and bit-order conventions where they affect interpretation.
Keep diagrams and representative plots inside notebooks; export only outputs
that need to be referenced elsewhere.

A topic is ready for academic assessment when intuition, mathematics, physical
interpretation, derivations, examples, implementation, unaided exercises, and a
summary in the student's own words have all been completed. Distinguish a
published result, a reproduced observation, and a personal interpretation in
the writing. The current skeleton does not claim that those steps are finished.

[Project home](../README.md) · [Course map](course-map.md)
