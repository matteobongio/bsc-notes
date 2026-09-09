#import "../lib.typ": *

= Lecture 2: Fourier Series

#Definitionbox("Periodic", [
   A function $f$ defined on the real line is _periodic_ with _period_ $T$ if

   $ f(t + T) = f(t) quad "for all real number" t $

   (including the constant function)
])


#Examplebox([
   $cos(pi t)$ and $sin(pi t)$ have a period 2

   $ cos(pi t) + 1/2 sin (2 pi t) $

   has period 2, the _least common multiple_ of periods of its two terms
])

#Definitionbox("Pericewise Continuous Functions", [
   A function 
   $f$ is said to be piecewise continuous on a domain $D$ in the set of reals, if for every $c$
   in $D$ both the left limit, and right limit exist:
   $ f(c-) := lim_(x -> c^-) f(c) $
   $ f(c+) := lim_(x -> c^+) f(c) $

   continuous functions are piecewise, but not the converse
])

#Definitionbox("Fourier Series", [
   Supose $f(t)$
   - is periodic with fundamental period $T$
   - is continuous on $RR$
   - $f'(t)$ is piecewise continuous
   then $f(t)$ can be expressed everywhere as the sum of a series of the form

   $ f(t) = a_0 / 2 + sum_(n = 1)^infinity ( a_n cos(n omega t) + b_n sin(n omega t) ) $
   
   where $omega = (2 pi) / T$. this is called the *Fourier Series* of $f$ and the real numbers
   $a_0, a_1, ...$ and $b_0, b_1, ...$ are called the *Fourier Coefficients* of f.
])

#pinkbox("How to Compute the Fourier Coefficients", [
   Supose $f(t)$
   - is periodic with fundamental period $T$
   - is continuous on $RR$
   - $f'(t)$ is piecewise continuous

   $
   a_n &= 2/ T integral_(- T / 2)^(T / 2) f(t) cos(n omega t) d t, quad &&"for all" n = 0, 1, 2,... \
   b_n &= 2/ T integral_(- T / 2)^(T / 2) f(t) sin(n omega t) d t, &&"for all" n = 1, 2,...
   $
])

#Definitionbox("Fourier Series of a Piecewise Continuous Function", [
   - relax conditions
   Supose $f(t)$
   - is periodic with fundamental period $T$
   - $f'(t)$ is piecewise continuous
   - is _piecewise_ continuous on $RR$

   $ f(t) = a_0 / 2 + sum_(n = 1)^infinity ( a_n cos(n omega t) + b_n sin(n omega t) ) $

   where $omega = 2 pi / T$. The Fourier coefficients are found in the same way

   $
   a_n &= 2/ T integral_(- T / 2)^(T / 2) f(t) cos(n omega t) d t, quad &&"for all" n = 0, 1, 2,... \
   b_n &= 2/ T integral_(- T / 2)^(T / 2) f(t) sin(n omega t) d t, &&"for all" n = 1, 2,...
   $

   In this case the Fourier series of $f$ converges to the average of left and
   right limits of $f$ at $c$ for all $c$ in the domain of $f$.


   $ f(t) = a_0 / 2 + sum_(n = 1)^infinity ( a_n cos(n omega t) + b_n sin(n omega t) ) 
      = frac(f(x+) + f(c-), 2)
   $

   The RHS equals $f(c)$ if $f$ is continuous at $c$.
])


#TheoremBox("", [
   - Even functions have no sine terms in their Fourier series (called Fourier cosine series)
   - Odd functions have no cosine terms in their Fourier series (incl. constante term $a_0/2$)
   (called Fourier sine series)
])

#yellowbox("Fourier Cosine Series", [
   + Start with a funtion defines on a finite interval of the form $[0, T/2]$
      for some positive real number $T$. $f$ and $f'$ need to be piecewise continuous.
   + Extend the domain of $f$ to $[- T/ 2, T/2]$ by requiring that $f$ is anf _even_ function.
      $ f(-t) = f(t) quad "for all" 0 < t <= T/2 $
   + Extend the domain of $f$ to whole $RR$ be requiring that $f$ is periodic with period $T$:
      $ f(t + m T) = f(t) quad "for all" r "and all integers" m $
   + Find the Fourier series of the extended function. Since the extended function is even, its 
      Fourier series will be of the form
      $ a_0 / 2 + sum_(n = 1)^infinity a_n cos(n omega t), "where" omega = 2 pi / T $
      and 
      $ a_n = 2/T integral_(T / 2)^(T / 2) f(t) cos(n omega t) d t 
            = 4 / T integral_0^(T / 2) f(t) cos(n omega t) d t $
])

#pinkbox("Fourier Sine Series", [
   + Start with a funtion defines on a finite interval of the form $[0, T/2]$
      for some positive real number $T$. $f$ and $f'$ need to be piecewise continuous.
   + Extend the domain to $[-T/2, T/2]$ be requiring that $f$ is an _odd_ function.
      $ f(-t) = -f(t) "for all" 0 < t <= T/2 $
   + Extend the domain of $f$ to whole $RR$ be requiring that $f$ is periodic with period $T$:
      $ f(t + m T) = f(t) "for all" t "and all integers" m $
   + Find the Fourier Series of the extended function. Since the extended funciton is off, its
      Fourier Series will be of the form
      $ sum_(n = 1)^infinity b_n sin(n omega t), "where" omega = 2 pi / T $
      and 
      $ a_n = 2/T integral_(T / 2)^(T / 2) f(t) sin(n omega t) d t 
            = 4 / T integral_0^(T / 2) f(t) sin(n omega t) d t $
])

//TODO: Examples
*TODO:* Examples
