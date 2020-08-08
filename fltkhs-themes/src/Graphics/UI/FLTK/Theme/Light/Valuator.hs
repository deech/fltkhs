{-# LANGUAGE ImplicitParams, OverloadedStrings, AllowAmbiguousTypes, GADTs, CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
module Graphics.UI.FLTK.Theme.Light.Valuator
  (
    adjusterNew,
    valueOutputNew,
    valueInputNew
  )
where
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.Theme.Light.Common
import Graphics.UI.FLTK.Theme.Light.Input
import qualified Data.Text as T
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import qualified Graphics.UI.FLTK.LowLevel.FLTKHS as LowLevel
import Graphics.UI.FLTK.Theme.Light.Assets

adjusterNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.Adjuster)
adjusterNew rectangle label = do
  a <- LowLevel.adjusterNew rectangle label
  LowLevel.setLabelfont a commonFont
  LowLevel.setLabelsize a commonFontSize
  color <- commonColor
  LowLevel.setColor a color
  color <- commonSelectionColor
  LowLevel.setSelectionColor a color
  return a

valueOutputNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.ValueOutput)
valueOutputNew rect l = do
  let customDraw :: Ref LowLevel.ValueOutput -> IO ()
      customDraw vo =
        withCustomBoxDraw
          BorderBox
          (\rect color -> do
              LowLevel.flcRectfWithColor rect color
              focused <- isWidget vo FL.focus
              inputBox focused rect color)
          (LowLevel.drawValueOutputBase (safeCast vo))
  vo <- LowLevel.valueOutputCustom rect l (Just customDraw) Nothing
  LowLevel.setColor vo lightBackground
  LowLevel.setBox vo BorderBox
  LowLevel.setTextfont vo commonFont
  LowLevel.setTextsize vo commonFontSize
  color <- commonSelectionColor
  LowLevel.setSelectionColor vo color
  LowLevel.setLabelfont vo commonFont
  LowLevel.setLabelsize vo commonFontSize
  return vo

valueInputNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.ValueInput)
valueInputNew rect l = do
  let customDraw :: Ref LowLevel.ValueInput -> IO ()
      customDraw vi =
        withCustomBoxDraw
          BorderBox
          (\rect color -> do
              LowLevel.flcRectfWithColor rect color
              focused <- isWidget vi FL.focus
              inputBox focused rect color)
          (LowLevel.drawValueInputBase (safeCast vi))
  vi <- LowLevel.valueInputCustom rect l (Just customDraw) Nothing
  LowLevel.setColor vi lightBackground
  LowLevel.setBox vi BorderBox
  LowLevel.setTextfont vi commonFont
  LowLevel.setTextsize vi commonFontSize
  color <- commonSelectionColor
  LowLevel.setSelectionColor vi color
  LowLevel.setLabelfont vi commonFont
  LowLevel.setLabelsize vi commonFontSize
  return vi
