{-# LANGUAGE CPP #-}
module Main where
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Control.Monad
import Graphics.UI.FLTK.LowLevel.FLTKHS
import Data.IORef
import Data.List
import Data.Function
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
headerFontSize :: FontSize
headerFontSize = FontSize 16
rowFontFace :: Font
rowFontFace = helvetica
rowFontSize :: FontSize
rowFontSize = FontSize 16

data TableState = TableState {
  sortReverse :: IORef Bool,
  sortLastCol :: IORef Int,
  rowData :: IORef [[String]]
  }

drawSortArrow :: Rectangle -> Bool -> IO ()
drawSortArrow (Rectangle (Position (X x') (Y y')) (Size (Width w') (Height h'))) sortReverse' =
  let xlft = x' + (w'-6) - 8
      xctr = x' + (w'-6) - 4
      xrit = x' + (w'-6) - 0
      ytop = y' + (truncate ((fromIntegral h' / 2) :: Double)) - 4
      ybot = y' + (truncate ((fromIntegral h' / 2) :: Double)) + 4
  in
   if sortReverse'
   then do
     flcSetColor whiteColor
     flcLine (Position (X xrit) (Y ytop)) (Position (X xctr) (Y ybot))
     flcSetColorWithC 41
     flcLine (Position (X xlft) (Y ytop)) (Position (X xrit) (Y ytop))
     flcLine (Position (X xlft) (Y ytop)) (Position (X xctr) (Y ybot))
   else do
     flcSetColor whiteColor
     flcLine (Position (X xrit) (Y ybot)) (Position (X xctr) (Y ybot))
     flcLine (Position (X xrit) (Y ybot)) (Position (X xlft) (Y ybot))
     flcSetColorWithC 41
     flcLine (Position (X xlft) (Y ybot)) (Position (X xctr) (Y ytop))

