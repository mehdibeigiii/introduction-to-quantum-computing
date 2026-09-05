# Applications and phenomenological connections

Particle-physics phenomenology connects theoretical models with observable quantities such as event rates, particle momenta, invariant masses, and detector signatures. Quantum computing may contribute at different stages of this process. It can help classify collision events, reconstruct particle trajectories, simulate detector responses, optimize difficult combinatorial problems, or model the quantum dynamics behind a physical system.

These roles should be distinguished carefully. Event classification belongs to physics analysis, tracking belongs to event reconstruction, and calorimeter generation belongs to detector simulation. They support phenomenological studies, but they do not directly calculate scattering amplitudes or cross sections. The examples in the first part of this document are based mainly on the [CERN lecture material][course-slides]. The final part introduces related research directions from external sources.

## Applications presented in the lecture material

### Higgs-event classification with quantum annealing

Higgs events are rare compared with the background processes recorded by a collider. A classifier must therefore retain as many signal events as possible while rejecting events that produce similar detector signatures.

The annealing example presented in the lecture considers gluon-fusion Higgs production followed by decay into two photons,

$$
gg \rightarrow H \rightarrow \gamma\gamma.
$$

In the method studied by [Mott and collaborators](https://www.nature.com/articles/nature24047), 36 weak classifiers constructed from photon kinematic variables are combined using binary weights. Selecting the best combination is written as a quadratic optimization problem and mapped to an Ising Hamiltonian that can be processed by a quantum annealer.

The physical meaning of the classifier is expressed through the expected number of selected signal events,

$$
N_s=\mathcal{L}\,\sigma\,\mathrm{BR}\,\epsilon_s,
$$

where $\mathcal{L}$ is the integrated luminosity, $\sigma$ is the production cross section, $\mathrm{BR}$ is the relevant branching fraction, and $\epsilon_s$ is the signal acceptance and efficiency. A classifier changes $\epsilon_s$ and the corresponding background efficiency, so its evaluation should include a receiver operating characteristic curve and a comparison with classical classifiers.

The study demonstrated that quantum annealing could formulate and solve a small HEP classification problem, but it did not establish a general quantum speedup. The local [MaxCut notebook](../notebooks/03-optimization-and-variational-methods/maxcut.ipynb) demonstrates the related conversion between binary optimization and an Ising model, although its objective is graph partitioning rather than event classification.

### Particle-track reconstruction

Charged particles leave hits in successive detector layers. Track reconstruction attempts to determine which hits were produced by the same particle. This becomes a large combinatorial problem when many collisions and particle trajectories overlap.

The lecture presents the method studied by [Bapst and collaborators](https://link.springer.com/article/10.1007/s41781-019-0032-5). Compatible groups of hits are represented by candidate triplets. A binary variable $T_i$ indicates whether candidate $i$ is selected, and the reconstruction problem is expressed using a cost function such as

$$
C(T)=\sum_{i=1}^{n}a_iT_i+
\sum_{i=1}^{n}\sum_{j=i+1}^{n}b_{ij}T_iT_j,
\qquad T_i\in\{0,1\}.
$$

The linear coefficients describe the quality of individual candidates, while the quadratic coefficients reward compatible candidates or penalize conflicting ones. The resulting QUBO can be transformed into an Ising Hamiltonian and studied with quantum annealing.

The lecture describes QAOA as a possible gate-based approach to the same type of problem, but it does not present a completed QAOA tracking benchmark. The local [MaxCut](../notebooks/03-optimization-and-variational-methods/maxcut.ipynb) and [QAOA](../notebooks/03-optimization-and-variational-methods/qaoa.ipynb) notebooks provide the necessary optimization methods. A complete tracking implementation would additionally require detector-hit data, candidate construction, a detector-specific objective function, and reconstruction metrics such as efficiency, purity, duplicate rate, TrackML score, and execution time.

### Simulating a physical system with VQE

The lecture uses the quantum Rabi model to show how a physical Hamiltonian can be encoded and studied with a variational quantum algorithm. The model describes a two-level system coupled to a photon mode. In the demonstrated encoding, the photon occupation is truncated to the states from zero to three photons, which can be represented by two qubits. A third qubit represents the two-level system.

Following the demonstration by [Li, Macridin, and Spentzouris](https://lss.fnal.gov/archive/2019/slides/fermilab-slides-19-003-qis.pdf), VQE is used to estimate the low-energy states of this truncated system. The calculation illustrates the general sequence of defining a physical Hamiltonian, mapping it to qubits, preparing a parameterized trial state, measuring expectation values, and using a classical optimizer to minimize the energy.

The local [molecular VQE notebook](../notebooks/03-optimization-and-variational-methods/vqe-molecular-energy.ipynb) applies this workflow to the ground-state energy of molecular hydrogen. Although molecular chemistry and the Rabi model use different Hamiltonians and encodings, the hybrid optimization structure is closely related. A careful Rabi-model experiment should compare its variational energies with exact diagonalization and repeat the calculation with different photon cutoffs to measure truncation error.

This example is best understood as a bridge between small quantum simulations and future field-theory applications. The Rabi model is not itself a collider prediction.

### Quantum classifiers for Higgs and supersymmetry searches

The lecture introduces two gate-based quantum-machine-learning approaches for event classification: quantum kernels and variational quantum classifiers.

A quantum kernel maps an event with features $x$ into a quantum state $|\phi(x)\rangle$. The similarity between two events can then be written as

$$
K(x,x')=
\left|\langle\phi(x)\mid\phi(x')\rangle\right|^2.
$$

The resulting kernel matrix is used by a classical support vector machine. The lecture discusses this approach for Higgs-event classification, including associated Higgs production with a top-quark pair. The local [quantum-kernel notebook](../notebooks/04-quantum-machine-learning/quantum-kernels.ipynb) implements the underlying feature-map and kernel procedure with instructional datasets.

A variational classifier places trainable gates after the feature-encoding circuit. Measurement produces a prediction, and a classical optimizer adjusts the circuit parameters to reduce a classification loss. The lecture connects this method to the $t\bar{t}H$ and $H\rightarrow\mu^+\mu^-$ analyses. The study by [Wu and collaborators](https://arxiv.org/abs/2012.11560) reports early simulator and ten-qubit hardware experiments with small training samples and compares the results with support-vector machines and boosted decision trees.

The lecture also presents the supersymmetric classification study by [Terashi and collaborators](https://arxiv.org/abs/2002.09935). In this case, a variational quantum classifier separates a chargino signal from a Standard Model $W^+W^-$ background. The study found performance comparable with the selected classical methods for the small datasets and feature spaces examined. This showed that the classification could be executed on available quantum hardware, but it did not demonstrate an advantage at realistic collider scale.

The local [variational-classifier notebook](../notebooks/04-quantum-machine-learning/variational-classifier.ipynb) supplies the computational structure for these applications. Reproducing either physics study would still require a documented event dataset, a physically motivated feature selection, separate training and test data, and a fair comparison with classical baselines.

### Calorimeter simulation with quantum generative models

A calorimeter measures the energy deposited when a particle produces a shower inside detector material. Detailed detector simulation is accurate but computationally expensive, so generative models are studied as possible fast approximations.

The lecture presents preliminary quantum generative adversarial network work associated with Su Yeon Chang and Sofia Vallecorsa. In this approach, a quantum generator learns a distribution of calorimeter responses while a discriminator attempts to distinguish generated samples from reference simulations.

The related study by [Chang and collaborators](https://arxiv.org/abs/2101.11132) investigates continuous-variable quantum GAN prototypes for reduced calorimeter outputs. A separate [dual-parameterized-circuit study](https://arxiv.org/abs/2103.15470) uses two quantum generators to learn simplified pixelated calorimeter images and their probabilities.

The local [quantum generative model notebook](../notebooks/04-quantum-machine-learning/quantum-generative-model.ipynb) demonstrates adversarial training on a small binomial distribution. It explains the interaction between a quantum generator and a classical discriminator, but it is not a calorimeter simulator. Extending it would require a representation of detector cells, deposited energies, spatial correlations, particle type, and incident energy.

A calorimeter model must be evaluated using physical distributions such as total deposited energy, longitudinal and transverse shower profiles, cell correlations, and rare tails. Visual similarity and training loss alone are not sufficient evidence that the generated samples preserve the detector response required by a physics analysis.

## Further phenomenological directions from external research

### Quantum parton showers

Parton showers describe the radiation emitted by energetic particles before hadronization. Classical simulations normally treat much of this evolution probabilistically, while interference between quantum states can be difficult to preserve.

[Bauer, de Jong, Nachman, and Provasoli](https://arxiv.org/abs/1904.03196) developed a quantum final-state shower for a simplified field theory. Their algorithm represents particle branchings and intermediate quantum states directly in a quantum circuit. The demonstration shows how a quantum computer could retain interference information during shower evolution, but it does not yet reproduce the complete Standard Model event-generation chain or realistic collider kinematics.

### Parton distribution functions

Predictions for proton collisions depend on parton distribution functions, which describe the momentum distributions of quarks and gluons inside the proton. They enter hadronic cross sections schematically through a convolution,

```math
\sigma_{pp \rightarrow X}
=
\sum_{a,b}
\int dx_1\,dx_2\,
f_a(x_1,\mu)\,
f_b(x_2,\mu)\,
\hat{\sigma}_{ab \rightarrow X}.
```

[Pérez-Salinas and collaborators](https://arxiv.org/abs/2011.13934) studied variational quantum circuits as representations of these functions. They deployed small qPDF models on quantum devices and performed a broader global fit using quantum-circuit simulation on classical hardware. This work connects variational circuits directly to phenomenological predictions, but it does not show that present hardware can replace modern classical PDF fitting.

### Quantum-field-theory dynamics

Real-time evolution in quantum field theories is difficult for many classical numerical methods. [Martinez and collaborators](https://arxiv.org/abs/1605.04570) demonstrated a few-qubit trapped-ion simulation of the Schwinger model, a simplified form of quantum electrodynamics in one spatial dimension. The experiment followed particle-antiparticle production, vacuum persistence, and entanglement during real-time evolution.

A complementary proposal by [Bauer, Freytsis, and Nachman](https://arxiv.org/abs/2102.05044) uses effective field theory to separate perturbatively accessible high-energy dynamics from lower-energy dynamics assigned to a quantum computer. Their demonstration evaluates Wilson-line observables in a scalar field theory using simulation and IBM quantum hardware. These studies move closer to calculating quantum dynamics connected with collider theory, although both use simplified models rather than full quantum chromodynamics.

### Collective neutrino oscillations

Dense neutrino systems, such as those found in supernovae or the early universe, involve interacting many-body dynamics. [Yeter-Aydeniz and collaborators](https://arxiv.org/abs/2104.03273) used quantum Lanczos and Trotterized evolution to study small collective-neutrino systems on IBM hardware. They calculated approximate energy levels and transition probabilities after reducing the Hamiltonian into smaller blocks.

This is a phenomenological application because neutrino flavor evolution influences observable signals from astrophysical environments. Current demonstrations remain limited to small and simplified systems, so agreement with exact classical calculations is more significant than a claim of computational advantage.

## Interpretation and repository status

The applications above range from data analysis and detector reconstruction to simulation of physical dynamics. Their common question is whether a quantum method improves a physically meaningful observable under a fair comparison with classical computation. Running a circuit successfully demonstrates implementation, while quantum advantage requires evidence about accuracy, scaling, resources, and total computational cost.

In this repository, molecular VQE is the only fully implemented domain application. The optimization, kernel, variational-classifier, and generative-model notebooks provide method-level foundations for the HEP examples. The Higgs, tracking, Rabi, supersymmetry, calorimeter, parton-shower, qPDF, field-theory, and neutrino cases remain literature studies unless separate datasets, Hamiltonians, experiments, and validation results are added.

Future results should identify the dataset or Hamiltonian, the measured observable, the classical reference, the quantum execution conditions, and the approximations that limit the conclusion. This separation keeps implemented work distinct from proposed applications and prevents feasibility demonstrations from being presented as established quantum advantage.

[Project home](../README.md) · [Course map](course-map.md) · [Course overview](overview.md) · [References](../REFERENCES.md)

[course-slides]: https://indico.cern.ch/event/970909/attachments/2165159/3654057/PIQC%20Lecture%207.pdf
