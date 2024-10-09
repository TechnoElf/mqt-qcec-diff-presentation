#import "@preview/tablex:0.0.8": tablex

#import "../template/conf.typ": slide
#import "data.typ": *

#slide(title: "")[
  #box(width: 100%, height: 80%, align(center + horizon)[
    #text(size: 60pt)[*Conclusion*]
  ])
]

#slide(title: "Conclusion")[
  #figure(
    box(width: 90%, height: 90%, align(horizon, {
      tablex(
        columns: (2fr, 1fr, 1fr, 1fr),
        [*Algorithm*], [*Average Run Time Improvement (%)*], [*Maximum Run Time Improvement (%)*], [*Maximum Run Time Regression (%)*],
        [Myers' Diff],
        align(right, [#calc.round(unclip(results-r1-b5q16).map(r => -(r.cmyers-p.mu / r.cprop.mu * 100 - 100)).sum() / unclip(results-r1-b5q16).len(), digits: 2)]),
        align(right, [#calc.round(unclip(results-r1-b5q16).map(r => -(r.cmyers-p.mu / r.cprop.mu * 100 - 100)).fold(0, calc.max), digits: 2)]),
        align(right, [#calc.round(unclip(results-r1-b5q16).map(r => -(r.cmyers-p.mu / r.cprop.mu * 100 - 100)).fold(0, calc.min), digits: 2)]),
        [Myers' Diff (Processed)],
        align(right, [#calc.round(unclip(results-r1-b5q16).map(r => -(r.cmyers-pmismc.mu / r.cprop.mu * 100 - 100)).sum() / unclip(results-r1-b5q16).len(), digits: 2)]),
        align(right, [#calc.round(unclip(results-r1-b5q16).map(r => -(r.cmyers-pmismc.mu / r.cprop.mu * 100 - 100)).fold(0, calc.max), digits: 2)]),
        align(right, [#calc.round(unclip(results-r1-b5q16).map(r => -(r.cmyers-pmismc.mu / r.cprop.mu * 100 - 100)).fold(0, calc.min), digits: 2)]),
        [Myers' Diff (Reversed)],
        align(right, [#calc.round(unclip(results-r1-b5q16).map(r => -(r.cmyersrev-p.mu / r.cprop.mu * 100 - 100)).sum() / unclip(results-r1-b5q16).len(), digits: 2)]),
        align(right, [#calc.round(unclip(results-r1-b5q16).map(r => -(r.cmyersrev-p.mu / r.cprop.mu * 100 - 100)).fold(0, calc.max), digits: 2)]),
        align(right, [#calc.round(unclip(results-r1-b5q16).map(r => -(r.cmyersrev-p.mu / r.cprop.mu * 100 - 100)).fold(0, calc.min), digits: 2)]),
        [Myers' Diff (Reversed, Processed)],
        align(right, [#calc.round(unclip(results-r1-b5q16).map(r => -(r.cmyersrev-pmismc.mu / r.cprop.mu * 100 - 100)).sum() / unclip(results-r1-b5q16).len(), digits: 2)]),
        align(right, [#calc.round(unclip(results-r1-b5q16).map(r => -(r.cmyersrev-pmismc.mu / r.cprop.mu * 100 - 100)).fold(0, calc.max), digits: 2)]),
        align(right, [#calc.round(unclip(results-r1-b5q16).map(r => -(r.cmyersrev-pmismc.mu / r.cprop.mu * 100 - 100)).fold(0, calc.min), digits: 2)]),
        [Patience Diff],
        align(right, [#calc.round(unclip(results-r1-b5q16).map(r => -(r.cpatience-p.mu / r.cprop.mu * 100 - 100)).sum() / unclip(results-r1-b5q16).len(), digits: 2)]),
        align(right, [#calc.round(unclip(results-r1-b5q16).map(r => -(r.cpatience-p.mu / r.cprop.mu * 100 - 100)).fold(0, calc.max), digits: 2)]),
        align(right, [#calc.round(unclip(results-r1-b5q16).map(r => -(r.cpatience-p.mu / r.cprop.mu * 100 - 100)).fold(0, calc.min), digits: 2)]),
        [*Myers' Diff (Processed) \ with filter*],
        align(right, [*#calc.round(filter(unclip(results-r1-b5q16)).map(r => -(r.cmyers-pmismc.mu / r.cprop.mu * 100 - 100)).sum() / filter(unclip(results-r1-b5q16)).len(), digits: 2)*]),
        align(right, [*#calc.round(filter(unclip(results-r1-b5q16)).map(r => -(r.cmyers-pmismc.mu / r.cprop.mu * 100 - 100)).fold(0, calc.max), digits: 2)*]),
        align(right, [*#calc.round(filter(unclip(results-r1-b5q16)).map(r => -(r.cmyers-pmismc.mu / r.cprop.mu * 100 - 100)).fold(0, calc.min), digits: 2)*]),
      )
    }))
  )
]

