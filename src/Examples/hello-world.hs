module Main where
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.FLTKHS


buttonCb :: Ref Button -> IO ()
buttonCb b' = do
  l' <- getLabel b'
  if (l' == "Hello world")
    then setLabel b' "Goodbye world"
    else setLabel b' "Hello world"

main :: IO ()
main = do
 window <- windowNew
           (Size (Width 100) (Height 75))
           Nothing
           Nothing
 begin window
 b' <- buttonNew
        (Rectangle (Position (X 10) (Y 30)) (Size (Width 95) (Height 30)))
        (Just "Hello world")
 setLabelsize b' (FontSize 10)
 setCallback b' buttonCb
 end window
 showWidget window
 _ <- FL.run
 return ()
