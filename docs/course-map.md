# Course and notebook map

The course consists of seven sessions with overlapping attachments. The final
251-page lecture PDF contains the cumulative material in 21 thematic parts.
The table below follows the announced lecture subjects; it does not assign
precise recording boundaries to topics already introduced in adjacent decks.

| CERN session | Main subject | Repository entry point |
| --- | --- | --- |
| [1](https://indico.cern.ch/event/970903/) | Qubits, gates, measurement, hardware, and programming | [Foundations](../notebooks/01-foundations-and-information/README.md) |
| [2](https://indico.cern.ch/event/970904/) | BB84, two-qubit systems, entanglement, and CHSH | [Quantum information](../notebooks/01-foundations-and-information/README.md) |
| [3](https://indico.cern.ch/event/970905/) | Teleportation, superdense coding, and Deutsch's algorithm | [Communication](../notebooks/01-foundations-and-information/README.md) and [algorithms](../notebooks/02-quantum-algorithms/README.md) |
| [4](https://indico.cern.ch/event/970906/) | Multiqubit computation, Deutsch–Jozsa, Grover, Shor, and HHL | [Algorithms](../notebooks/02-quantum-algorithms/README.md) |
| [5](https://indico.cern.ch/event/970907/) | Ising/QUBO optimization, annealing, and QAOA; VQE materials | [Optimization and variational methods](../notebooks/03-optimization-and-variational-methods/README.md) |
| [6](https://indico.cern.ch/event/970908/) | VQE, quantum kernels, classifiers, and QGANs | [Variational methods](../notebooks/03-optimization-and-variational-methods/README.md) and [QML](../notebooks/04-quantum-machine-learning/README.md) |
| [7](https://indico.cern.ch/event/970909/) | Error correction, simulation, quantum advantage, and prospects | [Error correction](../notebooks/05-error-correction/README.md) and [simulation](../notebooks/06-simulation-and-quantum-advantage/README.md) |

## Canonical implementations

Original numbers are retained here for traceability. All linked notebooks use
the supplied modernized implementations. The 16 existing repository copies keep
their prior changes, including optional hardware guards; example 8 is added
from the modernized Sources. MaxCut was originally distributed as a Python
script. Example 8 complements the hand-built circuits with algorithm-library
and Boolean-expression examples.

| CERN example | Canonical notebook |
| --- | --- |
| 1 — Hello, quantum world! | [hello-quantum-world.ipynb](../notebooks/01-foundations-and-information/hello-quantum-world.ipynb) |
| 2 — BB84 | [bb84.ipynb](../notebooks/01-foundations-and-information/bb84.ipynb) |
| 3 — Hello, entangled world! | [entanglement.ipynb](../notebooks/01-foundations-and-information/entanglement.ipynb) |
| 4 — CHSH | [chsh.ipynb](../notebooks/01-foundations-and-information/chsh.ipynb) |
| 5 — Teleportation and superdense coding | [teleportation-superdense-coding.ipynb](../notebooks/01-foundations-and-information/teleportation-superdense-coding.ipynb) |
| 6 — Deutsch–Jozsa | [deutsch-jozsa.ipynb](../notebooks/02-quantum-algorithms/deutsch-jozsa.ipynb) |
| 7 — Grover | [grover.ipynb](../notebooks/02-quantum-algorithms/grover.ipynb) |
| 8 — Modern Deutsch–Jozsa and Grover | [oracle-search-examples.ipynb](../notebooks/02-quantum-algorithms/oracle-search-examples.ipynb) |
| 9 — Modern Shor | [shor-order-finding.ipynb](../notebooks/02-quantum-algorithms/shor-order-finding.ipynb) |
| 10 — MaxCut | [maxcut.ipynb](../notebooks/03-optimization-and-variational-methods/maxcut.ipynb) |
| 11 — QAOA | [qaoa.ipynb](../notebooks/03-optimization-and-variational-methods/qaoa.ipynb) |
| 12 — VQE | [vqe-molecular-energy.ipynb](../notebooks/03-optimization-and-variational-methods/vqe-molecular-energy.ipynb) |
| 13 — QSVM | [quantum-kernels.ipynb](../notebooks/04-quantum-machine-learning/quantum-kernels.ipynb) |
| 14 — VQC | [variational-classifier.ipynb](../notebooks/04-quantum-machine-learning/variational-classifier.ipynb) |
| 15 — QGAN | [quantum-generative-model.ipynb](../notebooks/04-quantum-machine-learning/quantum-generative-model.ipynb) |
| 16 — Simulation | [stabilizer-simulation.ipynb](../notebooks/06-simulation-and-quantum-advantage/stabilizer-simulation.ipynb) |
| 17 — Random circuits | [random-circuit-sampling.ipynb](../notebooks/06-simulation-and-quantum-advantage/random-circuit-sampling.ipynb) |

## Coverage boundaries

The implemented examples form the computational core. Their mathematical
prerequisites, error correction, fault tolerance, and limitations of quantum
advantage remain essential conceptual material even when no dedicated notebook
exists. HHL, quantum counting, QRAM, excited-state VQE, and boson sampling are
currently represented by the course references rather than separate experiments.
Further communication protocols and advanced code constructions are supplementary.

The course supplies guided examples and linked demonstrations, but no separate
exercise collection was found in the inspected materials. Independent exercises,
full derivations, and personal summaries remain work for the next stage. The
separate original QGAN-results attachment is a historical output example, not
another canonical implementation. [Applications](applications.md) distinguishes
local examples from the HEP case studies.

[Project home](../README.md) · [References](../REFERENCES.md)
