#import "../lib.typ": *

= Lecture 12

#pinkbox("Change of variables in multiple integrals", [
   Let $S$ and $R$ be subsets of $RR^2$. A transformation from $S$ to $R$ is a map
   $T : S -> R$ which is 1 to 1 and onto. $T$ is a $C^1$ transformation if 
   $T(u, v)=(x(u, v), y(u, v))$ and both $x(u, v)$ and $y(u, v)$ have continuous 
   first order partial derivatives.

   #image("../img/lect_12/transformations.png")
])

#Definitionbox("Jacobian of a transformation", [
   The Jacobian of $T$ is
   $
      frac(partial(x, y), partial(u, v)) = 
      mat(delim:"|", 
         frac(partial x, partial u), frac(partial x, partial v);
         frac(partial y, partial u), frac(partial y, partial v);
      ) =
      frac(partial x, partial u) frac(partial y, partial v) 
      - frac(partial x, partial v) frac(partial y, partial u) 
   $

   extends to $RR^3$
])

#TheoremBox("", [
   If $T: S -> R$ is a $C^1$ transformation with $T(u, v) = (x(u, v), y(u, v))$ then
   $
      integral integral_R f(x, y) d x d y = integral integral_S f(x(u, v), y(u, v)) 
      lr(|frac(partial(x, y), partial(u, v))|) d u d v
   $
])

For triple integrals

#TheoremBox("", [
   If $T: S -> R$ is a $C^1$ transformation with $T(u, v, w) = (x(u, v, w), y(u, v, w), z(u, v, w))$
   then
   $
      integral integral integral_R f(x, y, z) d x d y d z =
      integral integral integral_S f(x(u, v), y(u, v), z(u, v, w)) 
      lr(|frac(partial(x, y, z), partial(u, v, w))|) d u d v d w
   $
])

#Examplebox("Cylindrical Coordinates", [
   $ 
      (x, y, z) -> (r, theta, z) \
   $$
      x &= r cos theta \
      y &= r sin theta \
      z &= z \
      T(r, theta, z) &= (r cos theta, r sin theta, z) \
      (partial(x, y, z))/(partial(r, theta, z)) &= 
      mat(delim:"|", 
         frac(partial x, partial r), frac(partial x, partial theta), frac(partial x, partial z);
         frac(partial y, partial r), frac(partial y, partial theta), frac(partial y, partial z);
         frac(partial z, partial r), frac(partial z, partial theta), frac(partial z, partial z);
      ) \
      &=
      mat(delim:"|",
         cos theta, -r sin theta, 0;
         sin theta, r cos theta, 0;
         0, 0, 1;
      ) \
      &= r sin^2 theta + r cos^2 theta \
      &= r (cos^2 theta + sin^2 theta) = bold(r)
   $
   *Converting Integrals from cartesian to cylindrical coordinates*
   $
      integral integral integral_R f(x, y, z) d x d y d z =
      integral integral integral_S f(r cos theta, r sin theta, z) bold(r) thin d z thin d r thin d theta
   $
])

#Examplebox("Spherical Coordinates", [
   Let $Q$ be a point in $RR^3$
   $
      rho &: "distance from" Q "to the origin" \
      phi &: "angle between positive z-axis and" arrow(O Q) \
      theta &: "angle between polar corrdinate of the projection of" Q "to" x y "plane"
   $

   The triple $(rho, phi, theta)$ is called the spherical coordinates of the point $Q$.
   The natural domain of spherical coordinates is $rho >= 0, 0<= phi <= pi$ and $0 <= theta <= 2 pi$


   *Transformation rules*

   - spherical to cylindrical
      $
         z &= rho cos phi \
         r &= rho sin phi \
         theta &= theta
      $
   - spherical to cartesian
      $
         x &= rho sin phi cos theta \
         y &= rho sin phi sin theta \
         z &= rho cos phi\
      $
   - cylindrical to spherical
      $
         rho &= sqrt(z^2 + r^2) \
         phi &= arccos(z/(z^2 + r^2)) \
         theta &= theta
      $
   - cartesian to spherical
      $
         rho &= sqrt(x^2 + y^2 + z^2) \
         phi &= arccos(z/(x^2 + y^2 + z^2)) \
         theta ?
      $
      = TODO theta not in lecture slides

   *Jacobian of spherical coordinates*
   $
      frac(partial(x, y, z), partial(rho, phi, theta))
      & = mat(delim:"|", 
         frac(partial x, partial rho), frac(partial x, partial phi), frac(partial x, partial theta);
         frac(partial y, partial rho), frac(partial y, partial phi), frac(partial y, partial theta);
         frac(partial z, partial rho), frac(partial z, partial phi), frac(partial z, partial theta);
      ) \
      & = mat(delim: "|",
         sin phi cos theta, rho cos phi cos theta, - rho sin phi sin theta;
         sin phi sin theta, rho cos phi sin theta, rho sin phi cos theta;
         cos phi, - rho sin phi, 0;
      )
   $

   *Converting integrals from cartesian to spherical coordinates*
   $ integral integral integral_R f(x, y, z) = integral integral integral_S f(rho sin phi cos theta, rho sin phi sin theta, rho cos phi) rho^2 sin phi d rho d phi d theta $
])

