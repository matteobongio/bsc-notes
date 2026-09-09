#import "../lib.typ": *

= Lecture 4


#Definitionbox("Arc length of a parametric curve", [
   Arc length of the curve $C$ parametrized by the smooth (derivative exists, and is continuous)
   function $arrow(r)(t) = (x(t), y(t), z(t))$ for all $a <= t <= b$ is given by:

   $
      "Length" &= integral_a^b sqrt(
         (frac(d x, d t))^2
         + (frac(d y, d t))^2
         + (frac(d z, d t))^2
      ) d t \
      &= integral_a^b |arrow(r)'(t)| d t
   $

   #line(length: 100%)

   *Special Case:* length of graphs

   If $C$ is parametrized by: $(t, f(t))$ Then 

   $
      "Length" = integral_a^b sqrt(1 + (f'(t))^2) d t $
])

== Re-parametrizing curves

Suppose a curve $C$ is parametrized by $arrow(r)(t)$ for $a <= t <= b$. Say $f(u)$
is an increasing function on $[c, d]$ with $f(c) = a$ and $f(d) = b$. Then by substituting 
$t = f(u)$ we get the new vector function $arrow(r)(f(u)), c <= u <= d$, which has the same image
$C$.

#purplebox("",[Any smooth parametric curve can be parametrized by its arc length])

#Definitionbox("", [
   We say that $arrow(r)(t)$ for $a <= t <= b$ is an arclength parametrization if
   $|r'(t)| = 1$ for all $t in [a, b]$

   //TODO:
   = TODO

   characterization of arclegth parametrization

   what does it mean to differenetiate with respect to s?
])

== Unit tangent and curvature

#Definitionbox("Unit Tangent", [
   Let $C$ be a curve parametried with the arc length by the smooth function $arrow(r)(s)$.
   $|arrow(r)'(s)| = 1$ so, $arrow(T)(s) = arrow(r)'(s) = frac(arrow(r)(t), |arrow(r)(t)|)$
   is the _unit tangent vector_ to $C$ at each point.
   #redbox("", [$|arrow(T)(s)| = 1$ for all $s$ implies $arrow(T)(s) dot arrow(T)'(s) = 0$])
])

#Definitionbox("Curvature", [
   Let $C$ be a curve parametrized with the arc length by the smooth function $arrow(r)(s)$.
   $arrow(T)(s) = arrow(r)'(s)$ is the unit tangent vector.

   The _curvature_ is:
   $
      kappa(s) = lr(|(d arrow(T)) / (d s)|)
   $
])

*properties of curvature:*
- $kappa = 0$ iff $C$ is a part of a line
- all circles have a constant $kappa = 1/"radius"$ 
- if $kappa$ is non-zero constant and $C$ lies in a plane then $C$ must be part of a circle


#Definitionbox("Principal unit normal", [
   Assuming $kappa(s) != 0$ for all $s$. The principal unit normal is:
   $
      arrow(N)(s) = 1 / (kappa(s)) arrow(T)'(s)
   $

   - $arrow(N)(s)$ is a unit vector such that $arrow(N)(s) bot arrow(T)(s)$ for all $s$
   - If $C$ is a plane curve then $arrow(N)(s)$ points inward towards the direction of the bend
])

#Definitionbox("Binormal", [
   $ arrow(B)(s) = arrow(T)(s) times arrow(N)(s) $
   - $|arrow(B)(s)| = |arrow(T)(s)| |arrow(N)(s)|$ since $arrow(T) bot arrow(N)$
   - $arrow(B)$ is a unit vector perpendicular to both $arrow(T)$ and $arrow(N)$ for all $s$
])


#yellowbox("", [
   The triplet $arrow(T), arrow(N), arrow(B)$ is called the _Frenet frame_ of the curve $C$
])

