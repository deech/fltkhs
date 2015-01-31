module Main where
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.FLTKHS

pi :: Double
pi = 3.14159

initializeTable :: Ref Table -> IO ()
initializeTable t' = do
  begin t'
  setRows t' 11
  setRowHeightAll t' 20
  setRowHeader t' True
  setCols t' 11
  setColWidthAll t' 60
  setColHeader t' True
  setColResize t' True
  end t'

resize :: Ref Table -> Rectangle -> IO ()
resize t' r' = do
  let (x',y',w',h') = fromRectangle r'
  tableHeight' <- getH t'
  let newR' = if (w' > 718) then toRectangle (x',y', 718 ,tableHeight') else toRectangle (x',y',w',tableHeight')
  resizeSuper t' newR'

drawCell :: String -> Ref Table -> TableContext -> TableCoordinate -> Rectangle -> IO ()
drawCell mode' t' tc' tcoord' r' = do
  let (TableCoordinate (Row row') (Column col')) = tcoord'
  case tc' of
    ContextCell -> do
      isSelected' <- isSelected t' tcoord'
      let color' = if isSelected' then yellowColor else whiteColor
      let content' = case mode' of
            "Addition" -> show $ row' + col'
            "Subtract" -> show $ row' - col'
            "Multiply" -> show $ row' * col'
            "Divide"   -> if col' == 0 then "N/A" else (show $ truncate $ (fromIntegral row') / (fromIntegral col'))
            "Exponent" -> show $ row' ^ col'
            "SinCos"   -> show "SinCos"
            _          -> "???"
      flcPushClip r'
      flcSetColor color' >> flcRectf r'
      flcSetColor gray0Color >> flcDrawInBox content' r' alignCenter Nothing Nothing
      tableColor' <- getColor t'
      flcSetColor tableColor' >> flcRect r'
      flcPopClip
    ContextStartPage -> flcSetFont helvetica (FontSize 10)
    c -> if (c == ContextColHeader || c == ContextRowHeader)
         then do
           let val = if (c == ContextColHeader) then col' else row'
           columnHeaderColor' <- getColHeaderColor t'
           rowHeaderColor' <- getRowHeaderColor t'
           let color = if (c == ContextColHeader) then columnHeaderColor' else rowHeaderColor'
           flcPushClip r'
           let s = show val
           flcDrawBox ThinUpBox r' color
           flcSetColor blackColor
           flcDrawInBox s r' alignCenter Nothing Nothing
           flcPopClip
         else return ()

main :: IO ()
main = do
  win' <- doubleWindowNew (toSize (100,100)) Nothing (Just "Tree Of Tables")
  begin win'
  windowWidth <- getW win'
  windowHeight <- getH win'
  tree' <- treeNew (toRectangle (10,10,windowWidth -20, windowHeight -20)) Nothing
  (Just root') <- root tree'
  setLabel root' "Math Tables"
  setItemLabelfont tree' courier
  setLinespacing tree' 4
  setSelectmode tree' TreeSelectNone
  setConnectorstyle tree' TreeConnectorDotted
  let makeTable mode' path' = do
        table' <- tableCustom
                   (toRectangle (0,0,500,156))
                   Nothing
                   defaultCustomWidgetFuncs {
                       resizeCustom = (Just Main.resize)
                     }
                   defaultCustomTableFuncs {
                      drawCellCustom = (Just (drawCell mode'))
                     }
        initializeTable table'
        (Just item') <- add tree' path'
        setWidget item' table'
  begin tree'
  makeTable "Addition" "Arithmetic/Additon"
  makeTable "Subtract" "Arithmetic/Subtract"
  makeTable "Multiply" "Arithmetic/Multiple"
  makeTable "Divide" "Arithmetic/Divide"
  makeTable "Exponent" "Misc/Exponent"
  makeTable "SinCos" "Misc/Sin*Cos"
  end tree'
  end win'
  setResizable win' win'
  showWidget win'
  _ <- FL.run
  return ()
