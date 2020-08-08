module Main where
import FastSlow
import Graphics.UI.FLTK.LowLevel.FLTKHS
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations

main :: IO ()
main = do
  w <- make_window
  showWidget w
  _ <- FL.run
  return ()
