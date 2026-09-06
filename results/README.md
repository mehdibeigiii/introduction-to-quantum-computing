# Experimental results

This file brings together the main outputs saved in the modernized notebooks. The notebooks remain the primary source because they contain the code, parameters, and available saved outputs. Sampling results may change when a notebook is executed again, while deterministic statevector calculations should remain stable. Results from different algorithms should only be compared when they solve the same problem under comparable conditions.

## Simulation methods for a single qubit

[Hello, quantum world](../notebooks/01-foundations-and-information/hello-quantum-world.ipynb) prepares the state `|+⟩`, for which zero and one each have an ideal probability of 50%.

| Simulation method | Shots | Zero counts | One counts |
|---|---:|---:|---:|
| Statevector | 1,000 | 537 | 463 |
| Stabilizer | 1,000 | 509 | 491 |
| Extended stabilizer | 1,000 | 486 | 514 |
| Density matrix | 1,000 | 487 | 513 |
| Matrix product state | 1,000 | 514 | 486 |
| IBM Quantum hardware | 1,024 | 500 | 524 |

All methods reproduce the expected distribution within ordinary sampling variation. The differences do not establish that one simulator is more accurate than another. The values follow the raw printed output because three labels in the notebook's first comparison-plot legend are ordered incorrectly.

## Quantum information protocols

The [entanglement notebook](../notebooks/01-foundations-and-information/entanglement.ipynb) produces only `00` and `11` in ideal simulation. The corresponding hardware execution contains a small number of the unwanted `01` and `10` outcomes.

| Bell-state execution | `00` | `11` | `01` | `10` |
|---|---:|---:|---:|---:|
| Local simulation | 493 | 507 | 0 | 0 |
| IBM Quantum hardware | 477 | 485 | 11 | 27 |

The simulated distribution and the off-diagonal density-matrix terms are consistent with the Bell state `|Φ⁺⟩`. The hardware result retains the expected correlation while also showing the effect of noise and imperfect execution.

The [CHSH experiment](../notebooks/01-foundations-and-information/chsh.ipynb) obtains a winning probability of `0.855957` in local simulation and `0.857086` in its saved IBM Quantum run. Both are above the classical maximum of `0.75` and close to the ideal quantum value of approximately `0.853553`. Small deviations from the ideal value are expected from finite sampling.

The [BB84 notebook](../notebooks/01-foundations-and-information/bb84.ipynb) retains 61 bits from 100 prepared bits in both its saved local and hardware runs after Alice and Bob compare their bases. A single run does not have to retain exactly half of the bits. These results demonstrate basis matching and key sifting, but they do not test eavesdropper detection or prove security.

In the executed [superdense-coding experiment](../notebooks/01-foundations-and-information/teleportation-superdense-coding.ipynb), Alice sends `10` and Bob recovers `10`. The teleportation section has no saved execution result, so no teleportation result is claimed here.

## Quantum algorithms

| Algorithm | Local saved result | Interpretation |
|---|---|---|
| Deutsch–Jozsa, constant oracle | `0000` in 10 of 10 shots | The all-zero outcome identifies the constant function. |
| Deutsch–Jozsa, balanced oracle | `0001` in 10 of 10 shots | A nonzero outcome identifies the balanced function. |
| Grover search | `11` in 1,024 of 1,024 shots | One amplification step identifies the marked two-qubit state. |
| Shor order finding | `N = 15`, `a = 2`, `r = 4`, factors 3 and 5 | The phase information recovers the order used by the classical factor calculation. |

The saved Deutsch–Jozsa hardware run preserves the same dominant outcomes: `0000` appears in 3,923 of 4,096 shots for the constant oracle, while `0001` appears in 3,938 of 4,096 shots for the balanced oracle. The additional low-frequency strings illustrate the difference between ideal simulation and hardware execution.

The [oracle examples](../notebooks/02-quantum-algorithms/oracle-search-examples.ipynb) reproduce the Deutsch–Jozsa distinction using current oracle components. Their Grover examples also show that when several assignments satisfy an expression, probability is distributed among several valid states rather than concentrated on one answer.

The Grover iteration plot shows that success probability rises and falls as more iterations are applied, confirming that amplitude amplification has an optimal stopping point. The Shor result demonstrates order finding for a small number and should not be interpreted as evidence of scalable factorization.

## Optimization and variational methods

The [MaxCut notebook](../notebooks/03-optimization-and-variational-methods/MaxCut.ipynb) contains code for exact solving, classical simulated annealing, and D-Wave quantum annealing. Its restored version has no saved execution output, so this document does not claim numerical MaxCut results. The notebook must be executed successfully before these methods can be compared experimentally.

[QAOA](../notebooks/03-optimization-and-variational-methods/qaoa.ipynb) uses a five-node cycle with a known optimum of `−3`. Lower energy is better in this experiment.

