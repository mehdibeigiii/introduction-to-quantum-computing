# Applications and phenomenological connections

Particle-physics phenomenology connects models of fundamental interactions with
observable quantities, such as event rates, invariant masses, and particle
momentum distributions. The course shows how quantum computing might contribute
to this work through event classification, track reconstruction, detector
simulation, and calculations of quantum systems. Reconstruction and detector
simulation support the comparison between theory and data; they are distinct
from calculating a scattering process itself.

The examples below follow the [final CERN lecture deck][course-slides], with
primary references beside the relevant discussion. They are literature case
studies: this repository does not yet contain a HEP dataset analysis or a
reproduction of their published results. The modernized notebooks provide the
computational starting points. Suggested comparisons below describe what a
future experiment should measure, rather than results already obtained here.

## Molecular energy as an implemented starting point

The [molecular VQE notebook](../notebooks/03-optimization-and-variational-methods/vqe-molecular-energy.ipynb)
constructs an H₂ electronic-structure problem, maps its fermionic Hamiltonian to
qubits, and compares variational and exact energies as the internuclear distance
changes. This is a chemistry application. Its transferable lesson is the
sequence from a physical Hamiltonian to a qubit representation, a trial state,
measured expectation values, and a classical optimization. The exact solution
provides a reference for assessing the approximation within the chosen model.

## Higgs events: classification and physics sensitivity

Higgs analyses must distinguish rare signal events from other processes that
produce similar detector signatures. The annealing example on pages 148–151
considers gluon-fusion Higgs production followed by decay into two photons,
$gg \to H \to \gamma\gamma$, against non-Higgs diphoton backgrounds.
The separate QML examples on pages 189–191 include Higgs production with a
top-quark pair, $t\bar{t}H$, with $H \to \gamma\gamma$, and the
$H \to \mu^+\mu^-$ decay channel. The production mode and decay channel must be
specified when describing a dataset: these examples involve different signals
and backgrounds.

The physical value of a classifier lies in the signal it retains and the
background it rejects. For a specified production and decay channel, the
expected selected signal yield can be written as

$$
N_s = \mathcal{L}\,\sigma\,\mathrm{BR}\,\epsilon_s,
$$

where $\mathcal{L}$ is integrated luminosity, $\sigma$ the production cross
section, $\mathrm{BR}$ the branching fraction, and $\epsilon_s$ the combined
acceptance and selection efficiency. Changing a classifier threshold changes
the selected signal and background yields. A useful comparison should therefore
report signal efficiency at a specified background efficiency, alongside the
receiver operating characteristic (ROC) curve. A claim about improved physics
sensitivity would additionally require a statistical analysis with the relevant
background and systematic uncertainties.

