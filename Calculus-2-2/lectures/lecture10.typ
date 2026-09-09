#import "../lib.typ": *

= Lecture 10

#Definitionbox("Polar Coordinates", [
   $
      x = r cos theta\
      y = r sin theta \
      x^2 + y^2 = r^2
   $
   $(r, theta)$ uniquely identifies the position of a point on the plane (except for the origin),
   it is called the polar coordinates of the point.

   The natural domain of polar coordinates is $r > 0$ and $0 <= theta < 2 pi$

   *Conevtions for the extended domain of polar coordinates*
   + when $r = 0, (0, theta)$ represents the origin for all $theta$
   + $theta$ can take any real value, if it is out of $[0, 2 pi)$, we take the modulus
   + negative $r$ means we reflect about the origin
      $ (-r, theta) = (r, theta + pi) $
])

#Definitionbox("Polar Curves", [
   A _polar curve_ is the solution set of an equation of the form
   $ F(r, theta) = 0 $

   *Symmetries of polar curves*
   it is called:
   - *Horizontally symmetric* if the transformation $theta -> -theta$ does not change the curve
   - *Vertically symmetric* if the transformation $theta -> pi -theta$ does not change the curve
   - *Symmetric with respect to the origin* if the transformation
      $theta -> pi + theta equiv r -> - r$ does not change the curve
])

= TODO: cardoids

//TODO: cardoids
//

#pinkbox("Areas enclosed by polar curves", [
   _Disk sectors_: Area of a $theta$ sector of a disk of radius $r$ is given by 
      $A_theta = frac(theta r^2, 2)$

   We approximate areas enclosed by polar curves by sectors of small angles.
   - Suppose the curve is given by $r = f(theta)$ for $a <= theta <= b$
   - Take a partition $cal(P) : a = theta_1 < theta_1 < ... theta_n = b$
   Then the area of each approximating sector is 
   $Delta A_i = 1/2 r^2 Delta theta_i = 1/2(f(theta_i^*))^2 Delta theta_i$ therefore
   $ "Total Area" approx sum_(i = 1)^n Delta A_i approx sum_(i = 1)^n 1/2 (f(theta_i^*))^2 Delta theta_i $
   - The limit as $|cal(P)| -> 0$ gives an exact computation:
      $ 
         "Total Area" &= integral_(theta = a)^b 1/2 (f(theta))^2 d theta\
                      &= integral_(theta=a)^b integral_(r = 0)^(f(theta)) r thin d r thin d theta 
      $
])

#yellowbox("Double integrals in polar coordinates", [
   Suppose $D$ is a region in $x y$-plane given by polar inequalities
   $ alpha <= theta <= beta \ h_1(theta) <= r <= h_2(theta) $

   Let $f(x, y)$ be any continuous function on $D$. then the double integral of $f$ on $D$ is 
   given by 
   $ 
      integral integral_D f(x, y) d A 
      = integral_(theta=alpha)^beta integral_(h_1(theta))^(h_2(theta)) 
      f(r cos theta, r sin theta) r thin d r thin d theta
   $
   When $f(x, y) = 1$ the formula computes the area of $D$

   possible in cartesian coordinates, but a way worse integral
])
