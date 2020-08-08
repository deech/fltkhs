{-# LANGUAGE OverloadedStrings #-}
module Main where
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.FLTKHS

main :: IO ()
main = do
  win <- doubleWindowNew (toSize (640,480)) Nothing (Just "Simple Fl_Text_Editor")
  buff <- textBufferNew Nothing Nothing
  edit <- textEditorNew (toRectangle (20,20,(640-40),(480-40))) Nothing
  setBuffer edit (Just buff)
  showWidget win
  setText buff "line 0\nline 1\nline 2\nline 3\nline 4\nline 5\nline 6\nline 7\nline 8\nline 9\nline 10\nline 11\nline 12\nline 13\nline 14\nline 15\nline 16\nline 17\nline 18\nline 19\nline 20\nline 21\nline 22\nline 23\n"
  _ <- FL.run
  return ()
