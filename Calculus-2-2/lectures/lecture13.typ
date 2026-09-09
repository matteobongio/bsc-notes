#import "../lib.typ": *

= Lecture 13

#Definitionbox("Line integrals of scalar functions", [
   Let $C$ be a curve parametrized by

   $ arrow(r)(t) = vec(x(t), y(t), z(t)), "for" a <= t <= b $

   Let $f(x, y, z)$ be a continuous function defined near $C$. we define the line integral of $f$
   on $C$ by

   $
      integral_C f(x, y, z) d s &= integral_(t = a)^b f(x(t), y(t), z(t)) 
      sqrt( ((d x)/(d t))^2 + ((d y)/(d t))^2 + ((d z)/(d t))^2) d t \
      &= integral_(t = a)^b f(arrow(r)(t))|arrow(r)'(t)| d t
   $

   #line(length: 100%)

   *Properties of the line integral*

   + independent of the parametrization, we get the same result for all parametrizations
   + $integral_(C_1) f d s$ and $integral_(C_2) f d s$ need not be equal for different paths $C_1, C_2$
   + If $C = C_1 union C_2 union ...$ is obtained by concatination
      $
         integral_C f d s = integral_(C_1) f d s + integral_(C_2) f d s + ...
      $
])

*Area of cylindrical surfaces by line integrals*

when $C$ is a plane curve and $f(x, y) >= 0$ the line integral
$integral_C f(x, y) d s$ gives the surface area of the cylindrical surface with base $C$ and
height $f$


#Definitionbox("Vector Fields", [
   A vector field is an assignment of a vector to each point in its domain.
   $ arrow(F)(x, y, z) = vec( M(x, y, z), N(x, y, z), P(x, y, z)) $
   Where $M,N,P$ are scalar functions of 3 variables. A _vector field_ is continuous
   if all its component functions are continuous (same goes for $C^1, C^2$, etc)
])


#Definitionbox("Line integral of a vector field", [
   The line integral of a vector field $arrow(F)$ along a curve $C$ is defined by
   $ integral_C arrow(F) dot arrow(T) d s $
   where $arrow(T)$ is the unit tanget of $C$

   since $arrow(T)$ is a unit vector $arrow(F) dot arrow(T)$ gives the component of $arrow(F)$
   tangential to $C$ at each point on $C$. Hence we can think of $integral_C arrow(F) dot arrow(T)$
   as the integral of the tangential component of $arrow(F)$ on $C$.
])

#pinkbox([How to compute $integral_C arrow(F) dot arrow(T) d s$], [
   we need to know a parametrization $arrow(R), "for" a <= t <= b, "of" C$.
   $
      arrow(T)(t) = frac(arrow(r)'(t),|arrow(r)'(t)|)
   $

   And the arclength integration element is 
   $ d s = |arrow(r)'(t)| d t $
   Hence
   $
      integral_C arrow(F) dot arrow(T) d s 
      = integral_(t = a)^b arrow(F)(arrow(r)(t)) dot arrow(r)'(t) d t
   $

   #Notationbox([
      $
         integral_C arrow(F) dot d arrow(r) 
         = integral_(t = a)^b arrow(F)(arrow(r)(t)) dot frac(d arrow(r), d t) d t
      $
      Where $arrow(r)(t)$ for $a <= t <= b$ is a parametrization for $C$  
   ])

   $
      integral_C arrow(F) dot arrow(T) d s = integral_C arrow(F) dot d arrow(r)
   $

   #line(length: 100%)

   + changing the orientation on $C$ corresponds to changing the bounds of 
      $ integral_a^b arrow(F)(arrow(r)(t)) d t -> integral_b^a arrow(F)(arrow(r)(t)) d t $
      $ integral_(-C) arrow(F) dot arrow(T) d s = - integral_C arrow(F) dot arrow(T) d s $
   + The value of the line integral $integral_C arrow(F) dot arrow(T) d s$ is independent
      of the parametrization of $C$, as long as it gives the correct orientation
])


