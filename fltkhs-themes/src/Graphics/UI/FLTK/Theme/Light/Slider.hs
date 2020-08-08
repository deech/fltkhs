{-# LANGUAGE ImplicitParams, OverloadedStrings, AllowAmbiguousTypes, GADTs, CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
module Graphics.UI.FLTK.Theme.Light.Slider
  (
    sliderNew,
    fillSliderNew,
    valueSliderNew,
    gaugeSliderNew,
    horFillSliderNew,
    horNiceSliderNew,
    horSliderNew,
    horValueSliderNew,
    -- * Slider drawing helpers
    --
    --
    GaugeSliderSpec(..),
    defaultGaugeHeight,
    drawSlider,
    drawValueSlider,
    gaugeBoxBounds,
    sliderIsHorizontal,
    mkGaugeSliderSpec,
    sliderKnobColor,
    sliderSetup
  )
where
import Control.Exception
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.Theme.Light.Common
import Text.Printf
import qualified Data.Text as T
import qualified Data.Text.Encoding as TE
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import qualified Graphics.UI.FLTK.LowLevel.FLTKHS as LowLevel
import Graphics.UI.FLTK.Theme.Light.Assets
import Data.Either

sliderKnobColor :: IO Color
sliderKnobColor = rgbColorWithRgb (241,241,241)

sliderIsHorizontal :: SliderType -> Bool
sliderIsHorizontal VertSliderType     = False
sliderIsHorizontal HorSliderType      = True
sliderIsHorizontal VertFillSliderType = False
sliderIsHorizontal HorFillSliderType  = True
sliderIsHorizontal VertNiceSliderType = False
sliderIsHorizontal HorNiceSliderType  = True

sliderSetup ::
  (?assets :: Assets) => Ref LowLevel.SliderBase -> IO ()
sliderSetup s = do
  () <- LowLevel.setColor s lightBackground
  () <- LowLevel.setBox s BorderBox
  () <- LowLevel.setSlider s UpBox
  () <- LowLevel.setSliderSize s 0.15
  () <- LowLevel.setLabelfont s commonFont
  () <- LowLevel.setLabelsize s commonFontSize
  color <- commonSelectionColor
  LowLevel.setSelectionColor s color

data GaugeSliderSpec =
  GaugeSliderSpec
  {
    gaugeHeight :: Int
  , gaugeWidth :: Double
  , gaugeOverhang :: Double
  }

defaultGaugeHeight :: Int
defaultGaugeHeight = 10

mkGaugeSliderSpec :: GaugeSliderSpec
mkGaugeSliderSpec =
  GaugeSliderSpec
  {
    gaugeHeight = defaultGaugeHeight
  , gaugeWidth = 0.20
  , gaugeOverhang = (fromIntegral defaultGaugeHeight)/2
  }

drawValueSlider :: Ref LowLevel.ValueSlider -> IO ()
drawValueSlider vs = do
  color <- LowLevel.getColor vs
  selectionColor <- fmap darker (LowLevel.getSelectionColor vs)
  let slightlyDarker = Graphics.UI.FLTK.LowLevel.Fl_Enumerations.colorAverage color blackColor 0.85
  hoverColor <- rgbColorWithRgb (0xBB, 0xBB, 0xBB)
  (x,y,w,h) <- fmap fromRectangle (LowLevel.getRectangle vs)
  sliderType <- LowLevel.getType_ vs
  let spec =
        BorderBoxSpec
        {
          borderBoxHoveringColor = hoverColor,
          borderBoxColor = slightlyDarker,
          borderBoxFocusedColor = selectionColor,
          borderBoxFillColor = color,
          borderBoxBounds =
            toRectangle
              (if (sliderIsHorizontal sliderType)
               then (x,y,valueBoxWidth-1,h-1)
               else (x,y,w-1, valueBoxHeight-1)
              )
        }
  drawBorderBox vs spec True
  valueFont <- LowLevel.getTextfont vs
  valueFontsize <- LowLevel.getTextsize vs
  valueFontcolor <- LowLevel.getTextcolor vs
  LowLevel.flcSetFont valueFont valueFontsize
  isActive <- LowLevel.activeR vs
  LowLevel.flcSetColor (if isActive then valueFontcolor else (inactive valueFontcolor))
  currentValue <- LowLevel.format vs
  case currentValue of
    Left _ -> return ()
    Right text -> LowLevel.flcDrawInBox text (borderBoxBounds spec) (Alignments [AlignTypeClip]) Nothing Nothing
  drawSlider
    (castTo vs)
    Nothing
    (toRectangle
      (if (sliderIsHorizontal sliderType)
       then (x+valueBoxWidth,y,w-valueBoxWidth,h)
       else (x,y+valueBoxHeight,w,h-valueBoxHeight)
      )
    )
  where
    valueBoxWidth = 35
    valueBoxHeight = 25

gaugeBoxBounds :: Bool -> GaugeSliderSpec -> Rectangle -> Rectangle
gaugeBoxBounds horizontal spec rect =
  let (x,y,w,h) = fromRectangle rect
      horizontalBounds =
        (
          x+(truncate (gaugeOverhang spec))
        , y+(truncate ((gaugeWidth spec)*(fromIntegral h)))
        , w-(2*(truncate (gaugeOverhang spec)))
        , h-(2*(truncate ((gaugeWidth spec)*(fromIntegral h))))
        )
      verticalBounds =
        (
          x+(truncate ((gaugeWidth spec)*(fromIntegral w)))
        , y+(truncate (gaugeOverhang spec))
        , w-(2*(truncate ((gaugeWidth spec)*(fromIntegral w))))
        , h-(2*(truncate (gaugeOverhang spec)))
        )
  in toRectangle (if horizontal then horizontalBounds else verticalBounds)

drawSlider :: Ref LowLevel.Slider -> Maybe GaugeSliderSpec -> Rectangle -> IO ()
drawSlider s gaugeSpec rect = do
  color <- LowLevel.getColor s
  selectionColor <- fmap darker (LowLevel.getSelectionColor s)
  let (x,y,w,h) = fromRectangle rect
      slightlyDarker = colorAverage color blackColor 0.85
  hoverColor <- rgbColorWithRgb (0xBB, 0xBB, 0xBB)
  t <- LowLevel.getType_ s
  let spec =
        BorderBoxSpec
             {
               borderBoxHoveringColor = hoverColor,
               borderBoxColor = slightlyDarker,
               borderBoxFocusedColor = selectionColor,
               borderBoxFillColor = color,
               borderBoxBounds =
                 case gaugeSpec of
                   Nothing -> toRectangle (x,y,w-1,h-1)
                   Just spec -> gaugeBoxBounds (sliderIsHorizontal t) spec rect
             }
  drawBorderBox s spec (maybe True (\_ -> False) gaugeSpec)
  LowLevel.drawLabel s Nothing
  min' <- LowLevel.getMinimum s
  max' <- LowLevel.getMaximum s
  value' <- fmap (sliderValue min' max') (LowLevel.getValue s)
  case gaugeSpec of
    Nothing -> drawPill rect value' (sliderIsHorizontal t)
    Just gaugeSpec ->
      let (xDiff,yDiff,_,_) = FL.boxDifferences rect (borderBoxBounds spec)
      in do
      LowLevel.flcRectfWithColor (toRectangle (x,y,w,yDiff)) color
      LowLevel.flcRectfWithColor (toRectangle (x,y+yDiff,xDiff,h-(yDiff*2))) color
      LowLevel.flcRectfWithColor (toRectangle (x+w-xDiff,y+yDiff,xDiff,h-(yDiff*2))) color
      LowLevel.flcRectfWithColor (toRectangle (x,y+h-yDiff,w,yDiff)) color
      triangleColor <- FL.getColorRgb (colorAverage slightlyDarker blackColor 0.85)
      drawGauge (borderBoxBounds spec) triangleColor rect value' (sliderIsHorizontal t) gaugeSpec
  where
    gaugeSvg (borderR,borderG,borderB) bounds innerBounds v horizontal spec =
      let (_,_,w',h') = fromRectangle bounds
          (_,_,innerW,innerH) = fromRectangle innerBounds
          svg =
            "<svg width=\"%d\" height=\"%d\" transform=\"translate(%f,%f)\">\n"
            ++ "<g>\n"
            ++ "<path d=\" M%d %d L %d %d L %d %d L %d %d\" stroke=\"%s\" stroke-width=\"%s\" fill=\"none\">\n"
            ++ "<path d=\" M%d %d L %d %d L %d %d L %d %d\" stroke=\"%s\" stroke-width=\"%s\" fill=\"none\">\n"
            ++ "<path d=\" M%d %d L %d %d\" stroke=\"black\" stroke-width=\"%s\" fill=\"none\">\n"
            ++ "<path d=\" M%d %d L %d %d\" stroke=\"black\" stroke-width=\"%s\" fill=\"none\">\n"
            ++ "</g>\n"
            ++ "</svg>"
          xTranslation = (fromIntegral innerW) * v
          yTranslation = (fromIntegral innerH) * v
      in
        if horizontal
        then
          printf svg
            w' h' xTranslation (0 :: Double)
            (0 :: Int) (0 :: Int)
            (gaugeHeight spec) (0 :: Int)
            (((gaugeHeight spec) `intDiv` 2) :: Int) ((truncate ((gaugeWidth spec)*(fromIntegral h'))) :: Int)
            (0 :: Int) (0 :: Int)
            ("rgb(" ++ show borderR ++ "," ++ show borderG ++ "," ++ show borderB ++ ")") ("1px" :: String)
            (0 :: Int) h'
            (gaugeHeight spec) h'
            (((gaugeHeight spec) `intDiv` 2) :: Int) (h'-(truncate ((gaugeWidth spec)*(fromIntegral h'))))
            (0 :: Int) h'
            ("rgb(" ++ show borderR ++ "," ++ show borderG ++ "," ++ show borderB ++ ")") ("1px" :: String)
            (0 :: Int) (0 :: Int)
            (gaugeHeight spec) (0 :: Int)
            ("1px" :: String)
            (0 :: Int) h'
            (gaugeHeight spec) h'
            ("1px" :: String)
        else
          printf svg
            w' h' (0 :: Double) yTranslation
            (0 :: Int) (0 :: Int)
            (0 :: Int) (gaugeHeight spec)
            ((truncate ((gaugeWidth spec)*(fromIntegral w'))) :: Int) (((gaugeHeight spec) `intDiv` 2) :: Int)
            (0 :: Int) (0 :: Int)
            ("rgb(" ++ show borderR ++ "," ++ show borderG ++ "," ++ show borderB ++ ")") ("1px" :: String)
            w' (0 :: Int)
            w' (gaugeHeight spec)
            (w'-(truncate ((gaugeWidth spec)*(fromIntegral w')))) (((gaugeHeight spec) `intDiv` 2) :: Int)
            w' (0 :: Int)
            ("rgb(" ++ show borderR ++ "," ++ show borderG ++ "," ++ show borderB ++ ")") ("1px" :: String)
            (0 :: Int) (0 :: Int)
            (0 :: Int) (gaugeHeight spec)
            ("1px" :: String)
            w' (0 :: Int)
            w' (gaugeHeight spec)
            ("1px" :: String)
    drawGauge innerBounds borderRgb bounds v horizontal spec =
      let svg = gaugeSvg borderRgb bounds innerBounds v horizontal spec
          (x,y,_,_) = fromRectangle bounds
      in do
      iE <- LowLevel.svgImageNew ((TE.encodeUtf8 . T.pack) svg)
      case iE of
        Left _ -> throwIO (userError ("The generated SVG is invalid: \n" ++ svg))
        Right i -> do
          LowLevel.draw i (toPosition (x,y))
          LowLevel.destroy i
    pillCornerRadius :: Int
    pillCornerRadius = 2
    pillLength :: Double
    pillLength = 20.0
    pillPadding :: Int
    pillPadding = 3
    pillEndPadding :: Int
    pillEndPadding = 2
    sliderValue :: Double -> Double -> Double -> Double
    sliderValue min' max' curr' =
      if (min' == max') then 0.5
      else
        case (curr' - min') / (max' - min') of
          val | val > 1.0 -> 1.0
              | val < 0.0 -> 0.0
              | otherwise -> val
    pillRectangle :: Bool -> Double -> Rectangle -> Rectangle
    pillRectangle horizontal value' (Rectangle (Position (X x') (Y y')) (Size (Width w') (Height h'))) =
      if horizontal
      then
        Rectangle
          (Position
             (X (truncate (fromIntegral x' + (fromIntegral w' - pillLength) * value')))
             (Y (y'+ pillPadding)))
          (Size
             (Width (truncate pillLength))
             (Height (h' - (pillPadding * 2) - 1)))
      else
        Rectangle
          (Position
             (X (x'+ pillPadding))
             (Y (truncate (fromIntegral y' + ((fromIntegral h' - pillLength) * value')))))
          (Size
             (Width (w' - pillPadding*2 - 1))
             (Height (truncate pillLength)))
    drawPill rect v horizontal =
      let (x,y,w,h) = fromRectangle rect
          pill = pillRectangle
                   horizontal
                   v
                   (toRectangle
                     (if horizontal
                       then (x+pillEndPadding,y,w-2*pillEndPadding,h)
                       else (x,y+pillEndPadding,w,h-2*pillEndPadding)
                     )
                   )
      in do
      borderColor <- rgbColorWithRgb (0x93,0x93,0x93)
      color <- sliderKnobColor
      let pillVertices = mapM_ (LowLevel.flcVertex . toPrecisePosition) (roundedBoxPoints pill (Just pillCornerRadius) Nothing)
      LowLevel.flcSetColor color
      LowLevel.flcBeginPolygon
      pillVertices
      LowLevel.flcEndPolygon
      LowLevel.flcSetColor borderColor
      LowLevel.flcBeginLine
      pillVertices
      LowLevel.flcEndLine

{-# DEPRECATED fillSliderNew "Fill sliders are not supported in the Light theme. 'fillSliderNew' is the same as 'sliderNew'." #-}
{-# DEPRECATED horFillSliderNew "Fill sliders are not supported in the Light theme. 'horFillSliderNew' is the same as 'sliderNew'." #-}
{-# DEPRECATED horNiceSliderNew "\"Nice\"sliders are not supported in the Light theme. 'horNiceSliderNew' is the same as 'sliderNew'." #-}

handleSliderHover :: Ref LowLevel.SliderBase -> Event -> IO (Either UnknownEvent ())
handleSliderHover s e = do
  res <- handleHover s e
  case res of
    Left _ -> LowLevel.handleSliderBase s e
    Right _ -> return (Right ())

sliderNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.Slider)
sliderNew rectangle label = do
  s <- LowLevel.sliderCustom
         rectangle
         label
         (Just (\s -> do
                   bounds <- LowLevel.getRectangle s
                   drawSlider s Nothing bounds
               ))
         (Just (LowLevel.defaultCustomWidgetFuncs { LowLevel.handleCustom = (Just (handleSliderHover . safeCast)) }))
  sliderSetup (safeCast s)
  return s

gaugeSliderNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.Slider)
gaugeSliderNew rectangle label = do
  s <- LowLevel.sliderCustom
         rectangle
         label
         (Just (\s -> do
                   bounds <- LowLevel.getRectangle s
                   drawSlider s (Just mkGaugeSliderSpec) bounds
               ))
         (Just (LowLevel.defaultCustomWidgetFuncs {LowLevel.handleCustom = Just (handleSliderHover . safeCast)}))
  sliderSetup (safeCast s)
  return s

valueSliderNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.ValueSlider)
valueSliderNew rectangle label = do
  s <- LowLevel.valueSliderCustom
         rectangle
         label
         (Just drawValueSlider)
         (Just (LowLevel.defaultCustomWidgetFuncs { LowLevel.handleCustom = (Just (handleSliderHover . safeCast)) }))
  sliderSetup (safeCast s)
  return s

horValueSliderNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.HorValueSlider)
horValueSliderNew rectangle label = do
  s <- LowLevel.valueSliderCustom
         rectangle
         label
         (Just drawValueSlider)
         (Just (LowLevel.defaultCustomWidgetFuncs { LowLevel.handleCustom = (Just (handleSliderHover . safeCast)) }))
  LowLevel.setType s HorSliderType
  sliderSetup (safeCast s)
  return (LowLevel.castTo s)

horSliderNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.HorSlider)
horSliderNew rectangle label = do
  s <- LowLevel.sliderCustom
         rectangle
         label
         (Just (\s -> do
                   bounds <- LowLevel.getRectangle s
                   drawSlider s Nothing bounds
               ))
         (Just (LowLevel.defaultCustomWidgetFuncs { LowLevel.handleCustom = (Just (handleSliderHover . safeCast)) }))
  LowLevel.setType s HorSliderType
  sliderSetup (safeCast s)
  return (LowLevel.castTo s)

fillSliderNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.FillSlider)
fillSliderNew rectangle label = do
  s <- LowLevel.sliderCustom
         rectangle
         label
         (Just (\s -> do
                   bounds <- LowLevel.getRectangle s
                   drawSlider s Nothing bounds
               ))
         (Just (LowLevel.defaultCustomWidgetFuncs { LowLevel.handleCustom = (Just (handleSliderHover . safeCast)) }))
  LowLevel.setType s VertFillSliderType
  sliderSetup (safeCast s)
  return (LowLevel.castTo s)

horFillSliderNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.HorFillSlider)
horFillSliderNew rectangle label = do
  s <- LowLevel.sliderCustom
         rectangle
         label
         (Just (\s -> do
                   bounds <- LowLevel.getRectangle s
                   drawSlider s Nothing bounds
               ))
         (Just (LowLevel.defaultCustomWidgetFuncs { LowLevel.handleCustom = (Just (handleSliderHover . safeCast)) }))
  sliderSetup (safeCast s)
  LowLevel.setType s HorFillSliderType
  return (LowLevel.castTo s)

horNiceSliderNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.HorNiceSlider)
horNiceSliderNew rectangle label = do
  s <- LowLevel.sliderCustom
         rectangle
         label
         (Just (\s -> do
                   bounds <- LowLevel.getRectangle s
                   drawSlider s Nothing bounds
               ))
         (Just (LowLevel.defaultCustomWidgetFuncs { LowLevel.handleCustom = (Just (handleSliderHover . safeCast)) }))
  sliderSetup (safeCast s)
  LowLevel.setType s HorNiceSliderType
  return (LowLevel.castTo s)
