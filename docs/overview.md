# From qubits to quantum machine learning

Quantum computing develops from a different way of representing and processing information. A qubit introduces superposition and probability amplitudes; quantum gates turn these states into computations; entanglement enables communication protocols and nonclassical correlations; interference produces quantum algorithms; and parameterized circuits connect quantum processors with optimization, scientific simulation, and machine learning. Noise, error correction, and classical simulation then determine whether these methods can provide a practical advantage.

This progression is conceptual rather than strictly historical. Each stage depends on the previous one: quantum algorithms require controlled state preparation, hybrid methods require measurable quantum objectives, and quantum machine-learning models combine data encoding with the parameterized circuits used in variational algorithms.

Several mathematical models of quantum computation exist, including quantum circuits, adiabatic computation, measurement-based computation, and topological computation. These models do not expand the set of computable functions beyond classical computation, but they can change the resources required to solve particular problems. This repository uses the quantum-circuit model because it provides a direct connection between mathematical operations, Qiskit programs, simulators, and gate-based hardware.

Physical qubits can be implemented using superconducting circuits, trapped ions, quantum dots, photons, or defects in solid-state materials. These technologies differ in coherence time, gate speed, connectivity, measurement fidelity, and scalability. The abstract circuit model allows the same algorithms to be studied without depending on one physical implementation, while noise and hardware constraints determine how accurately those circuits can be executed.

## Quantum states and computation

A classical bit has one of two definite values, whereas a qubit can exist in a superposition of the computational basis states. A pure single-qubit state is written as

```math
\lvert\psi\rangle
=
\alpha\lvert0\rangle+\beta\lvert1\rangle,
\qquad
\lvert\alpha\rvert^2+\lvert\beta\rvert^2=1.
```

The complex amplitudes $\alpha$ and $\beta$ contain the information that determines measurement probabilities. Measuring in the computational basis produces zero with probability $P(0)=\lvert\alpha\rvert^2$ and one with probability $P(1)=\lvert\beta\rvert^2$. Measurement changes the state to the basis state associated with the observed result.

After removing a physically irrelevant global phase, a pure qubit can also be written as

```math
\lvert\psi\rangle
=
\cos\left(\frac{\theta}{2}\right)\lvert0\rangle
+
e^{i\phi}\sin\left(\frac{\theta}{2}\right)\lvert1\rangle.
```

The angles $\theta$ and $\phi$ locate the state on the Bloch sphere. This representation gives a geometric interpretation of single-qubit gates as rotations and makes the distinction between global phase and observable relative phase clear.

Quantum gates transform states through unitary matrices $U$ satisfying $U^\dagger U=I$. The Pauli gates change computational states and phases, the Hadamard gate creates and recombines superpositions, and parameterized rotation gates provide continuous control of a qubit. A finite collection such as $X$, $H$, $T$, and CNOT can approximate arbitrary quantum circuits.

Multiple qubits are combined using tensor products. An $n$-qubit state belongs to a space with dimension $2^n$, allowing the system to contain amplitudes for every $n$-bit basis state. Controlled gates such as CNOT make one operation depend on the state of another qubit and provide the basic mechanism for creating entanglement.

Some composite states cannot be separated into independent states of their individual qubits. The Bell state

```math
\lvert\Phi^+\rangle
=
\frac{\lvert00\rangle+\lvert11\rangle}{\sqrt{2}}
```

is an example of entanglement: measurement outcomes are correlated even though neither qubit possesses a separate pure state that completely describes it. Entanglement, measurement disturbance, and the no-cloning principle distinguish quantum information from ordinary classical data.

## Quantum information and communication

Quantum communication protocols demonstrate how superposition and entanglement can be used as information-processing resources. The CHSH inequality provides a test of correlations that cannot be explained by a local classical model. A local hidden-variable theory satisfies $\lvert S\rvert\leq2$, while quantum mechanics permits values as large as $2\sqrt{2}$.