| QAOA configuration | Result |
|---|---:|
| Known optimum | `−3.000` |
| Ideal simulation, depth `p = 1`, average of 10 runs | `−2.565625` |
| Ideal simulation, depth `p = 2`, average of 10 runs | `−2.748047` |
| Noisy FakeOurenseV2 simulation, depth `p = 1`, average of 10 runs | `−0.590820` |

In ideal simulation, depth two gives an average closer to the known optimum than depth one. Noise strongly degrades the saved depth-one result. Because the notebook does not execute a noisy depth-two experiment, it does not establish how increasing depth behaves under noise.

The [molecular VQE notebook](../notebooks/03-optimization-and-variational-methods/vqe-molecular-energy.ipynb) compares VQE with an exact eigensolver for molecular hydrogen.

| Method | Total ground-state energy |
|---|---:|
| VQE | `−1.137306035696` Hartree |
| Exact eigensolver | `−1.137306035753` Hartree |
| Absolute difference | Approximately `5.7 × 10⁻¹¹` Hartree |

The two values and their saved dissociation curves are nearly identical for the tested configuration. This verifies the small VQE implementation, but it does not establish an efficiency advantage because the same molecule is easy to solve exactly.

## Quantum machine learning

The [quantum-kernel notebook](../notebooks/04-quantum-machine-learning/quantum-kernels.ipynb) and [variational-classifier notebook](../notebooks/04-quantum-machine-learning/variational-classifier.ipynb) contain the following saved scores.

| Model and dataset | Circuit depth | Saved accuracy |
|---|---:|---:|
| Quantum kernel, synthetic data | Feature-map repetitions `2` | `0.90` |
| Quantum kernel, breast-cancer data | Feature-map repetitions `1` | `0.95` |
| Quantum kernel, breast-cancer data | Feature-map repetitions `2` | `1.00` |
| Variational classifier, breast-cancer data | Feature-map and ansatz repetitions `1` | `1.00` |
| Variational classifier, breast-cancer data | Feature-map and ansatz repetitions `2` | `1.00` |

The deeper kernel has a higher saved breast-cancer score, while the variational classifier has the same score at both tested depths. These results use one fixed test set of only 20 examples, so `1.00` represents 20 correct predictions in that split. PCA and scaling are also fitted before the train/test split, allowing information from the test set to affect preprocessing. Without a corrected pipeline, repeated splits, uncertainty estimates, and a classical baseline, these scores cannot support a reliable model ranking.

The [quantum generative model](../notebooks/04-quantum-machine-learning/quantum-generative-model.ipynb) trains a two-qubit generator on a four-value binomial distribution using an `efficient_su2` circuit.

| Distribution | Probabilities for values 0, 1, 2, and 3 |
|---|---|
| Training data | `0.121, 0.387, 0.372, 0.120` |
| Trained generator | Visually approximately `0.06, 0.44, 0.40, 0.10` |

The generated distribution correctly emphasizes the two central values but gives them too much probability and underestimates the outer values. The saved relative-entropy plot changes non-monotonically: it begins near `0.48`, reaches an early minimum near `0.06`, rises to about `0.19`, and finishes near `0.02` after 100 epochs. These are estimates from the plots because the notebook does not print the final generated probabilities or entropy values.

Classifier accuracy and generative relative entropy measure different tasks and should not be treated as directly comparable performance scores.

## Simulation structure and quantum advantage

The [stabilizer simulation](../notebooks/06-simulation-and-quantum-advantage/stabilizer-simulation.ipynb) prepares a 1,000-qubit GHZ-type circuit. From 1,024 shots, it records 510 all-zero strings and 514 all-one strings. The result has the expected correlation, but the Clifford structure allows efficient classical stabilizer simulation despite the large number of entangled qubits.

The [random-circuit experiment](../notebooks/06-simulation-and-quantum-advantage/random-circuit-sampling.ipynb) generates 10,000 four-qubit circuits of depth 30. It samples one bit string from each circuit and calculates that string's exact probability. The saved histogram visually follows the probability-weighted Porter–Thomas reference, with additional finite-size structure from the small circuits. The notebook does not calculate a quantitative goodness-of-fit measure.

These simulations illustrate why qubit count alone does not determine classical difficulty. The 1,000-qubit stabilizer circuit remains manageable because of its restricted gate structure, while random circuits provide less structured output distributions. Neither local experiment demonstrates quantum advantage.

## Overall observations

The simulator and hardware results reproduce the expected single-qubit and entanglement behavior while showing finite-sampling and hardware effects. QAOA improves with greater depth in the ideal runs but degrades strongly in the saved noisy run. VQE closely agrees with the exact molecular result. The machine-learning notebooks produce illustrative scores and a partially learned distribution, but their limited evaluation does not demonstrate a practical quantum advantage. MaxCut remains an implementation without a saved result.

Together, these experiments connect theory to executable examples and expose the effects of sampling, noise, circuit structure, and model evaluation. They should be presented as learning experiments rather than evidence of general quantum speedup or practical quantum advantage.
