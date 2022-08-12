---------------------------------------------------------------------
--
-- Module      :  Uniform.Tuples (beyond pairs)
                -- a restricted collection of operations on tuples 
                -- and nothing else 
                    -- with imports as far as I found similar code
----------------------------------------------------------------------

module  Uniform.Tuples (module Uniform.Tuples
                    , module Data.Tuple.Extra
                    ) where

import Data.Tuple.Extra (first, second, fst3, snd3, thd3, both)

trd3 :: (a, b, c) -> c
trd3 (x, y, z) = z

-- could copy from hledger-utils 

fst4 :: (a, b, c, d) -> a
fst4 (x, y, z, w) = x

snd4 :: (a, b, c, d) -> b
snd4 (x, y, z, w) = y

trd4 :: (a, b, c, d) -> c
trd4 (x, y, z, w) = z

thd4 :: (a, b, c, d) -> c
thd4 = trd4

fth4 :: (a, b, c, d) -> d
fth4 (x, y, z, w) = w

fst5 :: (a, b, c, d, e) -> a
fst5 (x, y, z, w, u) = x

snd5 :: (a, b, c, d, e) -> b
snd5 (x, y, z, w, u) = y

thd5 :: (a, b, c, d, e) -> c
thd5 (x, y, z, w, u) = z

trd5 :: (a, b, c, d, e) -> c
trd5 = thd5

fth5 :: (a, b, c, d, e) -> d
fth5 (x, y, z, w, u) = w

ffh5 :: (a, b, c, d, e) -> e
ffh5 (x, y, z, w, u) = u

first3 :: (a1 -> b) -> (a1, a2, a3) -> (b, a2, a3)
first3 f (a1, a2, a3) = (f a1, a2, a3)

second3 :: (a2 -> b) -> (a1, a2, a3) -> (a1, b, a3)
second3 f (a1, a2, a3) = (a1, f a2, a3)

third3 :: (a3 -> b) -> (a1, a2, a3) -> (a1, a2, b)
third3 f (a1, a2, a3) = (a1, a2, f a3)

first4 :: (a1 -> b) -> (a1, a2, a3, a4) -> (b, a2, a3, a4)
first4 f (a1, a2, a3, a4) = (f a1, a2, a3, a4)

second4 :: (a2 -> b) -> (a1, a2, a3, a4) -> (a1, b, a3, a4)
second4 f (a1, a2, a3, a4) = (a1, f a2, a3, a4)

third4 :: (a3 -> b) -> (a1, a2, a3, a4) -> (a1, a2, b, a4)
third4 f (a1, a2, a3, a4) = (a1, a2, f a3, a4)

fourth4 :: (a4 -> b) -> (a1, a2, a3, a4) -> (a1, a2, a3, b)
fourth4 f (a1, a2, a3, a4) = (a1, a2, a3, f a4)
