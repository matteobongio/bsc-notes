#import "../lib.typ": *

= Lecture 11

#Definitionbox("Triple integrals", [
Let $D$ be a region in $RR^3$ and let $f : D -> RR^3$ be a continuous function.
We define $integral integral integral_D f(x,y,z) d V$ similarly to double integrals

when $f(x, y, z) = 1$ the triple integral gives the volume of $D$

_Fubini's theorem_ and other properties also hold for triple integrals
])


#greenbox("Totaal mass of a system/rigid body", [
   *Discrete case*: $n$ points with masses $m_1, ..., m_n$
      $ "Total Mass" = sum_(i = 1)^n m_i $

   Now assume the system is a continuous mass distribution with density function $sigma$
   - 1 dimensional:
      $ "Total Mass" = integral_a^b sigma (x) d x $
   - 2 dimensional:
      $ "Total Mass" = integral integral_D sigma (x, y) d A $
   - 3 dimensional:
      $ "Total Mass" = integral integral integral_R sigma (x, y, z) d V $
])

#yellowbox("Center of mass", [
   - Discrete systems:
      paritcal with mass $m_j$ is at point $(x_j, y_j, z_j)$. to find the location of the 
      center of mass of this system, we take the average location of the system weighted by the masses
      $
         x_(C M) &= 1/"Total Mass" sum_(i = 1)^n x_i m_i \
         y_(C M) &= 1/"Total Mass" sum_(i = 1)^n y_i m_i \
         z_(C M) &= 2/"Total Mass" sum_(i = 1)^n z_i m_i 
      $
   - Continuous systems:
      - 1 dimensional:
         $ x_(C M) &= 1/"Total Mass" integral_(x = a)^b x sigma(x) d x $
      - 2 dimensional:
         $
         x_(C M) &= 1/"Total Mass" integral integral_D x sigma(x, y) d A \
         y_(C M) &= 1/"Total Mass" integral integral_D y sigma(x, y) d A
         $
      - 3 dimensional:
         $
         x_(C M) &= 1/"Total Mass" integral integral integral_R x sigma(x, y, z) d V \
         y_(C M) &= 1/"Total Mass" integral integral integral_R y sigma(x, y, z) d V \
         z_(C M) &= 1/"Total Mass" integral integral integral_R y sigma(x, y, z) d V
         $
])
