{-# LANGUAGE ImplicitParams, OverloadedStrings #-}
module Graphics.UI.FLTK.Theme.Light.TextDisplay
  (
    textDisplayNew
  )
where
import Graphics.UI.FLTK.Theme.Light.Common
import qualified Graphics.UI.FLTK.LowLevel.FLTKHS as LowLevel
import qualified Data.Text as T
import Graphics.UI.FLTK.Theme.Light.Assets

textDisplayNew :: (?assets :: Assets) => LowLevel.Rectangle -> Maybe T.Text -> IO (LowLevel.Ref LowLevel.TextDisplay)
textDisplayNew r l = do
  t <- LowLevel.textDisplayNew r l
  LowLevel.setColor t lightBackground
  LowLevel.setTextfont t commonFont
  LowLevel.setTextsize t commonFontSize
  color <- commonSelectionColor
  LowLevel.setSelectionColor t color
  LowLevel.setLabelfont t commonFont
  LowLevel.setLabelsize t commonFontSize
  return t
