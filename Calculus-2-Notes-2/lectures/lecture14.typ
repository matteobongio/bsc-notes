#import "../lib.typ": *

= Lecture 14

#TheoremBox("Green's Theorem (circulation-curl form)", [
   Let $C$ be a simple closed curve oriented counter-clockwise bounding the region $R$
   on the $x y$-plane let $M(x, y), N(x, y)$ be $C^1$ functions on $R$

   $
      integral_C M(x, y) d x + N(x, y) d y 
      &= integral integral_R (frac(partial N, partial x) - frac(partial M, partial y)) d A \
      &= integral integral_R gradient times arrow(F) dot arrow(k) d A 
      "(flux of" gradient times arrow(F) "across" R ")" \
      integral_C arrow(F) dot d arrow(r) 
      &= integral integral_R gradient times arrow(F) dot arrow(k) d A 
   $
])

#TheoremBox("Flux-divergence form of Green's theorem", [
   $
      integral_C M(x, y) d y - N(x, y) d x
      &= integral integral_R (frac(partial M, partial x) + frac(partial N, partial y)) d A \
   $
   *LHS is the flux of the vector field*

   #Definitionbox("", [
      For any vector field 
      $  
         arrow(G)(x, y, z) = 
         tilde(M)(x, y, z) arrow(i) 
         + tilde(N)(x, y, z) arrow(j) 
         + tilde(P)(x, y, z) arrow(k)
      $
      its divergence (scalar) is 
      $
         gradient dot arrow(G) =
         frac(partial tilde(M), partial x) +
         frac(partial tilde(N), partial y) +
         frac(partial tilde(P), partial z)
      $
   ])
   Since $F$ depends only on $x$ and $y$ and has no $arrow(k)$ component its integral is the double
   integral of $gradient dot arrow(F)$

   $
      integral_C arrow(F) dot arrow(n) d s = integral integral_R gradient dot arrow(F) d A
   $
])

#purplebox("Parametrization of Surfaces", [
   Let $S$ be a surface in $RR^3$. A parametrization for $S$ is an one to one map
   $ arrow(r): R -> S $
   where $R subset.eq RR^2$
   $ arrow(r)(u, v) = f(u, v) arrow(i) + g(u, v) arrow(j) + h(u, v) arrow(k) $
])

#yellowbox("Surface area of a parametrix surface", [
   $ Delta S approx |arrow(r)_u times arrow(r)_v| Delta u Delta v $
   $S$ is a _smooth_ surface if it admits a parametrization such that 
   $arrow(r)_u$ and $arrow(r)_v$ are continuous and
   $arrow(r)_u times arrow(r)_v$ is never 0

   In that case:
   $
      "Area"(S) = integral integral_R |arrow(r)_u times arrow(r)_v| d u d v = integral integral_S d S
   $
])

#greenbox("Surface areas of graphs", [
   let $D$ be a subset of $RR^2$ and let $f : D -> RR$ be a $C^1$ function.
   We can parametrize the graph of $f$ by
   $ arrow(r)(x, y) = x arrow(i) + y arrow(j) + f(x, y) arrow(k) "for" (x, y) in D $
   $ "Area" = integral integral_D |arrow(r)_u times arrow(r)_v| d A = integral integral_D sqrt(1 + f_x^2 + f_y^2) thin d A $
])
