#import "../../lib.typ": *

== Chapter 1.1: Structure and Meaning

All programming languages are fully defined in terms of 
- Syntax: appearance of the programs of the language
- Types: restrict the syntax to enforce suitable properties on programs
- Semantics: meanings of programs

#Definitionbox("Syntax, Types", [
  The _syntax_ of a _formal_ language states which sequences of symbols are valid statements, and which are not
  regular expressions, context-free grammars and BNF can be used to define the syntax of formal languages.

  _Types_ are often presented as logic rules called _type systems_. they are used to assign a type unambiguously to each computed 
  value. Different type systems can be defined over the same language to enforce different properties.

  Sadly, explaining what a program means is more complicated and requires natural language description
])

#Definitionbox("Operational Semantics", [
  _Operational Semantics_ is interested in how the effect of a computation is done. First, some abstract machine is defined,
  then operational semantics describes the meaning of programs in terms of actions executed by the machine. It is focused on
  _state_ and _transformations_.
])

#Definitionbox("Denotational Semantics", [
  In _denotational Semantics_ the meaning of a program is a mathematical object. The steps taken to compute the output
  is not important, only the _effect_ is.

  *Compositionality*: the semantics takes the form of a funciton that assigns an element of some domain to each construct,
  the meaning of a composite construct does not depend on the form of the components, but only on their meaning.

  Denotational Semantics often has issues with performance, as it is far from the real world of semiconductures and 
  computer architectures.
])

#Definitionbox("Axiomatic Semantics", [
  Instead on assigning a meaning to each program, axiomatic semantics provides logical conditions that are satisfied by
  programs. It's focused on valid assertions for program correctness, the computation and effect are deliberatly ignored.

  also called Floyd-Hoare logic

  program statements are described by a precondition, and a post-condition, with this it is possible to prove the correctness
  of a program w.r.t specification.

  - *Partial correctness*: a program is partially correct w.r.t a pre-condition and a post-condition if whenever the pre-condition
    is met, and the program terminates, the post-condition will be met. It does not guarentee termination though.
  - *Total correctness*: Partial correctness, and will always terminate if the pre-condition is satisfied

  Limitations include not really being applicable to concurrent interactive systems, whose correct behaviour often involves
  non-termination computations (yay).
])


