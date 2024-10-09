#import "@preview/fletcher:0.5.1": diagram, node, edge
#import "@preview/quill:0.3.0": quantum-circuit, lstick, rstick, ctrl, targ, mqgate, meter

#import "../template/conf.typ": slide

#slide(title: "")[
  #box(width: 100%, height: 80%, align(center + horizon)[
    #text(size: 60pt)[*Background*]
  ])
]

#slide(title: "Quantum Circuit Equivalence Checking")[
  #figure(
    box(width: 70%, height: 90%, align(horizon, {
      grid(
        columns: (4fr, 2fr),
        align(horizon, quantum-circuit(
          scale: 200%,
          lstick($|q_0〉$), $H$, 1, 1, [\ ],
          lstick($|q_1〉$), 1, $X$, 1
        )),
        align(horizon)[$U = 1/sqrt(2) mat(
          0, 1, 0, 1;
          1, 0, 1, 0;
          0, 1, 0, -1;
          1, 0, -1, 0
        )$]
      )
      grid(
        columns: (4fr, 2fr),
        align(horizon, quantum-circuit(
          scale: 200%,
          lstick($|q_0〉$), $"S"$, $sqrt(X)$, $"S"$, 1, [\ ],
          lstick($|q_1〉$), 1, 1, 1, $X$, 1
        )),
        align(horizon)[$U' = 1/sqrt(2) mat(
          0, 1, 0, 1;
          1, 0, 1, 0;
          0, 1, 0, -1;
          1, 0, -1, 0
        )$]
      )
    }))
  )
]

#slide(title: "Quantum Circuit Equivalence Checking")[
  #figure(
    box(width: 70%, height: 90%, {
      align(horizon, quantum-circuit(
        scale: 200%,
        lstick($|q_0〉$), $H$, 1, 1, $"S"^dagger$, $sqrt(X)^dagger$, $"S"^dagger$, 1, [\ ],
        lstick($|q_1〉$), 1, $X$, $X^dagger$, 1, 1, 1
      ))

      align(horizon)[$U dot U'^dagger =  mat(
        1, 0, 0, 0;
        0, 1, 0, 0;
        0, 0, 1, 0;
        0, 0, 0, 1
      ) = I$]
    })
  )
]

#slide(title: "Quantum Circuit Equivalence Checking")[
  #figure(
    box(width: 70%, height: 90%, align(horizon, grid(
      columns: (4fr, 1fr, 4fr),
      align(horizon)[$U = 1/sqrt(2) mat(
        0, 1, 0, 1;
        1, 0, 1, 0;
        0, 1, 0, -1;
        1, 0, -1, 0
      )$],
      align(horizon)[$<=>$],
      align(
        horizon,
        diagram(
          node-stroke: .1em,
          edge((0, -1), (0, 0), [$1/sqrt(2)$], "->"),
          node((0, 0), [$q_1$], radius: 1em),
          edge((0, 0), (0, 1), [], "->", bend: -50deg),
          edge((0, 0), (0, 1), [], "->", bend: -20deg),
          edge((0, 0), (0, 1), [], "->", bend: 20deg),
          edge((0, 0), (0, 1), [$-1$], "->", bend: 50deg),
          node((0, 1), [$q_0$], radius: 1em),
          edge((0, 1), (-0.5, 1.5), [], "->", bend: 10deg),
          edge((0, 1), (0, 2), [], "->", bend: -10deg),
          edge((0, 1), (0, 2), [], "->", bend: 10deg),
          edge((0, 1), (0.5, 1.5), [], "->", bend: -10deg),
          node((-0.5, 1.5), [$0$], stroke: 0pt),
          node((0.5, 1.5), [$0$], stroke: 0pt),
          node((0, 2), [$1$], shape: rect),
        )
      )
    )))
  )
]

#slide(title: "Quantum Circuit Equivalence Checking")[
  #figure(
    box(width: 90%, height: 90%, align(horizon, grid(
      columns: (8fr, 2fr),
      align(horizon, quantum-circuit(
        scale: 200%,
        lstick($|q_0〉$), 1, 1, 1, [\ ],
        lstick($|q_1〉$), 1, 1, 1
      )),
      align(
        horizon,
        diagram(
          node-stroke: .1em,
          edge((0, -1), (0, 0), [], "->"),
          node((0, 0), [$q_1$], radius: 1em),
          edge((0, 0), (0, 1), [], "->", bend: -50deg),
          edge((0, 0), (0, 0.5), [], "->", bend: -20deg),
          edge((0, 0), (0, 0.5), [], "->", bend: 20deg),
          edge((0, 0), (0, 1), [], "->", bend: 50deg),
          node((0, 0.5), [], stroke: 0pt, radius: 0.5em),
          node((0, 1), [$q_0$], radius: 1em),
          edge((0, 1), (0, 2), [], "->", bend: 50deg),
          edge((0, 1), (0, 1.5), [], "->", bend: -20deg),
          edge((0, 1), (0, 1.5), [], "->", bend: 20deg),
          edge((0, 1), (0, 2), [], "->", bend: -50deg),
          node((0, 1.5), [], stroke: 0pt, radius: 0.5em),
          node((0, 2), [$1$], shape: rect),
        )
      )
    )))
  )
]

