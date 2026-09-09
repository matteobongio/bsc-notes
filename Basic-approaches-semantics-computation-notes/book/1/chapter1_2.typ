#import "../../lib.typ": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

== Chapter 1.2: A Taste of Semantic Methods: Numberical Expressions

#Definitionbox("Concrete vs Abstract Syntax", [
  _Concrete_ syntax is concerned with the precise linear sequences of symbols which are valid terms of the language.

  _Abstract_ syntax describes expressions purely interms of their structure.

  //TODO: fix diagram 
  #diagram( $
    & & times.circle edge("rd") edge("ld") \
    &plus.circle edge("rd") edge("ld") & & 3 \
    1 & & 2
  $)

  This is usually written with brackets to save space
])

#Definitionbox("Small-step Semantics", [
  $ e_0 -> e_1 $
  - after performing one step of evaluation of $e_0$, the expression $e_1$ remains to be evaluated.

  Small-step semantics formally describes how individual steps of a computation take place on an abstract devices,
  ignoring details (e.g. registers and memory addresses)

  $
    frac("premises", "conclusion") "side-condition" ("rule name")
  $

  If the _premise_ and _side-condition_ are met then the conclusion can be drawn, where premise consist of one, none, or
  more judgements and the side-condition is a single boolean predicate.

  $ frac(,mono(n_0 times.circle n_1 -> n)) n = n_0 + n_1 $

  If $mono(n)$ is the sum of $mono(n_0)$ and $mono(n_1)$,
  then the expression can be replaced with $mono(n)$

  $ frac(e_0 -> e_0^', e_0 times.circle e_1 -> e_0^' times.circle e_1) $

  If $e_0$ can be furthur evaluated, then it can be replaced on the LHS with it's next evaluation step
  
  - An equivalent rule can be made for the RHS
  - rules wth no premises are called _axioms_, their conclusion is always valid
  - A derivation is represented as an invertd tree, where the goal is at the root, then
     the tree is generatrd by appling the rules, with the leaves being axioms. This can grow very 
     large, alternative notation later.
     //TODO: alternative notation link
  - even for deterministic programs, many different execution paths may exist. If you don't
    want this, make sure the rules only allow for one path of execution.
  - $e arrow.not$ detnotes that there is no futhur evaluation step for the expression of $e$
  - $e ->^* n$ is the _reflexive and transitive_ closure of $->$, which is the fully evaluated
    expression
])

#Definitionbox("Big-step Semantics (aka Natural Semantics)", [
  It is also a set of inference rules, but the entire computation is done as a single derivation
  (Big step).

  books uses $->>$, lecture uses $-->$

  $ frac(e_0 --> mono(n_1) thin e_1 --> mono(n_2), e_0 plus.circle e_1 --> n) n = n_1 + n_2 $

  Small-step gives more control of the details and order of evaluation, it s more convenient
  when proving type soundess. Big-step can lead to simpler proofs.

  Big-step can only be drawn for terminating programs
])

#Definitionbox("Denotational Semantics", [
  Denotational Semantics are only concered with manipulating mathematical objects. 

  We choose a _semantic domain_ and an _interpretation function_ that maps text to the 
  semantic domain

  syntactic terms are enclosed in $[||]$

  $
    cal(N)[|dot|] &: "Nums" -> NN \
    cal(E)[|dot|] &: "Exp" -> NN \
    cal(E)[|e_0 plus.circle e_1|] &= cal(E)[|e_0|] + cal(E)[|e_1|]
  $

  *Compositional*: the meaning of complex expressions is defined in terms of the meaning of their components 
])

#pinkbox("Semantic Equivalence", [
  - *Normalisation*: does every expression evaluate? (trivially satisfied by $cal(E)[|e|]$)
  - *Determinacy*: do all evaluation paths lead to the same result (trivially satisfied by $cal(E)[|e|]$)
  - *Consistency*: do big-step and small-step semantics lead to the same result (equivalence relation)
])

#bluebox("Memory", [
  $ sigma : X -> NN $
  sigma is the memory function

  $angle.l e, sigma angle.r$ denotes the state where $e$ is to be evaluated in the memory $sigma$

  $ 
    frac( ,angle.l e \, sigma angle.r -> n) n = sigma(x) ("var") #h(14pt) && "small-step" \
    frac( ,angle.l e \, sigma angle.r --> n) n = sigma(x) ("var") #h(14pt) && "big-step" \
    cal(E)[|dot|]: "Exp" -> ((X -> NN) -> NN) && "denotational" \
    cal(E)[|n|] sigma &= cal(N)[|n|] \
    cal(E)[|x|] sigma &= sigma(x) \
    cal(E)[|e_0 plus.circle e_1|] sigma &= cal(E)[|e_0|] sigma + cal(E)[|e_1|] sigma 
  $
])
