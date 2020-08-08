{-# LANGUAGE ImplicitParams, OverloadedStrings, AllowAmbiguousTypes, GADTs, CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
module Graphics.UI.FLTK.Theme.Light.Group
  (
    groupNew,
    scrolledNew
  )
where
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.Theme.Light.Common
import qualified Data.Text as T
import qualified Graphics.UI.FLTK.LowLevel.FLTKHS as LowLevel
import Graphics.UI.FLTK.Theme.Light.Assets

scrolledNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.Scrolled)
scrolledNew rectangle label = do
  s <- LowLevel.scrolledNew rectangle label
  p <- LowLevel.getParent s
  color <- maybe (return lightBackground) LowLevel.getColor p
  LowLevel.setColor s color
  LowLevel.setLabelfont s commonFont
  LowLevel.setLabelsize s commonFontSize
  return s

groupNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.Group)
groupNew rectangle label = do
  g <- LowLevel.groupNew rectangle label
  p <- LowLevel.getParent g
  color <- maybe (return lightBackground) LowLevel.getColor p
  LowLevel.setColor g color
  LowLevel.setLabelfont g commonFont
  LowLevel.setLabelsize g commonFontSize
  color <- commonSelectionColor
  LowLevel.setSelectionColor g color
  return g
