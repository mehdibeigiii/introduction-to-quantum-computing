# Applications and phenomenological connections

Particle-physics phenomenology connects theoretical models with observable quantities such as event rates, invariant masses, particle momenta, and detector signatures. Quantum computing can contribute to this process through event classification, track reconstruction, detector simulation, optimization, and simulation of physical systems.

Some applications concern the experimental workflow rather than direct phenomenological calculations: classification supports signal extraction, tracking reconstructs collision events, and calorimeter generation simulates detector response.

## Higgs classification with quantum annealing

The first application concerns the separation of Higgs events from non-Higgs background. The lecture considers gluon-fusion Higgs production followed by decay into two photons, $gg\rightarrow H\rightarrow\gamma\gamma$.

In the study by [Mott and collaborators](https://www.nature.com/articles/nature24047), presented on pages 148–151, 36 weak classifiers based on photon kinematics are combined using binary weights. Selecting the most useful combination becomes a QUBO problem that can be mapped to an Ising Hamiltonian and processed by a quantum annealer.

```math
N_s
=
\mathcal{L}\,\sigma\,\mathrm{BR}\,\epsilon_s
```

Here, $\mathcal{L}$ is the integrated luminosity, $\sigma$ is the production cross section, $\mathrm{BR}$ is the branching fraction, and $\epsilon_s$ is the signal acceptance and efficiency. A useful classifier should retain signal while rejecting background, so its evaluation must include signal efficiency, background efficiency, and comparison with classical classifiers.

The study demonstrated that a small HEP classification problem could be expressed and solved using quantum annealing. It did not establish a general quantum speedup. The local [MaxCut notebook](../notebooks/03-optimization-and-variational-methods/maxcut.ipynb) demonstrates the related mapping between binary optimization and an Ising Hamiltonian.

## Particle-track reconstruction

Charged particles leave hits as they pass through detector layers. Track reconstruction determines which hits belong to the same particle. When many collisions occur together, the number of possible hit combinations makes this a difficult optimization problem.

Pages 162–163 present the method studied by [Bapst and collaborators](https://link.springer.com/article/10.1007/s41781-019-0032-5). Candidate triplets of hits are represented by binary variables, and their quality and compatibility are included in a quadratic cost function.

```math
C(T)
=
\sum_{i=1}^{n}a_iT_i
+
\sum_{i=1}^{n}\sum_{j=i+1}^{n}b_{ij}T_iT_j,
\qquad T_i\in\{0,1\}.
```

The linear terms describe the quality of individual triplets, while the quadratic terms reward compatible candidates or penalize conflicting ones. The resulting QUBO can be converted into an Ising model.

The lecture presents quantum annealing as the tested method and QAOA as planned gate-based work. The local [MaxCut](../notebooks/03-optimization-and-variational-methods/maxcut.ipynb) and [QAOA](../notebooks/03-optimization-and-variational-methods/qaoa.ipynb) notebooks explain the required optimization methods, but they do not contain detector data or a complete tracking implementation.

## Physical simulation with VQE

The lecture uses the quantum Rabi model to demonstrate how a physical Hamiltonian can be encoded on qubits. The model describes a two-level system coupled to a photon mode. Restricting the photon occupation to zero through three photons allows the system to be represented with three qubits.

Following the demonstration by [Li, Macridin, and Spentzouris](https://lss.fnal.gov/archive/2019/slides/fermilab-slides-19-003-qis.pdf), VQE estimates the ground and first excited states of the truncated model. A parameterized circuit prepares a trial state, quantum measurements estimate its energy, and a classical optimizer updates the circuit parameters.

The local [molecular VQE notebook](../notebooks/03-optimization-and-variational-methods/vqe-molecular-energy.ipynb) applies the same computational pattern to molecular hydrogen. It is a chemistry application, but it demonstrates the important sequence from a physical Hamiltonian to a qubit representation, variational state, measured energy, and classical optimization.

The Rabi model is a small light–matter system rather than a collider prediction. Its importance here is that it connects VQE with the wider goal of simulating quantum systems relevant to particle and field physics.

## Quantum classifiers for Higgs and supersymmetry searches

Pages 189–202 introduce quantum kernels and variational quantum classifiers for separating physics signals from background. A quantum kernel encodes an event $x$ as a state $|\phi(x)\rangle$ and compares two events through $K(x,x')=|\langle\phi(x)|\phi(x')\rangle|^2$.

The Higgs examples include associated production with a top-quark pair, $t\bar{t}H$, and the decay $H\rightarrow\mu^+\mu^-$. The study by [Wu and collaborators](https://arxiv.org/abs/2012.11560), discussed in the lecture, applies a ten-qubit variational classifier to these analyses and compares small simulator and hardware experiments with classical support-vector machines and boosted decision trees.

The lecture also presents the supersymmetric event-classification study by [Terashi and collaborators](https://arxiv.org/abs/2002.09935). A variational quantum classifier is used to distinguish a chargino signal from a Standard Model $W^+W^-$ background. The reported results show comparable performance with the selected classical methods for small datasets, but they do not demonstrate an advantage at full collider scale.

The local [quantum-kernel](../notebooks/04-quantum-machine-learning/quantum-kernels.ipynb) and [variational-classifier](../notebooks/04-quantum-machine-learning/variational-classifier.ipynb) notebooks implement the two main classification approaches with instructional datasets. A phenomenological implementation would still require a documented HEP dataset, physically meaningful input variables, separate training and test samples, and fair classical baselines.

## Calorimeter simulation with quantum generative models

A calorimeter records the energy deposited by particle showers. Detailed detector simulation is computationally expensive, so generative models are studied as faster approximations.

Page 210 presents early QGAN work by Su Yeon Chang and Sofia Vallecorsa. The related [continuous-variable QGAN study](https://arxiv.org/abs/2101.11132) trains reduced models of calorimeter output. The [dual-parameterized-circuit model](https://arxiv.org/abs/2103.15470) uses two quantum generators to reproduce simplified pixelated shower images and their probabilities.

The local [quantum-generative-model notebook](../notebooks/04-quantum-machine-learning/quantum-generative-model.ipynb) demonstrates adversarial training with a small binomial distribution. It explains the method but is not a calorimeter simulator. A complete application would need detector geometry, cell energies, particle conditions, shower profiles, correlations, and comparisons with reference simulation.

## Brief external research outlook

Beyond the applications discussed in the lecture, [Bauer and collaborators](https://arxiv.org/abs/1904.03196) developed a quantum parton-shower algorithm for a simplified field theory. It preserves quantum information during particle branching and studies interference effects that are difficult to represent in a classical probabilistic shower.

[Pérez-Salinas and collaborators](https://arxiv.org/abs/2011.13934) used variational circuits to represent proton parton distribution functions. Other external studies include [real-time simulation of the Schwinger model](https://arxiv.org/abs/1605.04570) and [effective-field-theory calculations for collider observables](https://arxiv.org/abs/2102.05044). These studies connect quantum algorithms more directly to phenomenological calculations, but they remain small or simplified demonstrations.

## Interpretation and repository status

The repository currently implements the molecular VQE application and the main optimization, classification, and generative methods. The Higgs, tracking, Rabi, supersymmetry, calorimeter, parton-shower, qPDF, and field-theory examples remain literature-based case studies. A successful small circuit demonstrates feasibility; evidence of quantum advantage would also require realistic problem sizes, physical validation, scaling analysis, and a fair comparison with classical computation.

[Project home](../README.md) · [Course map](course-map.md) · [Course overview](overview.md) · [References](../REFERENCES.md)

[course-slides]: https://indico.cern.ch/event/970909/attachments/2165159/3654057/PIQC%20Lecture%207.pdf
