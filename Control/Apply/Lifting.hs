{-# OPTIONS_HADDOCK not-home #-}
-- | Standard lifting operators use fixities of 4 for application, 5 for composition.
-- 
--   Also included are standard operators serving as pseudosyntactic lifting 
--   operators, which all have a fixity of 1. For consistency '>>=' and '=<<' should
--   have been given fixity 0 but I drew the line of common sense at replacing '=<<'
--   just to alter its precedence by one.
module Control.Apply.Lifting ( (<$>), (<*>), (<.>)
                             , (=<$), (=<*), (=<.)
                             , (>>=), (>=>)
                             , (=<<), (<=<)
                             ) where

import Control.Applicative
import Control.Monad

infixl 4 =<$, =<*
infixr 5 =<., <.>

-- | Function application, lifting into a 'Monad'. Equivalent to '=<<' with different
--   fixity.
(=<$) :: (Monad m) => (a -> m b) -> (m a -> m b)
f =<$ x = x >>= f

-- | This is a composite of '=<$' and '<*>'. Does 'ap' followed by 'join', useful for
--   applying a function with a type like @a -> b -> m c@ to arguments @m a@ and @m b@
--   using infix, 'Applicative' style, where the final step needs the composite here.
--
--   A word on sequencing: 'ap' sequences its arguments left-to-right, while `=<$'
--   necessarily sequences right-to-left. The end result is that complicated expressions
--   written purely infix could become obfuscated regarding order of effects. In many
--   cases, this ordering is the only one that would make sense anyway, but in situations
--   where one would need to stop and think about what the expression means, something
--   a little more explicit than '=<*' is probably recommended.
(=<*) :: (Monad m) => m (a -> m b) -> (m a -> m b)
f =<* x = join (ap f x)

-- | Composition, 'Applicative'-style. Equivalent to @liftA2 (.)@ with appropriate fixity.
(<.>) :: (Applicative f) => f (b -> c) -> f (a -> b) -> f (a -> c)
f <.> g = (.) <$> f <*> g

-- | Composition, 'Monad'-style. Equivalent to '<=<' with different fixity.
(=<.) :: (Monad m) => (b -> m c) -> (a -> m b) -> (a -> m c)
f =<. g = f <=< g
