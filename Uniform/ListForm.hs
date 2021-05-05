---------------------------------------------------------------------
---Module      :   ListForms
-- a naive and simple data type for monoids
-- somewhat the minimum often used without much baggage
--
----------------------------------------------------------------------
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeFamilies #-}

{-# OPTIONS -Wall #-}

module Uniform.ListForm
  ( module Uniform.ListForm,
    module Uniform.Zero 
  )
where

import Uniform.Zero ( Zeros )

class (Monoid l, Zeros (LF l)) => ListForms l where
  type LF l
  prependOne :: LF l -> l -> l
  appendOne :: l -> LF l -> l
  mkOne :: LF l -> l
  appendTwo :: l -> l -> l

  prependOne a la = appendTwo (mkOne a) la
  appendOne la a = appendTwo la (mkOne a)
  appendTwo = error "not implemented appendTwo for ListForm (<>)"