drawCell ::  TableState -> Ref TableRow -> TableContext -> TableCoordinate -> Rectangle -> IO ()
drawCell tableState table tc (TableCoordinate (Row row') (Column col')) rectangle' =
  let (x',y',w',h') = fromRectangle rectangle'
  in do
    sortReverse' <- readIORef (sortReverse tableState)
    sortLastCol' <- readIORef (sortLastCol tableState)
    rowData' <- readIORef (rowData tableState)
    numCols <- getCols table
    numRows <- getRows table
    if (row' < numRows && col' < numCols)
      then case tc of
            ContextColHeader -> do
              flcPushClip rectangle'
              flcDrawBox ThinUpBox rectangle' backgroundColor
              if (col' < 9)
                then do
                  flcSetColor blackColor
                  flcDrawInBox
                    (dirHeaders !! col')
                    (toRectangle ((x'+2),y',w',h'))
                    alignLeft
                    Nothing
                    Nothing
                  if (col' == sortLastCol')
                    then drawSortArrow rectangle' sortReverse'
                    else return ()
                else return ()
              flcPopClip
            ContextCell -> do
              flcPushClip rectangle'
              bgColor <- do
                isSelected' <- getRowSelected table row'
                case isSelected' of
                  Right is' -> if is'
                               then getSelectionColor table
                               else return whiteColor
                  Left _ -> error $ "Row: " ++ (show row') ++ " is out of range."
              flcSetColor bgColor
              flcRectf rectangle'
              flcSetFont rowFontFace rowFontSize
              flcSetColor blackColor
              let currentRow = rowData' !! row'
              flcDrawInBox
                (indexOr "" col' currentRow)
                (toRectangle $ (x'+2,y',w',h'))
                alignLeft
                Nothing
                Nothing
              flcSetColor light2Color
              flcRect rectangle'
              flcPopClip
            _ -> return ()
      else return ()
setIndex :: Int -> [a] -> (a -> a) -> [a]
setIndex idx' xs f =
  map
   (
    \(i,e) -> if (i == idx')
                 then f e
                 else e
   )
   (zip [0..] xs)

indexOr :: a -> Int -> [a] -> a
indexOr fallback idx xs =
  if (idx < length xs)
  then xs !! idx
  else fallback

eventCallback :: TableState -> Ref TableRow -> IO ()
eventCallback tableState table = do
  (Column  col') <- callbackCol table
  context' <- callbackContext table
  case context' of
   ContextColHeader -> do
     event' <- FL.event
     mouseButton' <- FL.eventButton
     if (event' == Release && mouseButton' == Mouse_Left)
       then do
         sortLastCol' <- readIORef (sortLastCol tableState)
         if (sortLastCol' == col')
           then readIORef (sortReverse tableState) >>= writeIORef (sortReverse tableState) . toggle
           else writeIORef (sortReverse tableState) False
         sortReverse' <- readIORef (sortReverse tableState)
         rowData' <- readIORef (rowData tableState) >>= return . zip [(0 :: Int)..]
         let sorted = sortBy (compare `on` (indexOr "" col'. snd)) rowData'
         writeIORef
           (rowData tableState)
           (if sortReverse'
            then (reverse $ map snd sorted)
            else map snd sorted)
         writeIORef (sortLastCol tableState) col'
         redraw table
         else return ()
   _ -> return ()
  where toggle True = False
        toggle False = True

autowidth :: Ref TableRow -> Int -> [[String]] -> IO ()
autowidth table pad rowData' = do
  flcSetFont headerFontFace headerFontSize
  mapM_
    (\(colNum, colName) -> do
        (Size (Width w') _) <- flcMeasure colName Nothing
        setColWidth table (Column colNum) (w' + pad)
    )
    (zip [0 ..] dirHeaders)
  flcSetFont rowFontFace rowFontSize
  mapM_
    (\row' -> do
      mapM_
        (\(colIdx,col) -> do
            (Size (Width wc') _) <- flcMeasure col Nothing
            colWidth' <- getColWidth table (Column colIdx)
            if (wc' + pad > colWidth')
              then setColWidth table (Column colIdx) (wc' + pad)
              else return ()
        )
        (zip [0..] row')
    )
    rowData'
  -- need to do { table_resized(); redraw(); }
  -- but table_resized() is unexposed.
  -- setting the row_header flag induces this.
  getRowHeader table >>= setRowHeader table

resize_window :: Ref DoubleWindow -> Ref TableRow -> IO ()
resize_window window table = do
  let width = (4 :: Int)
  numCols <- getCols table
  colWidthTotal <- liftM sum $ mapM (getColWidth table . Column) [0..(numCols - 1)]
  let totalWidth = width + colWidthTotal + (margin * 2)
  appWidth <- FL.w
  if (totalWidth < 200 || totalWidth > appWidth)
    then return ()
    else do
      x' <- getX window
      y' <- getY window
      h' <- getH window
      resize window $ toRectangle (x',y',totalWidth,h')

main :: IO ()
main = do
  window <- doubleWindowNew
              (Size (Width 900) (Height 500))
              Nothing
              (Just "Table Sorting")
  windowW <- getW window
  windowH <- getH window
  rows <- uncurry readProcess dirCommand "" >>= return . map words . lines
  rowData' <- newIORef rows
  sortReverse' <- newIORef False
  sortLastCol' <- newIORef (-1)
  let tableState = TableState sortReverse' sortLastCol' rowData'
  begin window
  table <- tableRowNew
             (Rectangle
               (Position (X margin) (Y margin))
               (Size (Width $ windowW - margin * 2)
                     (Height $ windowH - margin * 2)))
             Nothing
             defaultCustomWidgetFuncs
             (defaultCustomTableFuncs {
                drawCellCustom = Just $ drawCell tableState
             })
  setColHeader table True
  setColResize table True
  setSelectionColor table yellowColor
  setWhen table [WhenRelease]
  readIORef rowData' >>= setRows table . length
  readIORef rowData' >>= setCols table . maximum . map length
  setRowHeightAll table 18
  readIORef rowData' >>= autowidth table 20
  setTooltip table "Click on column headings to toggle column sorting"
  setColor table whiteColor
  setCallback table (eventCallback tableState)
  end window
  setResizable window table
  resize_window window table
  _ <- showWidget window
  _ <- FL.run
  return ()
