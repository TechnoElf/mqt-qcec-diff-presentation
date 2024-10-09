#import "@preview/cetz:0.2.2": canvas, plot, chart, styles, draw, palette
#import "@preview/tablex:0.0.8": tablex
#import "@preview/unify:0.6.0": qty

#import "../template/conf.typ": slide
#import "data.typ": *

#slide(title: "")[
  #box(width: 100%, height: 80%, align(center + horizon)[
    #text(size: 60pt)[*Results*]
  ])
]

#slide(title: "Results")[
  #set text(size: 12pt)

  #figure(
    canvas({
      draw.set-style(
        axes: (bottom: (tick: (
          label: (angle: 45deg, anchor: "east"),
        )))
      )
      chart.columnchart(
        mode: "clustered",
        label-key: 0,
        value-key: range(1, 7),
        size: (20, 8),
        x-label: [Run Time (s)],
        x-tick: 45,
        y-label: [Count],
        y-max: 40,
        y-min: 0,
        legend: "legend.inner-north-east",
        labels: ([Proportional], [Myers' Diff (Reversed, Processed)], [Myers' Diff (Processed)], [Myers' Diff (Reversed)], [Myers' Diff], [Patience Diff]),
        bar-style: i => { if i >= 1 { palette.red(i) } else { palette.cyan(i) } },
        results-r1-b5q16-hist.bins-mu.zip(
          results-r1-b5q16-hist.cprop.mu,
          results-r1-b5q16-hist.cmyersrev-pmismc.mu,
          results-r1-b5q16-hist.cmyers-pmismc.mu,
          results-r1-b5q16-hist.cmyersrev-p.mu,
          results-r1-b5q16-hist.cmyers-p.mu,
          results-r1-b5q16-hist.cpatience-p.mu
        )
      )
    }),
    caption: [
      Benchmark instances sorted into bins based on their run time.
      The size of the bins increases exponentially to better reflect the distribution of the results.
      The benchmark runs that did not finish within the time limit are excluded from these results.
    ]
  )
]

#slide(title: "Results")[
  #set text(size: 14pt)

  #figure(
    canvas({
      draw.set-style(
        axes: (bottom: (tick: (
          label: (angle: 45deg, anchor: "east"),
        )))
      )
      chart.columnchart(
        size: (20, 9),
        x-ticks: (),
        y-label: [Run Time Improvement (%)],
        y-max: 100,
        y-min: -100,
        sort-by-circuit-size(unclip(results-r1-b5q16)).map(r =>
          ([#r.name], calc.max(-(r.cmyers-pmismc.mu / r.cprop.mu * 100 - 100), -100))
        )
      )
    }),
    caption: [
      The run time improvement of the application scheme based on the processed Myers' algorithm relative to the proportional application scheme for each benchmark instance.
    ]
  )
]

