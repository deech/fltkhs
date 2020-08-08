{-# LANGUAGE ImplicitParams, ScopedTypeVariables, OverloadedStrings, AllowAmbiguousTypes, GADTs, CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
module Graphics.UI.FLTK.Theme.Light.Clock
  (
    clockNew,
    drawClock
  )
where
import Control.Exception
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.Theme.Light.Common
import qualified Data.Text as T
import qualified Data.Text.Encoding as TE
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import qualified Graphics.UI.FLTK.LowLevel.FLTKHS as LowLevel
import Text.Printf
import Graphics.UI.FLTK.Theme.Light.Assets

clockSvg :: Width -> Height -> RGB -> RGB -> LowLevel.ClockByTime -> String
clockSvg (Width w) (Height h) colorRgb selectionColorRgb (LowLevel.ClockByTime (LowLevel.Hour hours) (LowLevel.Minute minutes) (LowLevel.Second seconds)) =
  let widthRadius :: Double
      widthRadius = (fromIntegral w)/2
      heightRadius :: Double
      heightRadius = (fromIntegral h)/2
      ellipseRadius :: PreciseSize
      ellipseRadius = PreciseSize (PreciseWidth widthRadius) (PreciseHeight heightRadius)
      withinSvg :: String -> String
      withinSvg innards =
        (printf
          ("<svg width=\"%d\" height=\"%d\" viewBox=\"%f %f %d %d\">\n")
          w h (-widthRadius) (-heightRadius) w h)
        ++ innards ++ "</svg>\n"
      strokeWidth = percentOfSmallerEllipseRadius 10 ellipseRadius
      tickPadding = percentOfSmallerEllipseRadius 15 ellipseRadius
      tickHeight = percentOfSmallerEllipseRadius 10 ellipseRadius
      centerRadius = percentOfSmallerEllipseRadius 5 ellipseRadius
      secondHandWidth = percentOfSmallerEllipseRadius 3 ellipseRadius
      minuteHandWidth = percentOfSmallerEllipseRadius 3 ellipseRadius
      minuteHandHeight = percentOfSmallerEllipseRadius 80 ellipseRadius
      hourHandWidth = percentOfSmallerEllipseRadius 3 ellipseRadius
      hourHandHeight = percentOfSmallerEllipseRadius 70 ellipseRadius
      outline (colorR,colorG,colorB) =
        printf "<ellipse cx=\"0\" cy=\"0\" rx=\"%d\" ry=\"%d\" fill=\"none\" stroke=\"%s\" stroke-width=\"%f\" />\n"
          (truncate (widthRadius-strokeWidth/2) :: Int)
          (truncate (heightRadius-strokeWidth/2) :: Int)
          ("rgb(" ++ show colorR ++ "," ++ show colorG ++ "," ++ show colorB ++ ")")
          strokeWidth
      ticks (colorR,colorG,colorB) =
        map
        (\tickNumber ->
           let tickAngle :: Int
               tickAngle = tickNumber * 30
               PrecisePosition (PreciseX unitX) (PreciseY unitY) = angleToCoordinate (PreciseAngle (fromIntegral tickAngle))
               quarterHourTick = tickNumber == 0 || tickNumber == 3 || tickNumber == 6 || tickNumber == 9
               tickSvg =
                 printf "<path d=\"M%f,%f L%f,%f\" fill=\"none\" stroke=\"%s\">\n"
                   (unitX * (widthRadius-tickPadding-tickHeight)) (unitY * (widthRadius-tickPadding-tickHeight))
                   (unitX * (widthRadius-tickPadding)) (unitY * (widthRadius-tickPadding))
                   (if quarterHourTick then "black"
                    else ("rgb(" ++ show colorR ++ "," ++ show colorG ++ "," ++ show colorB ++ ")"))
           in withinSvg tickSvg)
        [0 .. 11]
      center (colorR,colorG,colorB) =
        let centerColor = "rgb(" ++ show colorR ++ "," ++ show colorG ++ "," ++ show colorB ++ ")"
        in
        printf "<circle cx=\"0\" cy=\"0\" r=\"%f\" fill=\"%s\" stroke=\"%s\"/>"
          centerRadius
          centerColor
          centerColor
      hourHand :: String
      hourHand =
        let fromMilitary :: Int
            fromMilitary = hours `mod` 12
            hourPart :: Double
            hourPart = (fromIntegral fromMilitary) * 30
            minutePart :: Double
            minutePart = 30.0 * (fromIntegral minutes / 60)
            hourAngle :: Double
            hourAngle = hourPart+minutePart-90.0
            PrecisePosition (PreciseX unitX) (PreciseY unitY) = angleToCoordinate (PreciseAngle hourAngle)
        in
          printf "<path d=\"M 0,0 L%f,%f\" stroke=\"%s\" stroke-width=\"%f\""
            (unitX * (hourHandHeight-tickPadding)) (unitY * (hourHandHeight-tickPadding))
            ("black" :: String)
            hourHandWidth
      minuteHand :: String
      minuteHand =
        let minuteAngle :: Int
            minuteAngle = minutes*6-90
            PrecisePosition (PreciseX unitX) (PreciseY unitY) = angleToCoordinate (PreciseAngle (fromIntegral minuteAngle))
        in
          printf "<path d=\"M 0,0 L%f,%f\" stroke=\"%s\" stroke-width=\"%f\""
            (unitX * (minuteHandHeight-tickPadding)) (unitY * (minuteHandHeight-tickPadding))
            ("black" :: String)
            minuteHandWidth
      secondHand :: RGB -> String
      secondHand (colorR,colorG,colorB) =
        let secondAngle :: Int
            secondAngle = seconds*6-90
            PrecisePosition (PreciseX unitX) (PreciseY unitY) = angleToCoordinate (PreciseAngle (fromIntegral secondAngle))
        in
        withinSvg
          (printf "<path d=\"M 0,0 L%f,%f\" stroke=\"%s\" stroke-width=\"%f\""
            (unitX * (widthRadius-tickPadding)) (unitY * (widthRadius-tickPadding))
            ("rgb(" ++ show colorR ++ "," ++ show colorG ++ "," ++ show colorB ++ ")")
            secondHandWidth)
  in
    "<svg>\n"
    ++ (withinSvg (outline colorRgb))
    ++ (concat (ticks colorRgb))
    ++ (withinSvg hourHand)
    ++ (withinSvg minuteHand)
    ++ (withinSvg (center selectionColorRgb))
    ++ (withinSvg (secondHand selectionColorRgb))
    ++ "</svg>"

-- | Custom clock drawing function
drawClock :: Ref LowLevel.Clock -> IO ()
drawClock clock = do
  bounds@(Rectangle clockPos (Size w' h')) <- LowLevel.getRectangle clock
  color <- LowLevel.getColor clock
  oldColor <- LowLevel.flcColor
  colorRgb <- FL.getColorRgb (colorAverage color blackColor 0.80)
  LowLevel.flcSetColor color
  LowLevel.flcRectfWithColor bounds whiteColor
  LowLevel.flcSetColor oldColor
  selectionColorRgb <- LowLevel.getSelectionColor clock >>= FL.getColorRgb
  time <- LowLevel.getValue clock
  let svg = clockSvg w' h' colorRgb selectionColorRgb time
  iE <- LowLevel.svgImageNew ((TE.encodeUtf8 . T.pack) svg)
  case iE of
    Left _ -> throwIO (userError ("The generated SVG is invalid: \n" ++ svg))
    Right i -> do
      LowLevel.draw i clockPos
      LowLevel.destroy i
      LowLevel.drawLabel clock Nothing

clockNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.Clock)
clockNew rectangle l' = do
  c <- LowLevel.clockCustom rectangle l' (Just drawClock) Nothing
  color <- commonColor
  LowLevel.setColor c color
  LowLevel.setBox c BorderBox
  LowLevel.setLabelfont c commonFont
  LowLevel.setLabelsize c commonFontSize
  color <- commonFillColor
  LowLevel.setSelectionColor c color
  LowLevel.setShadow c False
  return c
