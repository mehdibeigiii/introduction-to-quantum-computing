# Quantum machine learning

Quantum machine learning connects classical data to quantum circuits. A feature map encodes an input as a quantum state, a quantum kernel compares encoded states, and a variational classifier trains circuit parameters to produce useful predictions. A quantum generative model instead learns a probability distribution.

[Quantum kernels](quantum-kernels.ipynb) combines a quantum feature map with a support-vector classifier. [Variational classification](variational-classifier.ipynb) trains a parameterized circuit with a classical optimizer. [The quantum generative model](quantum-generative-model.ipynb) combines a quantum generator with a classical PyTorch discriminator.

## Conceptual interpretation

A quantum kernel measures similarity through the overlap between feature-map states. The classical SVM uses this quantum-computed similarity in place of an ordinary classical kernel. A variational classifier uses the same data encoding but adds trainable gates, turning measured circuit outputs into class predictions.

![Breast-cancer data reduced to two features](../../results/04-quantum-machine-learning/breast-cancer-two-feature-view.png)

*This is a view of the input data after dimensionality reduction. It shows class overlap, but it is not a decision boundary, confusion matrix, or performance result.*

The saved classifier scores range from 0.90 to 1.00 in the selected examples. However, the breast-cancer notebooks fit PCA and scaling before dividing the data into training and test sets. Information from the test set therefore affects preprocessing, so these scores should remain illustrative until preprocessing is fitted on the training data alone.

In the generative experiment, a two-qubit parameterized circuit learns probabilities over four possible values. A classical discriminator supplies the training signal that changes the generator parameters.

![QGAN generated distribution](../../results/04-quantum-machine-learning/qgan-generated-distribution.png)

*The trained generator places most of its probability on the two central values, following the main shape of the binomial training data.*

The relative entropy compares the generated distribution with the target distribution. It falls overall during training but is not monotonic, which reflects the competing updates of the generator and discriminator.

![QGAN relative entropy](../../results/04-quantum-machine-learning/qgan-relative-entropy.png)

*The final relative entropy is much lower than its initial value, although the temporary rise shows that adversarial training does not improve steadily at every epoch.*

## Implementation status

All three notebooks use current Qiskit Machine Learning components and contain saved local outputs. Their small datasets, ideal simulation, and limited evaluation do not demonstrate quantum advantage. The high-energy-physics uses of classification and generative modelling are discussed in [applications](../../docs/applications.md), and the modernization approach is explained in [About the notebooks](../README.md).
