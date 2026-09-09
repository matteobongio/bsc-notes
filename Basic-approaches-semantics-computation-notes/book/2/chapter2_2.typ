#import "../../lib.typ": *

== Chapter 2.2: Inference Rules and Logical Systems

Inference rules are a tool for defining syntax and semantics

  #let derivation = $attach(forces, br:R)$
#Definitionbox("Inference Rule", [
  Let $x_1, x_2, ..., x_n, y$ be formulae. And _inference rule_ is written as
  $ r = {x_1, x_2, ..., x_n} slash y = X / y = (x_1, x_2, ..., x_n)/y $
  where $x$ are the premises, and $y$ the conclusion

  An _axiom_ is an inference rule with empty premis $r = emptyset slash y$

  A _logcal system_ is a set of inference rules $R = {r_i}_(i in I)$

  A _derivation_ is written 
  $ d derivation y $
  where either $d = emptyset slash y$ is an axiom, or there are some derivations 
  $d_1 derivation x_1, ..., d_n derivation x_n$ such that $d=({d_1, ..., d_n} slash y)$
  and $({x_1, ..., x_n} slash y) in R$. Derivations are kind of proofs that in the formal
  system $R$ we can get to $y$.

  $
  emptyset/y in R => emptyset/y derivation y \
  ({x_1, ..., x_n} slash y) in R and ( d_1 derivation x_1, ..., d_n derivation x_n )
  => d=({d_1, ..., d_n} slash y)
  $
  
  The height of a derivation tree is
  $
    "height"(d) def cases(
      1 &&"if" d = (emptyset slash y),
      1 + max {"height"(d_1), ..., "height"(d_n) } && "if" d = ({d_1, ..., d_n} slash y)
    )
  $

  A _theorem_ in a logical system $R$ a theorem $y$, has a proof $derivation y$

  $y$ is a thoerem in $R$ if $exists d. d derivation y$

  Let $I_R = {y | derivation y}$ be the set of all theorems that can be proven in $R$
])


#pinkbox("Approaches to prove Theorems", [
  - top-down / direct: start from axioms, keep proving things until you get to the theorem
  - bottom-up / goal-oriented: deduce a derivation by applying the inference rules backwards
])
