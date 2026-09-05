# Applications and phenomenological connections

Particle-physics phenomenology connects theories of fundamental interactions with measurable quantities such as cross sections, event rates, invariant masses, and momentum distributions. Quantum computing may contribute to this process through physical simulation, event classification, optimization, and generative modelling. Track reconstruction and detector simulation support physics analyses, while calculations of parton distributions, radiation, and field dynamics connect more directly to theoretical predictions.

The first half of this document follows applications presented in the [CERN lecture material][course-slides]. The second half considers related research from external sources. The H₂ [molecular VQE notebook](../notebooks/03-optimization-and-variational-methods/vqe-molecular-energy.ipynb) is the only domain application implemented locally. The other notebooks demonstrate transferable methods, but this repository does not currently reproduce a HEP dataset, detector simulation, or quantum-field-theory calculation.

## Applications presented in the course

### Higgs-event classification with quantum annealing

The course presents the work of Mott and colleagues on separating the Higgs signal \(gg\rightarrow H\rightarrow\gamma\gamma\) from Standard Model diphoton backgrounds. Their method combines 36 weak classifiers using binary weights and converts the training objective into an Ising optimization problem that can be studied with classical or quantum annealing.

The physical value of such a classifier depends on the number of signal events it retains and the background events it rejects. For a specified production and decay channel, the expected selected signal yield is

```math
N_s
=
\mathcal{L}\,\sigma\,\mathrm{BR}\,\epsilon_s,
```

where \(\mathcal{L}\) is the integrated luminosity, \(\sigma\) is the production cross section, \(\mathrm{BR}\) is the branching fraction, and \(\epsilon_s\) is the combined acceptance and selection efficiency. A credible comparison should report the ROC curve and signal efficiency at a stated background efficiency, followed by a statistical analysis of the resulting physics sensitivity.