#slide(title: "Quantum Circuit Equivalence Checking")[
  #figure(
    box(width: 90%, height: 90%, align(horizon, grid(
      columns: (8fr, 2fr),
      align(horizon, quantum-circuit(
        scale: 200%,
        lstick($|q_0〉$), 1, 1, 1, 1, [\ ],
        lstick($|q_1〉$), 1, $X$, 1, 1
      )),
      align(
        horizon,
        diagram(
          node-stroke: .1em,
          edge((0, -1), (0, 0), [], "->"),
          node((0, 0), [$q_1$], radius: 1em),
          edge((0, 0), (-0.5, 0.5), [], "->", bend: -20deg),
          edge((0, 0), (0, 1), [], "->", bend: -20deg),
          edge((0, 0), (0, 1), [], "->", bend: 20deg),
          edge((0, 0), (0.5, 0.5), [], "->", bend: 20deg),
          node((0, 0.5), [], stroke: 0pt, radius: 0.5em),
          node((0, 1), [$q_0$], radius: 1em),
          edge((0, 1), (0, 2), [], "->", bend: 50deg),
          edge((0, 1), (0, 1.5), [], "->", bend: -20deg),
          edge((0, 1), (0, 1.5), [], "->", bend: 20deg),
          edge((0, 1), (0, 2), [], "->", bend: -50deg),
          node((0, 1.5), [], stroke: 0pt, radius: 0.5em),
          node((0, 2), [$1$], shape: rect),
        )
      )
    )))
  )
]

#slide(title: "Quantum Circuit Equivalence Checking")[
  #figure(
    box(width: 90%, height: 90%, align(horizon, grid(
      columns: (8fr, 2fr),
      align(horizon, quantum-circuit(
        scale: 200%,
        lstick($|q_0〉$), 1, 1, 1, [\ ],
        lstick($|q_1〉$), $X$, $X^dagger$, 1
      )),
      align(
        horizon,
        diagram(
          node-stroke: .1em,
          edge((0, -1), (0, 0), [], "->"),
          node((0, 0), [$q_1$], radius: 1em),
          edge((0, 0), (0, 1), [], "->", bend: -50deg),
          edge((0, 0), (0, 0.5), [], "->", bend: -20deg),
          edge((0, 0), (0, 0.5), [], "->", bend: 20deg),
          edge((0, 0), (0, 1), [], "->", bend: 50deg),
          node((0, 0.5), [], stroke: 0pt, radius: 0.5em),
          node((0, 1), [$q_0$], radius: 1em),
          edge((0, 1), (0, 2), [], "->", bend: 50deg),
          edge((0, 1), (0, 1.5), [], "->", bend: -20deg),
          edge((0, 1), (0, 1.5), [], "->", bend: 20deg),
          edge((0, 1), (0, 2), [], "->", bend: -50deg),
          node((0, 1.5), [], stroke: 0pt, radius: 0.5em),
          node((0, 2), [$1$], shape: rect),
        )
      )
    )))
  )
]

#slide(title: "Quantum Circuit Equivalence Checking")[
  #figure(
    box(width: 90%, height: 90%, align(horizon, grid(
      columns: (8fr, 2fr),
      align(horizon, quantum-circuit(
        scale: 200%,
        lstick($|q_0〉$), $H$, 1, 1, $"S"^dagger$, $sqrt(X)^dagger$, $"S"^dagger$, 1, [\ ],
        lstick($|q_1〉$), 1, $X$, $X^dagger$, 1, 1, 1
      )),
      align(
        horizon,
        diagram(
          node-stroke: .1em,
          edge((0, -1), (0, 0), [], "->"),
          node((0, 0), [$q_1$], radius: 1em),
          edge((0, 0), (0, 1), [], "->", bend: -50deg),
          edge((0, 0), (0, 0.5), [], "->", bend: -20deg),
          edge((0, 0), (0, 0.5), [], "->", bend: 20deg),
          edge((0, 0), (0, 1), [], "->", bend: 50deg),
          node((0, 0.5), [], stroke: 0pt, radius: 0.5em),
          node((0, 1), [$q_0$], radius: 1em),
          edge((0, 1), (0, 2), [], "->", bend: 50deg),
          edge((0, 1), (0, 1.5), [], "->", bend: -20deg),
          edge((0, 1), (0, 1.5), [], "->", bend: 20deg),
          edge((0, 1), (0, 2), [], "->", bend: -50deg),
          node((0, 1.5), [], stroke: 0pt, radius: 0.5em),
          node((0, 2), [$1$], shape: rect),
        )
      )
    )))
  )
]

#slide(title: "The Longest Common Subsequence Problem")[
  #figure(
    box(width: 70%, height: 90%, align(horizon, {
      quantum-circuit(scale: 300%, lstick($|q_0〉$), $H$, $X$, $H$, $Y$, 1)
      v(4em)
      quantum-circuit(scale: 300%, lstick($|q_0〉$), $Y$, $H$, $H$, $X$, 1)
    }))
  )
]

