{-# LANGUAGE ImplicitParams, OverloadedStrings, AllowAmbiguousTypes, GADTs, CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
module Graphics.UI.FLTK.Theme.Light.Tree
  (
    treeNew
  )
where
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.Theme.Light.Common
import qualified Data.Text as T
import qualified Graphics.UI.FLTK.LowLevel.FLTKHS as LowLevel
import Graphics.UI.FLTK.Theme.Light.Assets

treeNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.Tree)
treeNew rectangle l' = do
  let customDraw :: Ref LowLevel.Tree -> IO ()
      customDraw t = do
        (color :: Color) <- LowLevel.getColor t
        let slightlyDarker = colorAverage color blackColor 0.85
        withCustomBoxDraw
          BorderBox
          (\rect _ -> do
              LowLevel.flcRectfWithColor rect color
              LowLevel.flcRectWithColor rect slightlyDarker)
          (LowLevel.drawTreeBase (safeCast t))
  t <- LowLevel.treeCustom rectangle l' (Just customDraw) Nothing
  LowLevel.setBox t BorderBox
  LowLevel.setColor t lightBackground
  LowLevel.setLabelfont t commonFont
  LowLevel.setLabelsize t commonFontSize
  LowLevel.setItemLabelfont t commonFont
  LowLevel.setItemLabelsize t commonFontSize
  sc <- commonSelectionColor
  LowLevel.setSelectionColor t sc
  LowLevel.setScrollbarSize t 10
  LowLevel.setConnectorstyle t TreeConnectorSolid
  return t
