---------------------------------------------------------------------
---Module      :   Zeros
--      a naive and simple data type
--      usable to stand in for most kinds of nothing
--      added Either and Maybe to import wherever needed
--
----------------------------------------------------------------------
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE DefaultSignatures #-}
{-# LANGUAGE TypeOperators #-}

{-# OPTIONS -Wall #-}

module Uniform.Zero
  ( module Uniform.Zero,
    module Data.Maybe,
    module Data.Either,
    -- module GHC.Generics,
  )
where

import Data.Either
  ( Either (..),
    either,
    fromLeft,
    fromRight,
    isLeft,
    isRight,
    lefts,
    partitionEithers,
    rights,
  )
import Data.Maybe
  ( Maybe (..),
    catMaybes,
    fromJust,
    fromMaybe,
    isJust,
    isNothing,
    listToMaybe,
    mapMaybe,
    maybe,
    maybeToList,
  )
import GHC.Generics

-- | a minimal algebraic type with nothing than an identity
--  useful to identify a specific value in a type
class Zeros z where
  zero :: z
  default zero :: (Generic z, GZero (Rep z)) => z
  zero = to gzero

  isZero, notZero :: Eq z => z -> Bool
  isZero z = zero == z
  notZero = not . isZero

class GZero a where
  gzero :: a x

instance GZero U1 where
  gzero = U1

instance Zeros a => GZero (K1 i a) where
  gzero = K1 zero

instance (GZero a, GZero b) => GZero (a :*: b) where
  gzero = gzero :*: gzero

instance GZero a => GZero (M1 i c a) where
  gzero = M1 gzero

instance Zeros Char where zero = ' '

instance Zeros () where zero = ()

instance Zeros Bool where zero = False

-- is this contrary to the Unix tradition?

instance Zeros Int where zero = 0

instance Zeros [a] where zero = []

instance (Zeros a, Zeros b) => Zeros (a, b) where zero = (zero, zero)

instance (Zeros a, Zeros b, Zeros c) => Zeros (a, b, c) where
  zero = (zero, zero, zero)

instance (Zeros a, Zeros b, Zeros c, Zeros d) => Zeros (a, b, c, d) where
  zero = (zero, zero, zero, zero)

instance
  (Zeros a, Zeros b, Zeros c, Zeros d, Zeros e) =>
  Zeros (a, b, c, d, e)
  where
  zero = (zero, zero, zero, zero, zero)

instance Zeros (Maybe a) where zero = Nothing
