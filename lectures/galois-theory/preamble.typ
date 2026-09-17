#import "@preview/theoretic:0.4.0"
#import theoretic.presets.basic: *

#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#let example = definition.with(supplement: "Example")
#let remark = definition.with(supplement: "Remark")

#let lecture-date(date) = {
  place(
    right,
    dx: 70pt,
    dy: 0.1em,
    rect(
      stroke: (
        top: 1pt + black,
        right: 1pt + black,
      ),
      radius: 1pt,
      inset: (x: 6pt, y: 6pt),
      text(size: 0.75em, fill: black, date),
    ),
  )
}

#let ran = math.op("ran")
