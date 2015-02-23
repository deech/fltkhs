{-# LANGUAGE ScopedTypeVariables #-}
module Main where
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.FLTKHS

buttonCb :: Ref LightButton -> IO ()
buttonCb lightButton = do
  l' <- getLabel lightButton
  print $ "BUTTON: " ++ l'

setTableSize :: Ref Table -> Int -> Int -> IO ()
setTableSize t' nr' nc' = do
  clear t'
  setRows t' nr'
  setCols t' nc'
  begin t'
  let (rowCols :: [(Int,Int)]) = [(r',c') | r' <- [0..(nr'-1)], c' <- [0..(nc'-1)]]
  mapM_
    (\(_r,_c) -> do
        cellRectangle <- findCell t' ContextTable (TableCoordinate (Row _r) (Column _c))
        case cellRectangle of
         Just cellRectangle' ->
           if (odd _c)
           then do
            let s = (show _r) ++ "." ++ (show _c)
            input_ <- inputNew Nothing cellRectangle' Nothing
            _ <- setValue input_ s Nothing
            return ()
           else
             do
               let s = (show _r) ++ "/" ++ (show _c)
               butt <- lightButtonNew cellRectangle' (Just s)
               setAlign butt (Alignments [AlignTypeCenter, AlignTypeInside])
               setCallback butt buttonCb
               _ <- setValue butt ((_r+_c*2) `mod` 4 == 0)
               return ()
         Nothing -> return ()
    )
    rowCols
  end t'

drawCell :: Ref Table -> TableContext -> TableCoordinate -> Rectangle -> IO ()
drawCell t' tcontext' (TableCoordinate (Row tr') (Column tc')) r' =
  case tcontext' of
    ContextStartPage -> flcSetFont helvetica (FontSize 12)
    ContextRCResize -> do
      rows' <- getRows t'
      cols' <- getCols t'
      let (rowCols :: [(Int,Int)]) = [(_r,_c) | _r <- [0..(rows'-1)], _c <- [0..(cols'-1)]]
      mapM_
        (\((i::Int), (_r',_c')) -> do
            children' <- children t'
            if (i >= children')
              then return ()
              else do
                cellRectangle <- findCell t' ContextTable (TableCoordinate (Row _r') (Column _c'))
                case cellRectangle of
                  Just cellRectangle' -> do
                   child' <- getChild t' i
                   resize child' cellRectangle'
                  Nothing -> return ()
        )
        (zip [0..] rowCols)
      initSizes t'
    ContextRowHeader -> do
      flcPushClip r'
      let s = "Row " ++ (show tr')
      headerColor <- getRowHeaderColor t'
      flcDrawBox ThinUpBox r' headerColor
      flcSetColor blackColor
      flcDrawInBox s r' (Alignments [AlignTypeCenter]) Nothing Nothing
      flcPopClip
    ContextColHeader -> do
      flcPushClip r'
      let s = "Column " ++ (show tc')
      headerColor <- getColHeaderColor t'
      flcDrawBox ThinUpBox r' headerColor
      flcSetColor blackColor
      flcDrawInBox s r' (Alignments [AlignTypeCenter]) Nothing Nothing
      flcPopClip
    _ -> return ()
initializeTable :: Ref Table -> IO ()
initializeTable t = do
  begin t
  setColHeader t True
  setColResize t True
  setColHeaderHeight t 25
  setRowHeader t True
  setRowResize t True
  setRowHeaderWidth t 80
  end t
main :: IO ()
main = do
  win <- doubleWindowNew (toSize (940,500)) Nothing (Just "table as container")
  win_w <- getW win
  win_h <- getH win
  begin win
  table <- tableCustom
            (toRectangle (20,20,win_w-40,win_h-40))
            (Just "FLTK widget table")
            defaultCustomWidgetFuncs
            (defaultCustomTableFuncs{
              drawCellCustom = (Just drawCell)
              })
  initializeTable table
  setTableSize table 50 50
  end win
  setResizable win table
  showWidget win
  _ <- FL.run
  return ()
