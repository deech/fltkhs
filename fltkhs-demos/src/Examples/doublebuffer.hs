{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE FlexibleContexts, ScopedTypeVariables #-}
module Main where
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.FLTKHS
import Control.Monad
import Data.IORef

star :: Int -> Int -> Double -> IO ()
star w h n = do
  flcPushMatrix
  flcTranslate (ByXY (ByX (fromIntegral w / 2)) (ByY (fromIntegral h /2)))
  flcScaleWithY (ByXY (ByX (fromIntegral w / 2)) (ByY (fromIntegral h /2)))
  forM_ [0..n] $ \i -> do
    forM_ [(i+1)..n] $ \j -> do
      let i_vertex :: Double =  2 * pi * i/n + 0.1
          j_vertex :: Double =  2 * pi * j/n + 0.1
      flcBeginLine
      flcVertex (PrecisePosition (PreciseX $ cos i_vertex) (PreciseY $ sin i_vertex))
      flcVertex (PrecisePosition (PreciseX $ cos j_vertex) (PreciseY $ sin j_vertex))
      flcEndLine
  flcPopMatrix

sliderCb :: IORef (Double,Double) -> (Double -> (Double,Double) -> (Double,Double))-> Ref HorSlider -> IO ()
sliderCb sides' sidesf' slider' = do
  v' <- getValue slider'
  modifyIORef sides' (sidesf' v')
  (Just p') <- getParent slider'
  redraw p'

badDraw :: IORef (Double,Double) -> Int -> Int -> ((Double,Double) -> Double) -> IO ()
badDraw sides w h which' = do
  flcSetColor blackColor >> flcRectf (toRectangle (0,0,w,h))
  flcSetColor whiteColor >> readIORef sides >>= star w h . which'


drawWindow :: IORef (Double, Double) ->
              ((Double, Double) -> Double) ->
              Ref WindowBase ->
              IO ()
drawWindow sides' whichf' w' = do
  (Width ww') <- getW w'
  (Height wh') <- getH w'
  badDraw sides' ww' wh' whichf'
  c' <- getChild w' (AtIndex 0)
  maybe (return ()) (drawChild w') (c' :: Maybe (Ref WidgetBase))

main :: IO ()
main = do
  visual' <- FL.visual ModeDouble
  if (not visual') then print "Xdbe not supported, faking double buffer with pixmaps.\n" else return ()
  sides' <- newIORef (20,20)
  w01 <- windowNew (toSize (420,420)) Nothing (Just "Fl_Single_Window")
  setBox w01 FlatBox
  begin w01
  w1 <- singleWindowCustom
          (Size (Width 400) (Height 400))
          (Just (Position (X 10) (Y 10)))
          (Just "Single Window")
          (Just (\w -> drawWindow sides' fst (safeCast w)))
          defaultCustomWidgetFuncs
          defaultCustomWindowFuncs
  setBox w1 FlatBox
  setColor w1 blackColor
  setResizable w1 (Just w1)
  begin w1
  slider0 <- horSliderNew (toRectangle (20,370,360,25)) Nothing
  range slider0 2 30
  setStep slider0 1
  _ <- readIORef sides' >>= setValue slider0 . fst
  setCallback slider0 (sliderCb sides' (\v (_,s2) -> (v, s2)))
  end w1
  end w01
  w02 <- windowNew (Size (Width 420) (Height 420)) Nothing (Just "Fl_Double_Window")
  setBox w02 FlatBox
  begin w02
  w2 <- doubleWindowCustom
          (Size (Width 400) (Height 400))
          (Just $ Position (X 10) (Y 10))
          (Just "Fl_Double_Window")
          (Just (\w -> drawWindow sides' snd (safeCast w)))
          defaultCustomWidgetFuncs
          defaultCustomWindowFuncs
  setBox w2 FlatBox
  setColor w2 blackColor
  setResizable w2 (Just w2)
  begin w2
  slider1 <- horSliderNew (toRectangle (20,370,360,25)) Nothing
  range slider1 2 30
  setStep slider1 1
  _ <- readIORef sides' >>= setValue slider1 . fst
  setCallback slider1 (sliderCb sides' (\v (s1,_) -> (s1,v)))
  end w2
  end w02
  showWidget w01
  showWidget w1
  showWidget w02
  showWidget w2
  _ <- FL.run
  return ()
