# A Practical Introduction to Quantum Computing

This university project follows CERN's [A Practical Introduction to Quantum
Computing: From Qubits to Quantum Machine Learning and Beyond](https://indico.cern.ch/event/970903/),
taught by Elías F. Combarro in November and December 2020. It connects physical
ideas and mathematical reasoning with computational examples, from the first
qubit circuit to optimization, quantum machine learning, and the limits of
classical simulation.

The modernized notebooks are the canonical implementations. The original CERN
materials provide the educational reference; Explanations and
interpretations are written with equations and code where
they help explain the experiment.

## Read and run

Start with the [overview](docs/overview.md), then follow the concept
groups below. Each group introduces its subject and links directly to its
notebooks. The first experiment is
[Hello, quantum world!](notebooks/01-foundations-and-information/hello-quantum-world.ipynb).

Installation instructions, package purposes, and dependency versions are combined
in [requirements.txt](requirements.txt). Activate a compatible Python environment
before running these commands from the repository root, and select that same
environment as the notebook kernel:

```bash
python -m pip install -r requirements.txt         # For linux systems, python -> python3
python -m jupyterlab
```

The examples provide local simulation paths. IBM and D-Wave hardware extensions
are optional and disabled by default in the canonical notebooks.

## Follow the concepts

| Topic | Question and implementation |
| --- | --- |
| [Foundations and information](notebooks/01-foundations-and-information/README.md) | How do states, gates, measurement, and entanglement enable quantum communication? |
| [Quantum algorithms](notebooks/02-quantum-algorithms/README.md) | How do interference, oracles, and phase estimation produce useful answers? |
| [Optimization and variational methods](notebooks/03-optimization-and-variational-methods/README.md) | How do MaxCut, QAOA, and molecular VQE turn problems into energy minimization? |
| [Quantum machine learning](notebooks/04-quantum-machine-learning/README.md) | How can quantum circuits represent features, classify data, and learn distributions? |
| [Error correction](notebooks/05-error-correction/README.md) | How can a quantum state be protected without revealing its information? Conceptual coverage; implementation pending. |
| [Simulation and quantum advantage](notebooks/06-simulation-and-quantum-advantage/README.md) | Which circuits are easy to simulate, and what do sampling experiments demonstrate? |

The [applications discussion](docs/applications.md) connects these methods to
chemistry and high-energy physics, distinguishing implemented examples from
literature case studies. [Reflections](docs/reflections.md) is reserved for the
student's own synthesis and interpretation.

## Repository layout

```text
README.md              Project introduction and navigation
REFERENCES.md          Course, research, and software references
requirements.txt       Combined setup instructions and dependencies
docs/                  Overview, course map, reproducibility, applications, reflections
notebooks/             Six concept groups and their canonical implementations
results/               Selected reproducible experimental outputs
```

Circuit diagrams and plots belong inside the notebooks. Selected outputs reused
in the documentation can be exported under [results/](results/README.md). Local
synced Sources are read-only reference inputs and are excluded from the published
repository.

## Current scope

This first implementation establishes the documentation skeleton and organizes
17 modernized notebooks. The existing 16 notebooks retain their implementations;
the additional oracle-search notebook comes from modernized source example 8.
The topic introductions are starting points for the later derivations, exercises,
and personal observations. Error correction does not yet have a notebook.

Saved outputs are inherited examples, not evidence of a fresh execution of the
whole collection. Known implementation and evaluation limitations are recorded
in [reproducibility.md](docs/reproducibility.md). New experimental results and
personal conclusions will be added only after they have been obtained.

The course, its author, and the original research remain acknowledged in
[REFERENCES.md](REFERENCES.md). Hardware descriptions and roadmaps from the
lectures should be read in their 2020 context.