#yellowbox([Line integrals with respect to $d x, d y, d z$], [
   define three vector fields
   $
      F_1(x, y, z) = M(x, y, z) arrow(i) \
      F_2(x, y, z) = N(x, y, z) arrow(j) \
      F_3(x, y, z) = P(x, y, z) arrow(k)
   $
   consider the parametric curve
   $ arrow(r)(t) = x(t) arrow(i) + y(t) arrow(j) + z(t) arrow(k) $
   for $a <= t <= b$
   $
      integral_C arrow(F)_1 dot d arrow(r) &= integral_(t = a)^b M(x(t), y(t), z(t)) (d x)/(d t) d t \
      integral_C arrow(F)_1 dot d arrow(r) &= integral_C M(x, y, z) d x \
      integral_C arrow(F)_2 dot d arrow(r) &= integral_C N(x, y, z) d x \
      integral_C arrow(F)_3 dot d arrow(r) &= integral_C P(x, y, z) d x \
      arrow(F)(x, y, z) &= vec(M(x, y, z), N(x, y, z), P(x, y, z)) \
      integral_C arrow(F) dot d arrow(r) &= integral_C M(x, y, z) d x + N(x, y, z) d x + P(x, y, z) d x \
   $
])

#TheoremBox("Jordan Curve Theorem", [
   Every _simple_ (does not cross itself), _closed_ (initial and final points are the same)
   *plane* curve splits $RR^2$ into two regions: inside and outside
])

#Definitionbox("Outward normal", [
   The outward normal of a simple closed pane curve $C$ is a unit vector field $arrow(n)$
   on $C$ which is orthogonal to the tangent line of $C$ at each point of $C$
])

#Definitionbox("Flux accross a simple closed curve", [
   Suppose $C$ is a simple closed curve with outward normal field $arrow(n)$ the integral
   $ integral_C arrow(f) dot arrow(n) d s $
   is called the flux of $arrow(F)$ across $C$

   #line(length: 100%)

   If $arrow(F)$ represents the velocity field of a fluid flow, the flux of $F$ across $C$
   measures how much net fluid escapes outside of $C$. If the flux is negative then more fluid
   goes inside.
])

#pinkbox("How to compute the flux integral", [
   Suppose $arrow(F)(x, y) = vec(M(x, y), N(x, y))$ and the simple closed plane curve
   $C$ is given by the arclength parametrization
   $ arrow(r)(s) = vec( x(s), y(s)) "for" 0 <= s <= b $
   Assume the induced orientation of $C$ is counter clockwise. The unit normal of $C$ can
   be found by $arrow(n) = arrow(T) times arrow(k)$
   $
      arrow(T) &= arrow(r)'(s)  \
      arrow(n) &= arrow(T) times arrow(n) \
      integral_C arrow(F) dot arrow(n) d s 
      &= integral_(s = 0)^b vec( M(x(s), y(s)), N(x(s), y(s))) dot vec( (d y)/(d s), -(d x)/(d s)) d s \
      &= integral_(s = 0)^b ( M(x(s), y(s)) (d y)/(d s) - N(x(s), y(s))(d x)/(d s)) d s\
      &= integral_C M d y - N d x
   $
])


#greenbox("Comparison of the circulation and the flux", [
   If $arrow(F)(x, y) = vec(M(x, y), N(x, y))$ and $C$ is a simple closed plane curve
   orientated counter clockwise then
   $ integral_C M(x, y) d x + N(x, y) d y $
   is the circulation of $arrow(F)$ through $C$
   $ integral_C M(x, y) d y - N(x, y) d x $
   is the outward flux of $arrow(F)$ accross $C$
])


#Definitionbox("Conservative fields", [
   Let $arrow(F)$ be a vector field on a region $D$. $arrow(F)$ is a conservative field
   if the line integral $integral_C arrow(F) dot d arrow(r)$ depends only on the end points of $C$
   if $C_1, C_2$ are paths with the same end points then
   $ integral_C_1 arrow(F) dot d arrow(r) = integral_C_2 arrow(F) dot d arrow(r) $

   #redbox("How to determine if F is a conservative vector field", [
      $ 
         F = f_x arrow(i) + f_y arrow(j) \
         frac(partial f_x, partial y) - frac(partial f_y, partial x) = 0
      $
   ])
])

