--{-# OPTIONS_GHC -F -pgmF htfpp #-}
{-# LANGUAGE
    FlexibleInstances
--    , Safe
    , MultiParamTypeClasses
    , TypeSynonymInstances
    , FlexibleContexts
--        , UndecidableInstances
        , OverloadedStrings
 #-}
{-# OPTIONS -Wall #-}
{-# OPTIONS -fno-warn-missing-signatures #-}


module Uniform.Zero (Zeros (..)
        , Text, pair, cross
        ,  fst3, snd3, thd3
        , first, second
--            , htf_thisModulesTests
) where


import Data.Text (Text)
import Data.Tuple.Utils (fst3, snd3, thd3)



class Zeros z where
    zero :: z

    isZero, notZero :: Eq z =>  z -> Bool
    isZero z = zero == z
    notZero = not.isZero
    zero = (error   "Zeros for this type not instantiated")
    -- gives a difficult to track error, because the type is not known

pair f (a,b) = (f a, f b)
cross (f,g) (a,b) = (f a, g b)

first f (a,b) = (f a, b)
second f (a,b) = (a, f b)



instance Zeros Char where zero = ' '
--instance (Zeros a, Eq a) => Zeros [a] where zero = []
instance Zeros () where zero = ()
--instance Zeros String where zero = ""
--instance Zeros Strings where zero = []
instance Zeros Int where zero = 0
instance Zeros [a] where zero = []
instance (Zeros a, Zeros b) => Zeros (a,b) where zero = (zero, zero)
instance (Zeros a, Zeros b, Zeros c) => Zeros (a,b,c) where
     zero = (zero, zero, zero)
instance (Zeros a, Zeros b, Zeros c, Zeros d) => Zeros (a,b,c,d) where
     zero = (zero, zero, zero, zero)
instance (Zeros a, Zeros b, Zeros c, Zeros d, Zeros e)
         => Zeros (a,b,c, d, e) where
     zero = (zero, zero, zero, zero, zero)

instance Zeros Text where zero = (""::Text)

--instance (Eq (g f), Zeros f, Applicative g) => Zeros (g f)
--    where zero = pure zero

--instance (Eq x) => Zeros x where
--    zero = (undefined $ "Zeros for this type not instantiated")
-- unsafe overlap -- when defined in other modules

