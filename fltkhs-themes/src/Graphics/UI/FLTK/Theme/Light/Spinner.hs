{-# LANGUAGE RecursiveDo, ImplicitParams, ScopedTypeVariables, OverloadedStrings #-}
module Graphics.UI.FLTK.Theme.Light.Spinner
  (
    spinnerNew,
    -- * Spinner drawing and handling helpers
    handleSpinner,
    resizeSpinner,
    spinnerComponentBounds,
    spinnerDownCallback,
    spinnerInputCallback,
    spinnerUpCallback
  )
where
import Control.Exception
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.Theme.Light.Button
import Graphics.UI.FLTK.Theme.Light.Common
import Graphics.UI.FLTK.Theme.Light.Input
import qualified Data.Text as T
import qualified Data.Text.Read as T
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import qualified Graphics.UI.FLTK.LowLevel.FLTKHS as LowLevel
import Graphics.UI.FLTK.Theme.Light.Assets

doublePrecisionFormat :: T.Text
doublePrecisionFormat = T.pack "%.*"

spinnerComponentBounds :: Rectangle -> (Rectangle,Rectangle,Rectangle)
spinnerComponentBounds rect =
  let (x',y',w',h') = fromRectangle rect
      buttonH = h' `intDiv` 2
      inputW = w' - buttonH - 2
      buttonW = buttonH + 2
  in
    (
      toRectangle (x',y',inputW,h'),
      toRectangle (x'+inputW,y',buttonW,buttonH),
      toRectangle (x'+inputW,y'+ buttonH,buttonW,buttonH)
    )

handleSpinner :: Ref LowLevel.Input -> Ref LowLevel.Spinner -> Event -> IO (Either UnknownEvent ())
handleSpinner i s e =
  let upOrDown = do
        key <- FL.eventKey
        case key of
          SpecialKeyType Kb_Up -> spinnerUpCallback s i >> return (Right ())
          SpecialKeyType Kb_Down -> spinnerDownCallback s i >> return (Right ())
          _ -> return (Right ())
  in
  case e of
    Keydown -> upOrDown
    Shortcut -> upOrDown
    _ -> LowLevel.handleSpinnerBase (safeCast s) e

updateInput :: Maybe T.Text -> Double -> Ref LowLevel.Input -> IO ()
updateInput format v i =
  let vString =
        case format of
          Just f -> if (doublePrecisionFormat `T.isPrefixOf` f) then show v else show (truncate v)
          Nothing -> show (truncate v)
  in LowLevel.setValue i (T.pack vString) >> return ()

resizeSpinner :: Ref LowLevel.Input -> Ref LowLevel.Button -> Ref LowLevel.Button -> Ref LowLevel.Spinner -> Rectangle -> IO ()
resizeSpinner i up down s r = do
  LowLevel.resizeSpinnerBase (safeCast s) r
  let (iRect,upRect,downRect) = spinnerComponentBounds r
  LowLevel.resize i iRect
  LowLevel.resize up upRect
  LowLevel.resize down downRect

spinnerInputCallback :: Ref LowLevel.Spinner -> Ref LowLevel.Input -> IO ()
spinnerInputCallback s i = do
  vString <- LowLevel.getValue i
  (vs :: Double) <-
    case (T.decimal vString) of
      Left _ ->
        case (T.double vString) of
          Left _ -> throwIO
                      (userError
                       ("The contents of the spinner input must be an integer or floating point number: "++ (show (T.unpack vString))))
          Right (v,_) -> return v
      Right (v,_) -> return (fromIntegral v)
  min <- LowLevel.getMinimum s
  max <- LowLevel.getMaximum s
  f <- LowLevel.getFormat s
  let v =
        if (vs < min)
        then min
        else if (vs > max)
             then max
             else vs
  LowLevel.setValue s v
  updateInput f v i
  LowLevel.setChanged s
  LowLevel.doCallback s

spinnerUpCallback :: Ref LowLevel.Spinner -> Ref LowLevel.Input -> IO ()
spinnerUpCallback s i = do
  vi <- LowLevel.getValue s
  min <- LowLevel.getMinimum s
  max <- LowLevel.getMaximum s
  step <- LowLevel.getStep s
  wrap <- LowLevel.getWrap s
  f <- LowLevel.getFormat s
  let v =
        let tmp = vi + step
        in
          if (tmp > max)
          then if wrap then min else max
          else tmp
  LowLevel.setValue s v
  updateInput f v i
  LowLevel.setChanged s
  LowLevel.doCallback s

spinnerDownCallback :: Ref LowLevel.Spinner -> Ref LowLevel.Input -> IO ()
spinnerDownCallback s i = do
  vi <- LowLevel.getValue s
  min <- LowLevel.getMinimum s
  max <- LowLevel.getMaximum s
  step <- LowLevel.getStep s
  wrap <- LowLevel.getWrap s
  let v =
        let tmp = vi - step
        in
          if (tmp < min)
          then if wrap then max else min
          else tmp
  LowLevel.setValue s v
  f <- LowLevel.getFormat s
  updateInput f v i
  LowLevel.setChanged s
  LowLevel.doCallback s

spinnerNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.Spinner)
spinnerNew rect l = mdo
  s <- LowLevel.spinnerCustom rect l Nothing
         (Just (LowLevel.defaultCustomWidgetFuncs
                  {
                    LowLevel.handleCustom = Just (handleSpinner i),
                    LowLevel.resizeCustom = Just (resizeSpinner i upButton downButton)
                  }))
  LowLevel.setColor s lightBackground
  LowLevel.setBox s BorderBox
  LowLevel.setTextfont s commonFont
  LowLevel.setTextsize s commonFontSize
  color <- commonSelectionColor
  LowLevel.setSelectionColor s color
  LowLevel.setLabelfont s commonFont
  LowLevel.setLabelsize s commonFontSize
  cs <- LowLevel.getArray s
  mapM_ LowLevel.hide cs
  numChildren <- LowLevel.children s
  mapM_ (LowLevel.removeIndex s . AtIndex) [0 .. numChildren-1]
  let (inputRect,upRect,downRect) = spinnerComponentBounds rect
  LowLevel.begin s
  i <- inputNew inputRect Nothing Nothing
  _ <- LowLevel.setValue i "1"
  LowLevel.setInputType i LowLevel.FlIntInput
  LowLevel.setWhen i [WhenEnterKey, WhenRelease]
  LowLevel.setCallback i (spinnerInputCallback s)
  upButton <- LowLevel.buttonCustom
                upRect
               Nothing
               (Just (\b -> do
                    spec <- buttonFillSpec b
                    r <- LowLevel.getRectangle b
                    s <- LowLevel.getDataSize upSmallImage
                    drawRegularButton (spec { fillCornerRadius = 0 }) (safeCast b)
                    LowLevel.draw upSmallImage (centerInRectangle r s)))
               Nothing
  buttonSetup upButton
  LowLevel.setCallback upButton (\_ -> spinnerUpCallback s i)
  downButton <- LowLevel.buttonCustom
                downRect
                Nothing
                (Just (\b -> do
                          spec <- buttonFillSpec b
                          r <- LowLevel.getRectangle b
                          s <- LowLevel.getDataSize upSmallImage
                          drawRegularButton (spec { fillCornerRadius = 0 }) (safeCast b)
                          LowLevel.draw downSmallImage (centerInRectangle r s)))
                Nothing
  buttonSetup downButton
  LowLevel.setCallback downButton (\_ -> spinnerDownCallback s i)
  LowLevel.end s
  return s