BB84 uses the computational basis and a complementary basis to distribute secret-key material. Alice prepares each qubit using a randomly selected bit and basis, while Bob independently selects a measurement basis. They use an authenticated classical channel to compare their basis choices and retain only the results obtained with matching bases.

Because measuring a qubit in an incompatible basis changes its state, an intercept-and-resend attack introduces detectable errors. Alice and Bob can compare a sample of the retained bits to estimate the error rate before accepting the remaining bits as key material. BB84 therefore connects the mathematics of incompatible measurements with an operational security test.

Quantum teleportation transfers an unknown qubit state by consuming a shared Bell pair and communicating two classical bits. The physical carrier of the original state is not transported, and the original state is destroyed during the protocol, preserving the no-cloning principle. The receiver cannot reconstruct the state until the classical information arrives, so teleportation does not enable faster-than-light communication.

Superdense coding uses the same entanglement resource for a different communication task. By applying one of four operations to one half of a Bell pair, a sender can encode two classical bits and communicate them by transmitting one qubit.

## Quantum algorithms

Quantum algorithms use superposition, phase, and interference to extract global information about a problem. A reversible oracle for a function $f$ acts according to

```math
O_f\lvert x\rangle\lvert y\rangle
=
\lvert x\rangle\lvert y\oplus f(x)\rangle.
```

Applying an oracle to a superposition can produce a state containing amplitudes associated with many inputs:

```math
\frac{1}{\sqrt{2^n}}
\sum_{x=0}^{2^n-1}
\lvert x\rangle\lvert f(x)\rangle.
```

This is often called quantum parallelism, but measurement does not reveal all values of $f(x)$. A measurement returns only one classical outcome. A useful algorithm must arrange interference so that amplitudes associated with the desired global property are reinforced while other amplitudes cancel.

Deutsch’s algorithm is the first example of this strategy. It determines whether a promised one-bit Boolean function is constant or balanced with one oracle query. Its central mechanism is phase kickback: an operation applied through the oracle stores information about the function in relative phases, which a final Hadamard gate converts into a measurable result.

Deutsch–Jozsa extends the same idea to functions with several input bits. It distinguishes constant functions from balanced functions under a promise about the allowed inputs. The algorithm is mainly important as a clear demonstration of oracle queries, phase kickback, and interference.

Grover’s algorithm applies amplitude amplification to unstructured search. If one item is marked among $N$ possibilities and the circuit begins in a uniform superposition, its success probability after $r$ Grover iterations is

```math
P_r
=
\sin^2\bigl((2r+1)\theta\bigr),
\qquad
\sin\theta=\frac{1}{\sqrt{N}}.
```

The probability initially rises toward one and then decreases if the circuit continues rotating past the marked state. Choosing approximately $O(\sqrt{N})$ iterations gives a quadratic improvement over the $O(N)$ queries required by ordinary unstructured classical search.

Phase estimation extracts an eigenphase associated with a unitary operator when a suitable eigenstate can be prepared. The quantum Fourier transform converts phase and periodicity information into measurable amplitudes, making it a central component of Shor’s algorithm. Shor reduces integer factorization to order finding: for a suitable integer $a$, the algorithm seeks the smallest $r$ satisfying $a^r\equiv1\pmod{N}$. The remaining steps, including greatest-common-divisor calculations, are performed classically.

Phase estimation also supports algorithms that are not implemented as separate notebooks in this repository. Quantum counting applies phase estimation to Grover’s operator to estimate the number of marked elements. HHL uses phase estimation, controlled eigenvalue inversion, and uncomputation to address a linear system $A\mathbf{x}=\mathbf{b}$.

HHL prepares a quantum state related to the solution rather than returning every component of $\mathbf{x}$ as classical data. Its advantages depend on efficient state preparation, matrix sparsity, conditioning, required precision, and the observable extracted from the result. These conditions illustrate why the cost of loading inputs and reading outputs must be included when evaluating a quantum speedup.

