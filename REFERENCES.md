# References and acknowledgments

This repository is based on Elías F. Combarro’s CERN course, *A Practical Introduction to Quantum Computing: From Qubits to Quantum Machine Learning and Beyond*.
[CERN Indico course page](https://indico.cern.ch/event/970903/) contains the seven lectures, original notebooks, slides, exercises, recordings, and supporting resources. 
The [final cumulative lecture deck](https://indico.cern.ch/event/970909/attachments/2165159/3654057/PIQC%20Lecture%207.pdf) contains the complete progression of the course.

## Course recordings

| Lecture | Main subjects | YouTube recording |
| --- | --- | --- |
| 1 | Introduction, qubits, circuits, hardware, and IBM Quantum | [Watch lecture 1](https://www.youtube.com/watch?v=jwHM8AHOtJ0) |
| 2 | BB84, two-qubit gates, entanglement, and the CHSH game | [Watch lecture 2](https://www.youtube.com/watch?v=SPQ-rvtaREs) |
| 3 | Quantum teleportation, superdense coding, and Deutsch’s algorithm | [Watch lecture 3](https://www.youtube.com/watch?v=wX_vmpbQGU4) |
| 4 | Multiqubit systems, Deutsch–Jozsa, Grover, Shor, and HHL | [Watch lecture 4](https://www.youtube.com/watch?v=a7L2m2qlEIw) |
| 5 | Quantum annealing, Ising optimization, MaxCut, and QAOA | [Watch lecture 5](https://www.youtube.com/watch?v=LFewKe_tWME) |
| 6 | VQE, quantum kernels, variational classifiers, and QGANs | [Watch lecture 6](https://www.youtube.com/watch?v=I6xnxUSubD0) |
| 7 | Quantum error correction, quantum advantage, simulation, and future directions | [Watch lecture 7](https://www.youtube.com/watch?v=vy7oF70FCxQ) |

## Documentation used to modernize the notebooks


[Qiskit 0.33 release notes](https://quantum.cloud.ibm.com/docs/en/api/qiskit/release-notes/0.33)
[Qiskit 0.43 release notes](https://quantum.cloud.ibm.com/docs/en/api/qiskit/release-notes/0.43)
[Qiskit 1.0 feature changes](https://quantum.cloud.ibm.com/docs/en/guides/qiskit-1.0-features) explain the move from V1 primitives to `StatevectorSampler` and `StatevectorEstimator`. 
[Qiskit 2.0 migration guide](https://quantum.cloud.ibm.com/docs/en/guides/qiskit-2.0) 

| Modernization area | Documentation used |
| --- | --- |
| Replacing local `execute`, `QuantumInstance`, and old sampler workflows | IBM’s [exact simulation with Qiskit SDK primitives](https://quantum.cloud.ibm.com/docs/en/guides/simulate-with-qiskit-sdk-primitives), [`StatevectorSampler`](https://quantum.cloud.ibm.com/docs/en/api/qiskit/qiskit.primitives.StatevectorSampler), and [`StatevectorEstimator`](https://quantum.cloud.ibm.com/docs/en/api/qiskit/qiskit.primitives.StatevectorEstimator) documentation |
| Replacing old simulator backends with Aer | IBM’s [exact and noisy simulation with Qiskit Aer](https://quantum.cloud.ibm.com/docs/en/guides/simulate-with-qiskit-aer) |
| Replacing the old IBMQ provider and execution model | IBM’s [`SamplerV2`](https://quantum.cloud.ibm.com/docs/en/api/qiskit-ibm-runtime/sampler-v2) and [Sampler quickstart](https://quantum.cloud.ibm.com/docs/en/guides/get-started-with-sampler) |
| Converting circuits to the selected device instruction set | IBM’s [`generate_preset_pass_manager`](https://quantum.cloud.ibm.com/docs/en/api/qiskit/qiskit.transpiler.generate_preset_pass_manager) documentation |
| Replacing old truth-table and Aqua oracle classes | IBM’s [`PhaseOracleGate`](https://quantum.cloud.ibm.com/docs/en/api/qiskit/qiskit.circuit.library.PhaseOracleGate) documentation and the current [Grover tutorial](https://qiskit-community.github.io/qiskit-algorithms/tutorials/06_grover.html) |
| Using the current quantum Fourier transform gate | IBM’s [`QFTGate`](https://quantum.cloud.ibm.com/docs/en/api/qiskit/qiskit.circuit.library.QFTGate) documentation |
| Replacing class-based feature maps and ansätze with current functions | IBM’s [`zz_feature_map`](https://quantum.cloud.ibm.com/docs/en/api/qiskit/qiskit.circuit.library.zz_feature_map), [`efficient_su2`](https://quantum.cloud.ibm.com/docs/en/api/qiskit/qiskit.circuit.library.efficient_su2), and [`n_local`](https://quantum.cloud.ibm.com/docs/en/api/qiskit/qiskit.circuit.library.n_local) documentation |
| Moving Grover, QAOA, VQE, and optimizers out of Aqua | The current [Qiskit Algorithms API](https://qiskit-community.github.io/qiskit-algorithms/apidocs/qiskit_algorithms.html) |
| Updating the molecular-energy implementation | The [Qiskit Nature documentation](https://qiskit-community.github.io/qiskit-nature/), [`PySCFDriver`](https://qiskit-community.github.io/qiskit-nature/stubs/qiskit_nature.second_q.drivers.PySCFDriver.html), and [`GroundStateEigensolver`](https://qiskit-community.github.io/qiskit-nature/stubs/qiskit_nature.second_q.algorithms.GroundStateEigensolver.html) |
| Updating quantum kernels, VQC, QNN, and QGAN code | The [Qiskit Machine Learning 0.9.1 documentation](https://qiskit-community.github.io/qiskit-machine-learning/), [QML algorithms API](https://qiskit-community.github.io/qiskit-machine-learning/apidocs/qiskit_machine_learning.algorithms.html), [QML primitives API](https://qiskit-community.github.io/qiskit-machine-learning/apidocs/qiskit_machine_learning.primitives.html), and [migration guide](https://qiskit-community.github.io/qiskit-machine-learning/migration/02_migration_guide_0.8.html) |

The hardware sections follow IBM’s guidance for [saving account credentials](https://quantum.cloud.ibm.com/docs/en/guides/save-credentials).

## Supporting explanations

[Introduction to Bell States in Qiskit](https://quantumcomputinguk.org/tutorials/introduction-to-bell-states)

[Quantum Teleportation](https://quantum.cloud.ibm.com/learning/en/courses/basics-of-quantum-information/entanglement-in-action/quantum-teleportation) 

[Superdense Coding](https://en.wikipedia.org/wiki/Superdense_coding) 

[Introduction to Quantum Machine Learning](https://quantum.cloud.ibm.com/learning/en/courses/quantum-machine-learning/introduction) 

[Quirk quantum circuit simulator](https://algassert.com/quirk) 

## Applications and research context (partial review)

[*Quantum Machine Learning in High Energy Physics*](https://arxiv.org/abs/2005.08582)

[*Solving a Higgs Optimization Problem with Quantum Annealing for Machine Learning*](https://www.nature.com/articles/nature24047)

[*Event Classification with Quantum Machine Learning in High-Energy Physics*](https://arxiv.org/abs/2002.09935)

[*Application of Quantum Machine Learning Using the Quantum Variational Classifier Method to High Energy Physics Analysis at the LHC*](https://arxiv.org/abs/2012.11560)

[*Quantum Generative Adversarial Networks in a Continuous-Variable Architecture to Simulate High Energy Physics Detectors*](https://arxiv.org/abs/2101.11132)

[*Dual-Parameterized Quantum Circuit GAN Model in High Energy Physics*](https://arxiv.org/abs/2103.15470)

[*A Quantum Algorithm for High Energy Physics Simulations*](https://arxiv.org/abs/1904.03196)

[*Real-Time Dynamics of Lattice Gauge Theories with a Few-Qubit Quantum Computer*](https://arxiv.org/abs/1605.04570)

[*Simulating Collider Physics on Quantum Computers Using Effective Field Theories*](https://arxiv.org/abs/2102.05044)


[Project home](README.md) · [Overview](docs/overview.md) · [Applications](docs/applications.md)
