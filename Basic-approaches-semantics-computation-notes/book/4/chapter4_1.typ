#import "../../lib.typ": *
== Chapter 4.1: Noether’s Principle of Well-Founded Induction

#Definitionbox("Binary relation", [
  A _binary relation_ over a set $A$:
  $ prec subset.eq A times A $
  For $(a, b) in prec$ we write $a prec b$ or $b succ a$

  A relation can be represented as an _oriented graph_ whose nodes are the elements of $A$ and 
  whose arcs $n -> m$  represent the pairs $n prec m$
])

#Definitionbox("Infinite descending chain", [
  Given a relation, an _infinite descending chain_ is an infinite sequence ${a_i}_(i in NN)$
  of elements in $A$ such that 
  $ forall i in NN. a_(i + 1) prec a_i $ 

  $a(0) succ a(1) succ a(2) ...$
])

#Definitionbox("Well-founded relation", [
  A relation is _well founded_ if it has no inifinite descending chains
])

#Definitionbox("Transitive closure", [
  The transitive closure of $prec$, $tprec$ is defined:
  $
    frac(a prec b, a tprec b) #h(10pt) frac(a tprec b #h(10pt) b tprec c, a tprec c)
  $
])

#Definitionbox("Transitive and reflexive closure", [
  The transitive and reflexive closure of $prec$, $trprec$ is defined:
  $
    frac(, a trprec a) #h(10pt)
    frac(a prec b, a trprec b) #h(10pt)
    frac(a trprec b #h(10pt) b trprec c, a trprec c) 
  $
  both $prec$ and $tprec$ are included in $trprec$
])

#TheoremBox("", [
  Let $prec$ be a relation over $A$. For any $x, y in A, x tprec y$ iff there exists a 
  finite number of elements $z_0, z_1, z_k in A$ with $k > 0$ such that 
  $ x = z_0 prec z_1 prec ... prec z_k = y $
]) 

#TheoremBox([Well-foundedness of $tprec$], [
  A relation $prec$ i well-founded iff $tprec$ is well-founded
])

#Definitionbox("Acyclic Relation", [
  We say that $prec$ has a cycle if $exists a in A. a tprec a$ we say that $prec$ is
  _acyclic_ if it has no cycle
])

#TheoremBox("Well-founded relations are acyclic", [
  If the relation $prec$ is well-founded, this it is acyclic
])

#TheoremBox("Well-founded relations over finite sets", [
  Let $A$ be a finite set and let $prec$ be acyclic, then $prec$ is well-founded
])

#Definitionbox("Minimal element", [
  $prec$ is well-founded iff every nonempty subset $Q subset.eq A$ containns a minimal element
  $m$.
])

#Definitionbox("Terms over one-sorted signatures", [
  Let $Sigma = {Sigma_n}_(n in NN)$ be a one-sorted signature (a set of ranked operators $f$
  such that $f in Sigma_n$ if $f$ takes $n$ arguments)

  We define the set of $Sigma$-terms as the set $T_Sigma$ that is defined inductively by the
  following inference rule
  $
    frac(
      t_i in T_Sigma #h(10pt) i = 1\, ...\, n #h(10pt) f in Sigma_n,
      f(t_1, ..., t_n) in T_Sigma
    )
  $
])

#Definitionbox("Terms over many-sorted signatures", [
  - $S$ be a set of _sorts_
  - $Sigma = {Sigma_(s_1...s_n, s}$ is an operator that takes $n$ arguments, the _i_ th
    being of type $s_i$ and gives a result of type $s$

  We define the set of $Sigma$-terms as 
  $ T_Sigma = {tsx}_(s in S) $

  where for $s in S$, the set $tsx$ is the set of terms of sort $s$ over the signature $Sigma$
  defined by

  $
    frac(
      t_i in tsx #h(10pt) i = 1\, ...\, n #h(10pt) f in Sigma_(s_1...s_n, s),
      f(t_1\, ...\, t_n) in tsx
    )
  $
])