#slide(title: "Results")[
  #set text(size: 14pt)

  #figure(
    canvas({
      plot.plot(
        size: (20, 8),
        x-label: [Absolute Circuit Size Difference (gates)],
        y-label: [Run Time Improvement (%)],
        y-max: 100,
        y-min: -100,
        legend: "legend.inner-north-east",
        {
          plot.add-hline(style: (stroke: black), 0)
          plot.add(
            mark: "triangle",
            mark-style: (fill: none),
            style: (stroke: none),
            label: [Myers' Diff],
            unclip(results-r1-b5q16).map(r =>
              (r.circuit-size-difference, calc.max(-(r.cmyers-p.mu / r.cprop.mu * 100 - 100), -100))
            )
          )
          plot.add(
            mark: "square",
            mark-style: (fill: none),
            style: (stroke: none),
            label: [Myers' Diff (Processed)],
            unclip(results-r1-b5q16).map(r =>
              (r.circuit-size-difference, calc.max(-(r.cmyers-pmismc.mu / r.cprop.mu * 100 - 100), -100))
            )
          )
          plot.add(
            mark: "o",
            mark-style: (fill: none),
            style: (stroke: none),
            label: [Myers' Diff (Reversed)],
            unclip(results-r1-b5q16).map(r =>
              (r.circuit-size-difference, calc.max(-(r.cmyersrev-p.mu / r.cprop.mu * 100 - 100), -100))
            )
          )
          plot.add(
            mark: "x",
            mark-style: (fill: none),
            style: (stroke: none),
            label: [Myers' Diff (Reversed, Processed)],
            unclip(results-r1-b5q16).map(r =>
              (r.circuit-size-difference, calc.max(-(r.cmyersrev-pmismc.mu / r.cprop.mu * 100 - 100), -100))
            )
          )
          plot.add(
            mark: "+",
            mark-style: (fill: none),
            style: (stroke: none),
            label: [Patience],
            unclip(results-r1-b5q16).map(r =>
              (r.circuit-size-difference, calc.max(-(r.cpatience-p.mu / r.cprop.mu * 100 - 100), -100))
            )
          )
        }
      )
    }),
    caption: [The run time improvement dependent on the circuit size difference for each diff algorithm.]
  )
]

#slide(title: "Results")[
  #set text(size: 14pt)

  #figure(
    canvas({
      plot.plot(
        size: (20, 8),
        x-label: [Total Circuit Size (gates)],
        y-label: [Run Time Improvement (%)],
        y-max: 100,
        y-min: -100,
        legend: "legend.inner-north-east",
        {
          plot.add-hline(style: (stroke: black), 0)
          plot.add(
            mark: "triangle",
            mark-style: (fill: none),
            style: (stroke: none),
            label: [Myers' Diff],
            unclip(results-r1-b5q16).map(r =>
              (r.total-circuit-size, calc.max(-(r.cmyers-p.mu / r.cprop.mu * 100 - 100), -100))
            )
          )
          plot.add(
            mark: "square",
            mark-style: (fill: none),
            style: (stroke: none),
            label: [Myers' Diff (Processed)],
            unclip(results-r1-b5q16).map(r =>
              (r.total-circuit-size, calc.max(-(r.cmyers-pmismc.mu / r.cprop.mu * 100 - 100), -100))
            )
          )
          plot.add(
            mark: "o",
            mark-style: (fill: none),
            style: (stroke: none),
            label: [Myers' Diff (Reversed)],
            unclip(results-r1-b5q16).map(r =>
              (r.total-circuit-size, calc.max(-(r.cmyersrev-p.mu / r.cprop.mu * 100 - 100), -100))
            )
          )
          plot.add(
            mark: "x",
            mark-style: (fill: none),
            style: (stroke: none),
            label: [Myers' Diff (Reversed, Processed)],
            unclip(results-r1-b5q16).map(r =>
              (r.total-circuit-size, calc.max(-(r.cmyersrev-pmismc.mu / r.cprop.mu * 100 - 100), -100))
            )
          )
          plot.add(
            mark: "+",
            mark-style: (fill: none),
            style: (stroke: none),
            label: [Patience],
            unclip(results-r1-b5q16).map(r =>
              (r.total-circuit-size, calc.max(-(r.cpatience-p.mu / r.cprop.mu * 100 - 100), -100))
            )
          )
        }
      )
    }),
    caption: [The run time improvement dependent on the total circuit size for each diff algorithm.]
  )
]

#slide(title: "Results")[
  #set text(size: 14pt)

  #figure(
    canvas({
      plot.plot(
        size: (20, 8),
        x-label: [Equivalence Rate],
        y-label: [Run Time Improvement (%)],
        y-max: 100,
        y-min: -100,
        legend: "legend.inner-north-east",
        {
          plot.add-hline(style: (stroke: black), 0)
          plot.add(
            mark: "triangle",
            mark-style: (fill: none),
            style: (stroke: none),
            label: [Myers' Diff],
            unclip(results-r1-b5q16).map(r =>
              (r.equivalence-rate, calc.max(-(r.cmyers-p.mu / r.cprop.mu * 100 - 100), -100))
            )
          )
          plot.add(
            mark: "square",
            mark-style: (fill: none),
            style: (stroke: none),
            label: [Myers' Diff (Processed)],
            unclip(results-r1-b5q16).map(r =>
              (r.equivalence-rate, calc.max(-(r.cmyers-pmismc.mu / r.cprop.mu * 100 - 100), -100))
            )
          )
          plot.add(
            mark: "o",
            mark-style: (fill: none),
            style: (stroke: none),
            label: [Myers' Diff (Reversed)],
            unclip(results-r1-b5q16).map(r =>
              (r.equivalence-rate, calc.max(-(r.cmyersrev-p.mu / r.cprop.mu * 100 - 100), -100))
            )
          )
          plot.add(
            mark: "x",
            mark-style: (fill: none),
            style: (stroke: none),
            label: [Myers' Diff (Reversed, Processed)],
            unclip(results-r1-b5q16).map(r =>
              (r.equivalence-rate, calc.max(-(r.cmyersrev-pmismc.mu / r.cprop.mu * 100 - 100), -100))
            )
          )
          plot.add(
            mark: "+",
            mark-style: (fill: none),
            style: (stroke: none),
            label: [Patience],
            unclip(results-r1-b5q16).map(r =>
              (r.equivalence-rate, calc.max(-(r.cpatience-p.mu / r.cprop.mu * 100 - 100), -100))
            )
          )
        }
      )
    }),
    caption: [The run time improvement dependent on the circuit equivalence rate for each diff algorithm.]
  )
]

#slide(title: "Results")[
  #set text(size: 14pt)

  #figure(
    canvas({
      plot.plot(
        size: (20, 8),
        x-label: [Equivalence Rate],
        y-label: [Run Time Improvement (%)],
        y-max: 100,
        y-min: -100,
        legend: "legend.inner-north-east",
        {
          plot.add-hline(style: (stroke: black), 0)
          plot.add(
            mark: "square",
            mark-style: (stroke: green, fill: none),
            style: (stroke: none),
            label: [Myers' Diff (Processed)],
            unclip(results-r1-b5q16).map(r =>
              (r.equivalence-rate, calc.max(-(r.cmyers-pmismc.mu / r.cprop.mu * 100 - 100), -100))
            )
          )
          plot.add-vline(style: (stroke: red), 0.35)
        }
      )
    }),
    caption: [The run time improvement dependent on the circuit equivalence rate for each diff algorithm.]
  )
]

#slide(title: "Results")[
  #set text(size: 14pt)

  #figure(
    canvas({
      draw.set-style(
        axes: (bottom: (tick: (
          label: (angle: 45deg, anchor: "east"),
        )))
      )
      chart.columnchart(
        size: (20, 9),
        x-ticks: (),
        y-label: [Run Time Improvement (%)],
        y-max: 100,
        y-min: -100,
        filter(sort-by-circuit-size(unclip(results-r1-b5q16))).map(r =>
          ([#r.name], calc.max(-(r.cmyers-pmismc.mu / r.cprop.mu * 100 - 100), -100))
        )
      )
    }),
    caption: [
      The run time improvement of the application scheme based on the processed Myers' algorithm relative to the proportional application scheme for each benchmark instance.
      The benchmark instances are filtered so the application scheme is only used for those where the circuits are more than 40% equivalent.
    ]
  )
]

