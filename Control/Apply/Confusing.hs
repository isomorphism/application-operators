module Control.Apply.Confusing where

import qualified Prelude as P
import Prelude hiding (($!))

infixl 8 $, $!

-- | I never liked the way this was used in the standard libraries. This
--   defines it as it should be, because 'Control.Apply.Pseudosyntactic.<|'
--   provides the same effect as the standard @$@, but consistent with the
--   mnemonics used.
($) :: (a -> b) -> a -> b
f $ x = f x

-- | Same deal as '$'.
($!) :: (a -> b) -> a -> b
f $! x = f P.$! x
