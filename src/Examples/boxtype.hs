module Main where
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.FLTKHS
import Data.IORef
import Control.Monad

windowWidth :: Int
windowWidth = 200
rowHeight :: Int
rowHeight = 50
numRows :: Int
numRows = 14
bt :: IORef Int -> String -> Boxtype -> Bool -> IO ()
bt n label' boxtype' square' = do
  n' <- readIORef n
  let (quotient',remainder') = quotRem n' 4
  modifyIORef n (+ 1)
  b' <- boxNewWithBoxtype
          boxtype'
          (Rectangle
            (Position (X (remainder' * windowWidth + 10)) (Y (quotient' * rowHeight + 10)))
            (Size
             (Width $ if square' then rowHeight - 20 else windowWidth - 20)
             (Height $ rowHeight - 20)))
          label'
          Nothing
  setLabelsize b' (FontSize 11)
  when square' $ setAlign b' alignRight
main :: IO ()
main = do
  window <- doubleWindowNew
             (Size (Width $ windowWidth * 4) (Height $ numRows * rowHeight))
             Nothing
             Nothing
  setBox window FlatBox
  FL.getSystemColors
  setColor window (Color 12)
  n' <- newIORef 0
  begin window
  bt n' "NoBox" NoBox False
  bt n' "FlatBox" FlatBox False
  modifyIORef n' (+ 2)
  bt n' "UpBox" UpBox False
  bt n' "DownBox" DownBox False
  bt n' "UpFrame" UpFrame False
  bt n' "DownFrame" DownFrame False
  bt n' "ThinUpBox" ThinUpBox False
  bt n' "ThinDownBox" ThinDownBox False
  bt n' "ThinUpFrame" ThinUpFrame False
  bt n' "ThinDownFrame" ThinDownFrame False
  bt n' "EngravedBox" EngravedBox False
  bt n' "EmbossedBox" EmbossedBox False
  bt n' "EngravedFrame" EngravedFrame False
  bt n' "EmbossedFrame" EmbossedFrame False
  bt n' "BorderBox" BorderBox False
  bt n' "ShadowBox" ShadowBox False
  bt n' "BorderFrame" BorderFrame False
  bt n' "ShadowFrame" ShadowFrame False
  bt n' "RoundedBox" RoundedBox False
  bt n' "RshadowBox" RshadowBox False
  bt n' "RoundedFrame" RoundedFrame False
  bt n' "RFlatBox" RFlatBox False
  bt n' "RoundUpBox" RoundUpBox False
  bt n' "RoundDownBox" RoundDownBox False
  bt n' "DiamondUpBox" DiamondUpBox False
  bt n' "DiamondDownBox" DiamondDownBox False
  bt n' "OvalBox" OvalBox False
  bt n' "OshadowBox" OshadowBox False
  bt n' "OvalFrame" OvalFrame False
  bt n' "FloatBox" FloatBox False
  bt n' "PlasticUpBox" PlasticUpBox False
  bt n' "PlasticDownBox" PlasticDownBox False
  bt n' "PlasticUpFrame" PlasticUpFrame False
  bt n' "PlasticDownFrame" PlasticDownFrame False
  bt n' "PlasticThinUpBox" PlasticThinUpBox False
  bt n' "PlasticThinDownBox" PlasticThinDownBox False
  modifyIORef n' (+ 2)
  bt n' "PlasticRoundUpBox" PlasticRoundUpBox False
  bt n' "PlasticRoundDownBox" PlasticRoundDownBox False
  modifyIORef n' (+ 2)
  bt n' "GtkUpBox" GtkUpBox False
  bt n' "GtkDownBox" GtkDownBox False
  bt n' "GtkUpFrame" GtkUpFrame False
  bt n' "GtkDownFrame" GtkDownFrame False
  bt n' "GtkThinUpBox" GtkThinUpBox False
  bt n' "GtkThinDownBox" GtkThinDownBox False
  bt n' "GtkThinUpFrame" GtkThinUpFrame False
  bt n' "GtkThinDownFrame" GtkThinDownFrame False
  bt n' "GtkRoundUpBox" GtkRoundUpBox False
  bt n' "GtkRoundDownBox" GtkRoundDownBox False
  bt n' "FreeBoxtype" FreeBoxtype False
  setResizable window (Just window)
  end window
  showWidget window
  _ <- FL.run
  return ()