Quantum algorithms do not accelerate every calculation. An advantage depends on problem structure, input preparation, oracle construction, circuit depth, measurement cost, error rates, and the strongest available classical method.

## Optimization and variational computation

Many computational problems can be expressed as the search for a low-energy configuration. A quadratic unconstrained binary optimization problem has the form

```math
C(x)
=
\sum_i a_i x_i
+
\sum_{i \lt j}b_{ij}x_i x_j,
\qquad
x_i\in\{0,1\}.
```

The coefficients describe the value of selecting individual variables and the rewards or penalties associated with selecting pairs. Binary variables can be mapped to spin variables through relations such as $x_i=(1-z_i)/2$, allowing the same objective to be represented by an Ising Hamiltonian. MaxCut is a useful example because the quality of a graph partition can be encoded directly as an energy.

Adiabatic quantum computation begins in the ground state of a simple Hamiltonian $H_i$ and gradually changes it into a problem Hamiltonian $H_f$. A standard interpolation is

```math
H(t)
=
\left(1-\frac{t}{T}\right)H_i
+
\frac{t}{T}H_f.
```

The adiabatic theorem relates successful evolution to the rate of change and the minimum spectral gap between relevant energy levels. If the evolution is too fast, the system may leave the ground state. Practical quantum annealing uses a related physical process to search for low-energy configurations without necessarily satisfying the strict adiabatic condition. Devices such as D-Wave machines implement this specialized Ising and QUBO approach.

QAOA adapts the connection between mixing and problem Hamiltonians to gate-based quantum computers. It alternates parameterized operations generated by the two Hamiltonians. Measurements estimate the objective, and a classical optimizer changes the angles. The circuit depth $p$ controls the number of alternating layers and influences both expressiveness and execution cost.

VQE applies the same hybrid structure to a general physical Hamiltonian. A parameterized state $\lvert\psi(\theta)\rangle$ is prepared, and the measured objective is

```math
E(\theta)
=
\langle\psi(\theta)\rvert
H
\lvert\psi(\theta)\rangle.
```

The variational principle guarantees that this expectation value cannot be below the true ground-state energy. A Hamiltonian used in a circuit calculation is decomposed into Pauli terms,

```math
H
=
\sum_j c_j P_j,
```

where each $P_j$ is a tensor product of Pauli operators. The circuit estimates the expectation value of each required term, using basis changes when necessary, and combines the measurements with the coefficients $c_j$.

Minimizing the resulting energy approximates the ground state of $H$. Molecular applications additionally require a fermionic Hamiltonian, a fermion-to-qubit mapping, an initial state, and a physically suitable ansatz. Excited states can be approached by adding penalty terms that discourage overlap with states already found.

These methods connect circuit execution to scientific modelling, but their accuracy depends on the Hamiltonian representation, ansatz, classical optimizer, sampling precision, circuit noise, and comparison with an exact or classical reference.

## Quantum machine learning

Quantum machine learning applies quantum algorithms and parameterized circuits to data. Some proposed QML algorithms rely on quantum basic linear-algebra subroutines such as the quantum Fourier transform, phase estimation, HHL, and amplitude amplification. Their theoretical speedups depend on the assumption that data can be prepared and results can be extracted efficiently.

QRAM is a proposed mechanism for querying classical data in superposition, but scalable QRAM remains a physical and architectural challenge. If preparing a quantum state requires processing the entire classical dataset, data loading can remove an apparent speedup. Output extraction creates a similar limitation because measuring a quantum state produces only limited classical information.

These issues motivate variational approaches designed for noisy intermediate-scale quantum devices. Instead of requiring deep fault-tolerant subroutines, they use relatively shallow feature maps, trainable circuits, repeated measurements, and classical optimization.

A feature map encodes a classical input $x$ into a quantum state,

