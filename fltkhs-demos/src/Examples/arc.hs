{-# LANGUAGE OverloadedStrings #-}
module Main where
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.FLTKHS
import Data.IORef
import qualified Data.Text as T
import Control.Monad

name :: [T.Text]
name = ["X", "Y", "R", "start", "end", "rotate"]

drawArc :: IORef [Double] -> Ref Widget -> IO ()
drawArc myArgsRef widget = do
  myArgs <- readIORef myArgsRef
  rectangle' <- getRectangle widget
  let (x',y',w',h') = fromRectangle rectangle'
  flcPushClip rectangle'
  flcSetColor dark3Color
  flcRectf rectangle'
  flcPushMatrix
  if (myArgs !! 5 > 0)
    then do
    flcTranslate
      (ByXY
       (ByX ((fromIntegral x') + (fromIntegral w')/2))
       (ByY ((fromIntegral y') + (fromIntegral h')/2)))
    flcRotate (PreciseAngle (myArgs !! 5))
    flcTranslate
      (ByXY
       (ByX (-((fromIntegral x') + (fromIntegral w')/2)))
       (ByY (-((fromIntegral y') + (fromIntegral h')/2))))
    else return ()
  flcSetColor whiteColor
  flcTranslate (ByXY (ByX (fromIntegral x')) (ByY (fromIntegral $ y')))
  flcBeginComplexPolygon
  flcArcByRadius
    (PrecisePosition (PreciseX $ myArgs !! 0) (PreciseY $ myArgs !! 1))
    (myArgs !! 2)
    (PreciseAngle (myArgs !! 3))
    (PreciseAngle (myArgs !! 4))
  flcGap
  flcArcByRadius (PrecisePosition (PreciseX 140) (PreciseY 140)) 20 (PreciseAngle 0) (PreciseAngle (-360))
  flcEndComplexPolygon
  flcSetColor redColor
  flcBeginLine
  flcArcByRadius
    (PrecisePosition (PreciseX $ myArgs !! 0) (PreciseY $ myArgs !! 1))
    (myArgs !! 2)
    (PreciseAngle (myArgs !! 3))
    (PreciseAngle (myArgs !! 4))
  flcEndLine
  flcPopMatrix
  flcPopClip

setIndex :: Int -> [a] -> a -> [a]
setIndex idx' xs x =
  map
   (
    \(i,e) -> if (i == idx')
                 then x
                 else e
   )
   (zip [0..] xs)

sliderCb :: Ref Widget -> Int -> IORef [Double] -> Ref HorValueSlider -> IO ()
sliderCb widget sliderNumber myArgsRef slider' = do
  v' <- getValue slider'
  modifyIORef myArgsRef (\myArgs' -> setIndex sliderNumber myArgs' v')
  redraw widget

main :: IO ()
main = do
  myArgs' <- newIORef [140, 140, 50, 0, 360,0]
  window' <- doubleWindowNew (Size (Width 300) (Height 500)) Nothing Nothing
  begin window'
  widget <- widgetCustom
             (Rectangle
               (Position (X 10) (Y 10))
               (Size (Width 280) (Height 280)))
             Nothing
             (drawArc myArgs')
             defaultCustomWidgetFuncs
  forM_ (take 6 (zip (iterate ((+) 25) 300) [0..])) $ \(y, sliderNumber') -> do
    s <- horValueSliderNew
         (toRectangle $ (50, y, 240, 25))
         (Just $ name !! sliderNumber')
    case sliderNumber' of
     sliderNumber'' | sliderNumber'' < 3 -> setMinimum s 0 >> setMaximum s 300
        | sliderNumber'' == 5 -> setMinimum s 0 >> setMaximum s 360
     _ -> setMinimum s (-360) >> setMaximum s 360
    setStep s 1
    _ <- readIORef myArgs' >>= \args' -> setValue s (args' !! sliderNumber')
    setAlign s alignLeft
    setCallback s (sliderCb widget sliderNumber' myArgs')
  end window'
  showWidget window'
  _ <- FL.run
  return ()
