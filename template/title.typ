#import "@preview/polylux:0.3.1": *

#import "colour.typ": *

#let title-slide(
  title: "",
  author: "",
  chair: "",
  school: "",
  degree: "",
  examiner: "",
  supervisor: "",
  submitted: ""
) = {
  set page(
    paper: "presentation-16-9",
    margin: (top: 3cm, bottom: 1cm, left: 1cm, right: 1cm),
    header: {
      align(bottom, grid(
        columns: (1fr, 1fr),
        align(left, text(font: "TUM Neue Helvetica", fill: tum_blue, size: 8pt, [#chair \ #school \ Technical University of Munich])),
        align(right, image("resources/TUM_Logo_blau.svg", height: 1cm))
      ))
    }
  )

  polylux-slide([
    #set text(
      font: "TUM Neue Helvetica",
      size: 20pt
    )

    #set align(top + left)
    #text(fill: tum_blue, size: 34pt, [*#title*])

    #v(1em)
    *#author*
    #v(1em)

    #text(size: 16pt, [#chair \ #school \ Technical University of Munich])

    #v(1em)
    #submitted
    
    #place(
      bottom + right,
      image("resources/TUM_Tower.png", height: 10cm)
    )
  ])
}
