# References and acknowledgment

Elías F. Combarro's CERN course, **A Practical Introduction to Quantum Computing:
From Qubits to Quantum Machine Learning and Beyond** (November–December 2020),
is the educational basis of this project. The [Indico course entry](https://indico.cern.ch/event/970903/)
links the seven sessions, their recordings, and the original materials. The
[final cumulative lecture deck](https://indico.cern.ch/event/970909/attachments/2165159/3654057/PIQC%20Lecture%207.pdf)
contains the full sequence. Original notebooks establish the examples and their
intended purpose; the supplied modernizations are the implementations used here.
Their correspondence is recorded in the [course map](docs/course-map.md).

## Foundations and further reading

The course's [recommended books and resources](https://indico.cern.ch/event/970909/attachments/2165159/3654059/Recommended%20books%20and%20resources.pdf)
include Michael A. Nielsen and Isaac L. Chuang, *Quantum Computation and Quantum
Information*, 10th Anniversary Edition (Cambridge University Press, 2011), and
Noson S. Yanofsky and Mirco A. Mannucci, *Quantum Computing for Computer
Scientists* (Cambridge University Press, 2008). For machine learning, the list
includes Maria Schuld and Francesco Petruccione, *Supervised Learning with
Quantum Computers* (Springer, 2018).

The [BB84 entanglement-attack supplement](https://indico.cern.ch/event/970906/attachments/2151237/3627129/BB84-entanglement.pdf)
develops a security example beyond the basic sifting notebook. The lecture slides
also link interactive demonstrations in [Quirk](https://algassert.com/quirk).

## Research context

Wen Guan, Gabriel Perdue, Arthur Pesah, Maria Schuld, Koji Terashi, Sofia
Vallecorsa, and Jean-Roch Vlimant, [Quantum Machine Learning in High Energy
Physics](https://arxiv.org/abs/2005.08582) (2020), surveys the HEP applications
discussed in the course. These applications are literature context here unless
an explicitly documented local reproduction is added.

Vasil S. Denchev and colleagues, [What is the Computational Value of Finite
Range Tunneling?](https://arxiv.org/abs/1512.02206), *Physical Review X* 6, 031015
(2016), is one of the annealing references linked by lecture 5. Its benchmark
conditions matter when interpreting comparisons with classical algorithms.

## Software and methodology

Use the [IBM Qiskit installation guide](https://quantum.cloud.ibm.com/docs/en/guides/install-qiskit)
and [local testing documentation](https://quantum.cloud.ibm.com/docs/en/guides/local-testing-mode)
alongside the versions in [requirements.txt](requirements.txt).
[Qiskit Nature's PySCF guidance](https://qiskit-community.github.io/qiskit-nature/apidocs/qiskit_nature.second_q.drivers.pyscfd.html)
describes the additional electronic-structure dependency. The
[scikit-learn guidance on data leakage](https://scikit-learn.org/stable/common_pitfalls.html#data-leakage)
is relevant to evaluating the classifier examples.

Further references should be added next to the claim or experiment they support.
Keep CERN attribution with adapted explanations and preserve the attribution of
any reused figures or code. Historical hardware descriptions in the lecture
material are dated context.

[Project home](README.md)
