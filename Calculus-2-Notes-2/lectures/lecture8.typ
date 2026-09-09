#import "../lib.typ": *

= Lecture 8



#TheoremBox("Absolute Extrema", [
   Every continuous function that is defined on a closed and bounded interval $[a, b]$
   attains both its absolute maximum and minimum.
])


#Definitionbox([closed and bounded subsets of $RR^n$], [
   let $epsilon > 0$

   Let $S$ be a region in $RR^n$ we call a point $P$ in $RR^n$ a boundary point of $S$
   if every $epsilon$-neighborhood of $P$ contains beoth points from $S$ 
   and points outside of $S$.

   #line(length: 100%)

   We say a region is closed if it contains all of its boundary points

   #line(length: 100%)

   We say that a region $S$ is bounded if there is a number $R>0$ such tht $S$ lies completely inside a
   disk (or ball) of radius $R$
])


#TheoremBox("Absolute Extrema", [
   Every continuous function that is defined on a closed and bounded subset of $RR^n$
   attains both its absolute maximum and minimum.
])

*How to find the extreme values of a function*

suppose $f(x, y)$ uis a $C^1$ function ($f, f_x, f_y$ are all continuous)
defined over a closed and bounded region $S$ in $RR^2$. Then in order to find
the absolute extreme values of $f$, we apply the following procedure
+ find all interior critical points of $f$
+ restrict $f$ to the boundary of $S$ and find all boundary critical points
+ detect the corners of the boundary
+ compare the values of $f$ at those points



*Lagrange Multipliers*

We want to find the extreme values of a function $f(x, y)$ subject to a constraint $C: g(x, y) = K$
this means that we only look at the values of $f(x, y)$ on the curve $C$

To determine the critical points of $f$ on $C$, check whether $gradient f$ has a tangential 
component at each point $(x, y)$ on $C$

If $gradient f$ has a non-zero tangential component $arrow(T)$ at $P$ then as we move in its direction
values of $f$ increase and vice versa for $- arrow(T)$

Hence the point $P$ on $C$ cannot be a local minimum or maximum if $gradient f$ has a non-zero tangential component
to $C$

the natural canditates for local minimum and maximum are the points where $gradient f(P)$ is perpendicular to the tangent line.

Since $gradient g(Q)$ is also perpendicular to the tangent line to $C$ at $Q$, $gradient f(Q)$ and $gradient g(Q)$ are parallel

$ gradient f(Q) = lambda gradient g(Q) $

#pinkbox("Summary", [
   in order to find all candidates of local minimum and maximum of $f(x, y)$ subject to the constraint $g(x, y) = k$,
   look at all the solutions of
   $
      gradient & f(x, y) = lambda gradient g(x, y) \
      &g(x, y) = k
   $
   with unknowns $x, y, lambda$

   similarly, for the extremes on a level surface:
   $
      gradient & f(x, y, z) = lambda gradient g(x, y, z) \
      &g(x, y, z) = k
   $
   
   #redbox("", [
      this will give you all the possible candidates of maximum and minimum, but you still need to 
      justify why they exist (e.g. by the extreme value theorem)
   ])
])
