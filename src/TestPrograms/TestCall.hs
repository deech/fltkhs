module Main where
import Graphics.UI.FLTK.LowLevel.Fl_Window
import Graphics.UI.FLTK.LowLevel.FL    
main :: IO ()
main = do
  windowPtr <- windowNewWithLabel 100 100 "Test"
  windowShow windowPtr
  flRun
