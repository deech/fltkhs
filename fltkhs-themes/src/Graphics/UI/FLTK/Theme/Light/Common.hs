{-# LANGUAGE ImplicitParams, OverloadedStrings, AllowAmbiguousTypes, GADTs, CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
module Graphics.UI.FLTK.Theme.Light.Common
  (
    -- * Theme Loading
    configureTheme,
    -- * Common Colors & Fonts
    commonColor,
    commonDarkGreyColor,
    commonFillColor,
    commonFont,
    commonFontSize,
    commonLargeFontSize,
    commonSelectionColor,
    lightBackground,
    -- * Common Calculations For Drawing Widgets
    angleToCoordinate,
    centerInRectangle,
    centerInRectangleByRelativePosition,
    degreesPerRadian,
    fromFltkAngle,
    insideRectangle,
    intDiv,
    isWidget,
    percentOf,
    percentOfSmallerEllipseRadius,
    positionInside,
    splitVertically,
    splitVerticallyByPixels,
    splitHorizontally,
    splitHorizontallyByPixels,
    withPositionX,
    withPositionY,
    withSizeHeight,
    withSizeWidth,
    -- * Common Widget Drawing Helpers
    withCustomBoxDraw,
    BorderBoxSpec(..),
    drawBorderBox,
    FillSpec(..),
    makeFillSpec,
    borderRectangle,
    fillRectangle,
    handleHover,
    OpenBorder(..),
    roundedBoxPoints
  )
where
import Control.Monad
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.FLTKHS hiding (colorAverage, isHorizontal, inactive, tabPositionsCustom, tabHeightCustom, tabDrawCustom, find, tabWhichCustom, tabRedrawTabs)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.Theme.Light.Assets
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Foreign.Ptr

-- | For drawing a rectangular widget that is borderless on the top or bottom. Guess
-- it could be passed into a function as yet another Bool but we have too many of those
-- as it is.
data OpenBorder =
    OpenBorderTop    -- ^ Signifies a bordered rectangle with the top side. Useful, for example, for a bottom tab
  | OpenBorderBottom -- ^ Signifies a bordered rectangle without a bottom side. Useful, for example, for a top tab

-- | Specifies how to draw a border around a 'Rectangle'.
data BorderBoxSpec =
  BorderBoxSpec
  {
    borderBoxBounds :: Rectangle, -- ^ The bounds of the rectangle to border
    borderBoxFocusedColor :: Color, -- ^ The color of the border if the widget is focused
    borderBoxHoveringColor :: Color, -- ^ The color of the border if the mouse pointer is over the widget
    borderBoxColor :: Color, -- ^ The default color of the border
    borderBoxFillColor :: Color -- ^ The fill color of the rectangle. Even though 'FillSpec' exists this is useful if you want a simple solid color and don't care about gradients.
  } deriving Show


-- | Specifies how a 'Rectangle' should be filled. Allows for a vertical color gradient.
data FillSpec =
  FillSpec
  {
    fillBounds :: Rectangle -- ^ The bounds of the rectangle to be filled
  , fillTopColor :: Color  -- ^ The color at the top of the rectangle
  , fillTopSelectionColor :: Color -- ^ The color at the top of the rectangle if this widget is selected (mostly of use to buttons)
  , fillTopFillPercentage :: Int  -- ^ The % of the rectangle at that top that is filled with 'fillTopColor' before the gradient begins
  , fillBottomColor :: Color -- ^ The color at the bottom of the rectangle
  , fillBottomSelectionColor :: Color -- ^ The color at the bottom of the rectangle if this widget is selected (mostly of use to buttons)
  , fillBottomFillPercentage :: Int -- ^ The % of the rectangle at the bottom that is filled with 'fillBottomColor' after the gradient ends
  , fillCornerRadius :: Int -- ^ The roundedness of the corners
  , fillBorderColor :: Color -- ^ The border color of this rectangle
  , fillBorderFocusColor :: Color -- ^ The border color of this rectangle if it is focused
  , fillBorderHovered :: Color -- ^ The border color of this rectangle if the mouse is over it
  }

commonFont :: (?assets :: Assets) => Font
commonFont = dejaVuSans

commonFontSize :: FontSize
commonFontSize = FontSize 12

commonLargeFontSize :: FontSize
commonLargeFontSize = FontSize 22

commonColor :: IO Color
commonColor = rgbColorWithRgb (0xF9, 0xF9, 0xF9)

commonDarkGreyColor :: IO Color
commonDarkGreyColor = rgbColorWithRgb (80,81,84)

commonFillColor :: IO Color
commonFillColor = rgbColorWithRgb (0x66, 0x94, 0xE3)

lightBackground :: Color
lightBackground = whiteColor

-- | Converts from an FLTK angle to a unit circle's. FLTK starts its angles counter-clockwise
-- from 270 so, for example, 45 degrees in FLTK is 270-45 = 225 degrees on a unit circle.
-- Angle unit is in degrees.
fromFltkAngle :: PreciseAngle -> PreciseAngle
fromFltkAngle (PreciseAngle a) =
  let unitCircleAngle = (270 - (truncate a)) `mod` 360
  in
    PreciseAngle
      (if (unitCircleAngle < 0)
       then 360.0 - (abs (fromIntegral unitCircleAngle))
       else (fromIntegral unitCircleAngle))

-- | pi/180
degreesPerRadian :: Double
degreesPerRadian = pi/180

-- | Given a 'PreciseAngle' /in degrees/ return the corresponding location on the unit circle
angleToCoordinate :: PreciseAngle -> PrecisePosition
angleToCoordinate (PreciseAngle a) =
  case a of
     _ | a == 360 -> PrecisePosition (PreciseX (cos 0)) (PreciseY (sin 0))
       | otherwise ->
           let radians = a * degreesPerRadian
           in PrecisePosition (PreciseX (cos radians)) (PreciseY (sin radians))

-- | Straightfoward % of the given 'Int', the 'Double' % must be between 0.0 and 1.0
percentOf :: Double -> Int -> Int
percentOf p a = truncate ((fromIntegral a) * p)

-- | Given the width and height of an ellipse via 'PreciseSize', return
-- the 'Double' % of the smaller radius. % must be between 0.0 and 1.0.
-- Used in 'Dial's and 'Clock's to measure the length of hands.
percentOfSmallerEllipseRadius :: Double -> PreciseSize -> Double
percentOfSmallerEllipseRadius percent (PreciseSize (PreciseWidth rW) (PreciseHeight rH)) = ((if (rW < rH) then rW else rH) * percent) / 100.0

commonSelectionColor :: IO Color
commonSelectionColor = rgbColorWithRgb (50, 100, 201)

-- | Check if the given references point to the same 'Widget'.
isWidget :: (Parent a WidgetBase) => Ref a -> IO (Maybe (Ref b)) -> IO Bool
isWidget this thatM = thatM >>= maybe (return False) (refPtrEquals this)

-- | Check if the given 'Position' is inside the 'Rectangle'. Useful for
-- checking if an event happened within some bounds.
insideRectangle :: Position -> Rectangle -> Bool
insideRectangle (Position (X x) (Y y)) rect =
  let (rx,ry,rw,rh) = fromRectangle rect
  in x >= rx && x <= rx+rw && y >= ry && y <= ry+rh

-- | Return a set of vertices that circumscribe a region bounded by 'Rectangle'.
-- The 'Maybe' 'Int' when provided means the rectangle has rounded corners of
-- 'Int' radius. In a rounded rectangle the vertices don't meet stopping short
-- of the corners, the client is responsible for filling in the arcs.
--
-- 'Maybe' 'OpenBorder' determines whether the rectangle is whole (if not
-- provided) or has an open top or bottom.
roundedBoxPoints :: Rectangle -> Maybe Int -> Maybe OpenBorder -> [Position]
roundedBoxPoints (Rectangle (Position (X x) (Y y)) (Size (Width w) (Height h))) maybeRadius maybeOpen =
  let insideW = w-1
      insideH = h-1
  in
    map toPosition
      (case (maybeRadius,maybeOpen) of
         (Just radius, Nothing) ->
           [
             (x+radius,y)
           , (x+insideW-radius,y)
           , (x+insideW,y+radius)
           , (x+insideW,y+insideH-radius)
           , (x+insideW-radius,y+insideH)
           , (x+radius,y+insideH)
           , (x,y+insideH-radius)
           , (x,y+radius)
           , (x+radius,y)
           ]
         (Just radius, Just OpenBorderBottom) ->
           [
             (x,y+h)
           , (x,y+radius)
           , (x+radius,y)
           , (x+insideW-radius,y)
           , (x+insideW,y+radius)
           , (x+insideW,y+h)
           ]
         (Just radius, Just OpenBorderTop) ->
           [
             (x+insideW,y)
           , (x+insideW,y+insideH-radius)
           , (x+insideW-radius,y+insideH)
           , (x+radius,y+insideH)
           , (x,y+insideH-radius)
           , (x,y)
           ]
         (Nothing, Just OpenBorderBottom) ->
           [
             (x,y+insideH)
           , (x,y)
           , (x+insideW,y)
           , (x+insideW,y+insideH)
           ]
         (Nothing, Just OpenBorderTop) ->
           [
             (x,y)
           , (x,y+insideH)
           , (x+insideW,y+insideH)
           , (x+insideW,y)
           ]
         (Nothing, Nothing) ->
           [
             (x,y)
           , (x+insideW,y)
           , (x+insideW,y+insideH)
           , (x,y+insideH)
           , (x,y)
           ])

-- | Draw a bordered rectangle for the given widget according to 'BorderBoxSpec', the 'Bool'
-- determines if it should be filled with 'borderBoxFillColor'.
drawBorderBox :: (Parent a WidgetBase) => Ref a -> BorderBoxSpec -> Bool -> IO ()
drawBorderBox w spec shouldFill = do
  oldColor <- flcColor
  focused <- isWidget w FL.focus
  hovering <- isWidget w FL.belowmouse
  when shouldFill (flcRectfWithColor (borderBoxBounds spec) (borderBoxFillColor spec))
  if focused
    then flcSetColor (borderBoxFocusedColor spec)
    else if hovering
         then flcSetColor (borderBoxHoveringColor spec)
         else flcSetColor (borderBoxColor spec)
  flcBeginLine
  mapM_ (flcVertex . toPrecisePosition) (roundedBoxPoints (borderBoxBounds spec) Nothing Nothing)
  flcEndLine
  flcSetColor oldColor

-- | The default FLTK widgets don't react to a mouse pointer hovering over them.
-- This handler when applied to a customized widget initiates a 'redraw' when the
-- mouse enters and leaves the widget area. It also takes this widget's default 'handle'
-- so it can be called for events that don't apply to hovering, eg. Show, Hide etc.
handleHover ::
  (
    orig ~ (a b),
    Parent orig WidgetBase,
    Match x ~ FindOp orig orig (Redraw ()),
    Op (Redraw ()) x orig (IO ())
  )
  => Ref orig -> Event -> IO (Either UnknownEvent ())
handleHover b e = do
  case e of
    Enter -> do
      () <- redraw b
      return (Right())
    Leave -> do
      () <- redraw b
      return (Right ())
    _ -> return (Left UnknownEvent)

-- | Temporarily swap out the FLTK's box drawing function for a given 'Boxtype'
-- with 'BoxDrawF'. The 'IO' '()' action will typically use the custom function
-- that was just swapped in some kind custom drawing routine. For example, if a
-- custom widget used a 'BorderBox' on the FLTK side but you don't like the
-- default 'BorderBox' look, you can override the 'draw' function of the widget
-- with this one where the 'IO' '()' action calls 'draw' on its parent. For an example
-- use-case see 'Graphics.UI.FLTK.Theme.Light.Input.inputDraw'.
--
-- NOTE: The 'IO' '()' action is /not/ exception safe.
withCustomBoxDraw :: Boxtype -> BoxDrawF -> IO () -> IO ()
withCustomBoxDraw boxtype customBoxDrawF action = do
  oldFptr <- FL.getBoxtype boxtype
  dx <- FL.boxDx boxtype
  dy <- FL.boxDy boxtype
  dw <- FL.boxDw boxtype
  dh <- FL.boxDh boxtype
  FL.setBoxtype boxtype (FL.FromSpec customBoxDrawF 0 0 0 0)
  action
  fptr <- FL.getBoxtype boxtype
  when (fptr /= nullFunPtr) (freeHaskellFunPtr fptr)
  FL.setBoxtype boxtype (FL.FromFunPtr oldFptr (fromIntegral dx) (fromIntegral dy) (fromIntegral dw) (fromIntegral dh))

-- | Make the default 'FillSpec' used by most of the theme color graded with the initial 'Color'. The second 'Color'
-- is used to determine the border color.
makeFillSpec :: Rectangle -> Color -> Color -> IO FillSpec
makeFillSpec rect color selectionColor = do
  (colorR, colorG, colorB) <- FL.getColorRgb color
  pressedColor <- rgbColorWithRgb (colorR - 21, colorG - 21, colorB - 21)
  let slightlyDarker = colorAverage color blackColor 0.93
  let slightlyLighter = colorAverage whiteColor pressedColor 0.93
  hoverColor <- rgbColorWithRgb (0xBB, 0xBB, 0xBB)
  let darkerSelectionColor = darker selectionColor
  return
    FillSpec
      {
        fillBounds = rect,
        fillTopColor = color,
        fillTopSelectionColor = pressedColor,
        fillTopFillPercentage = 30,
        fillBottomColor = slightlyDarker,
        fillBottomSelectionColor = slightlyLighter,
        fillBottomFillPercentage = 70,
        fillCornerRadius = 2,
        fillBorderColor = slightlyDarker,
        fillBorderFocusColor = darkerSelectionColor,
        fillBorderHovered = hoverColor
      }

-- | Draw the border around the 'Rectangle' specified by 'FillSpec' possibly changing the border color
-- if the widget (usually a Button) is currently focused or if the mouse pointer is hovering over it.
borderRectangle :: FillSpec -> Bool -> Bool -> IO ()
borderRectangle spec focused hovering = do
  oldColor <- flcColor
  if focused
    then flcSetColor (fillBorderFocusColor spec)
    else if hovering
         then flcSetColor (fillBorderHovered spec)
         else flcSetColor (fillBorderColor spec)
  flcBeginLine
  mapM_ (flcVertex . toPrecisePosition) (roundedBoxPoints (fillBounds spec) (Just (fillCornerRadius spec)) Nothing)
  flcEndLine
  flcLineStyle (LineDrawStyle (Just LineStyleSolid) Nothing Nothing) Nothing Nothing
  flcSetColor oldColor

-- | Draw a box according to the 'FillSpec'. It was originally intended for custom "Graphics.UI.FLTK.Theme.Light.Button"
-- which is why it takes a 'Bool' specifies if the button is pressed but is used widely in the theme for any rounded
-- rectangular area.
fillRectangle :: FillSpec -> Bool -> IO ()
fillRectangle spec pressed = do
  if pressed
    then drawButton (fillTopSelectionColor spec) (fillBottomSelectionColor spec)
    else drawButton (fillTopColor spec) (fillBottomColor spec)
  where
    drawButton topColor bottomColor = do
      let diameter = (fillCornerRadius spec) * 2
          quarterCircle x y a1 a2 = do
            fillColor <- flcColor
            flcPie (toRectangle (x,y,diameter,diameter)) a1 a2
            flcSetColor fillColor
      oldColor <- flcColor
      -- top left/right
      let (x,y,w,h) = fromRectangle (fillBounds spec)
          insideW = w
          insideH = h
          topFillFraction :: Double
          topFillFraction = (fromIntegral (fillTopFillPercentage spec)) / 100.0
          topHeight = truncate (fromIntegral insideH * topFillFraction)
      flcSetColor topColor
      flcRectf (toRectangle (x + (fillCornerRadius spec), y, insideW - diameter, (fillCornerRadius spec)))
      flcRectf (toRectangle (x, y + (fillCornerRadius spec), insideW , topHeight - (fillCornerRadius spec)))
      -- bottom left/right
      let bottomFillFraction :: Double
          bottomFillFraction = (fromIntegral (fillBottomFillPercentage spec)) / 100.0
          bottomHeight = truncate (fromIntegral insideH * bottomFillFraction)
      flcSetColor bottomColor
      when (diameter > 0)
        (do
           quarterCircle x y (PreciseAngle 90.0) (PreciseAngle 180.0)
           quarterCircle (x + (insideW - diameter)) y (PreciseAngle 0) (PreciseAngle 90.0)
           quarterCircle x (y + (insideH - diameter)) (PreciseAngle 180.0) (PreciseAngle 270.0)
           quarterCircle (x + (insideW - diameter)) (y + (insideH - diameter)) (PreciseAngle 270.0) (PreciseAngle 360.0)
           flcRectf (toRectangle (x + (fillCornerRadius spec), y + h - (fillCornerRadius spec), insideW - (diameter), (fillCornerRadius spec))))
      flcRectf (toRectangle (x, y + bottomHeight, insideW, h - bottomHeight - (fillCornerRadius spec)))
      -- middle gradient
      let middleFraction = fromIntegral (fillBottomFillPercentage spec - fillTopFillPercentage spec) / 100.0
          totalSteps :: Double
          totalSteps = fromIntegral h * middleFraction
          stepSize :: Double
          stepSize = 1.0 / totalSteps
      mapM_
        (
          \step -> do
            let weight = 1.0 - (stepSize * fromIntegral step)
                blendColor =
                  colorAverage
                    topColor
                    bottomColor
                    weight
            flcSetColor blendColor
            flcXyline (toPosition (x,y + topHeight + step)) (X (x + insideW - 1))
        )
        [0 .. truncate totalSteps - 1]
      flcSetColor oldColor

-- | Return the 'Position' which centers the given 'Size' in 'Rectangle'.
centerInRectangle :: Rectangle -> Size -> Position
centerInRectangle r (Size (Width sW) (Height sH)) =
  let (rX,rY,rW,rH) = fromRectangle r
      posX = rX + ((rW-sW) `intDiv` 2)
      posY = rY + ((rH-sH) `intDiv` 2)
  in toPosition (posX,posY)

-- | Return the 'Rectangle' that is centered in the given 'Rectangle' by the
-- 'X' and 'Y' /offset/ , so for example, (X 20) (Y 20) returns
-- a 'Rectangle' with a top left coordinate which is 20 pixels over and 20
-- pixels below the top left of the given 'Rectangle'.
centerInRectangleByRelativePosition :: Rectangle -> X -> Y -> Rectangle
centerInRectangleByRelativePosition r (X xOff) (Y yOff) =
  let (rX,rY,rW,rH) = fromRectangle r
      r2W = rW - (2*xOff)
      r2H = rH - (2*yOff)
  in toRectangle (rX+xOff,rY+yOff,r2W,r2H)

-- | Return a 'Rectangle' of 'Size' positioned at 'X' and 'Y' inside the given
-- 'Rectangle'. It's on the caller to make sure that the resulting 'Rectangle'
-- actually fits inside the one passed in. 'Size', 'X' and 'Y' are
-- not checked.
positionInside :: Rectangle -> Size -> X -> Y -> Rectangle
positionInside r (Size (Width sW) (Height sH)) (X xOff) (Y yOff) =
  let (rX,rY,_,_) = fromRectangle r
  in toRectangle (rX+xOff,rY+yOff,sW,sH)

-- | Transform the height.
withSizeHeight :: Size -> (Height -> Height) -> Size
withSizeHeight (Size w h) f = Size w (f h)

-- | Transform the width.
withSizeWidth :: Size -> (Width -> Width) -> Size
withSizeWidth (Size w h) f = Size (f w) h

-- | Transform the X coordinate of a location
withPositionX :: Position -> (X -> X) -> Position
withPositionX (Position x y) f = Position (f x) y

-- | Transform the Y coordinate of a location
withPositionY :: Position -> (Y -> Y) -> Position
withPositionY (Position x y) f = Position x (f y)

-- | Split the width of the 'Rectangle' into two side-by-side
-- ('Rectangle','Rectangle') by the 'Double' %. % must be between 0.0 and 1.0.
-- The width of the 2 returned rectangles will always sum to the width of the
-- one passed in.
splitVertically :: Rectangle -> Double -> (Rectangle, Rectangle)
splitVertically r percent =
  let (rx,ry,rw,rh) = fromRectangle r
      r1w = truncate ((fromIntegral rw) * percent)
      r2w = rw-r1w
      r2x = rx+r1w
  in (toRectangle (rx,ry,r1w,rh), toRectangle (r2x,ry,r2w,rh))

-- | Like 'splitVertically' but takes a 'Int' pixel width instead of a %. If the
-- width is greater than the 'Rectangle' the first of the pair will be the
-- 'Rectangle' passed in and the second will have the same dimensions but a 0
-- width.
splitVerticallyByPixels :: Rectangle -> Int -> (Rectangle, Rectangle)
splitVerticallyByPixels r ps =
  let (rx,ry,rw,rh) = fromRectangle r
      r1w = if (ps >= rw) then rw else ps
      r2w = rw-r1w
      r2x = rx+r1w
  in (toRectangle (rx,ry,r1w,rh), toRectangle (r2x,ry,r2w,rh))

-- | Split the height of the 'Rectangle' into two stacked
-- ('Rectangle','Rectangle') by the 'Double' %. % must be between 0.0 and 1.0.
-- The height of the 2 returned rectangles will always sum to the height of the
-- one passed in.
splitHorizontally :: Rectangle -> Double -> (Rectangle, Rectangle)
splitHorizontally r percent =
  let (rx,ry,rw,rh) = fromRectangle r
      r1h = truncate ((fromIntegral rh) * percent)
      r2h = rh-r1h
      r2y = ry+r1h
  in (toRectangle (rx,ry,rw,r1h), toRectangle (rx,r2y,rw,r2h))

-- | Like 'splitHorizontally' but takes a 'Int' pixel height instead of a %. If the
-- height is greater than the 'Rectangle' the first of the pair will be the
-- 'Rectangle' passed in and the second will have the same dimensions but a 0
-- height.
splitHorizontallyByPixels :: Rectangle -> Int -> (Rectangle,Rectangle)
splitHorizontallyByPixels r ps =
  let (rx,ry,rw,rh) = fromRectangle r
      r1h = if (ps >= rh) then rh else ps
      r2h = rh-r1h
      r2y = ry+r1h
  in (toRectangle (rx,ry,rw,r1h), toRectangle (rx,r2y,rw,r2h))

-- | A lossy division of 'Int'/'Int'. The result is 'truncate'd but it's good
-- enough for widget dimensions which is the primary use-case.
intDiv :: Int -> Int -> Int
intDiv num denom = truncate (((fromIntegral num) / (fromIntegral denom)) :: Double)

-- | Needs to be called by every app to load the themes's resources and do some
-- minor setup See "Graphics.UI.FLTK.Theme.Light#GettingStarted" for more
-- information.
configureTheme :: IO Assets
configureTheme = do
  assets <- loadAssets
  let ?assets = assets
  FL.setColor background2Color lightBackground
  tooltipSetFont commonFont
  tooltipSetSize commonFontSize
  return assets
