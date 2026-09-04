# Quantum error correction

Quantum error correction protects encoded information by measuring an error
syndrome rather than directly measuring the logical state. It builds on
entanglement, controlled gates, basis changes, and the no-cloning principle.
Encoding distributes information across several physical qubits; it does not
make independent copies of an unknown state.

The course develops bit-flip and phase-flip repetition codes, Shor's nine-qubit
code, stabilizer measurements, and an introduction to surface codes and fault
tolerance. This material is essential to the course's conclusion about reliable
quantum computing.

No modernized error-correction notebook was supplied. This section currently
provides the conceptual entry point to [lecture 7](https://indico.cern.ch/event/970909/)
and its linked demonstrations. A small repetition-code notebook is planned as a
later original contribution, with encoding, an injected error, syndrome detection,
and state recovery. It is not part of this initial skeleton.

Full derivations and exercises will follow the implementation. The role of
stabilizers also connects to the next group's efficiently simulable circuits.

[Project home](../../README.md) · [Next: simulation and advantage](../06-simulation-and-quantum-advantage/README.md) · [References](../../REFERENCES.md)
