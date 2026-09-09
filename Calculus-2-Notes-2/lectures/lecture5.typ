#import "../lib.typ": *

= Lecture 5

#Definitionbox("Level Curves", [
   Level curves are defined by
   $ f(x, y) = C $
   $C$ is a constant in the range of $f$
])

== Functions of three variables

the graph is in 4D, so we visualize by drawing their level surfaces

#Definitionbox("Level Surface", [
   For any constant C in the range of $f$ the solution set of the equation   
   $ f(x, y, c) = C $
   is called a level surface of $f$
])

== Limits and continuity 
#let limxyab = $lim_((x, y) -> (a, b))$
#Definitionbox("", [
   We say that $f(x, y)$ is continuous at $(a, b)$ if
   $ limxyab f(x, y) = f(a, b) $

   *properties*

   $
      limxyab f(x, y) = L and limxyab g(x, y) = M \
      limxyab (f (x, y) + g(x, y)) = L + M \
      limxyab (k f (x, y)) = k L \
      limxyab (f (x, y) g(x, y)) = L M \
      limxyab ((f (x, y)) / g(x, y)) = L M "if" M != 0 \
   $
])

#TheoremBox("", [
   if $limxyab f(x, y) = L$ and $g$ is a single variable function which is
   continuous at $L$ then
   $ limxyab g(f(x, y)) = g(L) $
]) 

#TheoremBox("Squeezing Theorem", [
   if $f(x, y) <= g(x, y) <= h(x, y)$ for every point in an open disk containing $(a, b)$
   (except posibly at $(a, b)$) and if

   $ limxyab f(x, y) = limxyab h(x, y) = L $
   then

   $ limxyab g(x, y) = L $

])


== How to show that a limit does not exist

*Two paths test for non-existence*:

#purplebox("", [
   if $limxyab f(x, y) = L$ exists then $f(x, y) -> L$ as $(x, y) -> (a, b)$
   along any path approaching $(a, b)$
])

therefor if you can find 2 paths such that 
- $f(x, y) -> L_1$ as $(x, y) -> (a, b)$ along $C_1$
- $f(x, y) -> L_2$ as $(x, y) -> (a, b)$ along $C_2$
- $L_1 != L_2$

then $limxyab f(x, y)$ does not exist
