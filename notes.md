# Equivalence Checking of Quantum Circuits using Diff Algorithms
- Greet prof (good afternoon prof. wille, good afternoon lukas, and good afternoon dear guests)
- Today, I will present my findings on the use of so called "diff" algorithms applied to a design automation problem in the field of quantum computing

## Introduction
- Quantum computing needs no introduction
- Could solve important problems in many fields (chem, physics, CS)
- Design automation expertise is necessary in the field to handle noise (produce optimal circuit)
- My work specifically focuses on the improvement of equivalence checking methods

## Outline
- Intro
- Background
- Implementation
- Results
- Conclusion

## Background
- Many ways to represent quantum systems (3 important: Linear circuit, matrix, decision diagram)
- Introduce DD-based equivalence checking
- Demonstrate exploitation of associativity (not commutativity!) to find most efficient application sequence
- Briefly introduce LCS
- Ask for possible solutions? (djikstra or A* as obvious solution)
- Demonstrate Myers algorithm on graph

## Implementation
- Visualisation (shows how application scheme may work)
- Benchmarking tool (allow automatically testing MQT Bench circuits (28 circuits, 2-130 qubits, various compiler options))

## Results
- 150 Benchmarks for each variant of the application scheme
- Easier to visualise by showing the improvement over the state of the art
  - improvement = (t(prev) - t(new)) / t(prev)
  - 60% improvement means that t(new) = 0.4*t(prev)
- At this point, it makes sense to look for factors that may influence performance
  - Considered gate count, qubit count
  - Equivalence rate (2 * LCS / total length)
- Filter by 0.35

## Conclusion
- The result of this work is an equivalence checking method that improves the state of the art approach by 7%
- Developed tooling may be useful to future research
- Further heuristic approaches can certainly be developed

