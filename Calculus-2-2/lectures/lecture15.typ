#import "../lib.typ": *

= Lecture 15

#Definitionbox("Implicit surfaces", [
   A surface $S$ is defined by
   $ F(x, y, z) = C $
   Where $C$ is constant and $F$ is a $C^1$ function. We require $S$ to be a _smooth_ surface
   so it has a well defined tangent plane everywhere, so we also impose the condition
   $ gradient F(x, y, z) != 0 $
   Since $gradient F$ is a non-zero vector, one of its components must be non-zero at each point
   on $S$. Let $arrow(k)$ be the non-zero component, we can write $z$ as a function of $x, y$
   and parametrize $S$:
   $ arrow(r) (x, y) = vec(x, y, z(x, y)) $
   $
      arrow(r)_x &= vec(1, 0, frac(partial z, partial x)) = arrow(i) - (F_x)/(F_z) arrow(k)\
      arrow(r)_y &= vec(0, 1, frac(partial z, partial y)) = arrow(j) - (F_y)/(F_z) arrow(k) \
      arrow(r)_x times arrow(r)_y &= mat(delim: "|", 
         arrow(i), arrow(j), arrow(k);
         1, 0, - (F_x)/(F_z);
         0, 1, - (F_y)/(F_z);
      ) = (F_x)/(F_z) arrow(i) + (F_y)/(F_z) arrow(j) + arrow(k) \
      |arrow(r)_x times arrow(r)_y| &= frac(|gradient F|, |gradient F dot arrow(k)|)
   $
   if $gradient F$ has non-zero $arrow(j)$ ($F_y != 0$) :
   $
      arrow(r) (x, y) = vec(x, y(x, z), z)
      |arrow(r)_x times arrow(r)_y| &= frac(|gradient F|, |gradient F dot arrow(j)|)
   $
   same for non-zero $arrow(i)$
])

#TheoremBox("", [
   The area of an implicit surface $F(x, y, z) = C$ defined on domain $R$ is
   $
      "Area" = integral integral_S d S = integral integral_R frac(|gradient F|, |gradient F dot arrow(p)|) d A
   $
   Where $arrow(p) = arrow(i), arrow(j)$ or $arrow(k)$ so that $gradient F dot arrow(p) != 0$
])

#Definitionbox("Surface integrals", [
   The surface integral of a function $f$ on a surface $S$ which is parametrized by $arrow(r) : U -> RR^3$ is 
   $ integral integral_S f(x, y, z) d S = integral integral_U f(arrow(r)(u, v)) |arrow(r)_u times arrow(r)_v| d A $
   this is independent of the parametrization of $S$.
])

#Definitionbox("Orientation of Surfaces", [
   An orientation on a surface $S$ is a choice of a unit vector field 
   $arrow(n)$ which is continuous and perpendicular to the tangent place to $S$ at each point on $S$

   #line(length: 100%)

   not every surface is orientatable (e.g. mobius strip)
])

#Definitionbox("Flux across a surface", [
   Let $S$ be a surface oriented by the unit normal $arrow(n)$. Let $arrow(F)$ be a continuous
   vector field defined on $S$. the flux of $arrow(F)$ across $S$ is defined
   $ "Flux" = integral integral_S arrow(F) dot arrow(n) d S $

   #Notationbox([
      The flux integral is also denoted by 
      $ integral integral_S arrow(F) dot d arrow(S) $
   ])
])

#pinkbox("Flux across an implicit surface", [
   If $S$ is the level surfae $g(x, y, z) = C$ and $arrow(p)$ is one of the unit vectors 
   $arrow(i), arrow(j), arrow(k)$ satisflying $gradient g dot arrow(p) != 0$ then
   $ arrow(n) = plus.minus (gradient g)/(|gradient g|) $
   where $plus.minus$ sign depends on whether $gradient g$ gives the correct orientation on $S$
   $
      d arrow(S) = arrow(n) d S = plus.minus (gradient g)/(|gradient g dot arrow(p)|) d A \
      integral integral_S arrow(F) dot arrow(n) d S 
      = plus.minus integral integral_R arrow(F)  (gradient g)/(|gradient g dot arrow(p)|) d A 
   $
])

#Definitionbox("Compatible orientations", [
   A surface and its boundary curve are compatibly oriented if the vector $arrow(T) times arrow(n)$
   points out of the surface at every point on th ecurve where $arrow(T)$ is the unit tangent
   of the curve and $arrow(n)$ the unit normal of the surface.
])

#TheoremBox("Stokes' Theorem", [
   Suppose $S$ is an oriented surface and $C$ is its boundary curve which is compatibly oriented.
   Let $arrow(F)$ be a $C^1$ vector field on $S$
   $
      integral_C arrow(F) dot arrow(T) d s 
      = integral integral_S (gradient times arrow(F)) dot arrow(n) d S
   $
])

#redbox("Corollary", [
   If $S$ is a closed surface (without boundary) and $arrow(F)$ is a $C^1$ vector field then
   $ integral integral_S gradient times arrow(F) dot arrow(n) d S = 0 $
])

#TheoremBox("Divergence theorem", [
   Recall that the divergence of the vector field
   $ arrow(F)(x, y, z) = vec(M(x, y, z), N(x, y, z), P(x, y, z)) $
   is
   $ gradient dot arrow(F) = (partial M)/(partial x) + (partial N)/(partial y) + (partial P)/(partial z) $

   Let $D$ be a region in $RR^3$. Suppose the surface $S$ is the boundary of $D$ and is
   oriented by an outward normal $arrow(n)$. For every $C^1$ vector field $arrow(F)(x, y, z)$ on
   $D$:
   $
      integral integral_S arrow(F) dot arrow(n) d S 
      = integral integral integral_D gradient dot arrow(F) d V
   $

   *physical interpretation of $gradient dot arrow(F)(p)$*: average flux of $arrow(F)$ out of a small ball centered at $p$
])
