module Main where
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.FLTKHS
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations

maxRows :: Int
maxRows = 30
maxCols :: Int
maxCols = 26
tableData :: [[Int]]
tableData =
    let rowIndices = [0 .. (maxRows - 1)]
        colIndices = [0 .. (maxCols - 1)]
    in
      map (\r -> map (\c -> 1000 + (r * 1000) + c) colIndices) rowIndices
drawHeader :: Ref Table -> String -> Rectangle -> IO ()
drawHeader table s rectangle = do
  flcPushClip rectangle
  rhc <- getRowHeaderColor table
  flcDrawBox ThinUpBox rectangle rhc
  flcSetColor blackColor
  flcDrawInBox s rectangle alignCenter Nothing Nothing
  flcPopClip
drawData :: Ref Table -> String -> Rectangle -> IO ()
drawData table s rectangle = do
  flcPushClip rectangle
  flcSetColor whiteColor >> flcRectf rectangle
  flcSetColor gray0Color >> flcDrawInBox s rectangle alignCenter Nothing Nothing
  color' <- getColor table
  flcSetColor color' >> flcRect rectangle
  flcPopClip
drawCell :: Ref Table -> TableContext -> TableCoordinate -> Rectangle -> IO ()
drawCell table context (TableCoordinate (Row row) (Column col)) rectangle = do
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
initializeTable :: Ref Table -> IO ()
initializeTable table = do
  begin table
  setRows table maxRows
  setRowHeader table True
  setRowHeightAll table 20
  setRowResize table False
  setCols table maxCols
  setColHeader table True
  setColWidthAll table 80
  setColResize table True
  end table
main :: IO ()
main = do
  window <- doubleWindowNew
              (Size (Width 900) (Height 400))
              Nothing
              (Just "Simple Table")
  begin window
  table <- tableCustom
             (Rectangle
               (Position (X 10) (Y 10))
               (Size (Width 880) (Height 380)))
             Nothing
             defaultCustomWidgetFuncs
             defaultCustomTableFuncs {
               drawCellCustom = (Just drawCell)
             }
  initializeTable table
  setResizable window (Just table)
  end window
  showWidget window
  _ <- FL.run
  return ()
