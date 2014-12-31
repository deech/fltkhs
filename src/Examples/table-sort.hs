{-# LANGUAGE CPP #-}
module Main where
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.FLTKHS
import System.Process
dirCommand :: ([Char], [[Char]])
dirHeaders :: [[Char]]
#ifdef ming32_HOST_OS
dirCommand = ("dir", [])
dirHeaders = ["Perms", "#L", "Own", "Group", "Size", "Date", "", "", "Filename"]
#else
dirCommand = ("ls", ["-l"])
dirHeaders = ["Date", "Time", "Size", "Filename", "", "", "", "", ""]
#endif
margin :: Int
margin = 20
headerFontFace :: Font
headerFontFace = helveticaBold
headerFontSize :: Int
headerFontSize = 16
rowFontFace :: Font
rowFontFace = helvetica
rowFontSize :: Int
rowFontSize = 16
sortReverse :: Bool
sortReverse = False
sortLastCol :: Bool
sortLastCol = False
drawCell :: Ref TableRow -> TableContext -> Int -> Int -> Rectangle -> IO ()
drawCell = undefined
main :: IO ()
main = do
  window <- doubleWindowNew
              (Size (Width 900) (Height 500))
              Nothing
              (Just "Table Sorting")
  windowW <- getW window
  windowH <- getH window
  begin window
  table <- tableRowNew
             (Rectangle
               (Position (X margin) (Y margin))
               (Size (Width $ windowW - margin * 2)
                     (Height $ windowH - margin * 2)))
             Nothing
             defaultCustomWidgetFuncs
             (defaultCustomTableFuncs {
                drawCellCustom = Just drawCell
             })
  rows <- uncurry readProcess dirCommand "" >>= return . map words . lines
  _ <- showWidget window
  _ <- FL.run
  return ()
