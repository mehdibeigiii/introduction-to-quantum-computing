# Applications and physical interpretation

The notebooks implement small examples that expose the computational method.
The course also presents research applications, especially in chemistry and
high-energy physics. A connection to a published application should identify
the physical problem, mathematical representation, observable or evaluation
metric, and limitations of the comparison.

The most direct scientific implementation is
[molecular VQE](../notebooks/03-optimization-and-variational-methods/vqe-molecular-energy.ipynb).
It constructs an H₂ electronic-structure problem, maps it to qubits, and compares
variational and exact energies as the internuclear distance changes. The
[MaxCut and QAOA examples](../notebooks/03-optimization-and-variational-methods/README.md)
provide graph-optimization counterparts to the same energy-minimization theme.

The [machine-learning notebooks](../notebooks/04-quantum-machine-learning/README.md)
use synthetic or reduced breast-cancer data for classification and a small
binomial distribution for generative learning. These are instructional examples;
the classification evaluation still needs the correction described in
[reproducibility.md](reproducibility.md).

In the lectures, HEP examples include Higgs-versus-background classification,
particle-track reconstruction expressed as binary optimization, a Rabi-model
calculation, and calorimeter-shower generation. They currently form
literature-based case studies in this project. No HEP dataset analysis or
reproduction of those published experiments is supplied by the local notebooks.
The [course and HEP review](../REFERENCES.md) provide the starting references for
later, more detailed discussions.

New results should be linked to the exact notebook and execution record. Personal
interpretation can then explain what the small example teaches about the
application and which assumptions prevent a stronger conclusion.

[Project home](../README.md) · [Results](../results/README.md)