#Definitionbox("Torsion", [
   $ (d arrow(B)) / (d s) = - tau (s) arrow(N) (s) $
   = TODO: what is $tau$
   
   - A plane curve with non-vanishing curvature has zero torsion
   - if the torsion of a curve is dentically zero, then the curve belongs to a fixed plane
   - A helix has constant non-zero curvature and torsion. It is th only curve with these properties
])

#TheoremBox("Frenet formulas", [
   For any smoothly parametrized curve with the arc length parameter $s$, with $kappa(s) != 0$
   for all $s$, the derivatives of the _Frenet frame_ are given as follows:

   $
      frac(d arrow(T), d s) &= kappa (s) arrow(N)(s) \
      frac(d arrow(N), d s) &= - kappa(s)arrow(T)(s) + tau(s)arrow(B)(s)\
      frac(d arrow(B), d s) &= - tau(s) arrow(N)(s)\
   $
])

#pinkbox("Observatios about the helix", [
   - Torsion is positive when the helix is right handed $(b > 0)$ and negative when it is 
      left handed $b < 0$
   - If we fix $b -> 0$ the helix is tightly wound and becomes almost planer $tau -> 0$
   - If we let $b -> infinity$ the helix looks like a straight line and again almost planer
   - The maximum torsion is achieved when $b = a$
])


#TheoremBox("Curvature in arbitrary parametrizations", [
   Assume the curve $C$ is parametrized by $arrow(r)(t)$ where $t$ is not necessarily the arc
   length parameter. Then the curvature of $C$ is given by

   $
      kappa(t) = frac(|arrow(r)'(t) times arrow(r)''(t)|, |arrow(r)'(t)|^3) \
      "physics": lr((frac(|arrow(v)(t) times arrow(a)(t)|, |arrow(v)(t)^3|)))
   $
])


== Circle of curvature for plane curves

Let $P$ be a point on a plane curve with $kappa != 0$ at $P$. The circle of curvature 
(osculating circle) for the curve at $P$ is the circle in the plane of the curve that
+ is tangent to the curve at $P$,
+ has the same curvature the curve has at $P$,
+ lies toward the concave side of the curve

Radius if the isculating circle is:
$ rho = 1 / kappa $
where $kappa$ is the curvature at $rho$, the center is:
$ "Center" = arrow(Rho) + 1 / kappa arrow(N) $

#yellowbox("Frenet Triplet in arbitrary parametrixation", [
   let $C$ be a space curve smoothly parametrized by $arrow(r)(t)$
   $
      arrow(T)(t) &= frac(arrow(r)'(t), | arrow(r)'(t) |) \
      arrow(N)(t) &= frac(arrow(T)'(t), | arrow(T)'(t) |) \
      arrow(B)(t) &= arrow(T)(t) times arrow(N)(t) \
      kappa(t) &= frac(arrow(T)'(t), arrow(r)'(t))
   $
])

$
   tau(t) = frac(arrow(r)'(t) dot (arrow(r)''(t) times arrow(r)'''(t)), |arrow(r)'(t) times arrow(r)''(t)|^2)
$
whenever $|arrow(r)'(t) times arrow(r)''(t)| != 0$, equiv. $kappa(t) != 0$


#pinkbox("Planes", [
   - *Osculating plane*: contains $arrow(T)$ and $arrow(N)$ at $P$
   - *Rectifying plane*: contains $arrow(T)$ and $arrow(B)$ at $P$
   - *Normal plane*: contains $arrow(N)$ and $arrow(B)$ at $P$
])


#Examplebox("Tangential and notmal component of acceleration", [
   if we think of parametrization as a motion

   $
      arrow(r)(t) &: "position of a particle at time" t \
      arrow(v)(t) = arrow(r)'(t) &: "velocity of a particle at time" t \
      |arrow(v)(t)| = |arrow(r)'(t)| &: "speed of a particle at time" t \
      arrow(a)(t) = arrow(v)'(t) = arrow(r)''(t) &: "acceleration at time" t \
   $

   = TODO: write v and a in T N B frame
])