[Mott et al., *Solving a Higgs optimization problem with quantum annealing for machine learning*](https://www.nature.com/articles/nature24047), reported performance comparable to the selected classical methods under the tested conditions. The study did not establish a general quantum speedup. The local [MaxCut notebook](../notebooks/03-optimization-and-variational-methods/maxcut.ipynb) demonstrates the required Ising and QUBO ideas, but it does not implement the Higgs classifier.

### Particle-track reconstruction

Charged particles leave hits while passing through detector layers. Track reconstruction determines which hits were produced by the same particle so that its trajectory, momentum, and production vertex can be estimated. The course describes selecting compatible triplets of hits with a QUBO of the form

```math
C(T)
=
\sum_i a_iT_i
+
\sum_{i\lt j}b_{ij}T_iT_j,
\qquad
T_i\in\{0,1\}.
```

The coefficients describe the quality of individual triplets and the compatibility between pairs of triplets. [Bapst et al., *A Pattern Recognition Algorithm for Quantum Annealers*](https://link.springer.com/article/10.1007/s41781-019-0032-5), tested this formulation with classical and quantum annealing. They found that increasing track density reduced the purity of the selected segments, while complete timing and HL-LHC scaling remained unresolved.

The course mentioned a future QAOA implementation on Rigetti hardware; it did not present a completed QAOA tracking result. The local [MaxCut](../notebooks/03-optimization-and-variational-methods/maxcut.ipynb) and [QAOA](../notebooks/03-optimization-and-variational-methods/qaoa.ipynb) notebooks provide the optimization background. A real tracking study would also require detector hits, candidate construction, post-processing, and evaluation through efficiency, purity, duplicate rates, momentum resolution, TrackML score, and total processing time.

### VQE and the Rabi model

The course uses the Rabi model to show how a small physical system can be encoded for variational simulation. The model contains a two-level system coupled to a photon mode. After restricting the photon occupation to zero through three, two qubits encode the photon states and one qubit represents the two-level system.

The [Fermilab demonstration by Li, Macridin, and Spentzouris](https://lss.fnal.gov/archive/2019/slides/fermilab-slides-19-003-qis.pdf) used VQE to study the ground and first excited energies of this three-qubit model on a simulator and Rigetti hardware. It is a proof of principle for bosonic encoding and low-energy simulation. It does not calculate a collider cross section or simulate a complete quantum field theory.

The local [molecular VQE notebook](../notebooks/03-optimization-and-variational-methods/vqe-molecular-energy.ipynb) follows the same general cycle of Hamiltonian construction, qubit mapping, parameterized state preparation, energy measurement, and classical optimization. Its chemistry-specific mapping and ansatz would need to be replaced for a Rabi-model calculation.

### Quantum classifiers for Higgs and SUSY events

The course presents several HEP classification studies that should be treated separately. The quantum-kernel example uses quantum states to measure similarity between collision events before a classical support-vector machine performs the classification. [Wu et al.’s quantum-kernel study](https://arxiv.org/abs/2104.05059) applied this method to \(t\bar tH\) production. Its largest studies used quantum simulation, while its hardware experiment used 15 qubits and 100 events. The reported performance was comparable to the classical SVM and BDT baselines.

A separate [variational-classifier study by Wu et al.](https://arxiv.org/abs/2012.11560) considered \(t\bar tH\), with \(H\rightarrow\gamma\gamma\), and \(H\rightarrow\mu^+\mu^-\). The small hardware experiments showed that the circuits could distinguish signal and background under the tested conditions, but they did not demonstrate improved discovery sensitivity or computational advantage.

The course also presents [Terashi et al., *Event Classification with Quantum Machine Learning in High-Energy Physics*](https://arxiv.org/abs/2002.09935). This study classified a Higgs-mediated chargino-pair signal against a \(WW\) background using quantum circuit learning and variational classification. The hardware test used three variables with 40 training and 40 testing events. The result demonstrates feasibility at a small scale and does not establish production readiness.

The local [quantum-kernel](../notebooks/04-quantum-machine-learning/quantum-kernels.ipynb) and [variational-classifier](../notebooks/04-quantum-machine-learning/variational-classifier.ipynb) notebooks use instructional data rather than collision events. A HEP implementation would require a documented event sample, physically motivated features, preprocessing fitted only on the training data, held-out evaluation, and comparison with strong classical baselines.

### Calorimeter simulation with quantum generative models

Calorimeters measure energy deposited by particle showers. Detailed detector simulation is computationally expensive, which motivates generative models that learn the distribution of shower shapes and energy deposits.

The course shows a reduced calorimeter example associated with the work of Su Yeon Chang and Sofia Vallecorsa. [Chang et al.’s continuous-variable qGAN study](https://arxiv.org/abs/2101.11132) tested small quantum generative models on reduced calorimeter outputs. Their later [dual-PQC model](https://arxiv.org/abs/2103.15470) studied small pixelated shower images. These experiments are prototypes and do not establish accurate detector-scale simulation or quantum speedup.

The local [quantum generative model](../notebooks/04-quantum-machine-learning/quantum-generative-model.ipynb) learns a four-outcome binomial distribution. A calorimeter implementation would additionally require spatially organized cell energies, conditioning on particle type and incident energy, and validation of total energy, longitudinal and transverse profiles, inter-cell correlations, and rare distribution tails.

## Phenomenological applications from external research

### Quantum parton showers

Particles produced in high-energy collisions radiate other particles, creating a parton shower before hadronization and detector interaction. Ordinary event generators use classical probabilistic methods that do not retain every quantum interference effect.

[Bauer, de Jong, Nachman, and Provasoli](https://arxiv.org/abs/1904.03196) developed a quantum algorithm for final-state radiation and demonstrated it for a simplified quantum field theory. The method represents multiple shower histories coherently and includes interference between intermediate states. It provides a possible path toward quantum-assisted event generation, but the demonstrated model is much simpler than realistic QCD and does not yet produce complete LHC events.

### Proton parton distributions

Predictions for proton collisions depend on parton distribution functions, which describe how the proton’s momentum is distributed among quarks and gluons. A typical hadronic cross section contains a convolution of the form

```math
\sigma_{pp\rightarrow X}
=
\sum_{i,j}
\int dx_1\,dx_2\,
f_i(x_1,Q^2)
f_j(x_2,Q^2)
\hat{\sigma}_{ij\rightarrow X}.
```

The functions \(f_i\) and \(f_j\) describe the proton structure, while \(\hat{\sigma}_{ij\rightarrow X}\) is the partonic cross section. [Pérez-Salinas et al., *Determining the proton content with a quantum computer*](https://arxiv.org/abs/2011.13934), developed variational quantum circuits for representing these distributions. They tested small circuits on quantum hardware and performed a global fit through classical simulation of quantum circuits.

This is a direct phenomenological application because changes in the fitted distributions affect predictions for observable collider processes. The current evidence establishes that quantum circuits can represent such functions at small scale; it does not show that they improve the precision or computational cost of modern global PDF analyses.

### Real-time lattice gauge dynamics

Nonperturbative and real-time field dynamics are difficult for many classical numerical methods. Quantum simulation offers a way to represent the state and evolution of a field theory directly in a controlled quantum system.

[Martinez et al., *Real-time dynamics of lattice gauge theories with a few-qubit quantum computer*](https://arxiv.org/abs/1605.04570), simulated particle-antiparticle production in the \(1+1\)-dimensional Schwinger model using trapped ions. The experiment studied vacuum decay, pair production, and entanglement dynamics. It was an important demonstration of real-time lattice-gauge simulation, but the Schwinger model is an Abelian theory in one spatial dimension and should not be presented as a simulation of realistic QCD.

### Collider effective field theories

A complete quantum simulation of all energy scales in a collider process would require resources far beyond present hardware. Effective field theories provide a more focused approach by separating perturbative high-energy calculations from lower-energy dynamics that may contain difficult quantum interference.

[Bauer, Freytsis, and Nachman](https://arxiv.org/abs/2102.05044) calculated simplified Wilson-line transition observables using simulations and the IBMQ Manhattan processor. These quantities are related to the low-energy structures that appear in collider factorization. The example used a scalar field theory and therefore represents an early building block rather than a full Standard Model prediction.

### Collective neutrino oscillations

Dense systems of neutrinos can undergo collective flavour oscillations produced by many-body interactions. These dynamics are relevant to environments such as supernovae and can become difficult to calculate as the number of interacting neutrinos increases.

[Yeter-Aydeniz et al., *Collective Neutrino Oscillations on a Quantum Computer*](https://arxiv.org/abs/2104.03273), used quantum Lanczos and Trotterized evolution on IBM hardware to estimate energy levels and transition probabilities. The results agreed with exact references after simplifying the small systems under study. The experiment demonstrates a possible computational path, while realistic astrophysical neutrino ensembles remain far beyond the demonstrated scale.

## Interpretation and repository status

The phenomenological value of a quantum method depends on whether it improves a physical prediction or analysis under a fair comparison. Event classifiers should be evaluated through ROC curves, efficiencies, expected yields, and statistical sensitivity. Detector models should reproduce physically important distributions and correlations. Quantum simulations should quantify truncation, discretization, noise, and state-preparation errors. Every study should also include the cost of classical preprocessing, circuit execution, repeated measurements, and output reconstruction.

The H₂ VQE notebook is an implemented scientific application. The MaxCut, QAOA, quantum-kernel, variational-classifier, and generative-model notebooks demonstrate methods that could be adapted to HEP. The Higgs, SUSY, tracking, Rabi, calorimeter, parton-shower, proton-PDF, lattice-field, effective-field-theory, and neutrino examples remain literature-based case studies in this repository.

[Project home](../README.md) · [Course map](course-map.md) · [Course overview](overview.md) · [References](../REFERENCES.md)

[course-slides]: https://indico.cern.ch/event/970909/attachments/2165159/3654057/PIQC%20Lecture%207.pdf
