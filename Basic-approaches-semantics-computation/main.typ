#import "lib.typ": *

#let title = [Basic Approaches to the Semantics of Computation Notes]
#set page(
   paper: "a4",
   header: align(left, title),
   numbering: "1",
)

#align(center, text(17pt)[
   *#title*

   Matteo Bongiovanni\
])

#outline()

= Book notes

#include "book/1/chapter1_1.typ"

#include "book/1/chapter1_2.typ"

#include "book/2/chapter2_1.typ"

#include "book/2/chapter2_2.typ"

#include "book/4/chapter4_1.typ"

= Lecture notes

== Lecture 1
- pragmatics: How to use constructs and features

- formal syntax:
   - alphabet: symbols
   - grammatical structure: which sequences of symbols are valid

- Types
   - limit errors/bugs/bad practice
   - compiler optimization

== Lecture 2

SOS: Structural Operational Semantics

$T_Sigma$: closed terms, terms with no variables
$tsx$: terms with variables

$
   rho = [x = "succ" y, y = 0] \
   t = +(+(x, y), "succ"(x)) \
   t rho = +(+("succ" y, 0), "succ""succ" y) 
$
if $t$ is more general than (mgt) $t'$ then $t'$ is an instance of $t$

Eliminate: replace all occurances of $x$ (propigate to other equalities)
