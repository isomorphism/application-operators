This is a loose collection of alternate operator names that I'm
somewhat fond of. The central idea here is to remain reasonably
close to standard symbols, while providing extra mnemonic value 
and symmetry, plus more consistency in fixities.

The basic rationale is as follows:

* The default fixity for application should be left-to-right;
  any family of operators should either have the default 
  direction only, or should provide both.

* Application should be of lower precedence than composition,
  or equal if the fixities are such that compositions will
  group together anyway.

* Families of related operators should have visually-related
  symbols, compatible fixities, and mnemonic value indicating
  their direction if the both are present. When directions are
  indicated, the two should be mirror images of each other visually.

* Don't rename standard operators if they're mostly consistent
  with these guidelines, and try not to confuse things when
  replacing standard operators.

By default, this re-exports two modules: `Control.Apply.Lifting`
defines lifted application operators for `Monad` and `Applicative`,
re-exporting several standard operators as well. 
`Control.Apply.Pseudosyntactic` defines very low-precedence 
operators for regular functions, intended to serve as pseudo-syntactic
constructs in the same manner that the standard definition of `($)` does.

The additional module `Control.Apply.Confusing` redefines operators 
from the standard libraries to have different fixities. Probably not
recommended for actual use, but it's what I wish things were.
