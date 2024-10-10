#import "@preview/fletcher:0.5.1": diagram, node, edge

#import "../template/conf.typ": slide

#slide(title: "")[
  #box(width: 100%, height: 80%, align(center + horizon)[
    #text(size: 60pt)[*Implementation*]
  ])
]

#slide(title: "Visualisation")[
  #figure(
    image(height: 90%, "../resources/kaleidoscope-diff-grover.png"),
  )
]

#slide(title: "Benchmarking")[
  #set text(size: 20pt)
  #box(width: 100%, height: 80%, align(center + horizon)[
    #figure(
      diagram(
        node-stroke: .1em,
        spacing: 5em,
        edge-stroke: .2em,
        node((-1.8, 0), [*MQT Bench*], stroke: 0pt, radius: 1em),
        node((-1, -0.5), [28 Circuits], stroke: 0pt, radius: 4em),
        node((-1, 0), [2-130 Qubits], stroke: 0pt, radius: 4em),
        node((-1, 0.5), [Compiler Options, Target QPUs, Intermediate Results], stroke: 0pt, radius: 4em),
        edge((-1, -0.5), (0, 0), [], "->", bend: 20deg),
        edge((-1, 0), (0, 0), [], "->", bend: 0deg),
        edge((-1, 0.5), (0, 0), [], "->", bend: -20deg),
        node((0, 0), [*MQT QCEC Bench*], radius: 3em),
        edge((0, 0), (1, 0), [], "->", bend: 0deg),
        node((1, 0), [*Data*], stroke: 0pt, radius: 2em),
      )
    )
  ])
]
