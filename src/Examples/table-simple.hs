module Main where
import Graphics.UI.FLTK.LowLevel.FL
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Double_Window
import Graphics.UI.FLTK.LowLevel.Fl_Draw
import Graphics.UI.FLTK.LowLevel.Fl_Table

maxRows = 30
maxCols = 26
tableData =
    let rowIndices = [0 .. (maxRows - 1)]
        colIndices = [0 .. (maxCols - 1)]
    in
      map (\r -> map (\c -> 1000 + (r * 1000) + c) colIndices) rowIndices
drawHeader :: Table a -> String -> Rectangle -> IO ()
drawHeader table s rectangle = do
  flcPushClip rectangle
  rhc <- tableRowHeaderColor table
  flcDrawBox ThinUpBox rectangle rhc
  flcSetColor blackColor
  flcDrawInBoundingBox s rectangle AlignCenter Nothing Nothing Nothing
  flcPopClip
drawData :: Table a -> String -> Rectangle -> IO ()
drawData table s rectangle = do
  flcPushClip rectangle
  flcSetColor whiteColor >> flcRectf rectangle
  flcSetColor gray0Color >> flcDrawInBoundingBox s rectangle AlignCenter Nothing Nothing Nothing
  color <- tableColor table
  flcSetColor color >> flcRect rectangle
  flcPopClip
drawCell :: Table a -> TableContext -> Int -> Int -> Rectangle -> IO ()
drawCell table context row col rectangle = do
  case context of
   ContextStartPage -> flcSetFont helvetica (FontSize 16)
   ContextColHeader ->
       let a = fromEnum 'A'
           currentLetter :: Char
           currentLetter = (toEnum $ fromEnum a + col)
       in
       drawHeader table [currentLetter] rectangle
   ContextRowHeader -> drawHeader table (show row) rectangle
   ContextCell -> drawData table (show $ tableData !! row !! col) rectangle
   _ -> return ()
initializeTable :: Table a -> IO ()
initializeTable table = do
  tableBegin table
  tableSetRows table maxRows
  tableSetRowHeader table True
  tableSetRowHeightAll table 20
  tableSetRowResize table False
  tableSetCols table maxCols
  tableSetColHeader table True
  tableSetColWidthAll table 80
  tableSetColResize table True
  tableEnd table
main :: IO ()
main = do
  window <- doubleWindowNew
              (Size (Width 900) (Height 400))
              Nothing
              (Just "Simple Table")
              Nothing
  doubleWindowBegin window
  table <- tableNew
             (Rectangle
               (Position (X 10) (Y 10))
               (Size (Width 880) (Height 380)))
             Nothing
             defaultTableFuncs {
               tableDrawCellOverride = (Just drawCell)
             }
  initializeTable table
  doubleWindowSetResizable window table
  doubleWindowEnd window
  doubleWindowShow window
  _ <- run
  return ()
