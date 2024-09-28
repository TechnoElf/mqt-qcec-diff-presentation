#import "@preview/cetz:0.2.2"
#import "@preview/fletcher:0.5.1"
#import "@preview/gentle-clues:0.9.0"
#import "@preview/lovelace:0.3.0"
#import "@preview/polylux:0.3.1": *
#import "@preview/tablex:0.0.8"
#import "@preview/unify:0.6.0"
#import "@preview/quill:0.3.0"

#import "template/conf.typ": conf, slide

#show: doc => conf(
  title: "Equivalence Checking of Quantum Circuits using Diff Algorithms",
  author: "Janis Heims",
  chair: "Chair for Design Automation",
  school: "School of Computation, Information and Technology",
  degree: "Bachelor of Science (B.Sc.)",
  examiner: "Prof. Dr. Robert Wille",
  supervisor: "DI Lucas Berent",
  submitted: "22.07.2024",
  doc
)

#set math.vec(delim: "[")
#set math.mat(delim: "[")

#slide(title: "A section", [
  #lorem(50)

  - A point
  - Another point
])

