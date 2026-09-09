#import "lib.typ": *
#let title = [Calculus 2]
#set page(
   paper: "a4",
   header: align(left, title),
   numbering: "1",
)

#align(center, text(17pt)[
   *#title*

   Matteo Bongiovanni\
])


= Calculus 2

#rainbowbox("Learning Outcomes", [
   + represent a given periodic function using its Fourier series by finding the Fourier coefficients
   + accurately depict and compute the dot product and the cross product of vectors, and understand what a vector field is
   + formulate the definition of continuity for vector valued and multivariable functions, and check continuity for such functions
   + develop a firm understanding of differentiability for vector valued and multivariable functions including partial and directional derivatives
   + compute partial and directional derivatives from the definition, linear approximations, determine the tangent plane of the graph of a multivariable function, and apply the chain rule
   + determine extrema of multivariable functions, including constrained extrema using the method of Lagrange multipliers, and, for functions of two variables, classify critical points using the Hessian
   + understand change of coordinates Cartesian, polar, spherical and cylindrical coordinates
   + compute the lengths of parametric curves, reparametrize curves by arclength and compute the scalar curvature of a curve
   + apply the implicit function theorem and the integral theorems of Green, Stokes, and Gauss
   + compute double and triple integrals representing surface and volumes of shapes, respectively
])

// #include "book/book notes 1.typ"

#include "lectures/lecture1.typ"

#include "lectures/lecture2.typ"

#include "lectures/lecture3.typ"

#include "lectures/lecture4.typ"

#include "lectures/lecture5.typ"

#include "lectures/lecture6.typ"

#include "lectures/lecture7.typ"

#include "lectures/lecture8.typ"

#include "lectures/lecture9.typ"

#include "lectures/lecture10.typ"

#include "lectures/lecture11.typ"

#include "lectures/lecture12.typ"

#include "lectures/lecture13.typ"

#include "lectures/lecture14.typ"

#include "lectures/lecture15.typ"

= Extras
#columns(2)[
   $
   (v / u)' = frac(v u' - u v', v^2) \
   "proj"_(arrow(a))arrow(b) = frac(arrow(a) dot arrow(b), ||arrow(a)||^2) arrow(a) \
   "comp"_(arrow(a))arrow(b) = frac(arrow(a) dot arrow(b), ||arrow(a)||) = ||arrow(b)|| cos theta \
   ||arrow(v) times arrow(w)|| = ||arrow(v)|| ||arrow(w)|| sin theta \
   arrow(v) dot ||arrow(v) times arrow(w)|| = "area of parallel-piped" \
   ||arrow(v) times arrow(w)|| = 0 => arrow(v) parallel arrow(w) \
   "parametric equation of a line": \
   t = frac(x - x_0, a) = frac(y - y_0, b)= frac(z - z_0, c) \
   vec(x, y, z) = vec(x_0, y_0, z_0) + t vec(a, b, c) \
   arrow(T)'(s) = arrow(r)'(s) = (arrow(r)'(t)) / (||arrow(r)'(t)||) \
   kappa(s) = ||arrow(T)'(s)|| = frac(||arrow(r)'(t) times arrow(r)''(t)||, ||arrow(r)'(t)||^3) \
   arrow(N)(s) = frac(arrow(T)'(s), kappa(s)) \
   arrow(N)(t) = frac(arrow(T)'(t), ||arrow(T)'(t)||) \
   arrow(B)(s) = arrow(T) (s) times arrow(N)(s) \
   "Length" = integral_a^b sqrt((frac(d x, d t))^2 + (frac(d y, d t))^2 + (frac(d z, d t))^2) d t \
$
$
   "find critical points":\
   (f_(x x) f_(y y) - f^2_(x y)) 
   cases(
      > 0 and F_(x x) > 0 => "local max",
      > 0 and F_(x x) < 0 => "local min",
      < 0 "saddle",
      = 0 "inconclusive"
   )\
   "Fourier Series": \
   f(t) = a_0/2 + sum_(n = 1)^infinity a_n cos(n omega t) + b_n sin(n omega t) \
   omega = (2 pi)/T \
   a_n = 2/T integral_(- T/2)^(T/2) f(t) cos(n omega t) d t quad n=0,1,2,... \
   b_n = 2/T integral_(- T/2)^(T/2) f(t) sin(n omega t) d t quad n=1,2,3,... \
   "Even function have no sin terms," \ " Odd functions have no cos terms" \
   "Ellipse":
   x^2/a^2 + y^2/b^2 = 1 quad arrow(r)(t) = vec(a cos(t) + x_0, b sin(t) + y_0)
   $

   Limits:
   does not exists if
- different along different paths
- deendent on angle when using polar coordinates

]

#bibliography("bib.bib", full: true)
