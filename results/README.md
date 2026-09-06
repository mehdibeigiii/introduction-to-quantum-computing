# Experimental results

This file brings together the main outputs saved in the modernized notebooks. The notebooks remain the primary source because they contain the code, parameters, and complete outputs. The comparisons here explain what the numbers show and where they remain limited.

Most experiments use local simulation. Sampling results may change slightly when a notebook is executed again, while deterministic statevector calculations should remain stable. Results from different algorithms should not be ranked against one another unless they solve the same problem under comparable conditions.

## Simulation methods for a single qubit

[Hello, quantum world](../notebooks/01-foundations-and-information/hello-quantum-world.ipynb) prepares the state `|+⟩` and measures it 1,000 times with several simulation methods. The expected distribution is 50% zero and 50% one.

| Simulation method | Zero counts | One counts |
|---|---:|---:|
| Statevector | 537 | 463 |
| Stabilizer | 509 | 491 |
| Extended stabilizer | 486 | 514 |
| Density matrix | 487 | 513 |
| Matrix product state | 514 | 486 |

All five methods reproduce the expected distribution within ordinary sampling variation. The different counts do not show that one simulator is more accurate than another; each method represents the same circuit differently and produces a separate finite sample. The values above follow the raw printed output because three labels in the notebook’s comparison-plot legend are currently ordered incorrectly.

## Quantum information protocols

The [entanglement notebook](../notebooks/01-foundations-and-information/entanglement.ipynb) produces 493 measurements of `00` and 507 measurements of `11`. The absence of `01` and `10`, together with the off-diagonal terms in the density matrix, is consistent with the Bell state `|Φ⁺⟩`.

The [CHSH experiment](../notebooks/01-foundations-and-information/chsh.ipynb) obtains a winning probability of approximately 0.856. This is above the classical maximum of 0.75 and close to the ideal quantum value of approximately 0.854. The small difference from the ideal value comes from finite sampling.

The [BB84 simulation](../notebooks/01-foundations-and-information/bb84.ipynb) retains 61 bits from 100 prepared bits after Alice and Bob compare their bases. A single run does not have to retain exactly half of the bits. The result demonstrates basis matching and key sifting, but it does not test eavesdropper detection or prove security.

In the executed [superdense-coding experiment](../notebooks/01-foundations-and-information/teleportation-superdense-coding.ipynb), Alice sends `10` and Bob recovers `10`. 
## Quantum algorithms

| Algorithm | Saved result | Interpretation |
|---|---|---|
| Deutsch–Jozsa, constant oracle | `0000` in 10 of 10 shots | The all-zero outcome identifies the constant function. |
| Deutsch–Jozsa, balanced oracle | `0001` in 10 of 10 shots | A nonzero outcome identifies the balanced function. |
| Grover search | `11` in 1,024 of 1,024 shots | One amplification step identifies the marked two-qubit state. |
| Shor order finding | `N = 15`, `a = 2`, `r = 4`, factors 3 and 5 | The measured phase information recovers the order used by the classical factor calculation. |

The [oracle examples](../notebooks/02-quantum-algorithms/oracle-search-examples.ipynb) reproduce the same Deutsch–Jozsa distinction with current oracle components. Their Grover examples also show an important limitation: when several assignments satisfy an expression, probability is distributed among several valid states rather than concentrated on one answer.

The Grover iteration experiment shows that success probability rises and falls as more iterations are applied. This confirms that amplitude amplification has an optimal stopping point. The Shor result demonstrates the logic of order finding for a small number and should not be interpreted as evidence of scalable factorization.

## Optimization and variational methods

The [MaxCut notebook](../notebooks/03-optimization-and-variational-methods/MaxCut.ipynb) first solves a two-spin Ising problem.

| Solver | Saved result |
|---|---|
| Exact solver | Minimum energy `−1` with the two opposite-spin assignments |
| Classical simulated annealing | Energy `−1` in all 10 saved reads |
| D-Wave quantum annealer | No result because an API token was not configured |

The exact and simulated-annealing results agree for the small problem. Execution stops when the notebook tries to access D-Wave, so the larger example and quantum-annealing comparison do not have valid saved results.

[QAOA](../notebooks/03-optimization-and-variational-methods/qaoa.ipynb) uses a five-node cycle whose exact minimum is `−3`. Lower energy is better in this comparison.

