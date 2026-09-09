#let title = [Intro To Machine Learning]
#set page(
   paper: "a4",
   header: align(left, title),
   numbering: "1",
)

#align(center, text(17pt)[
   *#title*
])
// #show outline.entry.where(
//   level: 1
// ): set block(above: 1.2em)
#set heading(numbering: "1.")
#outline()

#include "unsupervised.typ"

#include "supervised.typ"
