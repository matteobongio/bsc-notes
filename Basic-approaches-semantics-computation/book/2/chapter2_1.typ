#import "../../lib.typ": *
== Chapter 2.1: Notation
#Notationbox([
  - Capital Letters denote sets, lowercase for an element of a set
  - $BB def {bold("true"), bold("false")}$
  - $[m, n] def {k | m <= k <= n}$
  - cardinality $|A|$ is the size of a finite set
  - disjoint union $union.plus$ is the union of two sets,
    but elements are labeled by their set, and the elements in common appear twice,
    once with each label
  - A relation $R$ between two sets is a subset of $A times B$, it can be considered a function if
    these properties are satisfied
      - function: $forall a in A, forall b in B. (a, b_1) in f and (a, b_2) in f => b_1 = b_2$
      - total: $forall a in A, exists b in B. (a, b) in f$
    We can then write $f: A -> B$, $A$ is the domain, $B$ is the codomain
  - $f$ can be written as ${(a, f(a)) | a in A} subset.eq A times B$
])

#Definitionbox("Signature", [
  A onesorted/unsorted _signature_  is a set of function symbols such that each symbol is assigned
  and _arity_ (arity 0 is a constant) ($Sigma = {c, f, g}$). Let $Sigma_n subset.eq Sigma$ be the
  set of function symbols whose arity is $n$. Given an infinite set of variables $X = {x, y, z, ...}$,
  the set $T_(Sigma, X)$ is the set of terms over $Sigma$ and $X$, the set of all and only terms generated
  according to the rules:
  - each variable $x in X$ is a term ($x in tsx$)
  - each constant $c in Sigma_0$ is a term ($c in tsx$)
  - if $f in Sigma_n$ and $t_1, ..., t_n$ are terms, then $f(t_1, ..., t_n)$ is also a term
  For a term $t$ we denote the set of variables occuring in $t$ by $"vars"(t)$

  $T_Sigma subset.eq $ is the set of terms with no variables
  ($T_Sigma def {t in tsx | "vars"(t) = emptyset} $)
])

#Definitionbox("Substitutions", [
  A _substitution_ $rho : X -> tsx$ is a function assigning terms to variables.

  The set of variables is infinite, we are only interested in terms with a finite number of
  variables, we consider only subtitutions that are defined as identity everywhere except on a finite
  number of variables.
  $ rho(x) = cases(t_i "if" x = x_i, x "otherwise") $
  #Notationbox([$ rho = [x_1 = t_1, ..., x_n = t_n] $])
  $t rho$ or $rho(t)$ denotes the term ovtained from $t$ by simultaneously replacing each variable x
  with $rho(x)$ in $t$
  
  We say that the term $t$ is _more general_ than term $t'$ if there exists a substitution $rho$
  such that $t rho = t'$. The "more general than" relation is reflexive and transitive.

  (note that there are terms $t != t'$, $t$ is more general than $t'$ and $t'$ is more general than $t$)

  We say that the substitution $rho$ is more general than the substitution $rho'$ if there
  exists a $rho''$ such that for any variable $x$ we have $rho''(rho(x)) = rho'(x)$
])

#Examplebox([
  $
    Sigma = {0, "succ", "plus"} \
    0 in T_Sigma \
    x in tsx \
    "succ"(0) in T_sigma \
    "succ"(x) in tsx \
    "plus"("succ"(x), 0) in tsx \
    "vars"(0) = "vars"("succ"(0)) = emptyset \
    t def "plus"("succ"(x), "succ"(y)) \
    rho def [x = "succ"(y), y = 0] \
    t rho = "plus"("succ"(x), "succ"(y))[x = "succ"(y), y = 0] = "plus"("succ"("succ"(y)), "succ"(0))
 $
])

#Definitionbox("Unification Problem", [
  The unification problem consists of finding a substitution $rho$ that identifies some terms pairwise
  $ G = {l_1 mighteq r_1, ..., l_n mighteq r_n} $
  where $l_i, r_i in tsx$ we say that $rho$ is a solution of $G$ if
  $ forall i in [1, n]. l_i rho = r_i rho $
  The unification problem requres finding the _most general_ solution $rho$

  We say that two sets of potential equalities $G$ and $G'$ are _equivalent_ if they have the
  same set of solutions

  $"vars"(G)$ denotes the set of variables occuring in $G$

  $
    "vars"({l_1 mighteq r_1, ..., l_n mighteq r_n}) 
    = union.big_(i = 1)^n ("vars"(l_i) union "vars"(r_i)) 
  $

  the solution does note necessarily exist, and it is not necessarily unique

  The unification algorithm takes as input a set of potential equalities $G$ and applies some 
  transformations until
  - it terminates after having transformed the set $G$ into an equivalent set of equalities
    $ G' = {x_1 mighteq t_1, ..., x_k mighteq t_k} $
    where $x_1, ..., x_k$ are all distinct variables and $t_1, ..., t_k$ are terms with no 
    occurences of $x_1,...,x_k$ (such that ${x_1,...,x_k} inter union.big_(i=1)^k "vars"(t_i) = emptyset$
    the set $G'$ directly defines a most general solution
      $[x_1 = t_1, ..., x_k = t_k]$
    to the unification problem $G$
  - or it fails (the potential equalities cannot be unified)
    We denote $G rho$ the set of potential equalities obtained b applying $rho$ to all terms in $G$
    $ {l_1 mighteq r_1, ..., l_n mighteq r_n} rho = {l_1 rho mighteq r_1 rho, ..., l_n rho mighteq r_n rho} $
  
])
*The unification algorithm applies the following steps:*
#greenbox("delete", [$G union {t mighteq t}$ is transformed into $G$])
#greenbox("decompose", [ $G union {f(t_1, ..., t_m) mighteq f(u_1, ..., u_m)}$ is transformed into $G union {t_1 mighteq u_1, ..., t_m mighteq u_m}$ ])
#greenbox("swap", [ $G union {f(t_1, ..., t_m) mighteq x}$ is transformed into $G union {x mighteq f(t_1, ..., t_m)}$ ])
#greenbox("eliminate", [ $G union {x mighteq t}$ is transformed into $G[x = t] union {x mighteq t}$ if $x in "vars"(G) and x in.not "vars"(t)$ ])
#redbox("conflict", [$G union {f(t_1, ..., t_m) mighteq g (u_1,..., u_h)}$ leads to failure if $f != g or m != h$ ])
#redbox("occur", [check: $G union {x mighteq f(t_1, ..., t_m)}$ leads to failure if $x in "vars"(f(t_1,...,t_m))$ ])
