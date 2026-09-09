#import "../lib.typ": *

= Lecture 7

#Definitionbox("Gradient of a function", [
   let $f(x, y)$ be a function with continuous partial derivatives at $(a, b)$.
   The gradient vector of $f$ at $(a, b)$ is
   $
      gradient f(a, b) = vec(
         f_x(a, b),
         f_y(a, b)
      ) 
   $
])

#TheoremBox("", [
   + $gradient f(a, b)$ is perpendicular to the tangent line of the level curve
     $f(x, y) = C$ where $C = f(a, b)$

   + $gradient f(a, b, c)$ is perpendicular to the tangent plane of the level surface
     $f(x, y, z) = C$ where $C = f(a, b, c)$

   #line(length:  100%)

   we can use the gradient vector to find the equations for:
   - Tangent planes to level surfaces
   - Tangent lines to level curves
   - Normal lines to level surfaces/curves
])

#Definitionbox("Directional Derivatives", [
   Let $P = (a, b)$ be a poiunt in the domain of $f(x, y)$.
   let $arrow(u)$ be a vector.
   $
      D_(arrow(u)) f(P) 
      = lim_(h -> 0) frac(f(arrow(P) + h arrow(u)) - f(arrow(P)), h) 
      = lim_(h -> 0) frac(f(a + h arrow(u)_1, b + h arrow(u)_2) - f(a, b), h)
   $
   when $arrow(u)$ is a unit vector we call $D_(arrow(u)) f (P)$ the directional derivative of $f$ at 
   $P$ in the direction of $arrow(u)$

   - $D_hat(i) f(a, b) = f_x (a, b)$
   - $D_hat(j) f(a, b) = f_y (a, b)$

   Directional derivative extends the notion of partial derivative

   #line(length: 100%)

   If $arrow(u)$ is a unit vector in $RR^2$ then $D_arrow(u) f(a, b)$
   is the slope of the tangent line to the curve obtained by
   cutting the graph $z = f(x, y)$ by the plane through
   $(a, b, f(a, b))$ containing $arrow(u)$ and $arrow(k)$

   #line(length: 100%)

   - $arrow(u)$ must be a unit vector to call this the directional derivative
   - this works in 3D
])

#TheoremBox("", [
   $ D_arrow(u) f (P) = arrow(u) dot gradient f (P) $
])

== Maximum and Minimum Values

let $f$ be a $C^2$ funciton (all the partial derivateives of $f$ exist and are
continuous up to order 2).

#Definitionbox("Critical point", [
   $(a, b)$ is a critical point of $f(x, y)$ if $f_x (a, b)$ and $f_y(a, b) = 0$
])

The tangent plane to the grah $z = f(x, y)$ at the point $(a, b, f(a, b))$ is parallel to the $x y$ plane
if $(a, b)$ is a critical point of $f$.

- local minimum: $f$ decreases in any direction
- local maximum: $f$ increases in any direction
- saddle: $f$ decreases in one direction and decreases in the other e.g. $z = x^2 - y^2$

#align(center)[
   #image("../img/lect_7/saddle.png", width: 50%)
]

#TheoremBox("Secound derivative test", [
   let $f(a, b)$ be a critical point of $f$
   $
      bold(D) = bold(D)(a, b) = mat( delim: "|",
         f_(x x)(a, b), f_(x y)(a, b);
         f_(y x)(a, b), f_(y y)(a, b);
      ) = (f_(x x) f_(y y) - f^2_(x y))(a, b)
   $
   - if $bold(D) > 0$ and $F_(x x)(a, b) > 0$ then $f$ has a local minimum at $(a, b)$
   - if $bold(D) > 0$ and $F_(x x)(a, b) < 0$ then $f$ has a local maximum at $(a, b)$
   - if $bold(D) < 0$ then $f$ has a saddle at $(a, b)$
   - if $bold(D) = 0$ then the test is inconclusive
])

#Definitionbox("Hessian", [
   $
      H(f) = mat(
         f_(x x), f_(x y), f_(x z);
         f_(t x), f_(y y), f_(y z);
         f_(z z), f_(z y), f_(z z);
      )
   $
   is the Hession of $f$. Assuming $f$ is $C^2$ all the mixed partial derivatives in $H(f)$ commute, so it is 
   a symmetric matrix.

   $H(f)$ is positive definite if all the following determinants are positive

   $
      H_1 = f_(x x), quad H_2 = mat(delim:"|", 
         f_(x x), f_(x y);
         f_(t x), f_(y y);
      ), quad
      H_3 = mat(
         f_(x x), f_(x y), f_(x z);
         f_(t x), f_(y y), f_(y z);
         f_(z z), f_(z y), f_(z z);
      )
   $
   $H(f)$ is negative definite if $-H(f)$ is positive definite.

   the signs of $H_1, H_2, H_3$ are $-, +, -$
])


#TheoremBox([Second derivative test for $f(x, y, z)$], [
   let $(a, b, c)$ be a critical point

   - If $H(f)(a, b, c)$ is positive definite then $f$ has a local _minimum_ at $(a, b, c)$
   - If $H(f)(a, b, c)$ is negative definite then $f$ has a local _maximum_ at $(a, b, c)$
   - If $D e t H(f)(a, b, c) != 0$ and $H(f)(a, b, c)$ is neither 
      positive nor negative definite then $f$ has a _saddle_ at $(a, b, c)$
   - If $D e t H(f)(a, b, c) == 0$ then the test is inconclusive
])

