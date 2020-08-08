{-# LANGUAGE ImplicitParams #-}
module Graphics.UI.FLTK.Theme.Light.Misc
  (
    header
  , darkHeader
  )
where
import qualified Graphics.UI.FLTK.LowLevel.FLTKHS as LowLevel
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.Theme.Light.Common
import Graphics.UI.FLTK.Theme.Light.Assets

drawBackground :: (?assets :: Assets) => FillSpec -> Alignments -> LowLevel.Ref LowLevel.Box -> IO ()
drawBackground spec alignments b = do
  r <- LowLevel.getRectangle b
  fillRectangle (spec { fillBounds = r }) False
  LowLevel.drawLabel b (Just (r,alignments))

-- | This widget was intended for use as a app header bar, similar to the one provided by
-- [GTK3](https://developer.gnome.org/gtk3/stable/GtkHeaderBar.html) but really
-- it's just a "Graphics.UI.FLTK.LowLevel.Box" labeled with 'T.Text' and with a background vertically graded
-- with the 'Color' provided. You can use it for anything you like. For a more "turn-key" app
-- header that works nicely with the Light theme you probably want 'darkHeader'.
header :: (?assets :: Assets) => Color -> Rectangle -> T.Text -> Alignments -> IO (LowLevel.Ref LowLevel.Box)
header c r l alignments =
  let fillSpec =
        FillSpec
        {
          fillBounds = r
        , fillTopColor = c
        , fillTopSelectionColor = c
        , fillTopFillPercentage = 10
        , fillBottomColor = darker c
        , fillBottomSelectionColor = c
        , fillBottomFillPercentage = 90
        , fillCornerRadius = 0
        , fillBorderColor = c
        , fillBorderFocusColor = c
        , fillBorderHovered = c
        }
  in do
    b <- LowLevel.boxCustom r (Just l) (Just (drawBackground fillSpec alignments)) Nothing
    LowLevel.setLabel b l
    return b

-- | Same as 'header' except it doesn't take a 'Color' and uses the 'commonDarkGreyColor' and the
-- a large 'josefinSlabSemiBold' font for the label.
darkHeader :: (?assets :: Assets) => Rectangle -> T.Text -> Alignments -> IO (LowLevel.Ref LowLevel.Box)
darkHeader r l alignments = do
  c <- commonDarkGreyColor
  b <- header c r l alignments
  LowLevel.setLabelfont b josefinSlabSemiBold
  LowLevel.setLabelsize b commonLargeFontSize
  LowLevel.setLabelcolor b whiteColor
  return b