```math
\lvert\phi(x)\rangle
=
U_\phi(x)\lvert0\rangle^{\otimes n}.
```

Different feature maps create different geometries in the quantum state space. Their usefulness depends on whether the resulting representation exposes structure that a learning algorithm can use.

A quantum kernel measures the similarity between two encoded inputs through their state overlap,

```math
K(x,x')
=
\left\lvert
\langle\phi(x)\mid\phi(x')\rangle
\right\rvert^2.
```

The resulting kernel matrix can be supplied to a classical method such as a support-vector machine. The quantum circuit estimates similarities, while the classical algorithm performs the margin optimization and classification.

A variational quantum classifier adds a trainable circuit $W(\theta)$ after data encoding. A measured observable $O$ defines a model output:

```math
f_\theta(x)
=
\langle\phi(x)\rvert
W^\dagger(\theta) O W(\theta)
\lvert\phi(x)\rangle.
```

The observable may act on one qubit or several qubits. A threshold, parity rule, or other interpretation converts the measured output into a class prediction. A classical optimizer changes $\theta$ to reduce a loss calculated from the predictions and known labels.

For suitable parameterized gates, derivatives can be estimated with the parameter-shift rule. If a gate generator has eigenvalues $\pm r$, then

```math
\frac{\partial f}{\partial\theta}
=
r\left[
f(\theta+s)-f(\theta-s)
\right],
\qquad
s=\frac{\pi}{4r}.
```

This turns gradient estimation into repeated evaluations of the same circuit at shifted parameter values. It connects quantum measurements with ordinary gradient-based training, although the number of circuit evaluations and the possibility of flat optimization landscapes remain practical concerns.

Quantum generative models use measurements to represent probability distributions. A parameterized generator can assign probability

```math
p_\theta(z)
=
\left\lvert
\langle z\mid\psi(\theta)\rangle
\right\rvert^2
```

to an output $z$. In a QGAN, the generator competes with a discriminator that tries to distinguish generated samples from training data. The two models are trained in alternating phases: the discriminator learns to recognize generated outputs, while the generator learns to produce a distribution that the discriminator accepts as real.

A credible QML experiment requires more than successful circuit execution. Preprocessing must be fitted using training data alone, evaluation must use held-out examples, randomness should be controlled, and results should be compared with suitable classical baselines. Circuit-execution cost, data loading, measurement count, optimization stability, and uncertainty must also be reported. These requirements distinguish a demonstration of a quantum model from evidence that it offers a useful computational advantage.

## Applications and phenomenological connections

Variational methods connect naturally to scientific applications because many physical questions can be formulated in terms of Hamiltonians and expectation values. The molecular-energy implementation demonstrates the path from a physical model to a qubit Hamiltonian, a parameterized state, measured energies, and comparison with an exact reference.

In high-energy physics, possible applications include QUBO formulations of particle-track reconstruction, quantum kernels and variational classifiers for collision-event classification, and generative models for calorimeter showers. Small physical systems such as the truncated Rabi model also illustrate how quantum states and interactions can be encoded for variational simulation.

These examples are research directions and literature case studies. A physically meaningful evaluation must specify the dataset or Hamiltonian, the observable or performance metric, the relevant classical baseline, and all important resource costs. Classification accuracy, a low optimization energy, or a visually plausible generated sample does not by itself establish improved physics sensitivity or quantum advantage. Their phenomenological context is developed further in [applications.md](applications.md).

## Noise and quantum error correction

Present quantum hardware is affected by imperfect gates, measurement errors, and interactions with the environment. These processes damage the amplitudes, phases, and entanglement on which quantum computations depend. Quantum error correction protects a logical state by encoding it across several physical qubits and measuring error syndromes without directly measuring the protected information.

The three-qubit repetition code introduces this idea for bit-flip errors:

