{-# LANGUAGE ImplicitParams, OverloadedStrings #-}
module Graphics.UI.FLTK.Theme.Light.Wizard
  (
    wizardNew
  )
where
import Graphics.UI.FLTK.Theme.Light.Common
import Graphics.UI.FLTK.Theme.Light.Assets
import qualified Graphics.UI.FLTK.LowLevel.FLTKHS as LowLevel
import qualified Data.Text as T

wizardNew :: (?assets :: Assets) => LowLevel.Rectangle -> Maybe T.Text -> IO (LowLevel.Ref LowLevel.Wizard)
wizardNew r l = do
  w <- LowLevel.wizardNew r l
  LowLevel.setColor w lightBackground
  color <- commonSelectionColor
  LowLevel.setSelectionColor w color
  LowLevel.setLabelfont w commonFont
  LowLevel.setLabelsize w commonFontSize
  return w
