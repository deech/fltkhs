{-# LANGUAGE ImplicitParams, ScopedTypeVariables #-}
module Graphics.UI.FLTK.Theme.Light.Positioner
  (
    positionerNew
  )
where
import Graphics.UI.FLTK.Theme.Light.Common
import qualified Data.Text as T
import qualified Graphics.UI.FLTK.LowLevel.FLTKHS as LowLevel
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.Theme.Light.Assets

positionerNew :: (?assets :: Assets) => LowLevel.Rectangle -> Maybe T.Text -> IO (LowLevel.Ref LowLevel.Positioner)
positionerNew rect l = do
  let customDraw :: LowLevel.Ref LowLevel.Positioner -> IO ()
      customDraw p = do
        (color :: Color) <- LowLevel.getColor p
        let slightlyDarker = colorAverage color blackColor 0.85
        withCustomBoxDraw
          BorderBox
          (\rect _ -> do
              LowLevel.flcRectfWithColor rect color
              LowLevel.flcRectWithColor rect slightlyDarker)
          (LowLevel.drawPositionerBase (safeCast p))
  p <- LowLevel.positionerCustom rect l (Just customDraw) Nothing
  LowLevel.setLabelfont p commonFont
  LowLevel.setLabelsize p commonFontSize
  LowLevel.setColor p lightBackground
  LowLevel.setBox p BorderBox
  LowLevel.setSelectionColor p redColor
  return p
