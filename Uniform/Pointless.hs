---------------------------------------------------------------------
--
-- Module      :  Uniform.Pointless
--              collecting some of the operations for a 
--              pointless (pairs based) programming style  
--              demonstrated in the book by
--              Bird \& deMoore \"The Algebra of Programming\"
--          which is available from hackage 
--         https://hackage.haskell.org/package/aop-prelude-0.4.1.1 
----------------------------------------------------------------------

module Uniform.Pointless (module Uniform.Pointless
                    -- , module AOPPrelude
                    ) where


-- import AOPPrelude (outl, outr, swap, assocl, assocr, dupl
--     , pair, cross, cond )
-- code copied from aop-prelude (partial)
    
const :: a -> b -> a
const k a = k
id :: a -> a
id a      = a

outl :: (a, b) -> a
outl (a, _) = a
outr :: (a, b) -> b
outr (_, b) = b
swap :: (a, b) -> (b, a)
swap (a, b) = (b, a)

assocl :: (a, (b, c)) -> ((a, b), c)
assocl (a, (b, c)) = ((a, b), c)
assocr :: ((a, b), c) -> (a, (b, c))
assocr ((a, b), c) = (a, (b, c))

dupl :: (a, (b, c)) -> ((a, b), (a, c))
dupl (a, (b, c)) = ((a, b), (a, c))
dupr :: ((a, b), c) -> ((a, c), (b, c))
dupr ((a, b), c) = ((a, c), (b, c))

pair :: (a -> b, a -> c) -> a -> (b, c)
pair (f, g) a       = (f a, g a)
cross :: (a -> c, b -> d) -> (a, b) -> (c, d)
cross (f, g) (a, b) = (f a, g b)
cond :: (a -> Bool) -> (a -> b, a -> b) -> a -> b
cond p (f, g) a     = if p a then f a else g a

curry :: ((a, b) -> c) -> a -> b -> c
curry f a b      = f (a, b)
uncurry :: (a -> b -> c) -> (a, b) -> c
uncurry f (a, b) = f a b
-- pair :: (t -> b) -> (t, t) -> (b, b)

-- my old different definitions (with prime):

pair' :: (a->b) -> (a,a) -> (b,b)
pair' f (a, b) = (f a, f b) 
-- ^ replace wth both

swapPair :: (b, a) -> (a, b)
-- | replace with swap
swapPair (a, b) = (b, a)

dup :: b -> (b, b)
-- make a pair from a value
dup a = (a,a)
