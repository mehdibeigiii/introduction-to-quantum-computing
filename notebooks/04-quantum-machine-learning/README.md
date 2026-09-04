# Quantum machine learning

Quantum machine learning connects data representations to quantum circuits.
Feature maps encode examples, kernel methods compare the resulting states,
and variational models adjust circuit parameters through classical training.
The prerequisites are parameterized circuits and measurement, together with
basic ideas of training data, held-out evaluation, and loss functions.

[Quantum kernels](quantum-kernels.ipynb) uses a quantum feature map with an SVM
on synthetic and reduced breast-cancer data.
[Variational classification](variational-classifier.ipynb) studies the same
dataset with trainable circuits. [The quantum generative model](quantum-generative-model.ipynb)
combines a Qiskit generator with a PyTorch discriminator to learn a small
binomial distribution.

The classifier notebooks currently fit preprocessing before the train/test
split. Their evaluation needs correction before the scores support a comparison,
as explained in [reproducibility](../../docs/reproducibility.md). Later experiments
should compare methods on the same held-out data and distinguish training
variation from a consistent effect. Neither a small simulated example nor its
accuracy alone demonstrates quantum advantage.

Data-loading costs, QRAM, parameter-shift gradients, and the connection to
earlier quantum subroutines provide the theoretical context. The HEP examples
are described as literature case studies in [applications](../../docs/applications.md).

[Project home](../../README.md) · [Next: error correction](../05-error-correction/README.md) · [References](../../REFERENCES.md)
