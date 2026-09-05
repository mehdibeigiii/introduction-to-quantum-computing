# References and acknowledgments

This repository is based on Elías F. Combarro’s CERN course, *A Practical Introduction to Quantum Computing: From Qubits to Quantum Machine Learning and Beyond*. The [CERN Indico course page](https://indico.cern.ch/event/970903/) contains the seven lectures, original notebooks, slides, exercises, recordings, and supporting resources. The [final cumulative lecture deck](https://indico.cern.ch/event/970909/attachments/2165159/3654057/PIQC%20Lecture%207.pdf) contains the complete progression of the course.

The original CERN notebooks were written with an older Qiskit version. I used them to understand the intended concepts and exercises, but rewrote the implementations with the current APIs. The package versions used by the modernized notebooks are recorded in [requirements.txt](requirements.txt).

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

Lecture 6 also links Sau Lan Wu’s seminar, [Quantum Machine Learning for High Energy Physics](https://www.youtube.com/watch?v=rwZrmSs2nO8), as additional material on collider applications.

## Documentation used to modernize the notebooks

The [Qiskit 0.33 release notes](https://quantum.cloud.ibm.com/docs/en/api/qiskit/release-notes/0.33) explain the removal of Qiskit Aqua and the division of its functions into packages such as Qiskit Algorithms, Qiskit Nature, and Qiskit Machine Learning. The [Qiskit 0.43 release notes](https://quantum.cloud.ibm.com/docs/en/api/qiskit/release-notes/0.43) document the deprecation of `QuantumInstance` and the transition to primitive-based execution.

The [Qiskit 1.0 feature changes](https://quantum.cloud.ibm.com/docs/en/guides/qiskit-1.0-features) explain the move from V1 primitives to `StatevectorSampler` and `StatevectorEstimator`. The [Qiskit 2.0 migration guide](https://quantum.cloud.ibm.com/docs/en/guides/qiskit-2.0) documents later breaking changes and removals. These guides provide the general basis for converting the old notebook code.

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

The optional hardware sections follow IBM’s guidance for [saving account credentials](https://quantum.cloud.ibm.com/docs/en/guides/save-credentials). Credentials are configured outside the repository and are not stored in notebooks or dependency files.

## Supporting explanations

Macauley Coggins’ [Introduction to Bell States in Qiskit](https://quantumcomputinguk.org/tutorials/introduction-to-bell-states) provides a circuit-level explanation of the four Bell states and their preparation with Hadamard and controlled-NOT gates.

IBM Quantum Learning’s [Quantum Teleportation](https://quantum.cloud.ibm.com/learning/en/courses/basics-of-quantum-information/entanglement-in-action/quantum-teleportation) explains the protocol, its shared entangled state, Alice’s measurements, the two classical bits, and Bob’s correction operations.

The [Superdense Coding](https://en.wikipedia.org/wiki/Superdense_coding) article provides a short overview of transmitting two classical bits using one qubit and a previously shared entangled pair. It is used as supplementary explanation alongside the lecture and notebook.

IBM Quantum Learning’s [Introduction to Quantum Machine Learning](https://quantum.cloud.ibm.com/learning/en/courses/quantum-machine-learning/introduction) supports the discussion of data encoding, quantum models, kernels, variational circuits, training, and the relationship between classical and quantum machine learning.

The lecture material also uses the interactive [Quirk quantum circuit simulator](https://algassert.com/quirk) and provides a separate [BB84 entanglement-attack supplement](https://indico.cern.ch/event/970906/attachments/2151237/3627129/BB84-entanglement.pdf).

## Applications and research context

Wen Guan, Gabriel Perdue, Arthur Pesah, Maria Schuld, Koji Terashi, Sofia Vallecorsa, and Jean-Roch Vlimant, [*Quantum Machine Learning in High Energy Physics*](https://arxiv.org/abs/2005.08582), 2020. This review provides the general context for the HEP applications discussed in the lecture.

Alex Mott and collaborators, [*Solving a Higgs Optimization Problem with Quantum Annealing for Machine Learning*](https://www.nature.com/articles/nature24047), *Nature* 550, 375–379, 2017. This is the source for the Higgs-classification and quantum-annealing example.

Andrew C. Y. Li, Alexandru Macridin, and Panagiotis Spentzouris, [*Simulating the Quantum Rabi Model with the Variational Quantum Eigensolver*](https://lss.fnal.gov/archive/2019/slides/fermilab-slides-19-003-qis.pdf), Fermilab, 2019. This supports the Rabi-model and VQE discussion.

Koji Terashi and collaborators, [*Event Classification with Quantum Machine Learning in High-Energy Physics*](https://arxiv.org/abs/2002.09935), 2020. This is the source for the variational classification of supersymmetric signal and Standard Model background.

Sau Lan Wu and collaborators, [*Application of Quantum Machine Learning Using the Quantum Variational Classifier Method to High Energy Physics Analysis at the LHC*](https://arxiv.org/abs/2012.11560), 2020. This supports the Higgs-event variational-classifier examples.

Su Yeon Chang, Sofia Vallecorsa, Elías F. Combarro, and Federico Carminati, [*Quantum Generative Adversarial Networks in a Continuous-Variable Architecture to Simulate High Energy Physics Detectors*](https://arxiv.org/abs/2101.11132), 2021. This is a source for the calorimeter-simulation discussion.

Su Yeon Chang and collaborators, [*Dual-Parameterized Quantum Circuit GAN Model in High Energy Physics*](https://arxiv.org/abs/2103.15470), 2021. This provides a second reduced calorimeter-generation model.

Christian W. Bauer, Wibe A. de Jong, Benjamin Nachman, and Davide Provasoli, [*A Quantum Algorithm for High Energy Physics Simulations*](https://arxiv.org/abs/1904.03196), 2019. This introduces a quantum final-state parton shower in a simplified field theory.

E. A. Martinez and collaborators, [*Real-Time Dynamics of Lattice Gauge Theories with a Few-Qubit Quantum Computer*](https://arxiv.org/abs/1605.04570), *Nature* 534, 516–519, 2016. This is the source for the Schwinger-model example.

Christian W. Bauer, Marat Freytsis, and Benjamin Nachman, [*Simulating Collider Physics on Quantum Computers Using Effective Field Theories*](https://arxiv.org/abs/2102.05044), 2021. This connects quantum simulation with low-energy effective-field-theory dynamics and Wilson-line observables.

Kübra Yeter-Aydeniz, Shikha Bangar, George Siopsis, and Raphael C. Pooser, [*Collective Neutrino Oscillations on a Quantum Computer*](https://arxiv.org/abs/2104.03273), 2021. This supports the discussion of small quantum simulations of interacting neutrino systems.

[Project home](README.md) · [Overview](docs/overview.md) · [Applications](docs/applications.md)