```math
\lvert0\rangle_L=\lvert000\rangle,
\qquad
\lvert1\rangle_L=\lvert111\rangle.
```

Ancillary qubits record parity information that identifies which physical qubit has flipped. Measuring the ancillas reveals the error syndrome without revealing the amplitudes of the encoded logical state. Basis changes using Hadamard gates allow a related construction to detect phase-flip errors.

Shor’s nine-qubit code combines bit-flip and phase-flip protection and can correct an arbitrary error affecting one physical qubit. This does not violate the no-cloning theorem because the encoding creates one entangled logical state rather than independent copies of an unknown qubit.

Stabilizer codes describe valid code states as simultaneous eigenstates of commuting Pauli operators. For stabilizer generators $S_i$, a valid logical state satisfies

```math
S_i\lvert\psi_L\rangle
=
\lvert\psi_L\rangle.
```

An error can change one or more eigenvalues from $+1$ to $-1$, producing a syndrome that identifies the required correction. The stabilizer formalism also connects error correction with circuits that can be simulated efficiently on classical computers.

Surface codes arrange local stabilizer checks on a two-dimensional structure and are a leading approach to scalable fault tolerance. Fault-tolerant computation extends protection to state preparation, gates, syndrome extraction, and measurement.

The threshold theorem states, under assumptions about the error model, that arbitrarily reliable computation is possible when the error probability of each physical operation remains below an appropriate threshold. Achieving this protection requires substantial overhead in physical qubits, control operations, and repeated syndrome measurements.

## Classical simulation and quantum advantage

Classical simulation remains essential for testing quantum circuits and evaluating claims of advantage. A general $n$-qubit state vector contains $2^n$ complex amplitudes, so direct state-vector simulation becomes expensive as the system grows. The number of qubits alone, however, does not determine simulation difficulty.

The Gottesman–Knill theorem shows that circuits restricted to stabilizer-state preparation, Clifford gates, and compatible measurements can be simulated efficiently classically. Such circuits can create substantial entanglement, demonstrating that entanglement alone is not sufficient evidence of classical intractability.

Random-circuit sampling studies output distributions generated by deep, irregular circuits. Large random-circuit experiments have been used as historical demonstrations of quantum computational advantage, although their tasks have limited direct practical value and classical simulation methods continue to improve.

A separate route uses photons and linear optical networks. In boson sampling, indistinguishable photons pass through an interferometer and are measured at its outputs. The resulting probabilities are connected to matrix permanents, which motivates the expectation that sampling from sufficiently large instances is difficult for classical computers.

The lecture materials describe random-circuit and photonic experiments from 2019–2020 using the historical term “quantum supremacy.” This overview uses “quantum advantage” for the broader idea and treats the hardware roadmaps in the course as historical projections rather than current specifications.

A convincing claim of quantum advantage must define the computational task, compare against strong classical methods, account for accuracy and complete resource costs, and explain why the result matters beyond executing a quantum circuit.

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
| Conceptual topics without dedicated notebooks | Quantum computing models and hardware, Bloch-sphere geometry, Deutsch’s original algorithm, quantum counting, HHL, QRAM, excited-state VQE, detailed error-correction circuits, and boson sampling |

## Closing perspective

The path from qubits to quantum machine learning is a progression from physical principles to increasingly complex computational models. Superposition and phase define the state space; controlled operations and entanglement create nonclassical correlations; interference enables quantum algorithms; and hybrid optimization makes parameterized circuits usable for scientific and data-driven tasks.

The same progression also reveals the limitations of quantum computation. State preparation, measurement, noise, optimization, classical simulation, and hardware overhead all affect whether a theoretical improvement becomes a practical one. Error correction provides a route toward reliable computation, while reproducible experiments and fair classical comparisons determine whether an observed result supports a meaningful claim of quantum advantage.

[Project home](../README.md) · [Course map](course-map.md) · [Applications](applications.md) · [References](../REFERENCES.md)
