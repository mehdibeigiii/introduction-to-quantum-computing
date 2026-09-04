# Foundations and quantum information

The starting point is the difference between a quantum state and the classical
outcome of measuring it. Complex amplitudes, normalization, unitary gates, and
measurement bases explain the first one-qubit experiments. Tensor products and
controlled gates then introduce entanglement and communication protocols. Basic
complex arithmetic, vectors, and matrix multiplication are the prerequisites.

Begin with [Hello, quantum world!](hello-quantum-world.ipynb), then use
[BB84](bb84.ipynb) to connect basis choice with key distribution.
[Entanglement](entanglement.ipynb) constructs a Bell pair and inspects its state
and correlations. [CHSH](chsh.ipynb) tests the corresponding game statistics, and
[teleportation and superdense coding](teleportation-superdense-coding.ipynb)
show how shared entanglement changes communication resources.

Measurement probabilities must be distinguished from amplitudes. Correlated
outcomes alone do not establish a Bell-inequality violation, and teleportation
does not enable faster-than-light communication. The BB84 implementation covers
the preparation and sifting example; the broader security argument belongs to
the course and its supplement.

This introduction and the supplied notebooks establish the starting material.
The next academic pass will add the selected derivations, independent exercises,
and the student's interpretation of the observed results. Current implementation
qualifications are recorded in [reproducibility](../../docs/reproducibility.md).

[Project home](../../README.md) · [Next: algorithms](../02-quantum-algorithms/README.md) · [References](../../REFERENCES.md)
