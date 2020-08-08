{-# LANGUAGE ImplicitParams, OverloadedStrings, AllowAmbiguousTypes, GADTs, CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
module Graphics.UI.FLTK.Theme.Light.Browser
  (
    browserNew,
    selectBrowserNew,
    fileBrowserNew,
    browserDraw,
    browserSetup
  )
where
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.Theme.Light.Common
import qualified Data.Text as T
import qualified Graphics.UI.FLTK.LowLevel.FLTKHS as LowLevel
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.Theme.Light.Assets

-- | The custom 'draw' function for creating the themed browser
browserDraw :: Ref LowLevel.BrowserBase -> IO ()
browserDraw b = do
  (color :: Color) <- LowLevel.getColor b
  let slightlyDarker = colorAverage color blackColor 0.85
  withCustomBoxDraw
    BorderBox
    (\rect _ -> do
        LowLevel.flcRectfWithColor rect color
        LowLevel.flcRectWithColor rect slightlyDarker)
    (LowLevel.drawBrowserBase (safeCast b))

-- | Setting the theme's color, fonts etc
browserSetup :: (?assets :: Assets) => Ref LowLevel.BrowserBase -> IO ()
browserSetup b = do
  LowLevel.setColor b lightBackground
  LowLevel.setBox b BorderBox
  LowLevel.setLabelfont b commonFont
  LowLevel.setLabelsize b commonFontSize
  LowLevel.setTextfont b commonFont
  c <- commonSelectionColor
  LowLevel.setScrollbarSize b 10
  LowLevel.setSelectionColor b c
  LowLevel.setTextsize b commonFontSize

browserNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.Browser)
browserNew rect l = do
  b <- LowLevel.browserCustom rect l (Just (browserDraw . safeCast)) Nothing
  browserSetup (safeCast b)
  return b

selectBrowserNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.SelectBrowser)
selectBrowserNew rect l = do
  b <- browserNew rect l
  LowLevel.setType b SelectBrowserType
  return (castTo b)

fileBrowserNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.FileBrowser)
fileBrowserNew rect l = do
  b <- LowLevel.fileBrowserCustom rect l (Just (browserDraw . safeCast)) Nothing
  browserSetup (safeCast b)
  return b
