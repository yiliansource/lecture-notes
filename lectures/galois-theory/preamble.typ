#import "@preview/theoretic:0.4.0"
#import theoretic.presets.basic: *

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
