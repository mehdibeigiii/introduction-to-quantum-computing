# From qubits to quantum machine learning

Quantum computing develops from a different way of representing and processing information. A qubit introduces superposition and probability amplitudes; quantum gates turn these states into computations; entanglement enables communication protocols and nonclassical correlations; interference produces quantum algorithms; and parameterized circuits connect quantum processors with optimization, scientific simulation, and machine learning. Noise, error correction, and classical simulation then determine whether these methods can provide a practical advantage.

This progression is conceptual rather than strictly historical. Each stage depends on the previous one: quantum algorithms require controlled state preparation, hybrid methods require measurable quantum objectives, and quantum machine-learning models combine data encoding with the same parameterized circuits used in variational algorithms.

## Quantum states and computation

A classical bit has one of two definite values, whereas a qubit can exist in a superposition of the computational basis states. A pure single-qubit state is written as

```math
\lvert\psi\rangle
=
\alpha\lvert0\rangle+\beta\lvert1\rangle,
\qquad
\lvert\alpha\rvert^2+\lvert\beta\rvert^2=1.
```

The complex amplitudes $\alpha$ and $\beta$ contain the information that determines measurement probabilities. Measuring in the computational basis produces zero with probability $P(0)=\lvert\alpha\rvert^2$ and one with probability $P(1)=\lvert\beta\rvert^2$. Quantum gates transform the state through unitary matrices $U$ satisfying $U^\dagger U=I$, which preserves the total probability while changing amplitudes and phases.

Multiple qubits are combined using tensor products. An $n$-qubit state belongs to a space with dimension $2^n$, allowing the system to represent amplitudes for every $n$-bit basis state simultaneously. Some composite states cannot be separated into independent states of their individual qubits. The Bell state

```math
\lvert\Phi^+\rangle
=
\frac{\lvert00\rangle+\lvert11\rangle}{\sqrt{2}}
```

is an example of entanglement: measurement outcomes are correlated even though neither qubit possesses a separate pure state that completely describes it. Entanglement, measurement disturbance, and the no-cloning principle distinguish quantum information from ordinary classical data.

## Quantum information and communication

Quantum communication protocols demonstrate how superposition and entanglement can be used as information-processing resources. The CHSH inequality provides a test of correlations that cannot be explained by a local classical model. A local hidden-variable theory satisfies $\lvert S\rvert\leq2$, while quantum mechanics permits values as large as $2\sqrt{2}$.

BB84 uses the computational basis and a complementary basis to distribute secret-key material. Because measuring a qubit in an incompatible basis changes its state, an eavesdropper introduces detectable errors. The protocol therefore connects the mathematics of measurement with an operational security test.

Quantum teleportation transfers an unknown qubit state by consuming a shared Bell pair and communicating two classical bits. The physical carrier of the original state is not transported, and the original state is destroyed during the protocol, preserving the no-cloning principle. Superdense coding uses the same entanglement resource in the opposite direction: one transmitted qubit, together with a previously shared Bell pair, can communicate two classical bits.

## Quantum algorithms

Quantum algorithms use interference to reinforce amplitudes associated with useful answers and suppress amplitudes associated with unwanted outcomes. An oracle encodes a problem into a reversible operation, while the surrounding circuit determines which global property of that oracle becomes observable.

Deutsch–Jozsa introduces this pattern by distinguishing two promised classes of functions through a structured quantum evaluation. Grover’s algorithm applies amplitude amplification to unstructured search. If one item is marked among $N$ possibilities, its success probability after $r$ Grover iterations is

```math
P_r
=
\sin^2\bigl((2r+1)\theta\bigr),
\qquad
\sin\theta=\frac{1}{\sqrt{N}}.
```

The probability initially rises toward one and then decreases if the circuit continues rotating past the marked state. Choosing approximately $O(\sqrt{N})$ iterations gives a quadratic improvement over the $O(N)$ queries required by an ordinary unstructured classical search.