| QAOA configuration | Average saved energy |
|---|---:|
| Exact reference | `−3.000` |
| Ideal simulation, depth `p = 1` | `−2.565625` |
| Ideal simulation, depth `p = 2` | `−2.748047` |
| Noisy simulation, depth `p = 1` | `−0.590820` |

Increasing the depth from one to two moves the ideal average closer to the exact minimum for this experiment. The noisy result is much farther from the target, showing that a deeper or more expressive circuit is useful only when its additional operations can be executed with sufficient accuracy.

The [molecular VQE notebook](../notebooks/03-optimization-and-variational-methods/vqe-molecular-energy.ipynb) compares VQE with an exact eigensolver for hydrogen.

| Method | Total ground-state energy |
|---|---:|
| VQE | `−1.137306035696` Hartree |
| Exact eigensolver | `−1.137306035753` Hartree |
| Absolute difference | Approximately `5.7 × 10⁻¹¹` Hartree |

The two values and their dissociation curves are almost identical for the tested configuration. This verifies the small VQE implementation, but it does not establish an efficiency advantage because the same molecule is easy to solve exactly.

## Quantum machine learning

The classification notebooks compare quantum kernels and variational quantum classifiers.

| Model and dataset | Circuit depth | Saved accuracy |
|---|---:|---:|
| Quantum kernel, synthetic data | Feature-map repetitions `2` | `0.90` |
| Quantum kernel, breast-cancer data | Feature-map repetitions `1` | `0.95` |
| Quantum kernel, breast-cancer data | Feature-map repetitions `2` | `1.00` |
| Variational classifier, breast-cancer data | Feature-map and ansatz repetitions `1` | `1.00` |
| Variational classifier, breast-cancer data | Feature-map and ansatz repetitions `2` | `1.00` |

The deeper kernel improves the saved breast-cancer score, while the variational classifier gives the same score at both tested depths. These values are only illustrative because PCA and scaling are fitted before the train/test split. Information from the test set therefore affects preprocessing, so the scores cannot support a reliable model ranking until the data pipeline is corrected.

The [quantum generative model](../notebooks/04-quantum-machine-learning/quantum-generative-model.ipynb) trains a two-qubit generator on a four-value binomial distribution.

| Distribution | Probabilities for values 0, 1, 2, and 3 |
|---|---|
| Training data | `0.121, 0.387, 0.372, 0.120` |
| Trained generator | Approximately `0.22, 0.28, 0.28, 0.22` |

The generator learns that the two central values should be more probable than the outer values, but its distribution remains flatter than the target. Relative entropy decreases from approximately 0.135 to 0.096 over 100 epochs. This is measurable progress, although the remaining difference shows that training has not reproduced the target completely.

Classifier accuracy and generative relative entropy measure different tasks and should not be compared as though they were the same performance score.

## Simulation structure and quantum advantage

The [stabilizer simulation](../notebooks/06-simulation-and-quantum-advantage/stabilizer-simulation.ipynb) prepares a 1,000-qubit GHZ-type circuit. From 1,024 shots, it records 510 all-zero strings and 514 all-one strings. The result has the expected correlation, but the Clifford structure allows efficient classical stabilizer simulation despite the large number of entangled qubits.

The [random-circuit experiment](../notebooks/06-simulation-and-quantum-advantage/random-circuit-sampling.ipynb) generates 10,000 four-qubit circuits of depth 30. It samples one bit string from each circuit and calculates that string’s exact probability. The resulting histogram follows the general form of the probability-weighted Porter–Thomas reference, with additional finite-size structure from the small circuits.

The two simulations illustrate why qubit count alone does not determine classical difficulty. The 1,000-qubit stabilizer circuit remains manageable because of its restricted gate structure, while random circuits are used to study less structured output distributions. Neither local experiment demonstrates quantum advantage.

## Overall observations

The clearest agreement appears in the simulator comparison, the exact and simulated-annealing MaxCut result, and the VQE comparison with the exact molecular solver. QAOA shows improvement with greater ideal depth and substantial degradation under noise. The machine-learning notebooks produce encouraging saved scores, but their evaluation pipeline prevents a reliable classifier ranking. The replacement generative model shows partial learning rather than full convergence.

These results demonstrate that the modernized implementations preserve the main educational purpose of the original notebooks. They verify small examples, expose the effect of sampling and noise, and connect theory to executable code. They should be presented as learning experiments rather than evidence of general quantum speedup or practical quantum advantage.
