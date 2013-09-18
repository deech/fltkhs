module Main where
import Graphics.UI.FLTK.LowLevel.Fl_Window
import Graphics.UI.FLTK.LowLevel.FL
import Graphics.UI.FLTK.LowLevel.Fl_Types
testCallback :: CallbackPrim
testCallback _ _ = putStrLn "Here!"

main :: IO ()
main = do
  windowPtr <- windowNewWithLabel 100 100 "Test"
  windowSetCallback windowPtr testCallback
  windowShow windowPtr
  flRun
