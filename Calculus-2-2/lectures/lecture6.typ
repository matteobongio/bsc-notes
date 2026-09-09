#import "../lib.typ": *

= Lecture 6

== Partial Derivatives

#Definitionbox("", [
   Suppose $f : RR^2 -> RR$, the _partial derivative_ of $f$ with respect to $x$ at $(a, b)$
   is:

   $
      f_x (a, b) = (partial f)/(partial x)(a, b) = lim_(h -> 0) frac(f(a + h, b) - f(a, b), h)
   $

   for y:
   $
      f_y (a, b) = (partial f)/(partial y)(a, b) = lim_(h -> 0) frac(f(a, b + h) - f(a, b), h)
   $

   consider other variables as constant and differentiate
])

#pinkbox("Goemetric Interpretation", [
   let $C$ be ther curve of the intersection of the graph $f(x, y)$ with the plane $y = b$.
   A parametrization of $C$ is $arrow(r) (x) = (x, b, f(a, b))$. It lies on the graph of $f(x, y)$
   and passes through $(a, b, f(a, b))$ at $x = a$. The tangent vector to $C$ at this point is 
   $arrow(r)'(a) = (a, 0, f_x(a, b))$. therefore $f_x(a, b)$ is the slope of the tangent line to $C$ inside 
   the plane $y = b$
])

#bluebox("Higher Derivatives", [
   $
      f_(x x) = (f_x)_x = partial / (partial x) lr([(partial f)/(partial x)]) = (partial^2 f)/(partial x^2) \
      f_(x y) = (f_x)_y = partial / (partial y) lr([(partial f)/(partial x)]) = (partial^2 f)/(partial y partial x) \
      f_(y x) = (f_y)_x = partial / (partial x) lr([(partial f)/(partial y)]) = (partial^2 f)/(partial x partial y) \
      f_(y y) = (f_y)_y = partial / (partial y) lr([(partial f)/(partial y)]) = (partial^2 f)/(partial y^2) 
   $

   If $f_(x y)$ and $f_(y x)$ both exist and continuous at $(a, b)$ then

   $ f_(x y) (a, b) = f_(y x) (a, b) $
])

#Examplebox("Implicit Differentiation", [
   = TODO
   // TODO:
])

#greenbox("Tangent planes and linear approximations", [
   To derive the equation of the plane tangent to the graph of $f(x, y)$ at $(a, b, f(a, b))$

   let
   $
      arrow(u)(x) = vec(x, b, f(x, b)) \
      arrow(v)(x) = vec(a, y, f(a, y))
   $
   - $arrow(u)(x)$ passes through $(a, b, f(a, b))$ at $x = a$
   - $arrow(v)(y)$ passes through $(a, b, f(a, b))$ at $y = b$
   - therefore $arrow(u)'(a)$ and $arrow(v)'(b)$ are both contained in the tangent plane of the graph
      of $f$ and $(a, b, f(a, b))$
   - therefore $arrow(n) = arrow(u)'(a) times arrow(v)'(b)$ is a normal vector of the tangent plane

   $
      arrow(u)'(x) = arrow(i) + f_x(x, b) arrow(k) => arrow(u)'(a) = arrow(i) + f_x(a, b) arrow(k) \
      arrow(v)'(y) = arrow(j) + f_y(a, y) arrow(k) => arrow(v)'(b) = arrow(j) + f_y(a, b) arrow(k) \

      arrow(n) = arrow(u)'(a) times arrow(v)'(b) = -f_x(a,b) arrow(i) - f_y(a, b) arrow(j) + arrow(k)
   $
   The tangent plane passes through $(a, b, f(a, b))$ therefore
   $ -f_x(a, b) (x - a) - f_y(a, b) (y - b) + (1)(z - f(f, a)) = 0 $
])

#TheoremBox("", [
   If $f(x, y)$ has partial derivatives at the point $(a, b)$. then the equation to the tangent to the 
   graph of $f$ at $(a, b, f(a, b))$ is

   $ z = f(a, b) + f_x(a, b)(x - a) + f_y(a, b)(y - b) $
])

#Definitionbox("Linear Approximation", [
   $ L(x, y) = f(a, b) + f_x(a ,b)(x - a) + f_y(a, b)(y - b) $
   is called the linearization of $f$ at $(a, b)$

   The graph of $L(x, y)$ is the tangent plane of the graph of $f$ at $(a, b, f(a, b))$

   If $f_x$ and $f_y$ are both continuous at $(a, b)$ then $L(x, y)$ approximates $f(x, y)$ when 
   $(x, y)$ is close enough to $(a, b)$
])

#Definitionbox("Differentiable functions", [
   $f(x, y)$ is differentiable at $(a, b)$ iff $f(a, b), f_x(a, b) "and" f_y(a, b)$ all
   exist and 
   $
      lim_((x, y) -> (a, b)) frac(f(x, y) - L(x, y), sqrt((x - a)^2 + (y - b)^2))
   $
   where $L(x, y)$ is the linearization of $f(a, b)$

   #line(length: 100%)

   $f(x, y) approx L(x, y)$ is a "good" approximation as $|f(x, y) - L(x, y)| -> 0$ faster than 
   $sqrt((x - a)^2 + (y - b)^2) -> 0$ as $(x, y) -> (a, b)$.
])

#TheoremBox("", [
   If $f$ is differentiable at $(a, b)$ then $f$ is continuous at $(a, b)$
])

#TheoremBox("", [
   If $f_x(a, b), f_y(a, b)$ both exist and $f_x, f_y$ are both contiuous at $(a, b)$, then 
   $f$ is differentiable at $(a, b)$
])


== Chain Rule Revisited
For single variable functions:
$ 
   lr((f(g(t))), size: #150%)' = f'(g(t))g'(t) \
   frac(d y, d t) = (d y)/(d x) (d x)/(d t)
$

for multi variable functions:
#Examplebox([
   = TODO
   //TODO:
])

#purplebox("Implicit Differentiation", [
   let $F(x, y, z)$ have continuous partial derivatives and $(partial F)/(partial z) != 0$, then
   $ F(x, y, z) = 0 $
   defines $z$ implicitly as a function of $x$ and $y$. We can consider $z$ the dependent variable, and $x, y$ 
   as independent.
   $
      partial /(partial x) lr([F(x, y, z)]) = 0 \
      => F_x + F_z (partial z)/(partial x) \
      => (partial z)/(partial x) = - F_x/F_z \
      => (partial z)/(partial y) = - F_y/F_z \
   $
])
#TheoremBox("", [
   If $F(x, y, z)$ has continuous partial derivatives and $(partial F)/(partial z) != 0$ at
   $(x_0, y_0, z_0)$ then

   $ F(x, y, z) = 0 $

   defines $z$ as a function of $x$ and $y$ near $(x_0, y_0, z_0)$ also having continuous
   partial derivatives:

   $
      lr((partial z)/(partial x)|) _((x_0, y_0, z_0))
      = lr(- F_x/F_z|) _((x_0, y_0, z_0)) \
      lr((partial z)/(partial y)|) _((x_0, y_0, z_0))
      = lr(- F_y/F_z|) _((x_0, y_0, z_0)) \
   $
])
