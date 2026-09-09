#import "../lib.typ": *

= Lecture 3

== Vector Functions

#Definitionbox("Vector Functions", [
   $ arrow(r) : RR -> RR^n $

   #line(length: 100%)

   $arrow(r) = (t, f(t))$ _parametrizes_ the function: $y = f(x)$
])


=== Calculus with vector functions

let $arrow(r) = (f(t), g(t), h(t))$.

#let limta = $display(lim_(t -> a))$

- Domain of $arrow(r)(t)$ is the common domain of $f, g, h$
- Limit and continuity:

   $limta arrow(r)(t) = (limta f(t), limta g(t), limta h(t))$

   $arrow(r)(t)$ is continuous at $t = a$ if $limta arrow(r) (t) = arrow(r) (a)$
- Derivative:
   $ arrow(r)'(a) 
      = frac(d, d t) arrow(r) (t) |_(t = a) 
      = limta 1/(t - a) (arrow(r) (t) - arrow(r) (a))
      = (f'(a), g'(a), h'(a))
   $
- Integral:
   $
      integral_(t = a)^b arrow(r) (t) d t 
      = (integral_a^b f(t) d t, integral_a^b g(t) d t, integral_a^b h(t) d t)
   $

#Examplebox([
   Find a parametrization of the curve of intersection of the
   cylinder $x^2 + y^2 = 1$ and the plane $y + z = 2$.
   #align(center)[
      #image("../img/lect_3/cylinder.png", width: 50%)
   ]
   $
      z = 2 - y \
      (cos theta, sin theta, 2 - sin theta)
   $
])

== Hyperbolic trig functions

$
   cosh^2 t - sinh^2 t &= 1 \
   tanh^2 t + sech^2 t &= 1 \
   d / (d t) sinh t &= cosh t\
   d / (d t) cosh t &= sinh t
$

== Tangent lines of parametric plane curves

If $arrow(r) = x(t) arrow(i) + y (t) arrow(j)$ passes through $(x_0, y_0)$ at $t=t_0$ then
the slope of the tangent at $(x_0, y_0)$ can be computed using chain rule
$
   frac(d y, d x) = lr(frac(d y slash d t, d x slash d t)|)_(t = t_0)
$

== Differentiation rules for vector functions

#TheoremBox("", [
   - Constant rule: $d / (d t) lr([arrow(C)]) = 0$
   - Scalar multiplication rule: 
      $
         d/(d t) lr([arrow(u)(t)]) = c arrow(u)'(t) \
         d / (d t) lr([f(t) arrow(u)(t)]) = f'(t) arrow(u)(t) + f(t) arrow(u)'(t)
      $
   - Sum / difference rule: $d / (d t) lr([arrow(u)(t) + arrow(v)(t)]) = arrow(u)'(t) + arrow(v)'(t)$
   - Dot Product rule: $d / (d t) lr([arrow(u) (t) dot arrow(v) (t)]) 
      = arrow(u)'(t) dot arrow(v)(t) + arrow(u)(t) dot arrow(v)'(t)$
   - Cross Product rule: $d / (d t) lr([arrow(u)(t) times arrow(v)(t)])
      =arrow(u)'(t) times arrow(v)(t) + arrow(u)(t) times arrow(v)'(t)$
   - Chain rule: $d / (d t) lr([arrow(u)(f(t))]) = f'(t) arrow(u)'(f(t))$
   - $arrow(r)(t)$ is orthogonal to $arrow(r)'(t)$ for all $t$.
])
