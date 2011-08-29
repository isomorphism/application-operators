-- | Very low precedence operators, intended to serve as pseudo-syntax,
--   breaking up expressions written with other operators. Note that the
--   function application operators here have backwards associativity;
--   grouping is by innermost application first, rather than the outermost.
--
--   Fixity convention here is 0 for application, 1 for composition. 
--   
--   Note that the composition operators are simply re-exporting '>>>'
--   and '<<<' from "Control.Category", and the application operators were
--   chosen mostly for sensible mnemonics to go with those.
module Control.Apply.Pseudosyntactic ( (|>), (>>>)
                                     , (<|), (<<<)
                                     ) where

import Control.Category

infixl 0 |>
infixr 0 <|

-- | Reversed function application. If you're thinking this has an odd 
--   foreign accent to it somehow, well, I have no idea what you're talking
--   about. No, really, not a clue. What, why are you looking at me like that?
(|>) :: a -> (a -> b) -> b
x |> f = f x

-- | Regular function application. This is exactly equivalent to the standard
--   definition of '$'.
(<|) :: (a -> b) -> a -> b
f <| x = f x



