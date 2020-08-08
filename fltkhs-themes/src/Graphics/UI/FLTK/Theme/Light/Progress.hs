{-# LANGUAGE ImplicitParams, OverloadedStrings #-}
module Graphics.UI.FLTK.Theme.Light.Progress
  (
    progressNew,
    drawProgress
  )
where
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.Theme.Light.Common
import qualified Data.Text as T
import qualified Graphics.UI.FLTK.LowLevel.FLTKHS as LowLevel
import Graphics.UI.FLTK.Theme.Light.Assets

-- | Custom progress bar drawing function
drawProgress :: Ref LowLevel.Progress -> IO ()
drawProgress p = do
  rect <- LowLevel.getRectangle p
  progressMin <- LowLevel.getMinimum p
  progressMax <- LowLevel.getMaximum p
  v <- LowLevel.getValue p
  color <- LowLevel.getColor p
  let (x,y,w,h) = fromRectangle rect
      slightlyDarker = colorAverage color blackColor 0.85
      progressW = (truncate ((fromIntegral w) * (v/(progressMax-progressMin))))
  selectionColor <- LowLevel.getSelectionColor p
  let fillColor = darker selectionColor
  hoverColor <- rgbColorWithRgb (0xBB, 0xBB, 0xBB)
  let spec =
        BorderBoxSpec
             {
               borderBoxHoveringColor = hoverColor,
               borderBoxColor = slightlyDarker,
               borderBoxFocusedColor = fillColor,
               borderBoxFillColor = color,
               borderBoxBounds = rect
             }
  drawBorderBox p spec True
  LowLevel.flcRectfWithColor (toRectangle (x+1,y+1,progressW,h-2)) selectionColor

progressNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.Progress)
progressNew rect l = do
  p <- LowLevel.progressCustom rect l
         (Just drawProgress)
         Nothing
  LowLevel.setColor p lightBackground
  LowLevel.setBox p BorderBox
  LowLevel.setLabelfont p commonFont
  LowLevel.setLabelsize p commonFontSize
  color <- commonFillColor
  LowLevel.setSelectionColor p color
  return p
