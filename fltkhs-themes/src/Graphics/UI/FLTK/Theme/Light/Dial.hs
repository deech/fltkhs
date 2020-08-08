{-# LANGUAGE ImplicitParams, ScopedTypeVariables, OverloadedStrings, AllowAmbiguousTypes, GADTs, CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
module Graphics.UI.FLTK.Theme.Light.Dial
  (
    dialNew,
    fillDialNew,
    lineDialNew,
    drawDial
  )
where
import Control.Exception
import Control.Monad
import Data.List
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.Theme.Light.Common
import Text.Printf
import qualified Data.ByteString.Char8 as BC
import qualified Data.Text as T
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import qualified Graphics.UI.FLTK.LowLevel.FLTKHS as LowLevel
import Graphics.UI.FLTK.Theme.Light.Assets


dialOutline w h rW rH a1X a1Y rWWithStroke rHWithStroke bigCircle a2X a2Y sw colorString =
    "<svg width=\"" ++ (show w) ++ "\" height=\"" ++ (show h) ++ "\" viewBox=\"" ++ (show (-rW)) ++ " " ++ (show (-rH)) ++ " " ++ (show w) ++ " " ++ (show h) ++ "\" >"
  ++ "<path "
  ++ "d=\"M" ++ (show a1X) ++ " " ++ (show a1Y) ++ ""
  ++ "A " ++ (show rWWithStroke) ++ " " ++ (show rHWithStroke) ++ " 0 1 " ++ (show bigCircle) ++ " " ++ (show a2X) ++ " " ++ (show a2Y) ++ ""
  ++ "\""
  ++ "stroke-width=\"" ++ (show sw) ++ "\""
  ++ "stroke=\"" ++ colorString ++ "\""
  ++ "fill=\"none\""
  ++ "stroke-linecap=\"round\""
  ++ "/>"
  ++ "</svg>"

meter w h rW rH meterCenter meterX meterY mw =
    "<svg width=\"" ++ (show w) ++ "\" height=\"" ++ (show h) ++ "\" viewBox=\"" ++ (show (-rW)) ++ " " ++ (show (-rH)) ++ " " ++ (show w) ++ " " ++ (show h) ++ "\">"
  ++ "<circle cx=\"0.0\" cy=\"0.0\" r=\"" ++ (show meterCenter) ++ "\" />"
  ++ "<path "
  ++ "d=\"M0.0 0.0"
  ++ "l" ++ (show meterX) ++ " " ++ (show meterY) ++ ""
  ++ "\""
  ++ "stroke=\"black\""
  ++ "stroke-width=\"" ++ (show mw) ++ "\""
  ++ "stroke-linecap=\"round\""
  -- ++ "fill=\"none\""
  ++ "/>"
  ++ "</svg>"

fillEllipse w h rW rH startX startY rWWithStroke rHWithStroke bigCircle endX endY colorString =
    "<svg width=\"" ++ (show w) ++ "\" height=\"" ++ (show h) ++ "\" viewBox=\"" ++ (show (-rW)) ++ " " ++ (show (-rH)) ++ " " ++ (show w) ++ " " ++ (show h) ++ "\" >"
  ++ "<path "
  ++ "d=\"M" ++ (show startX) ++ " " ++ (show startY) ++ ""
  ++ "A " ++ (show rWWithStroke) ++ " " ++ (show rHWithStroke) ++ " 0 " ++ (show bigCircle) ++ " 1 " ++ (show endX) ++ " " ++ (show endY) ++ ""
  ++ "L 0.0 0.0 Z"
  ++ "\""
  ++ "fill=\"" ++ colorString ++ "\""
  ++ "/>"
  ++ "</svg>"

arrow :: [String]
arrow =
  [
    "<svg width=\"%d\" height=\"%d\" viewBox=\"%f %f %d %d\" transform=\"rotate(%f)\">"
  , "<circle cx=\"%f\" cy=\"%f\" r=\"%f\" fill=\"none\" stroke=\"black\" stroke-width=\"%f\"/>"
  , "<path "
  , "d=\"M%f %f"
  , "L%f %f"
  , "L%f %f"
  , "Z"
  , "\""
  , "fill=\"black\""
  , "/>"
  , "</svg>"
  ]

makeDialOutline :: Size -> PreciseAngle -> PreciseAngle -> String -> String
makeDialOutline (Size (Width w) (Height h)) a1 a2 colorString =
  let ((rW,rH) :: (Double,Double)) = center w h
      PrecisePosition (PreciseX a1X) (PreciseY a1Y) = angleToCoordinate (fromFltkAngle a1)
      PrecisePosition (PreciseX a2X) (PreciseY a2Y) = angleToCoordinate (fromFltkAngle a2)
      sw = strokeWidth (PreciseSize (PreciseWidth rW) (PreciseHeight rH))
  in
  dialOutline w h rW rH (a1X * (rW-(sw/2))) ((-a1Y) * (rH-(sw/2))) (rW-(sw/2)) (rH-(sw/2)) (if (a1 < a2) then (1 :: Int) else (0 :: Int)) (a2X * (rW-(sw/2))) ((-a2Y) * (rH-(sw/2))) sw colorString

center :: Int -> Int -> (Double,Double)
center w h = (fromIntegral w / 2, fromIntegral h / 2)

strokeWidth :: PreciseSize -> Double
strokeWidth = percentOfSmallerEllipseRadius 10
meterCenterRadius :: PreciseSize -> Double
meterCenterRadius = percentOfSmallerEllipseRadius 8
meterWidth :: PreciseSize -> Double
meterWidth = percentOfSmallerEllipseRadius 5
knobPadding :: PreciseSize -> Double
knobPadding = percentOfSmallerEllipseRadius 3
arrowBase :: PreciseSize -> Double
arrowBase = percentOfSmallerEllipseRadius 25
arrowHeight :: PreciseSize -> Double
arrowHeight = percentOfSmallerEllipseRadius 20
arrowPadding :: PreciseSize -> Double
arrowPadding = percentOfSmallerEllipseRadius 15

makeMeter :: PreciseAngle -> Size -> String
makeMeter angle (Size (Width w) (Height h)) =
  let (rW,rH) = center w h
      meterLength = if (rW < rH) then rW else rH
      PrecisePosition (PreciseX x) (PreciseY y) = angleToCoordinate (fromFltkAngle angle)
      sw :: Double
      sw = strokeWidth (PreciseSize (PreciseWidth rW) (PreciseHeight rH))
      meterCenter = meterCenterRadius (PreciseSize (PreciseWidth rW) (PreciseHeight rH))
      mw = meterWidth (PreciseSize (PreciseWidth rW) (PreciseHeight rH))
  in
  meter w h rW rH meterCenter (x * (meterLength - sw - (mw / 2))) ((-y) * (meterLength - sw - (mw / 2))) mw

makeFill :: Size -> PreciseAngle -> PreciseAngle -> String -> String
makeFill (Size (Width w) (Height h)) a1@(PreciseAngle a1') a2@(PreciseAngle a2') colorString =
  let ((rW,rH) :: (Double,Double)) = center w h
      PrecisePosition (PreciseX a1X) (PreciseY a1Y) = angleToCoordinate (fromFltkAngle a1)
      PrecisePosition (PreciseX a2X) (PreciseY a2Y) = angleToCoordinate (fromFltkAngle a2)
      sw = strokeWidth (PreciseSize (PreciseWidth rW) (PreciseHeight rH))
  in
  fillEllipse w h rW rH (a1X * (rW-sw)) ((-a1Y) * (rH-sw))  (rW-sw) (rH-sw) (if (abs (a2'-a1') < 180) then (0 :: Int) else (1 :: Int)) (a2X * (rW-sw)) ((-a2Y) * (rH-sw)) colorString

makeArrow :: Size -> PreciseAngle -> String
makeArrow (Size (Width w) (Height h)) a =
  let ((rW,rH) :: (Double,Double)) = center w h
      sw = strokeWidth (PreciseSize (PreciseWidth rW) (PreciseHeight rH))
      circleR = if (rW<rH) then rW else rH
      PreciseAngle a' = fromFltkAngle a
      arrH = arrowHeight (PreciseSize (PreciseWidth rW) (PreciseHeight rH))
      arrB = arrowBase (PreciseSize (PreciseWidth rW) (PreciseHeight rH))
      arrP = arrowPadding (PreciseSize (PreciseWidth rW) (PreciseHeight rH))
      knobP = knobPadding (PreciseSize (PreciseWidth rW) (PreciseHeight rH))
  in
    printf (intercalate "\n" arrow)
      w h (-rW) (-rH) w h (-a')
      (0.0 :: Double) (0.0 :: Double) (circleR-sw-knobP) (1.0 :: Double)
      (rW-sw-knobP-arrP) (0.0 :: Double)
      (circleR-sw-arrH-knobP-arrP) (arrH/2)
      (circleR-sw-arrH-knobP-arrP) (-(arrB/2))

wrapSvgs :: [String] -> String
wrapSvgs svgs =
  concat (intersperse "\n" (["<svg>"] ++ svgs ++ ["</svg>"]))

-- | Custom dial drawing function
drawDial :: Ref LowLevel.Dial -> IO ()
drawDial d = do
  bounds@(Rectangle dialPos@(Position (X dialX) (Y dialY)) dialSize@(Size (Width dialW) (Height dialH))) <- LowLevel.getRectangle d
  p <- LowLevel.getParent d
  color <- maybe (return lightBackground) LowLevel.getColor p
  drawBorderBox d
    (BorderBoxSpec
    {
      borderBoxBounds = bounds
    , borderBoxFocusedColor = color
    , borderBoxHoveringColor = color
    , borderBoxColor = color
    , borderBoxFillColor = color
    })
   True
  color <- fmap (\c -> colorAverage c blackColor 0.80) (LowLevel.getColor d)
  (colorR,colorG,colorB) <- FL.getColorRgb color
  (Angle a1) <- LowLevel.getAngle1 d
  (Angle a2) <- LowLevel.getAngle2 d
  let dialOutlineSvg = makeDialOutline dialSize (PreciseAngle (fromIntegral a1)) (PreciseAngle (fromIntegral a2)) ("rgb(" ++ show colorR ++ "," ++ show colorG ++ "," ++ show colorB ++ ")")
  dialMin <- LowLevel.getMinimum d
  dialMax <- LowLevel.getMaximum d
  when (dialMin>dialMax) (throwIO (userError ("Dial minimum cannot be less than maximum:(" ++ (show dialMin) ++ "," ++ (show dialMax) ++ ")")))
  dialV <- LowLevel.getValue d >>= LowLevel.clamp d
  dialType <- LowLevel.getType_ d
  let dialLocation = (dialV-dialMin) / (dialMax-dialMin)
  let meterAngle = PreciseAngle (((fromIntegral (a2-a1)) * dialLocation) + (fromIntegral a1))
  (selectionColorR, selectionColorG, selectionColorB) <- LowLevel.getSelectionColor d >>= FL.getColorRgb
  let svg =
        case dialType of
          LowLevel.FillDialType ->
            wrapSvgs
              [
                 dialOutlineSvg
               , if (a1<a2)
                 then makeFill dialSize
                       (PreciseAngle (fromIntegral a1))
                       meterAngle
                       ("rgb(" ++ show selectionColorR ++ "," ++ show selectionColorG ++ "," ++ show selectionColorB ++ ")")
                 else makeFill dialSize
                       meterAngle
                       (PreciseAngle (fromIntegral a1))
                       ("rgb(" ++ show selectionColorR ++ "," ++ show selectionColorG ++ "," ++ show selectionColorB ++ ")")
               , makeMeter meterAngle dialSize
              ]
          LowLevel.LineDialType ->
            wrapSvgs
              [
                dialOutlineSvg
              , makeMeter meterAngle dialSize
              ]
          LowLevel.NormalDialType ->
            wrapSvgs
              [
                dialOutlineSvg
              , makeArrow dialSize meterAngle
              ]
  iE <- LowLevel.svgImageNew (BC.pack svg)
  case iE of
    Left _ -> throwIO (userError ("drawDial: the generated SVG is invalid: \n" ++ svg))
    Right i -> do
      LowLevel.draw i dialPos
      LowLevel.destroy i
      LowLevel.drawLabel d Nothing

dialNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.Dial)
dialNew rectangle label = do
  d <- LowLevel.dialCustom
         rectangle
         label
         (Just drawDial)
         Nothing
  color <- commonColor
  LowLevel.setColor d color
  color <- commonFillColor
  LowLevel.setSelectionColor d color
  LowLevel.setLabelfont d commonFont
  LowLevel.setLabelsize d commonFontSize
  return d

fillDialNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.FillDial)
fillDialNew rect l = do
  d <- dialNew rect l
  LowLevel.setType d LowLevel.FillDialType
  return (castTo d)

lineDialNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.LineDial)
lineDialNew rect l = do
  d <- dialNew rect l
  LowLevel.setType d LowLevel.LineDialType
  return (castTo d)
