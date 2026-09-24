#import "@preview/texst:0.1.2": paper
#import "preamble.typ": *

#show: doc => paper(
  title: [Galois Theory / MM7043 2026W],
  subtitle: [Gregory Arone],
  authors: (
    (name: [Ian Hornik]),
  ),
  date: datetime.today().display("[month repr:long] [day], [year]"),

  doc,
)
#show ref: theoretic.show-ref

#set enum(numbering: "1.i.")
#set terms(separator: [: ])

#set math.equation(numbering: none)

#include "lectures/2026-09-03.typ"
#include "lectures/2026-09-10.typ"
#include "lectures/2026-09-17.typ"
#include "lectures/2026-09-24.typ"
