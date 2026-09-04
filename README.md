# CERN Practical Introduction to Quantum Computing

Practical, implementation-first notebooks for CERN's **“A Practical Introduction
to Quantum Computing: From Qubits to Quantum Machine Learning and Beyond.”**
The course material supplies the conceptual thread; the notebooks in this
repository are the canonical, modern Qiskit implementations.

The aim is to understand each topic from physical intuition through mathematics
to a reproducible computation. Theory is deliberately kept beside the code that
uses it, rather than separated into an independent set of notes.

## Course progression

The notebooks follow the course's progression from the building blocks of
quantum information to algorithms, optimization, machine learning, simulation,
and the limits of classical computation:

```text
Qubits and circuits
  -> quantum communication and entanglement
  -> quantum algorithms
  -> variational algorithms and optimization
  -> quantum machine learning
  -> simulation and quantum advantage
```

Work through the folders in numeric order. Each notebook is intended to pair
intuition and derivation with a circuit, a computation, and an interpretation
of the result.

## Repository structure

```text
.
├── README.md
├── requirements.txt
├── .gitignore
└── notebooks/
    ├── 01-foundations-and-quantum-information/
    ├── 02-quantum-algorithms/
    ├── 03-quantum-optimization/
    ├── 04-quantum-machine-learning/
    └── 05-simulation-and-quantum-advantage/
```

`notebooks/` is the canonical implementation layer. Local synced source
materials are deliberately not part of the public repository structure: they
are reference inputs, not a second competing set of notebooks.

## Implementation index

| # | Notebook | Focus | Implemented application or result |
| --- | --- | --- | --- |
| 01 | `01-hello-quantum-world.ipynb` | Qubits, gates, measurement, and simulation | Build and measure introductory circuits |
| 02 | `02-bb84.ipynb` | BB84 | Quantum key-distribution protocol simulation |
| 03 | `03-entanglement.ipynb` | Bell states and entanglement | Create, measure, and inspect entangled states |
| 04 | `04-chsh.ipynb` | CHSH game | Test classical-versus-quantum correlations |
| 05 | `05-teleportation-superdense-coding.ipynb` | Communication protocols | Quantum teleportation and superdense coding |
| 06 | `06-deutsch-jozsa.ipynb` | Deutsch–Jozsa | Constant-versus-balanced oracle classification |
| 07 | `07-grover.ipynb` | Grover search | Amplitude amplification for a marked state |
| 08 | `08-shor.ipynb` | Shor's algorithm | Order finding and small-integer factorization workflow |
| 09 | `09-vqe.ipynb` | Variational Quantum Eigensolver | Molecular dissociation-energy calculation |
| 10 | `10-maxcut.ipynb` | MaxCut | Binary quadratic model, exact and annealing approaches |
| 11 | `11-qaoa.ipynb` | QAOA | Variational optimization of an Ising/graph problem |
| 12 | `12-qsvm.ipynb` | QSVM | Breast-cancer classification with a quantum kernel |
| 13 | `13-vqc.ipynb` | VQC | Variational quantum classification of the same dataset |
| 14 | `14-qgan.ipynb` | QGAN | Learn a target probability distribution |
| 15 | `15-simulation.ipynb` | Classical simulation | Efficient simulation of a restricted gate set |
| 16 | `16-random-circuits.ipynb` | Random circuits | Circuit growth and simulation complexity |

### Application scope

The table lists **implemented** examples only. The CERN course discusses a
broader landscape of scientific, cryptographic, optimization, and machine
learning applications. Those discussions provide context; they do not imply
that every discussed application has a notebook implementation here.

Provider-backed cells remain in the notebooks where they motivate the lesson:
IBM Quantum examples occur in the foundations and algorithm notebooks, and
D-Wave examples occur in MaxCut. They are optional extensions, not prerequisites
for the local simulations. Configure credentials locally with the provider
before deliberately running those cells; never place tokens in a notebook or
commit them to the repository.

## Installation

The modernized notebooks were audited against Python 3.13.14. Create or select
a compatible Python environment, then install the exact package set:

```bash
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
python -m jupyter lab
```

Open the desired notebook in JupyterLab and run its local/simulator sections.
The provider libraries are included because the relevant notebooks import them,
but an IBM Quantum or D-Wave account is required only for the explicitly
optional hardware cells.

## Requirements and reproducibility

`requirements.txt` pins the direct packages actually imported by the canonical
notebooks, plus JupyterLab for opening them. The pins were taken from the
environment used to audit the notebooks, rather than inferred from the course
topic names. Transitive dependencies are resolved by `pip`.

## CERN source and acknowledgment

This project is based conceptually on CERN's course **“A Practical Introduction
to Quantum Computing: From Qubits to Quantum Machine Learning and Beyond,”**
by Elías F. Combarro. The supplied CERN lecture PDF is the conceptual source;
the canonical notebooks are maintained as modern implementation companions,
not as a replacement for the course.

Please retain this acknowledgment when sharing adaptations, and consult the
original course material for its own attribution and reuse terms.
