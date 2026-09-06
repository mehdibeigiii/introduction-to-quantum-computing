# Quantum error correction

Quantum information is fragile because interactions with the environment and imperfect operations introduce errors. Directly copying an unknown state is forbidden, so quantum error correction encodes one logical qubit across several physical qubits and detects errors through indirect syndrome measurements.

## Conceptual interpretation

A three-qubit repetition code protects against one bit flip by encoding the logical basis states across three qubits. Parity checks reveal which physical qubit changed without measuring the amplitudes of the logical state itself. Phase-flip protection uses the same idea in the Hadamard basis, where phase errors become detectable as bit errors.

Shor’s nine-qubit code combines bit-flip and phase-flip protection. This introduces the broader stabilizer description, in which commuting operators define the valid code space and their measured signs form an error syndrome. Surface codes extend this local-check principle to a two-dimensional lattice and provide a route toward fault-tolerant computation.

Error correction therefore connects physical noise to reliable algorithms. A useful code must suppress logical errors faster than the additional qubits and gates introduce new faults. This requirement leads to fault-tolerance thresholds, repeated syndrome extraction, and the large physical-qubit overhead expected for reliable logical qubits.

## Implementation status

No modernized error-correction notebook is currently included, so this folder has no computational result or visualization to present. The material is conceptual rather than experimentally verified in this repository. Stabilizer mathematics reappears from a different direction in [stabilizer simulation](../06-simulation-and-quantum-advantage/stabilizer-simulation.ipynb), where a restricted circuit family can be simulated efficiently on a classical computer.