In [Mott and colleagues' annealing study (2017)](https://www.nature.com/articles/nature24047),
simple classifiers built from photon kinematics are combined using binary
weights. Training becomes an Ising optimization problem. The authors report
classification performance comparable to the classical methods they studied;
this does not establish a general quantum speedup. The
[MaxCut notebook](../notebooks/03-optimization-and-variational-methods/maxcut.ipynb)
provides the relevant experience with Ising models and comparisons between
optimization methods, although its graph objective is different from classifier
training.

Quantum kernels instead encode event features into quantum states and use their
overlaps in a classical support vector machine. A
[subsequent study by Wu and colleagues (2021)](https://arxiv.org/abs/2104.05059)
applies this approach to $t\bar{t}H$ classification and reports performance
comparable to its classical baselines. This paper develops the research
direction beyond the 2020 course. The local
[quantum-kernel](../notebooks/04-quantum-machine-learning/quantum-kernels.ipynb)
and [variational-classifier](../notebooks/04-quantum-machine-learning/variational-classifier.ipynb)
notebooks introduce two distinct circuit-based classification approaches using
instructional data, including reduced breast-cancer data. Adapting either to
HEP would require a documented event sample, physically motivated features, and
a held-out comparison with classical classifiers. Their existing preprocessing
leakage must first be corrected as described in
[reproducibility.md](reproducibility.md).

## Particle tracking as binary optimization

Charged particles leave hits as they pass through detector layers. Reconstructing
a track requires deciding which hits belong together; many simultaneous
collisions create numerous plausible combinations. Correct assignments support
momentum and vertex measurements, which subsequently enter physics analyses.

Pages 162–163 describe an approach that selects compatible triplets of hits.
A binary variable $T_i$ records whether candidate triplet $i$ is selected, with
an objective of the form

$$
C(T) = \sum_i a_i T_i + \sum_{i \lt j} b_{ij} T_i T_j,
\qquad T_i \in \{0, 1\}.
$$

The coefficients represent candidate quality and compatibility, rewarding
consistent combinations and penalizing conflicts. This quadratic unconstrained
binary optimization (QUBO) can be mapped to an Ising problem.
[Bapst and colleagues](https://link.springer.com/article/10.1007/s41781-019-0032-5)
study the annealing formulation and find that increasing track density reduces
the purity of the selected segments. Their paper also leaves overall timing and
scaling to further study. The course describes applying QAOA to this formulation
as planned work; it does not present a completed QAOA tracking benchmark.

The [MaxCut](../notebooks/03-optimization-and-variational-methods/maxcut.ipynb)
and [QAOA](../notebooks/03-optimization-and-variational-methods/qaoa.ipynb)
notebooks teach the optimization machinery. A tracking implementation would
still need detector hits, candidate construction, the tracking-specific cost
function, and conversion of selected segments into tracks. Evaluation should
include tracking efficiency, false or duplicate tracks, momentum resolution,
and total processing time. A low QUBO cost alone does not establish accurate
reconstruction or a computational advantage.

## The Rabi model: encoding a physical quantum system

Page 173 presents a two-level system coupled to one photon mode, following
[Li, Macridin, and Spentzouris' 2019 Fermilab demonstration](https://lss.fnal.gov/archive/2019/slides/fermilab-slides-19-003-qis.pdf).
The photon occupation is restricted to zero through three photons, giving four
basis states that fit in two qubits. One additional qubit represents the
two-level system. VQE then estimates low-energy states of this truncated model;
the cited demonstration studies the ground and first excited states.

This example connects physical modeling to bosonic encoding, energy measurement,
and variational optimization. Its relevance is methodological: the Rabi model
is a small light–matter system, and it does not itself predict a collider cross
section or constitute a full quantum-field-theory simulation. The molecular
VQE notebook supplies the optimization pattern, but its fermionic mapping and
chemistry ansatz would need to be replaced for a Rabi calculation.

A useful reproduction would compare energies and their separation with exact
diagonalization at the same photon cutoff, then increase the cutoff to assess
the physical truncation error. Agreement within a small truncated space must be
distinguished from convergence to the untruncated model. Circuit noise and
optimization error introduce further, separate approximations.

## Calorimeter showers and generative modeling

Calorimeters measure energy deposited by particle showers. Simulating these
deposits is part of predicting how a physics process appears in a detector.
Page 210 shows a two-dimensional projection of a three-dimensional shower
beside a generated example, credited to Su Yeon Chang and Sofia Vallecorsa.
[CERN's account of the related QGAN work](https://quantum.cern/quantum-computing-simulation-investigating-quantum-generative-adversarial-networks-and-quantum)
describes small generative models trained to reproduce calorimeter energy
patterns. The aim is to learn a distribution from reference simulations and
sample additional detector responses.

The [generative-model notebook](../notebooks/04-quantum-machine-learning/quantum-generative-model.ipynb)
teaches adversarial training with a Qiskit generator and a PyTorch discriminator,
using a small binomial distribution. A calorimeter model would additionally
need an encoding of cell energies and spatial structure, with control over
incident energy and particle type. The local notebook does not yet provide
those ingredients.

Validation should compare distributions of total deposited energy, longitudinal
and transverse shower profiles, correlations between cells, and rare tails.
Similar-looking images or a decreasing training loss are insufficient evidence
that a generator preserves the detector response needed for physics analysis.
Any speed comparison should include training, state preparation, repeated
measurements, and the cost of producing usable classical samples.

## Connecting these case studies to project results

The shared question is whether a quantum method improves a physically relevant
calculation or inference under a fair comparison. Accuracy on a small simulation
is useful evidence about an implementation; quantum advantage requires an
explicit comparison of resources, precision, and problem size. The course's
[HEP review](https://arxiv.org/abs/2005.08582) supplies broader context for these
early research directions.

Any future local result should identify its dataset or Hamiltonian, observable,
classical reference, and execution record in [results/](../results/README.md).
The accompanying interpretation should explain which physical conclusion the
result supports and which approximations limit it. Personal observations belong
in [reflections.md](reflections.md), with links to the experiment that motivated
them.

[Project home](../README.md) · [Course map](course-map.md) · [References](../REFERENCES.md)

[course-slides]: https://indico.cern.ch/event/970909/attachments/2165159/3654057/PIQC%20Lecture%207.pdf