#TheoremBox("The fundamental theorem for line integrals", [
   If there exists a differentiable function $F(x, y, z)$ such that $arrow(F)(x, y, z) = gradient f(x, y, z)$
   for all $(x, y, z) in D$. in this case, all curves in $D$ connecting the point $A$ to $B$:
   $ integral_C arrow(F) dot d arrow(r) = f(B) - f(A) $
])

#Definitionbox("Potential Function", [
   If $arrow(F)(x, y, z) = gradient f(x, y, z)$ for all for all $(x, y, z) in D$, $f$ is a 
   potential function for $arrow(F)$
])

#TheoremBox("Equivalent characterizations of conservative vector fields", [
   Le $D$ be a conneected region in $RR^3$, these properties are equivalent
   - $arrow(F)$ is conservative on $D$
   - $arrow(F) = gradient f$ for some function $f$ on $D$
   - $integral.cont_C arrow(F) dot d arrow(r) = 0$ around any closed loop $C$
])

#Definitionbox("Curl", [
   let $arrow(F)(x, y, z)$ be a $C^1$ vector field given by
   $ arrow(F)(x, y, z) = M(x, y, z) arrow(i) + N(x, y, z) arrow(j) + P(x, y, z) arrow(k) $

   the _curl_ of $arrow(F)$ is
   $
      gradient times arrow(F) &= mat(delim:"|",
         arrow(i), arrow(j), arrow(k);
         partial/(partial x), partial/(partial y), partial/(partial z);
         M, N, P;
      )  \
      &= 
      (frac(partial P, partial y) - frac(partial N, partial z)) arrow(i) +
      (frac(partial P, partial x) - frac(partial M, partial z)) arrow(j) +
      (frac(partial N, partial x) - frac(partial M, partial y)) arrow(k) \
   $

   $arrow(F)$ is _irrotational_ if $gradient times arrow(F) = 0$
])

#purplebox([What $gradient times arrow(F)$ measures], [
   For any unit vector $arrow(u)$ the quatity $gradient times arrow(F) dot arrow(u)$
   measures how much $arrow(F)$ is rotational on the plane perpendicular to $arrow(u)$
])

#TheoremBox("The curl of the gradient is always zero", [
   $ gradient times (gradient f) 
      &= gradient times (f_x arrow(i) + (f_y arrow(j) + (f_z arrow(k)) \
      &= mat(delim:"|",
         arrow(i), arrow(j), arrow(k);
         partial/(partial x), partial/(partial y), partial/(partial z);
         f_x, f_y, f_z;
      ) \
      &= (f_(z y) - f_(y z)) arrow(i) - (f_(z x) - f_(x z)) arrow(j) + (f_(x y) - f_(y x)) arrow(k) \
      &= arrow(0) $
])

#Definitionbox("Simply Connected", [
   a region is simply connected if every closed curve continuously shrinks to a points
])

#TheoremBox("", [
   A $C^1$ vector field $arrow(F)$ on a simply connected domain $D$ is conservative iff 
   $gradient times arrow(F) = 0$
])

#pinkbox("Finding a potential function", [
   If $arrow(F)$ is conservative, we can find a potential function by solving a partial differential equation
   $
      arrow(F)(x, y, z) &= M(x, y, z) arrow(i) + N(x, y, z) arrow(j) + P(x, y, z) arrow(k) \
      gradient f(x, y, z) &= frac(partial f, partial x)(x, y, z) arrow(i)
      + frac(partial f, partial y)(x, y, z) arrow(j) 
      + frac(partial f, partial z)(x, y, z) arrow(k) \
   $
   Hence $arrow(F) = gradient f$ implies the unknown function $f$ satisfies:
   $
      frac(partial f, partial x) = M\
      frac(partial f, partial y) = N \
      frac(partial f, partial z) = P
   $

   if a solution exists these determine $f$ uniquely up to adding a constant
])
