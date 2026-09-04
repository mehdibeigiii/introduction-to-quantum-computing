# Optimization and variational methods

A computational problem can often be represented by an energy function whose
minimum describes a solution. This group connects binary variables and Ising
spins to qubit Hamiltonians, then compares annealing and parameterized circuits.
It builds on quantum states and gates, with eigenvalues and expectation values
as the additional mathematical prerequisites.

[MaxCut](maxcut.ipynb) expresses graph partitioning as an Ising problem and
includes exact, classical simulated-annealing, and optional D-Wave approaches.
[QAOA](qaoa.ipynb) studies a small graph using different variational depths and
simulation conditions. [Molecular VQE](vqe-molecular-energy.ipynb) uses a molecular
Hamiltonian, a fermion-to-qubit mapping, and a variational ansatz to construct an
H₂ dissociation curve alongside an exact reference.

VQE is placed here because its variational principle and classical optimization
loop connect directly to QAOA. Its chemistry interpretation is discussed in
[applications](../../docs/applications.md). A small problem's agreement with an
exact solver demonstrates the method under those conditions; it does not itself
establish a computational speedup.

The first pass preserves the supplied implementations. Derivations, independent
variations, and measured comparisons will be developed alongside the notebooks.
Keep hardware extensions disabled during local work and consult the
[reproducibility notes](../../docs/reproducibility.md) before longer runs.

[Project home](../../README.md) · [Next: machine learning](../04-quantum-machine-learning/README.md) · [References](../../REFERENCES.md)
