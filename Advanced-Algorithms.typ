#import "@preview/showybox:2.0.1": showybox

#let bluebox(title, text, ..opts) = {
  showybox(
    title-style: (
      weight: 900,
      color: blue.darken(40%),
      sep-thickness: 0pt,
      align: center
    ),
    frame: (
      title-color: blue.lighten(80%),
      border-color: blue.darken(40%),
      body-color: blue.lighten(90%),
      thickness: (left: 1pt),
      radius: (top-right: 5pt, bottom-right:5pt, rest: 0pt)
    ),
    title: title,
    text,
    ..opts
  )
}
#let DefCounters = state("defs", 0)
#let DefBox(text, ..opts) = {
DefCounters.update(x => x + 1)
let c = context DefCounters.get()
bluebox([Definition ] + c, text, ..opts)
}

#let ExCnts = state("exmples", 0)

#let Examplebox(text, ..opts) = {
ExCnts.update(x => x + 1)
let c = context ExCnts.get()
  showybox(
    title-style: (
      weight: 900,
      color: orange.darken(40%),
      sep-thickness: 0pt,
      align: center
    ),
    frame: (
      title-color: orange.lighten(80%),
      border-color: orange.lighten(40%),
      body-color: orange.lighten(90%),
      thickness: (left: 1pt),
      radius: (top-right: 5pt, bottom-right:5pt, rest: 0pt)
    ),
    title: [Example ] + c,
    text,
    ..opts
  )
}

= AA

TODO
- Theorem boxes
- O vs $Theta$ vs $Omega$ vs etc


== Master Theorem

Let $a >= 1 and b >= 1$ be constants, let $f(n)$ be a cfunction, 
and let $T(n)$ be defined on the nonnegative integers by the recurrence:

$ T(n) = a T( frac(n, b) + f(n)) "if" n/b equiv floor(n/b) or ceil(n/b) $
$
=> \
  &"if" f(n) = O(n^(log_b a - epsilon)) "for" epsilon > 0 => T(n) = Theta(n^(log_b a)) \
  &"if" f(n) = Theta(n^(log_b a) ) "for" epsilon > 0 => T(n) = Theta(n^(log_b a)lg(n)) \
  &"if" f(n) = Omega(n^(log_b a + epsilon)) "for" epsilon > 0 and "if" a f(n/b) <= c f(n)
  "for" c < 1 forall "sufficiently large" n \
  & quad => T(n) = Theta(f(n)) \
$


