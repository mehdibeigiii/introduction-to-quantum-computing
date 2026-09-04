# Simulation and quantum advantage

The cost of simulating a quantum circuit depends on its structure and gates,
as well as its size. The prerequisites are composite states, entanglement,
measurement distributions, and the distinction between a computational task
and a particular implementation of it.

[Stabilizer simulation](stabilizer-simulation.ipynb) prepares a 1,000-qubit
GHZ-type state using a restricted gate set and explicitly selects the stabilizer
simulator. It illustrates the Gottesman–Knill perspective: substantial
entanglement can coexist with efficient classical simulation.
[Random-circuit sampling](random-circuit-sampling.ipynb) samples small random
circuits and examines the exact probabilities of the sampled outputs. Its
reference curve is weighted by the probability of sampling each output, so it
should not be confused with uniformly selecting output bitstrings.

The course places these examples beside historical random-circuit and photonic
sampling experiments. Boson sampling, classical simulation strategies, and
hardware roadmaps remain conceptual or literature material here. Running these
small notebooks does not reproduce a large-scale quantum-advantage experiment.

The next stage will connect the plotted distributions to their derivation and
record the resources needed for the local experiments. The default random-circuit
example generates 10,000 circuits; consult [reproducibility](../../docs/reproducibility.md)
before using it as a first environment check.

[Project home](../../README.md) · [Course synthesis](../../docs/reflections.md) · [References](../../REFERENCES.md)
