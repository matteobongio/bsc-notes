#import "../lib.typ": *

= Lecture 9

#pinkbox([ *Computing volumes of a solid lying below the graph of $f$* ], [
   Let $R = [a, b] times [c, d]$ be a rectangular region in $RR^2$ and let $f$ be a
   non-negative bounded function defined on $R$. 

   Take a partition of the domain

   $
      cal(P) : & a = x_0 < x_1 < x_2 < ... < x_n = b \
               & c = y_0 < y_1 < y_2 < ... < y_n = d 
   $

   and let

   $
      &Delta x_i = x_i - x_(i - 1) \
      &Delta y_i = y_i - y_(i - 1) \
      &Delta A_(i j) = Delta x_i Delta y_i
   $

   The partition splits the domain $R$ into $n times m$ sub-rectangles and $Delta A_(i j)$
   is the area of the $i j$th sub-rectangle. the largest $Delta A_(i j)$ is called the mesh size of
   $cal(P)$ and denotes by $|cal(P)|$

])

#yellowbox("Double integrals over rectangles", [
   We choose a representative point $(x_i^*, y_i^*)$ from each sub-rectangle and form
   a Riemann sum

   $
      "Riem"(f, cal(P)) = sum_(i = 1)^n sum_(j = 1)^m f(x_i^*, y_i^*) Delta A_(i j)
   $

   Riemann sum gives an estimate of the volume under the graph of $f$. As we take a finer partition,
   the estimate becomes more accurate.

   #line(length: 100%)

   We say that $f$ is integrable if 
   $ lim_(|cal(P)| -> 0) "Riem"(f, cal(P)) $
   exists,
   if so it is denoted by:

   $ integral integral_R f(x, y) d A $

   and it is called the double integral of $f$ over the region $R$

   #line(length: 100%)

   - If $f$ is a continuous function over $R$ then $f$ is integrable.

   - If $f$ is bounded and its discontinuities occur only on a smooth curve $C$ in $R$ then
      $f$ is integrable.

   #align(center)[#image("../img/lect_9/riem.png", width: 50%)]
])

#TheoremBox("Fubini's Theorem", [
   Let $R = [a, b] times [c, d]$. Suppose $f$ is continuous on $R$ then

   $ integral integral_R f(x, y) d A 
      = integral_(x = a)^b lr([integral_(y = c)^d f(x, y) d y]) d x
   $

   #align(center)[#image("../img/lect_9/fubini_1.png", width: 50%)]
   #align(center)[#image("../img/lect_9/fubini_2.png", width: 50%)]

   #line(length: 100%)
   
   *Remark*: We may apply the third method only when the integration
   region is a rectangle and the integrand splits as $f (x, y ) = g (x)h(y )$ for
   some functions $g$ and $h$.
])

#bluebox("Double integrals over general regions", [
   Suppose $D$ is a bounded region whose boundary is a smooth curve.
   We define the characteristic function of $D$ by

   $
      chi_D (x, y) = cases(
         1 quad "if" (x, y) "is in" D,
         0 quad "if" (x, y) "is not in" D,
      )
   $

   Notice that $chi_D$ is discontinuous only on the boudary of $D$ and henec integrable.

   Fo every continuous function $f$ on $D$:

   $
      integral integral_D f(x, y) d A = integral integral_R chi_D(x, y) f(x, y) d A
   $
   where $R$ is any rectangle containing $D$.
])

#Definitionbox("x-simple and y-simple regions", [
   when $D$ is of the form:

   $ D = {(x, y): a <= x <= b, "and" g_1(x) <= y <= g_2(x)} $

   we say that $D$ is an x-simple region. In this case

   $ 
   integral integral_D f(x, y) d A = 
   integral_(x=a)^b lr([ integral_(y = g_1(x))^(g_2(x)) f(x, y) d y]) d x 
   $

   #line(length: 100%)

   when $D$ is of the form:

   $ D = {(x, y): c <= y <= d, "and" h_1(x) <= x <= h_2(x)} $

   we say that $D$ is an y-simple region. In this case

   $ 
   integral integral_D f(x, y) d A = 
   integral_(y=c)^b lr([ integral_(h = h_1(x))^(h_2(x)) f(x, y) d x]) d y 
   $

   - Every "reasonable" region can be subdivided into pieces each of which is either 
      x-simple or y-simple
])


#purplebox("properties of double integrals", [
   - $integral integral_D f(x, y) g(x, y) d A = integral integral_D f(x, y) d A + integral integral_D g(x, y) d A$
   - $integral integral c f(x, y) d A = c integral integral f(x, y) d A$
   - if $f(x, y) >= g(x, y)$ for all $(x, y)$ in $D$ then
      $ integral integral_D f(x, y) d A >= integral integral_D g(x, y) d A $
   - $integral integral 1 d A = "Area"(D)$
   - if $D = D_1 union D_2$ and $"Area"(D_1 inter D_2) = 0$ then
      $
         integral integral_D f(x, y) d A 
         = integral integral_D_1 f(x, y) d A 
         = integral integral_D_2 f(x, y) d A
      $
])

#greenbox("changing the order of integration", [
   = TODO
   //TODO:
])
