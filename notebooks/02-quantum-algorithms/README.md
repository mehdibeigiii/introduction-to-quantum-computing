# Quantum algorithms

Quantum algorithms must turn amplitudes into useful measurement outcomes.
Reversible oracles, phase kickback, and interference connect the examples here.
The prerequisites are the state, gate, measurement, and composite-system ideas
introduced in [foundations](../01-foundations-and-information/README.md).

[Deutsch–Jozsa](deutsch-jozsa.ipynb) builds constant and balanced oracles
explicitly. [Grover](grover.ipynb) constructs the diffusion operation and examines
success probability as the iteration count changes.
[Oracle-search examples](oracle-search-examples.ipynb) adds the modernized
algorithm-library and Boolean-expression examples from CERN notebook 8.
[Shor order finding](shor-order-finding.ipynb) connects controlled modular
multiplication and the inverse quantum Fourier transform to classical factor
recovery.

The theoretical thread includes universality, the cost of oracle queries, and
the limitations of quantum parallelism. Fourier transforms and phase estimation
also motivate quantum counting and HHL; these have course references but no
separate implementation here. The Shor example uses dense matrices and is
intended for small instances, so it cannot demonstrate scalable factorization.

Later derivations and exercises should explain why the measured distributions
have their expected form. Saved plots remain examples until their execution and
interpretation are documented under [reproducibility](../../docs/reproducibility.md).

[Project home](../../README.md) · [Next: optimization](../03-optimization-and-variational-methods/README.md) · [References](../../REFERENCES.md)
