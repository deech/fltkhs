{-# LANGUAGE ImplicitParams, OverloadedStrings, AllowAmbiguousTypes, GADTs, CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
module Graphics.UI.FLTK.Theme.Light.Menu
  (
    choiceNew,
    sysMenuBarNew
  )
where
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.Theme.Light.Common
import qualified Data.Text as T
import qualified Graphics.UI.FLTK.LowLevel.FLTKHS as LowLevel
import Graphics.UI.FLTK.Theme.Light.Assets

sysMenuBarNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.SysMenuBar)
sysMenuBarNew rectangle label = do
  let customDraw :: Ref LowLevel.SysMenuBar -> IO ()
      customDraw m = do
        (color :: Color) <- LowLevel.getColor m
        let slightlyDarker = colorAverage color blackColor 0.80
        items <- LowLevel.getMenu m
        mapM_
          (\miMaybe ->
             maybe
               (return ())
               (\mi -> do
                   LowLevel.setLabelfont mi commonFont
                   LowLevel.setLabelsize mi commonFontSize)
               miMaybe)
          items
        withCustomBoxDraw
          BorderBox
          (\rect _ -> do
              let (x',y',w',h') = fromRectangle rect
              LowLevel.flcSetColor slightlyDarker
              LowLevel.flcBeginLine
              LowLevel.flcVertex (toPrecisePosition (toPosition (x',y'+h')))
              LowLevel.flcVertex (toPrecisePosition (toPosition (x'+w',y'+h')))
              LowLevel.flcEndLine
              LowLevel.flcSetColor color
          )
          (LowLevel.drawSysMenuBarBase (safeCast m))
  m <- LowLevel.sysMenuBarCustom
         rectangle
         label
         (Just customDraw)
         Nothing
  LowLevel.setBox m BorderBox
  LowLevel.setColor m lightBackground
  LowLevel.setTextfont m commonFont
  LowLevel.setTextsize m commonFontSize
  return m

choiceNew :: (?assets :: Assets) =>  Rectangle -> Maybe T.Text -> IO (Ref LowLevel.Choice)
choiceNew rectangle label = do
  c <- LowLevel.choiceCustom
         rectangle
         label
         (Just drawChoice)
         Nothing
  let color = lightBackground
  LowLevel.setLabelfont c commonFont
  LowLevel.setLabelsize c commonFontSize
  LowLevel.setTextfont c commonFont
  LowLevel.setTextsize c commonFontSize
  LowLevel.setColor c color
  color <- commonSelectionColor
  LowLevel.setSelectionColor c color
  return c

drawChoice :: Ref LowLevel.Choice -> IO ()
drawChoice c = do
  color <- LowLevel.getColor c
  selectionColor <- fmap darker (LowLevel.getSelectionColor c)
  bounds' <- LowLevel.getRectangle c
  let (x,y,w,h) = fromRectangle bounds'
  let slightlyDarker = colorAverage color blackColor 0.85
  hoverColor <- rgbColorWithRgb (0xBB, 0xBB, 0xBB)
  let spec =
        BorderBoxSpec
        {
          borderBoxHoveringColor = hoverColor,
          borderBoxColor = slightlyDarker,
          borderBoxFocusedColor = selectionColor,
          borderBoxFillColor = color,
          borderBoxBounds = toRectangle (x,y,w-1,h-1)
        }
  withCustomBoxDraw UpBox (\_ _ -> drawBorderBox c spec True) (LowLevel.drawChoiceBase (safeCast c))
