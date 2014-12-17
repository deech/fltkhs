{-# LANGUAGE CPP #-}
module Main where
import Graphics.UI.FLTK.LowLevel.FL
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Double_Window
import Graphics.UI.FLTK.LowLevel.Fl_Draw
import Graphics.UI.FLTK.LowLevel.Fl_Table_Row
import System.Process
#ifdef ming32_HOST_OS
dirCommand = ("dir", [])
dirHeaders = ["Perms", "#L", "Own", "Group", "Size", "Date", "", "", "Filename"]
#else
dirCommand = ("ls", ["-l"])
dirHeaders = ["Date", "Time", "Size", "Filename", "", "", "", "", ""]
#endif
margin = 20
headerFontFace = helveticaBold
headerFontSize = 16
rowFontFace = helvetica
rowFontSize = 16
sortReverse = False
sortLastCol = False
drawCell = undefined
main :: IO ()
main = do
  window <- doubleWindowNew
              (Size (Width 900) (Height 500))
              Nothing
              (Just "Table Sorting")
              Nothing
  windowW <- doubleWindowW window
  windowH <- doubleWindowH window
  doubleWindowBegin window
  table <- tableRowNew
             (Rectangle
               (Position (X margin) (Y margin))
               (Size (Width $ windowW - margin * 2)
                     (Height $ windowH - margin * 2)))
             Nothing
             (defaultTableRowFuncs {
                tableRowDrawCellOverride = Just drawCell
             })
  rows <- uncurry readProcess dirCommand "" >>= return . map words . lines
  _ <- run
  return ()