Phase estimation extracts an eigenphase associated with a unitary operator. The quantum Fourier transform converts phase and periodicity information into measurable amplitudes, making it a central component of Shor’s algorithm. Shor reduces integer factorization to order finding: for a suitable integer $a$, the algorithm seeks the smallest $r$ satisfying $a^r\equiv1\pmod N$.

These examples show that a quantum computer does not accelerate every calculation. An advantage depends on the structure of the problem, the preparation of inputs, the implementation of the oracle, the number of measurements, and the best available classical alternative.

## Optimization and variational computation

Many computational problems can be expressed as the search for a low-energy configuration. A quadratic unconstrained binary optimization problem has the form

```math
C(x)
=
\sum_i a_i x_i
+
\sum_{i \lt j} b_{ij}x_i x_j,
\qquad
x_i \in \{0,1\}.
```

The coefficients describe the value of selecting individual variables and the rewards or penalties associated with selecting pairs. After mapping binary variables to spin variables, the same problem can be represented by an Ising Hamiltonian. MaxCut is a useful example because the quality of a graph partition can be encoded directly as an energy.

Quantum annealing searches for low-energy configurations through the physical evolution of a system. QAOA instead alternates a problem Hamiltonian with a mixing Hamiltonian in a parameterized gate-based circuit. Measurements estimate the objective, and a classical optimizer updates the circuit parameters.

VQE applies the same hybrid structure to physical Hamiltonians. A parameterized state $\lvert\psi(\theta)\rangle$ is prepared, and the measured objective is

```math
E(\theta)
=
\langle\psi(\theta)\rvert H\lvert\psi(\theta)\rangle.
```

Minimizing this expectation value approximates the ground-state energy of $H$. This provides a direct connection between quantum circuits and molecular or materials calculations, although the quality of the result depends on the Hamiltonian representation, ansatz, optimizer, measurement precision, and hardware noise.

## Quantum machine learning

Quantum machine learning applies quantum state preparation and parameterized circuits to data. A feature map encodes a classical input $x$ into a quantum state,

```math
\lvert\phi(x)\rangle
=
U_\phi(x)\lvert0\rangle^{\otimes n}.
```

A quantum kernel measures the similarity between two encoded inputs through their state overlap,

```math
K(x,x')
=
\left\lvert
\langle\phi(x)\mid\phi(x')\rangle
\right\rvert^2.
```

The resulting kernel matrix can be used by a classical method such as a support-vector machine. The quantum circuit supplies the similarity measure, while the classical algorithm performs the final optimization.

A variational quantum classifier adds a trainable circuit $W(\theta)$ after data encoding. A measured expectation value can define its prediction:

```math
\hat{y}_\theta(x)
=
\langle\phi(x)\rvert
W^\dagger(\theta)ZW(\theta)
\lvert\phi(x)\rangle.
```

A classical optimizer changes $\theta$ to reduce a loss calculated from the predictions and known labels. Quantum generative models use parameterized states differently: the measurement probability $p_\theta(z)=\lvert\langle z\mid\psi(\theta)\rangle\rvert^2$ defines a distribution from which the trained model can generate samples.

A credible QML experiment requires more than successful circuit execution. Data preprocessing must be fitted using training data alone, evaluation must use held-out examples, randomness should be controlled, and results should be compared with suitable classical baselines. These requirements distinguish a demonstration of a quantum model from evidence that it offers a useful computational advantage.

## Applications and phenomenological connections

Variational methods connect naturally to scientific applications because many physical questions can be formulated in terms of Hamiltonians and expectation values. The molecular-energy implementation demonstrates the path from a physical model to a qubit Hamiltonian, a parameterized state, measured energies, and comparison with an exact reference.

