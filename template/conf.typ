#import "@preview/polylux:0.3.1": *

#import "title.typ": title-slide
#import "colour.typ": *

#let slide(
  title: "Title",
  author: "Author",
  body
) = {
  set page(
    paper: "presentation-16-9",
    margin: (top: 3cm, bottom: 1cm, left: 1cm, right: 1cm),
    header: {
      align(bottom, grid(
        columns: (1fr, 1fr),
        align(left, text(font: "TUM Neue Helvetica", fill: tum_blue, size: 28pt, [*#title*])),
        align(right, image("resources/TUM_Logo_blau.svg", height: 1cm))
      ))
    },
  )

  polylux-slide({
    set text(
      font: "TUM Neue Helvetica",
      size: 20pt,
      fill: tum_black
    )

    body
  })
}

#let conf(
  title: "",
  author: "",
  chair: "",
  school: "",
  degree: "",
  examiner: "",
  supervisor: "",
  submitted: "",
  doc
) = {
  set document(title: title, author: author)

  title-slide(
    title: title,
    author: author,
    chair: chair,
    school: school,
    degree: degree,
    examiner: examiner,
    supervisor: supervisor,
    submitted: submitted
  )

  set page(
    footer: {
      text(font: "TUM Neue Helvetica", fill: tum_black, size: 14pt, [#author | #title | #submitted])
    }
  )

  doc
}

