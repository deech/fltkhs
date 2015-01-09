module Main where
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.FLTKHS

main :: IO ()
main = do
  w1 <- doubleWindowNew (Size (Width 220) (Height 220)) Nothing (Just "clock")
  begin w1
  c1 <- clockNew (toRectangle (0,0,220,220)) Nothing
  setResizable w1 c1
  end w1
  w2 <- doubleWindowNew (Size (Width 220) (Height 220)) Nothing (Just "Rounded Clock")
  begin w2
  c2 <- clockNew (toRectangle (0,0,220,220)) Nothing
  setResizable w2 c2
  end w2
  setXclass w1 "Fl_Clock"
  setXclass w2 "Fl_Clock"
  showWidget w1
  showWidget w2
  _ <- FL.run
  return ()