In high-energy physics, possible applications include QUBO formulations of particle-track reconstruction, quantum kernels and variational classifiers for collision-event classification, and generative models for calorimeter showers. Small physical systems such as the truncated Rabi model also illustrate how quantum states and interactions can be encoded for variational simulation. These examples are research directions and literature case studies; they should be evaluated using physically relevant quantities, realistic classical baselines, and complete accounting of computational cost. Their phenomenological context is developed further in [applications.md](applications.md).

## Noise, error correction, and computational limits

Present quantum hardware is affected by imperfect gates, measurement errors, and interactions with the environment. These processes damage the phase relationships and entanglement on which quantum computations depend. Quantum error correction encodes one logical qubit across several physical qubits and measures error syndromes without directly measuring the protected logical information.

Fault-tolerant quantum computing extends this protection to gates, measurements, and long calculations. It requires substantial physical resources, but it provides the framework for deciding when an imperfect device can perform a reliable computation at scale.

Classical simulation remains essential for testing quantum circuits and evaluating claims of advantage. A general $n$-qubit state vector contains $2^n$ complex amplitudes, so direct simulation becomes expensive as the system grows. Nevertheless, circuits with particular mathematical structures, including stabilizer circuits, can be simulated efficiently by specialized classical methods.

Random-circuit sampling investigates output distributions that may be difficult to reproduce classically. A convincing claim of quantum advantage must specify the computational task, compare against strong classical methods, account for accuracy and resource costs, and explain why the result matters beyond the execution of the circuit itself.

## From concepts to implementations

The modernized notebooks are the canonical implementation layer of this repository. They preserve the educational purpose of the original material while using the current Qiskit API.

| Conceptual area | Modernized implementations |
|---|---|
| Foundations and quantum information | [Qubit circuits](../notebooks/01-foundations-and-information/hello-quantum-world.ipynb), [entanglement](../notebooks/01-foundations-and-information/entanglement.ipynb), [BB84](../notebooks/01-foundations-and-information/bb84.ipynb), [CHSH](../notebooks/01-foundations-and-information/chsh.ipynb), and [teleportation with superdense coding](../notebooks/01-foundations-and-information/teleportation-superdense-coding.ipynb) |
| Quantum algorithms | [Deutsch–Jozsa](../notebooks/02-quantum-algorithms/deutsch-jozsa.ipynb), [Grover search](../notebooks/02-quantum-algorithms/grover.ipynb), [oracle search examples](../notebooks/02-quantum-algorithms/oracle-search-examples.ipynb), and [Shor order finding](../notebooks/02-quantum-algorithms/shor-order-finding.ipynb) |
| Optimization and variational methods | [MaxCut](../notebooks/03-optimization-and-variational-methods/maxcut.ipynb), [QAOA](../notebooks/03-optimization-and-variational-methods/qaoa.ipynb), and [molecular VQE](../notebooks/03-optimization-and-variational-methods/vqe-molecular-energy.ipynb) |
| Quantum machine learning | [Quantum kernels](../notebooks/04-quantum-machine-learning/quantum-kernels.ipynb), [variational classification](../notebooks/04-quantum-machine-learning/variational-classifier.ipynb), and [quantum generative modelling](../notebooks/04-quantum-machine-learning/quantum-generative-model.ipynb) |
| Quantum error correction | [Conceptual guide](../notebooks/05-error-correction/README.md); a modernized implementation notebook is not currently included |
| Simulation and quantum advantage | [Stabilizer simulation](../notebooks/06-simulation-and-quantum-advantage/stabilizer-simulation.ipynb) and [random-circuit sampling](../notebooks/06-simulation-and-quantum-advantage/random-circuit-sampling.ipynb) |

## Closing perspective

The path from qubits to quantum machine learning is a progression from physical principles to increasingly complex computational models. Superposition defines the state space, entanglement supplies nonclassical correlations, interference enables algorithms, and hybrid optimization makes parameterized circuits usable for scientific and data-driven tasks. Error correction, reproducible experiments, and fair classical comparisons ultimately determine whether these ideas become reliable and practically valuable forms of computation.
