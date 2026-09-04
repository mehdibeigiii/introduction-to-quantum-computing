# From qubits to quantum machine learning

Quantum computing uses quantum states and their evolution to process
information. A qubit is described by normalized complex amplitudes, while a
measurement produces a classical outcome. This distinction motivates the course:
the size of a quantum state space alone does not explain how useful answers can
be extracted from it.

The opening examples introduce gates, measurement bases, and composite systems.
BB84 uses preparation and measurement to distribute key material. Bell states,
CHSH, teleportation, and superdense coding then make entanglement a concrete
resource for correlations and communication. These ideas are developed in
[foundations and information](../notebooks/01-foundations-and-information/README.md).

[Quantum algorithms](../notebooks/02-quantum-algorithms/README.md) use phase
kickback and interference to reveal properties of an oracle. Deutsch–Jozsa
classifies a promised function, Grover amplifies marked states, and Shor combines
quantum order finding with classical arithmetic. Fourier transforms and phase
estimation connect this discussion to quantum counting and HHL.

The next transition is from constructing a fixed algorithm to optimizing a
parameterized computation. Ising and QUBO models connect graph problems to
Hamiltonians. Annealing, QAOA, and VQE approach energy minimization in different
ways. Their [optimization examples](../notebooks/03-optimization-and-variational-methods/README.md)
lead naturally into [quantum machine learning](../notebooks/04-quantum-machine-learning/README.md),
where circuits encode data, estimate kernels, or learn parameters.

The final topics ask how these computations can be reliable and when they are
difficult to reproduce classically. [Error correction](../notebooks/05-error-correction/README.md)
introduces encoded information and error syndromes.
[Simulation and quantum advantage](../notebooks/06-simulation-and-quantum-advantage/README.md)
then distinguish efficiently simulable circuits from more demanding sampling
problems. The 2020 hardware examples provide historical context.

This is the conceptual progression of the course, rather than a claim that the
field developed in exactly this order. The [course map](course-map.md) connects
the seven teaching sessions and their overlapping materials to these topics.

[Project home](../README.md) · [References](../REFERENCES.md)
