{-# LANGUAGE ImplicitParams, ScopedTypeVariables, OverloadedStrings, AllowAmbiguousTypes, GADTs, CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
module Graphics.UI.FLTK.Theme.Light.Input
  (
    fileInputNew,
    inputBox,
    inputNew,
    outputNew,
    inputSetup,
    inputDraw
  )
where
import Control.Monad
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.Theme.Light.Common
import qualified Data.Text as T
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import qualified Graphics.UI.FLTK.LowLevel.FLTKHS as LowLevel
import Graphics.UI.FLTK.Theme.Light.Assets

inputBox :: Bool -> Rectangle -> Color -> IO ()
inputBox focused r c =
  if focused
  then do
    color <- commonFillColor
    LowLevel.flcRectWithColor r color
  else
    let slightlyDarker = colorAverage c blackColor 0.75
        (x',y',w',_) = fromRectangle r
    in do
    LowLevel.flcRectWithColor r slightlyDarker
    LowLevel.flcSetColor blackColor
    LowLevel.flcBeginLine
    LowLevel.flcVertex (toPrecisePosition (toPosition (x',y')))
    LowLevel.flcVertex (toPrecisePosition (toPosition (x'+w'-1,y')))
    LowLevel.flcEndLine

inputDraw :: Ref LowLevel.InputBase -> IO ()
inputDraw i =
  withCustomBoxDraw
    BorderBox
    (\rect color -> do
        LowLevel.flcRectfWithColor rect color
        focused <- isWidget i FL.focus
        inputBox focused rect color)
    (do
       t <- LowLevel.getInputType i
       r <- LowLevel.getRectangle i
       rBox <- FL.adjustBoundsByBoxtype r BorderBox
       case t of
         LowLevel.FlHiddenInput -> return ()
         _ -> do
           ds <- LowLevel.getDamage i
           if (DamageAll `elem` ds)
             then do
             color <- LowLevel.getColor i
             LowLevel.drawBoxWithBoxtype i BorderBox color Nothing
             else
               when (DamageExpose `elem` ds)
                 (do
                   focused <- isWidget i FL.focus
                   color <- LowLevel.getColor i
                   inputBox focused rBox color)
       LowLevel.drawText i rBox)

-- | Common setup function for all 'Input' widgets, sets label color, font etc.
inputSetup :: (?assets :: Assets) => Ref LowLevel.InputBase -> IO ()
inputSetup i = do
  LowLevel.setColor i lightBackground
  LowLevel.setBox i BorderBox
  LowLevel.setTextfont i commonFont
  LowLevel.setTextsize i commonFontSize
  color <- commonSelectionColor
  LowLevel.setSelectionColor i color
  LowLevel.setLabelfont i commonFont
  LowLevel.setLabelsize i commonFontSize

inputNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> Maybe LowLevel.FlInputType -> IO (Ref LowLevel.Input)
inputNew rect l it = do
  i <- LowLevel.inputCustom rect l it (Just (inputDraw . safeCast)) Nothing
  inputSetup (safeCast i)
  return i

fileInputNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.FileInput)
fileInputNew rect l = do
  i <- LowLevel.fileInputNew rect l
  inputSetup (safeCast i)
  return i

outputNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> Maybe LowLevel.FlOutputType -> IO (Ref LowLevel.Output)
outputNew rect l t = do
  o <- LowLevel.outputCustom rect l
        (Just (inputDraw . safeCast))
        Nothing
  inputSetup (safeCast o)
  maybe (return ()) (\t -> LowLevel.setType o t) t
  return o
