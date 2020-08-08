module Main where
import Tree
import Graphics.UI.FLTK.LowLevel.FLTKHS
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations

main :: IO ()
main = do
  win <- make_window
  showWidget win
  _ <- FL.run
  return ()
