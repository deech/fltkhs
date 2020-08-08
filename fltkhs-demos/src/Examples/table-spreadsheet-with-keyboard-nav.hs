{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Main where
import           Data.IORef
import qualified Graphics.UI.FLTK.LowLevel.FL              as FL
import           Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import           Graphics.UI.FLTK.LowLevel.Fl_Types
import           Graphics.UI.FLTK.LowLevel.FLTKHS
import qualified Data.Text as T
maxCols, maxRows :: Int
maxCols = 26
maxRows = 500

data SpreadsheetProperties =
  SpreadsheetProperties
  {
    rowEdit      :: Int
  , colEdit      :: Int
  , sLeftTop     :: TableCoordinate
  , sRightBottom :: TableCoordinate
  , values       :: [[Int]]
  }

setIndex :: Int -> (a -> a) -> [a] -> [a]
setIndex idx' f xs =
  map
   (
    \(i,e) -> if (i == idx')
                 then f e
                 else e
   )
   (zip [0..] xs)

setValueHide :: IORef SpreadsheetProperties -> Ref Table -> Ref Input -> IO ()
setValueHide sp' table' intInput' = do
  props' <- readIORef sp'
  inputValue' <- getValue intInput' >>= return . read . T.unpack
  let updatedValues' = setIndex
                         (rowEdit props')
                         (setIndex
                           (colEdit props')
                           (const inputValue'))
                         (values props')
      updatedProperties' = props' {
          values = updatedValues'
        }
  writeIORef sp' updatedProperties'
  hide intInput'
  window' <- getWindow table'
  maybe (return ()) (\w' -> setCursor w' CursorDefault ) window'

startEditing :: IORef SpreadsheetProperties -> Ref Input -> Ref Table -> TableCoordinate -> IO ()
startEditing props' intInput' table' (TableCoordinate (Row row') (Column col')) = do
  modifyIORef props' (\p' -> p' {rowEdit = row', colEdit = col'})
  _p <- readIORef props'
  setSelection table'
    (TableCoordinate (Row (rowEdit _p)) (Column (colEdit _p)))
    (TableCoordinate (Row (rowEdit _p)) (Column (colEdit _p)))
  rectangle' <- findCell table' ContextCell (TableCoordinate (Row (rowEdit _p)) (Column  (colEdit _p)))
  case rectangle' of
    Just rect' -> do
      resize intInput' rect'
      let cellContents = (values _p) !! (rowEdit _p) !! (colEdit _p)
      _ <- setValue intInput' (T.pack (show cellContents))
      _ <- setPosition intInput' 0 (Just (length $ show cellContents))
      showWidget intInput'
      _ <- takeFocus intInput'
      return ()
    _ -> return ()

doneEditing :: IORef SpreadsheetProperties -> Ref Input -> Ref Table -> IO ()
doneEditing props' intInput' table' = do
  _p <- readIORef props'
  visible' <- getVisible intInput'
  if visible'
   then setValueHide props' table' intInput'
   else return ()

eventCallback :: IORef SpreadsheetProperties -> Ref Input -> Ref Table -> IO ()
eventCallback props' intInput' table' = do
  _p <- readIORef props'
  (Row r') <- callbackRow table'
  (Column c') <- callbackCol table'
  context' <- callbackContext table'
  (Rows numRows') <- getRows table'
  (Columns numCols') <- getCols table'
  case context' of
    ContextCell -> do
      event' <- FL.event
      case event' of
        Push -> do
          doneEditing props' intInput' table'
          if (r' /= (numRows' -1) && c' /= (numCols' -1))
            then startEditing props' intInput' table' (TableCoordinate (Row r') (Column c'))
            else return ()
          return ()
        Keydown -> do
          eventKey' <- FL.eventKey
          if (eventKey' == (SpecialKeyType Kb_Escape))
            then return ()
            else if (r' == numRows' - 1 || c' == numCols' -1)
                 then return ()
                 else do
                   doneEditing props' intInput' table'
                   setSelection table' (TableCoordinate (Row r') (Column c')) (TableCoordinate (Row r') (Column c'))
                   startEditing props' intInput' table' (TableCoordinate (Row r') (Column c'))
                   newEvent <- FL.event
                   if (newEvent == Keydown)
                     then handle intInput' newEvent >> return ()
                     else return ()
                   return ()
        _  -> return ()
    _c -> if (any (== _c) [ContextTable, ContextRowHeader, ContextColHeader])
          then doneEditing props' intInput' table'
          else return ()

setBySlider :: Ref ValueSlider -> Ref Table -> (Ref Table -> Int -> IO ()) -> IO ()
setBySlider slider' table' f = do
  v' <- getValue slider'
  f table' (truncate $ v'+1)
  redraw table'

setColsCb :: Ref Table -> Ref ValueSlider -> IO ()
setColsCb table' slider' = do
  v' <- getValue slider'
  setCols table' (Columns (truncate (v' + 1)))
  redraw table'

setRowsCb :: Ref Table -> Ref ValueSlider -> IO ()
setRowsCb table' slider' = do
  v' <- getValue slider'
  setRows table' (Rows (truncate (v' + 1)))
  redraw table'

drawCell :: IORef SpreadsheetProperties -> Ref Input -> Ref Table -> TableContext -> TableCoordinate -> Rectangle -> IO ()
drawCell props' intInput' table' context' (TableCoordinate (Row row') (Column col')) rectangle' = do
  _p <- readIORef props'
  (Rows numRows') <- getRows table'
  (Columns numCols') <- getCols table'
  case context' of
   ContextStartPage -> do
     (p1,p2) <- getSelection table'
     modifyIORef props' (\p -> p {sLeftTop = p1, sRightBottom = p2})
   ContextColHeader -> do
     flcSetFont helveticaBold (FontSize 14)
     flcPushClip rectangle'
     getColHeaderColor table' >>= flcDrawBox ThinUpBox rectangle'
     flcSetColor blackColor
     if (col' == numCols' - 1)
       then flcDrawInBox "TOTAL" rectangle' alignCenter Nothing Nothing
       else flcDrawInBox (T.pack [toEnum $ fromEnum 'A' + col']) rectangle' alignCenter Nothing Nothing
     flcPopClip
   ContextRowHeader -> do
     flcSetFont helveticaBold (FontSize 14)
     flcPushClip rectangle'
     getRowHeaderColor table' >>= flcDrawBox ThinUpBox rectangle'
     flcSetColor blackColor
     if (row' == numRows' - 1)
       then flcDrawInBox "TOTAL" rectangle' alignCenter Nothing Nothing
       else flcDrawInBox (T.pack (show $ row' + 1)) rectangle' alignCenter Nothing Nothing
     flcPopClip
   ContextCell-> do
     visible' <- getVisible intInput'
     let (TableCoordinate (Row sTop') (Column sLeft')) = sLeftTop _p
         (TableCoordinate (Row sBottom') (Column sRight')) = sRightBottom _p
     if (row' == (rowEdit _p) && col' == (colEdit _p) && visible')
       then return ()
       else do
            if (row' >= sTop' && row' <= sBottom' && col' >= sLeft' && col' <= sRight')
              then flcDrawBox ThinUpBox rectangle' yellowColor
              else if (col' < numCols' - 1 && row' < numRows' - 1)
                   then do
                     selected' <- isSelected table' (TableCoordinate (Row row') (Column col'))
                     flcDrawBox ThinUpBox rectangle' (if selected' then yellowColor else whiteColor)
                   else flcDrawBox ThinUpBox rectangle' (Color 0xbbddbb00)
            flcPushClip rectangle'
            flcSetColor blackColor
            if (col' == numCols' - 1 || row' == numRows' - 1)
              then do
                flcSetFont helveticaBold (FontSize 14)
                let shownValues = map (take (numCols'- 1)) $ take (numRows' -1) (values _p)
                let s' = if (col' == numCols' - 1 && row' == numRows' - 1)
                         then (show . sum . map sum) shownValues
                         else if (col' == numCols' - 1)
                              then (show $ sum $ shownValues !! row')
                              else if (row' == numRows' - 1)
                                   then (show . sum . map (\r -> r !! col')) shownValues
                                   else ""
                let (x',y',w',h') = fromRectangle rectangle'
                flcDrawInBox (T.pack s') (toRectangle (x'+3,y'+3,w'-6,h'-6)) alignRight Nothing Nothing
              else do
                flcSetFont helvetica (FontSize 14)
                let s' = show $ (values _p) !! row' !! col'
                let (x',y',w',h') = fromRectangle rectangle'
                flcDrawInBox (T.pack s') (toRectangle (x'+3,y'+3,w'-6,h'-6)) alignRight Nothing Nothing
            flcPopClip
   ContextRCResize -> do
     visible' <- getVisible intInput'
     if (not visible')
       then return ()
       else do
         cellRectangle' <- findCell table' ContextTable (TableCoordinate (Row row') (Column  col'))
         case cellRectangle' of
           Just cr' -> if (cr' == rectangle')
                       then return ()
                       else resize intInput' cr'
           Nothing -> return ()
   _  -> return ()

main :: IO ()
main = do
  FL.setOption FL.OptionArrowFocus True
  win' <- doubleWindowNew
           (Size (Width 922) (Height 382))
           Nothing
           (Just "Fl_Table Spreadsheet with Keyboard Navigation")
  (Width winWidth') <- getW win'
  (Height winHeight') <- getH win'
  let values' =
        map
          (\r' ->
            map
             (\c' -> (r'+2) * (c'+3))
             [0 .. (maxCols -1)]
          )
          [0.. (maxRows - 1)]
  props' <- newIORef $
              SpreadsheetProperties
                0
                0
                (TableCoordinate (Row 0) (Column 0))
                (TableCoordinate (Row 0) (Column 0))
                values'
  let tableWidth' = winWidth' - 80
      tableHeight' = winHeight' - 80
  intInput' <- inputNew
                (toRectangle
                 (
                  (truncate $ ((fromIntegral tableWidth' / 2) :: Double)),
                  (truncate $ ((fromIntegral tableHeight' / 2) :: Double)),
                  0,
                  0
                 )
                )
                Nothing
                (Just FlIntInput)
  hide intInput'
  setWhen intInput' [WhenEnterKeyAlways]
  setMaximumSize intInput' 5

  spreadsheet' <- tableCustom
                    (toRectangle (20,20,tableWidth', tableHeight'))
                    Nothing
                    Nothing
                    (drawCell props' intInput')
                    defaultCustomWidgetFuncs
                    defaultCustomTableFuncs
  whens' <- getWhen spreadsheet'
  setWhen spreadsheet' $ [WhenNotChanged] ++ whens'
  setSelection spreadsheet' (TableCoordinate (Row 0) (Column 0)) (TableCoordinate (Row 0) (Column 0))
  setCallback intInput' (setValueHide props' spreadsheet')
  setCallback spreadsheet' (eventCallback props' intInput')
  setTooltip spreadsheet' "Use keyboard to navigate cells:\n Arrow keys or Tab/Shift-Tab"
  -- Table rows
  setRowHeader spreadsheet' True
  setRowHeaderWidth spreadsheet' 70
  setRowResize spreadsheet' True
  setRows spreadsheet' (Rows 11)
  setRowHeightAll spreadsheet' 25
  -- Table cols
  setColHeader spreadsheet' True
  setColHeaderHeight spreadsheet' 25
  setColResize spreadsheet' True
  setCols spreadsheet' (Columns 11)
  setColWidthAll spreadsheet' 70

  begin win'
  -- Rows slider
  setRows' <- valueSliderNew (toRectangle (winWidth'-40,20,20,winHeight'-80)) Nothing
  setType setRows' VertNiceSliderType
  bounds setRows' 2 (fromIntegral maxRows)
  setStep setRows' 1
  (Rows numRows') <- getRows spreadsheet'
  _ <- setValue setRows' (fromIntegral $ numRows'-1)
  setCallback setRows' (setRowsCb spreadsheet')
  setWhen setRows' [WhenChanged]
  clearVisibleFocus setRows'
   -- Cols slider
  setCols' <- valueSliderNew (toRectangle (20,winHeight'-40,winWidth'-80,20)) Nothing
  setType setCols' HorNiceSliderType
  bounds setCols' 2 (fromIntegral maxCols)
  setStep setCols' 1
  (Columns numCols') <- getCols spreadsheet'
  _ <- setValue setCols' (fromIntegral $ numCols'-1)
  setCallback setCols' (setColsCb spreadsheet')
  setWhen setCols' [WhenChanged]
  clearVisibleFocus setCols'
  end win'
  setResizable win' (Just spreadsheet')
  showWidget win'
  _ <- FL.run
  return ()
