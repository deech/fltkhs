{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Main where
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.FLTKHS
import qualified Data.Text as T
buttonCb :: Ref LightButton -> IO ()
buttonCb lightButton = do
  l' <- getLabel lightButton
  print $ "BUTTON: " ++ (T.unpack l')

setTableSize :: Ref Table -> Int -> Int -> IO ()
setTableSize t' nr' nc' = do
  clear t'
  setRows t' (Rows nr')
  setCols t' (Columns nc')
  begin t'
  let (rowCols :: [(Int,Int)]) = [(r',c') | r' <- [0..(nr'-1)], c' <- [0..(nc'-1)]]
  mapM_
    (\(_r,_c) -> do
        cellRectangle <- findCell t' ContextTable (TableCoordinate (Row _r) (Column _c))
        case cellRectangle of
         Just cellRectangle' ->
           if (odd _c)
           then do
            let s = T.pack ((show _r) ++ "." ++ (show _c))
            input_ <- inputNew cellRectangle' Nothing Nothing
            _ <- setValue input_ s
            return ()
           else
             do
               let s = T.pack ((show _r) ++ "/" ++ (show _c))
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
      (Rows rows') <- getRows t'
      (Columns cols') <- getCols t'
      let (rowCols :: [TableCoordinate]) = [(TableCoordinate (Row _r) (Column _c)) | _r <- [0..(rows'-1)], _c <- [0..(cols'-1)]]
      mapM_
        (\((i::Int), tc) -> do
            children' <- children t'
            if (i >= children')
              then return ()
              else do
                cellRectangle <- findCell t' ContextTable tc
                case cellRectangle of
                  Just cellRectangle' -> do
                   child' <- getChild t' (AtIndex i)
                   maybe (return ()) (\c -> resize c cellRectangle') child'
                  Nothing -> return ()
        )
        (zip [0..] rowCols)
      initSizes t'
    ContextRowHeader -> do
      flcPushClip r'
      let s = T.pack ("Row " ++ (show tr'))
      headerColor <- getRowHeaderColor t'
      flcDrawBox ThinUpBox r' headerColor
      flcSetColor blackColor
      flcDrawInBox s r' (Alignments [AlignTypeCenter]) Nothing Nothing
      flcPopClip
    ContextColHeader -> do
      flcPushClip r'
      let s = T.pack ("Column " ++ (show tc'))
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
  (Width win_w) <- getW win
  (Height win_h) <- getH win
  begin win
  table <- tableCustom
            (toRectangle (20,20,win_w-40,win_h-40))
            (Just "FLTK widget table")
            Nothing
            drawCell
            defaultCustomWidgetFuncs
            defaultCustomTableFuncs
  initializeTable table
  setTableSize table 50 50
  end win
  setResizable win (Just table)
  showWidget win
  _ <- FL.run
  return ()
