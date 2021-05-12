---------------------------------------------------------------------
---Module      :   Properties  
--             a place to state some algebraic laws
--             used in tests 
-- compare with Data.Zero 
----------------------------------------------------------------------
-- {-# LANGUAGE FlexibleContexts #-}
-- {-# LANGUAGE MultiParamTypeClasses #-}
-- {-# LANGUAGE DefaultSignatures #-}
-- {-# LANGUAGE TypeOperators #-}

{-# OPTIONS -Wall #-}

module Uniform.Properties
  ( module Uniform.Properties
  )
where

import           Algebra.Laws             as Law
--import           Test.Framework
import           Test.Invariant           as Rule
prop_zero_mknull :: (Monoid a, Eq a)  => a -> Bool
prop_zero_mknull a = Law.zero mappend a mempty

prop_assoz :: (Monoid a, Eq a)  => a -> a ->  a -> Bool
prop_assoz a b c = Rule.associative mappend a b c

prop_concat :: (Monoid a, Eq a) => [a] -> Bool
prop_concat as =    mconcat as == foldr mappend mempty as



--prop_s2lat :: String -> Bool  -- will fail ? fails
--prop_s2lat = inverts lat2s s3lat

    --prop_s2latin :: String -> Bool     -- why does this always work?  (is the intermediate result ok?)
--prop_s2latin = inverts latin2s s2latin

--prop_s3latin :: String -> Bool     --inverts with reasonable intermediate value
--prop_s3latin s = inverts latin2s s2latin (convertLatin s)

--