#slide(title: "The Longest Common Subsequence Problem")[
  #figure(
    box(width: 70%, height: 90%, align(horizon, {
      quantum-circuit(scale: 300%, lstick($|q_0〉$), $H$, $X$, $H$, $Y$, 1)
      v(1em)
      text(size: 40pt)[`+y, =h, +h, =x, -h, -y`]
      v(1em)
      quantum-circuit(scale: 300%, lstick($|q_0〉$), $Y$, $H$, $H$, $X$, 1)
    }))
  )
]

#slide(title: "The Longest Common Subsequence Problem")[
  #set text(size: 12pt)

  #figure(
    diagram(
      spacing: 2em,
      node-stroke: .1em,
      node((0, 0), [hxhy], radius: 2em),
      node((1, 0), [xhy], radius: 2em),
      node((2, 0), [hy], radius: 2em),
      node((3, 0), [y], radius: 2em),
      node((4, 0), [], radius: 2em),
      node((0, 1), [yhxhy], radius: 2em),
      node((1, 1), [yxhy], radius: 2em),
      node((2, 1), [yhy], radius: 2em),
      node((3, 1), [yy], radius: 2em),
      node((4, 1), [y], radius: 2em),
      node((0, 2), [yhhxhy], radius: 2em),
      node((1, 2), [yhxhy], radius: 2em),
      node((2, 2), [yhhy], radius: 2em),
      node((3, 2), [yhy], radius: 2em),
      node((4, 2), [yh], radius: 2em),
      node((0, 3), [yhhhxhy], radius: 2em),
      node((1, 3), [yhhxhy], radius: 2em),
      node((2, 3), [yhhhy], radius: 2em),
      node((3, 3), [yhhy], radius: 2em),
      node((4, 3), [yhh], radius: 2em),
      node((0, 4), [yhhxhxhy], radius: 2em),
      node((1, 4), [yhhxxhy], radius: 2em),
      node((2, 4), [yhhxhy], radius: 2em),
      node((3, 4), [yhhxy], radius: 2em),
      node((4, 4), [yhhx], radius: 2em),

      edge((3, 0), (4, 1), "->"),
      edge((0, 1), (1, 2), "->"),
      edge((2, 1), (3, 2), "->"),
      edge((0, 2), (1, 3), "->"),
      edge((2, 2), (3, 3), "->"),
      edge((1, 3), (2, 4), "->"),

      edge((0, 0), (1, 0), [-h], "->"),
      edge((1, 0), (2, 0), [-x], "->"),
      edge((2, 0), (3, 0), [-h], "->"),
      edge((3, 0), (4, 0), [-y], "->"),
      edge((0, 1), (1, 1), [-h], "->"),
      edge((1, 1), (2, 1), [-x], "->"),
      edge((2, 1), (3, 1), [-h], "->"),
      edge((3, 1), (4, 1), [-y], "->"),
      edge((0, 2), (1, 2), [-h], "->"),
      edge((1, 2), (2, 2), [-x], "->"),
      edge((2, 2), (3, 2), [-h], "->"),
      edge((3, 2), (4, 2), [-y], "->"),
      edge((0, 3), (1, 3), [-h], "->"),
      edge((1, 3), (2, 3), [-x], "->"),
      edge((2, 3), (3, 3), [-h], "->"),
      edge((3, 3), (4, 3), [-y], "->"),
      edge((0, 4), (1, 4), [-h], "->"),
      edge((1, 4), (2, 4), [-x], "->"),
      edge((2, 4), (3, 4), [-h], "->"),
      edge((3, 4), (4, 4), [-y], "->"),

      edge((0, 0), (0, 1), [+y], "->"),
      edge((0, 1), (0, 2), [+h], "->"),
      edge((0, 2), (0, 3), [+h], "->"),
      edge((0, 3), (0, 4), [+x], "->"),
      edge((1, 0), (1, 1), [+y], "->"),
      edge((1, 1), (1, 2), [+h], "->"),
      edge((1, 2), (1, 3), [+h], "->"),
      edge((1, 3), (1, 4), [+x], "->"),
      edge((2, 0), (2, 1), [+y], "->"),
      edge((2, 1), (2, 2), [+h], "->"),
      edge((2, 2), (2, 3), [+h], "->"),
      edge((2, 3), (2, 4), [+x], "->"),
      edge((3, 0), (3, 1), [+y], "->"),
      edge((3, 1), (3, 2), [+h], "->"),
      edge((3, 2), (3, 3), [+h], "->"),
      edge((3, 3), (3, 4), [+x], "->"),
      edge((4, 0), (4, 1), [+y], "->"),
      edge((4, 1), (4, 2), [+h], "->"),
      edge((4, 2), (4, 3), [+h], "->"),
      edge((4, 3), (4, 4), [+x], "->"),
    )
  )
]
