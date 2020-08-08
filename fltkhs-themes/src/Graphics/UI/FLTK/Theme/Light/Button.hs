{-# LANGUAGE ImplicitParams, OverloadedStrings, AllowAmbiguousTypes, GADTs, CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
module Graphics.UI.FLTK.Theme.Light.Button
  (
    FillSpec(..),
    buttonFillSpec,
    buttonIsHidden,
    buttonNew,
    buttonSetup,
    cancelButtonNew,
    checkButtonNew,
    drawCheck,
    drawIndicatorButton,
    drawLight,
    drawMenuButton,
    drawRegularButton,
    drawRound,
    fillRectangle,
    lightButtonNew,
    menuButtonNew,
    okButtonNew,
    returnButtonNew,
    roundButtonNew,
    toggleButtonNew
  )
where
import Control.Exception
import Control.Monad
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
import Data.List

-- | Check of the given button is 'HiddenButtonType'
buttonIsHidden :: Ref LowLevel.ButtonBase -> IO Bool
buttonIsHidden b = do
  t <- LowLevel.getType_ b
  case t of
    HiddenButtonType -> return True
    _ -> return False

-- | Draw a regular button, i.e not a radio button, toggle button, etc.
drawRegularButton ::  FillSpec -> Ref LowLevel.ButtonBase -> IO ()
drawRegularButton spec b = do
  buttonType <- LowLevel.getType_ b
  case buttonType of
    HiddenButtonType -> return ()
    _ -> do
      pressed <- LowLevel.getValue b
      fillRectangle spec pressed
      focused <- isWidget b FL.focus
      hovering <- isWidget b FL.belowmouse
      borderRectangle spec focused hovering
      LowLevel.drawLabel b Nothing

-- | Radio and light buttons are examples of an "indicator" button, some visual indicator that the
-- button is enabled. It takes a function that draws the indicator and 'Bool' flags specifying
-- whether it is pressed, transparent or entirely hidden respectively, the 'FontSize' of the
-- label so the indicator can properly position itself next to the label and the widget itself.
drawIndicatorButton ::
  (
    Parent orig LowLevel.WidgetBase,
    Match b ~ FindOp orig orig (LowLevel.ActiveR ()),
    Op (LowLevel.ActiveR ()) b orig (IO Bool),
    Match c ~ FindOp orig orig (LowLevel.GetAlign ()),
    Op (LowLevel.GetAlign ()) c orig (IO Alignments),
    Match d ~ FindOp orig orig (LowLevel.GetImage ()),
    Op (LowLevel.GetImage ()) d orig (IO (Maybe (Ref LowLevel.Image))),
    Match e ~ FindOp orig orig (LowLevel.GetSelectionColor ()),
    Op (LowLevel.GetSelectionColor ()) e orig (IO Color),
    Match g ~ FindOp orig orig (LowLevel.GetRectangle ()),
    Op (LowLevel.GetRectangle ()) g orig (IO Rectangle),
    Match h ~ FindOp orig orig (LowLevel.GetColor ()),
    Op (LowLevel.GetColor ()) h orig (IO Color),
    Match i ~ FindOp orig orig (LowLevel.GetLabelsize ()),
    Op (LowLevel.GetLabelsize ()) i orig (IO FontSize),
    Match j ~ FindOp orig orig (LowLevel.DrawLabel ()),
    Op (LowLevel.DrawLabel ()) j orig (Maybe (Rectangle,Alignments) ->  IO ()),
    Match k ~ FindOp orig orig (LowLevel.GetBox ()),
    Op (LowLevel.GetBox ()) k orig (IO (Boxtype)),
    Match l ~ FindOp orig orig (LowLevel.GetParent ()),
    Op (LowLevel.GetParent ()) l orig (IO (Maybe (Ref LowLevel.GroupBase))),
    Match m ~ FindOp orig orig (LowLevel.GetColor ()),
    Op (LowLevel.GetColor ()) m orig (IO (Color)),
    Match n ~ FindOp orig orig (LowLevel.SetColor ()),
    Op (LowLevel.SetColor ()) n orig (Color -> IO ())
  ) => (FillSpec -> Bool -> Color -> FontSize -> IO Rectangle) -> Bool -> Bool -> Bool -> FontSize -> Ref orig -> IO ()
drawIndicatorButton indicator pressed transparent hidden fs b =
  if hidden then return ()
    else do
      spec <- buttonFillSpec b
      boxType <- LowLevel.getBox b
      active <- LowLevel.activeR b
      if (not transparent)
        then case boxType of
               NoBox -> return ()
               _ -> do
                 fillRectangle spec pressed
                 focused <- isWidget b FL.focus
                 hovering <- isWidget b FL.belowmouse
                 borderRectangle spec focused hovering
        else do
          maybeParent <- LowLevel.getParent b
          case maybeParent of
            Just (p :: Ref LowLevel.GroupBase) -> do
              c <- LowLevel.getColor p
              () <- LowLevel.setColor b c
              focused <- isWidget b FL.focus
              hovering <- isWidget b FL.belowmouse
              borderRectangle (spec { fillBorderColor = lightBackground }) focused hovering
            Nothing -> return ()
      let (x,y,w,h) = fromRectangle (fillBounds spec)
      color <- LowLevel.getSelectionColor b
      indicatorBounds <- indicator spec (pressed && active) color fs
      let (indicatorX, _, indicatorW, _) = fromRectangle indicatorBounds
      (alignments :: Alignments) <- LowLevel.getAlign b
      (imageM :: Maybe (Ref LowLevel.Image)) <- LowLevel.getImage b
      let labelBounds = case imageM of
            Nothing -> toRectangle (x + fillCornerRadius spec, y, w - (fillCornerRadius spec * 2), h)
            Just _ ->
              let widthLeftCut = indicatorX + indicatorW - x
                  widthRightCut = fillCornerRadius spec
              in toRectangle (indicatorX + indicatorW, y, w - (widthLeftCut + widthRightCut),h)
      LowLevel.drawLabel b (Just (labelBounds, alignments))

-- | Draw a down arrow on the right side of the given 'Rectangle' and return it's bounds
drawDownArrow :: Rectangle -> Color -> FontSize -> IO Rectangle
drawDownArrow bounds arrowColor (FontSize size)=
  let arrowSize :: Int
      arrowSize = (fromIntegral size) `intDiv` 2
      (x,y,w,h) = fromRectangle bounds
      arrowX = x + w - arrowSize - arrowSize
      arrowY :: Int
      arrowY = y + (h `intDiv` 2) - (arrowSize `intDiv` 2)
      arrowBoundingBox = toRectangle (arrowX, arrowY, arrowSize, arrowSize)
  in do
  LowLevel.flcSetColor arrowColor
  LowLevel.flcBeginPolygon
  LowLevel.flcVertex (PrecisePosition (PreciseX (fromIntegral arrowX)) (PreciseY (fromIntegral arrowY)))
  LowLevel.flcVertex (PrecisePosition (PreciseX (fromIntegral (arrowX+arrowSize))) (PreciseY (fromIntegral arrowY)))
  LowLevel.flcVertex (PrecisePosition (PreciseX ((fromIntegral arrowX) + (fromIntegral arrowSize)/2)) (PreciseY (fromIntegral (arrowY + arrowSize))))
  LowLevel.flcVertex (PrecisePosition (PreciseX (fromIntegral arrowX)) (PreciseY (fromIntegral arrowY)))
  LowLevel.flcEndPolygon
  return arrowBoundingBox

-- | Draw a themed menu button
drawMenuButton :: Ref LowLevel.MenuButton -> IO ()
drawMenuButton m = do
  t <- LowLevel.getType_ m
  b <- LowLevel.getBox m
  let noBox = case b of { NoBox -> True; _ -> False }
  if (t /= 0 || noBox) then return ()
    else do
      itemIndex <- LowLevel.getValue m
      fontSize <- LowLevel.getLabelsize m
      drawIndicatorButton (\spec _ color fs -> drawDownArrow (fillBounds spec) color fs) (maybe False (const True) itemIndex) False False fontSize m

-- | Draw the light part of a LightButton. The 'Bool' indicates whether the light is on.
drawLight :: FillSpec -> Bool -> Color -> FontSize -> IO Rectangle
drawLight spec lightOn lightColor (FontSize lightDiameter) =
  let (x,y,_,h) = fromRectangle (fillBounds spec)
      lightX = x + 3
      lightY = y + (h `intDiv` 2)
      lightRadius = (fromIntegral lightDiameter / 2.0)
      lightBoundingBox = toRectangle (lightX, (lightY - truncate lightRadius), fromIntegral lightDiameter, fromIntegral lightDiameter)
  in do
  oldColor <- LowLevel.flcColor
  when lightOn
    (do
      LowLevel.flcSetColor lightColor
      LowLevel.flcPie lightBoundingBox (PreciseAngle 0.0) (PreciseAngle 360.0)
    )
  LowLevel.flcSetColor (fillBorderColor spec)
  LowLevel.flcCircle (PrecisePosition (PreciseX (fromIntegral (lightX + truncate lightRadius))) (PreciseY (fromIntegral lightY))) lightRadius
  LowLevel.flcSetColor oldColor
  return lightBoundingBox

-- | Draw the radio part of a RoundButton. The 'Bool' indicates whether it is enabled.
drawRound :: FillSpec -> Bool -> Color -> FontSize -> IO Rectangle
drawRound spec radioOn radioColor (FontSize fs) =
  let (x,y,_,h) = fromRectangle (fillBounds spec)
      radioBoxX = x + 3
      radioBoxY = fromIntegral y + (fromIntegral h / 2.0)
      radioBoxWidth :: Int
      radioBoxWidth = fromIntegral fs
      radioBoxHalfway :: Double
      radioBoxHalfway = (fromIntegral radioBoxWidth) / 2.0
      radioBoundingBox =
        toRectangle (radioBoxX, truncate (radioBoxY - radioBoxHalfway), radioBoxWidth, radioBoxWidth)
      circleSvg =
        "<svg width=\"%d\" height=\"%d\" viewBox=\" %f %f %d %d\">\n" ++
        "<circle cx=\"0\" cy=\"0\" r=\"%f\" fill=\"%s\" stroke=\"%s\"/>" ++
        "</svg>\n"
      radioRadius :: Double
      radioRadius = (fromIntegral radioBoxWidth) / 4.5
  in do
  (borderColorR, borderColorG, borderColorB) <- FL.getColorRgb (fillBorderColor spec)
  (radioColorR, radioColorG, radioColorB) <- FL.getColorRgb (if radioOn then radioColor else (fillTopColor spec))
  let svg =
        "<svg>\n" ++
        (printf circleSvg
          radioBoxWidth radioBoxWidth (-radioBoxHalfway) (-radioBoxHalfway) radioBoxWidth radioBoxWidth
          (radioBoxHalfway-1.0) ("none" :: String) ("rgb(" ++ show borderColorR ++ "," ++ show borderColorG ++ "," ++ show borderColorB ++ ")")) ++
        (printf circleSvg
          radioBoxWidth radioBoxWidth (-radioBoxHalfway) (-radioBoxHalfway) radioBoxWidth radioBoxWidth
          (radioRadius-1.0) ("rgb(" ++ show radioColorR ++ "," ++ show radioColorG ++ "," ++ show radioColorB ++ ")") ("rgb(" ++ show radioColorR ++ "," ++ show radioColorG ++ "," ++ show radioColorB ++ ")")) ++
        "</svg>\n"
  iE <- LowLevel.svgImageNew ((TE.encodeUtf8 . T.pack) svg)
  case iE of
    Left _ -> throwIO (userError ("The generated SVG is invalid: \n" ++ svg))
    Right i -> do
      LowLevel.draw i (toPosition (radioBoxX,truncate (radioBoxY - radioBoxHalfway)))
      LowLevel.destroy i
  return radioBoundingBox

-- | Draw the check part of a CheckButton. The 'Bool' indicated whether to draw the check or not.
drawCheck :: FillSpec -> Bool -> Color -> FontSize -> IO Rectangle
drawCheck spec checked checkColor (FontSize fontSize) =
  let (x,y,_,h) = fromRectangle (fillBounds spec)
      checkBoxWidth :: Int = fromIntegral fontSize
      checkBoxHeight = checkBoxWidth
      checkBoxX = x + 3
      checkBoxMiddle = fromIntegral checkBoxHeight / 2.0
      checkBoxFourth = fromIntegral checkBoxHeight / 4.0
      yOffset = (h - fromIntegral checkBoxHeight) `intDiv` 2
      pad = 1
      checkThickness = 2
      checkBoxY = y + yOffset
      checkBoxRectangle = toRectangle (checkBoxX, checkBoxY, checkBoxWidth, checkBoxHeight)
  in do
  when checked
    (let
        downstrokeStart = Position (X (checkBoxX + pad)) (Y (checkBoxY + truncate checkBoxMiddle))
        upstrokeStart = Position (X (checkBoxX + pad + truncate checkBoxFourth)) (Y (checkBoxY - pad + checkBoxHeight))
     in do
     LowLevel.flcSetColor checkColor
     LowLevel.flcPolygonWith4Sides
       downstrokeStart
       (Position (X (checkBoxX + pad + checkThickness)) (Y (checkBoxY + truncate checkBoxMiddle)))
       (Position (X (checkBoxX + pad + truncate checkBoxFourth + checkThickness))  (Y (checkBoxY - pad + checkBoxHeight)))
       (Position (X (checkBoxX + pad + truncate checkBoxFourth)) (Y (checkBoxY - pad + checkBoxHeight)))
     LowLevel.flcPolygonWith4Sides
       upstrokeStart
       (Position (X (checkBoxX + checkBoxWidth - pad - checkThickness)) (Y (checkBoxY + pad)))
       (Position (X (checkBoxX + checkBoxWidth - pad)) (Y (checkBoxY + pad)))
       (Position (X (checkBoxX + pad + truncate checkBoxFourth + checkThickness)) (Y (checkBoxY - pad + checkBoxHeight)))
    )
  oldColor <- LowLevel.flcColor
  LowLevel.flcSetColor (fillBorderColor spec)
  LowLevel.flcRect checkBoxRectangle
  LowLevel.flcSetColor oldColor
  return checkBoxRectangle

-- | Create a 'FillSpec' for the given button based on its color, bounds etc.
buttonFillSpec ::
  (
    Match w ~ FindOp orig orig (LowLevel.GetRectangle ()),
    Op (LowLevel.GetRectangle ()) w orig (IO Rectangle),
    Match x ~ FindOp orig orig (LowLevel.GetColor ()),
    Op (LowLevel.GetColor ()) x orig (IO Color),
    Match y ~ FindOp orig orig (LowLevel.GetLabelsize ()),
    Op (LowLevel.GetLabelsize ()) y orig (IO FontSize),
    Match z ~ FindOp orig orig (LowLevel.GetSelectionColor ()),
    Op (LowLevel.GetSelectionColor ()) z orig (IO Color)
  ) => Ref orig -> IO FillSpec
buttonFillSpec b = do
  rect <- LowLevel.getRectangle b
  color <- LowLevel.getColor b
  selectionColor <- LowLevel.getSelectionColor b
  makeFillSpec rect color selectionColor

-- | Common setup for all buttons, setting the label fonts, background color etc.
buttonSetup ::
  (
    ?assets :: Assets,
    Match w ~ FindOp orig orig (LowLevel.SetColor ()),
    Op (LowLevel.SetColor ()) w orig (Color -> IO ()),
    Match x ~ FindOp orig orig (LowLevel.SetLabelfont ()),
    Op (LowLevel.SetLabelfont ()) x orig (Font -> IO ()),
    Match y ~ FindOp orig orig (LowLevel.SetLabelsize ()),
    Op (LowLevel.SetLabelsize ()) y orig (FontSize -> IO ()),
    Match z ~ FindOp orig orig (LowLevel.SetAlign ()),
    Op (LowLevel.SetAlign ()) z orig (Alignments -> IO ())
  ) => Ref orig -> IO ()
buttonSetup b = do
  color <- commonColor
  () <- LowLevel.setColor b color
  () <- LowLevel.setLabelfont b commonFont
  () <- LowLevel.setLabelsize b commonFontSize
  LowLevel.setAlign b (Alignments [AlignTypeInside, AlignTypeCenter , AlignTypeImageNextToText])

handleButtonHover :: Ref LowLevel.ButtonBase -> Event -> IO (Either UnknownEvent ())
handleButtonHover b e = do
  res <- handleHover b e
  case res of
    Left _ -> LowLevel.handleButtonBase b e
    Right _ -> return (Right ())

buttonNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.Button)
buttonNew rectangle label = do
  b <- LowLevel.buttonCustom
         rectangle
         label
         (Just (\b -> do
                   spec <- buttonFillSpec b
                   drawRegularButton spec (safeCast b)))
         (Just (LowLevel.defaultCustomWidgetFuncs { LowLevel.handleCustom = Just (handleButtonHover . safeCast) }))
  buttonSetup b
  return b

toggleButtonNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.ToggleButton)
toggleButtonNew rectangle label = do
  b <- LowLevel.buttonCustom
         rectangle
         label
         (Just (\b -> do
                   spec <- buttonFillSpec b
                   drawRegularButton spec (safeCast b)))
         (Just (LowLevel.defaultCustomWidgetFuncs { LowLevel.handleCustom = Just (handleButtonHover . safeCast ) }))
  LowLevel.setType b ToggleButtonType
  buttonSetup b
  return (LowLevel.castTo b)

lightButtonNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.LightButton)
lightButtonNew rectangle label = do
  b <- LowLevel.lightButtonCustom
         rectangle
         label
         (Just (\b -> do
                   pressed <- LowLevel.getValue b
                   hidden <- buttonIsHidden (safeCast b)
                   fontSize <- LowLevel.getLabelsize b
                   drawIndicatorButton drawLight pressed False hidden fontSize b))
         (Just (LowLevel.defaultCustomWidgetFuncs { LowLevel.handleCustom = Just (handleButtonHover . safeCast) }))
  buttonSetup b
  LowLevel.setSelectionColor b yellowColor
  LowLevel.setAlign b (Alignments [AlignTypeInside, AlignTypeCenter, AlignTypeImageNextToText])
  return b

checkButtonNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.CheckButton)
checkButtonNew rectangle label = do
  b <- LowLevel.checkButtonCustom
         rectangle
         label
         (Just (\b -> do
                   hidden <- buttonIsHidden (safeCast b)
                   when (not hidden)
                     (do
                       (x,y,w,h) <- fmap fromRectangle (LowLevel.getRectangle b)
                       bx <- FL.boxDx BorderBox
                       c <- LowLevel.getColor b
                       (FontSize labelWCInt) <- LowLevel.getLabelsize b
                       let labelW = fromIntegral labelWCInt
                       let dx = bx + 2
                           dy = (h-labelW) `intDiv` 2
                       LowLevel.flcDrawBox BorderBox (toRectangle (x+dx,y+dy,labelW,labelW)) c
                       v <- LowLevel.getValue b
                       when v
                         (do
                            let tx = x+dx+1
                                tw = labelW-1
                                d1 = tw `intDiv` 3
                                d2 = tw-d1
                                ty = y+dy+((labelW+d2) `intDiv` 2)-d1-2
                            oldC <- LowLevel.flcColor
                            LowLevel.flcSetColor blackColor
                            mapM_
                              (\i -> do
                                  let ty' = ty+i
                                  LowLevel.flcLine (toPosition (tx,ty')) (toPosition (tx+d1,ty'+d1))
                                  LowLevel.flcLine (toPosition (tx+d1,ty'+d1)) (toPosition (tx+tw-1,ty'+d1-d2+1)))
                              [0 .. 2]
                            LowLevel.flcSetColor oldC
                            )
                       let lx = dx+labelW+2
                       alignments <- LowLevel.getAlign b
                       LowLevel.drawLabel b (Just (toRectangle (x+lx,y,w-lx-bx,h), alignments)))))
         Nothing
  color <- commonColor
  () <- LowLevel.setColor b color
  () <- LowLevel.setLabelfont b commonFont
  () <- LowLevel.setLabelsize b commonFontSize
  LowLevel.setSelectionColor b color
  return b

roundButtonNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.RoundButton)
roundButtonNew rectangle label = do
  b <- LowLevel.roundButtonCustom
         rectangle
         label
         (Just (\b -> do
                   hidden <- buttonIsHidden (safeCast b)
                   when (not hidden)
                     (do
                       (x,y,w,h) <- fmap fromRectangle (LowLevel.getRectangle b)
                       bx <- FL.boxDx BorderBox
                       (FontSize labelWCInt) <- LowLevel.getLabelsize b
                       v <- LowLevel.getValue b
                       let labelW :: Int
                           labelW = fromIntegral labelWCInt
                           dx = bx + 2
                           dy = (h-labelW) `intDiv` 2
                           circleSvg =
                             "<svg width=\"%d\" height=\"%d\" viewBox=\" %f %f %d %d\">\n" ++
                             "<circle cx=\"0\" cy=\"0\" r=\"%f\" fill=\"%s\" stroke=\"%d\"/>" ++
                             "</svg>\n"
                           halfway :: Double
                           halfway = (fromIntegral labelW)/2
                           radius :: Double
                           radius = (fromIntegral labelW)/4.5
                           (Color black') = blackColor
                           black :: Int
                           black = fromIntegral black'
                           svg =
                             "<svg>\n" ++
                             (printf circleSvg
                               labelW labelW (-halfway) (-halfway) labelW labelW
                               (halfway-1.0) ("none" :: String) black) ++
                             (if v
                               then
                                 printf circleSvg
                                  labelW labelW (-halfway) (-halfway) labelW labelW
                                  (radius-1.0) ("black" :: String) black
                               else "")
                              ++
                             "</svg>\n"
                       iE <- LowLevel.svgImageNew ((TE.encodeUtf8 . T.pack) svg)
                       case iE of
                         Left _ -> throwIO (userError ("The generated SVG is invalid: \n" ++ svg))
                         Right i -> do
                           LowLevel.draw i (toPosition (x+dx,y+dy))
                           LowLevel.destroy i
                       let lx = dx+labelW+2
                       alignments <- LowLevel.getAlign b
                       LowLevel.drawLabel b (Just (toRectangle (x+lx,y,w-lx-bx,h), alignments)))))
         Nothing
  color <- commonColor
  () <- LowLevel.setColor b color
  () <- LowLevel.setLabelfont b commonFont
  () <- LowLevel.setLabelsize b commonFontSize
  LowLevel.setSelectionColor b color
  return b

menuButtonNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.MenuButton)
menuButtonNew rect l = do
  m <- LowLevel.menuButtonCustom rect l (Just drawMenuButton) Nothing
  buttonSetup m
  LowLevel.setBox m BorderBox
  LowLevel.setTextfont m commonFont
  LowLevel.setTextsize m commonFontSize
  color <- commonSelectionColor
  LowLevel.setSelectionColor m color
  return m

returnButtonNew :: (?assets :: Assets) => Rectangle -> Maybe T.Text -> IO (Ref LowLevel.ReturnButton)
returnButtonNew rect l = do
  b <- LowLevel.returnButtonCustom rect l
         (Just ((\b -> do
                   spec <- buttonFillSpec b
                   drawRegularButton spec (safeCast b))))
         (Just (LowLevel.defaultCustomWidgetFuncs { LowLevel.handleCustom = Just (handleButtonHover . safeCast) }))
  buttonSetup b
  let (_,_,w',h') = fromRectangle rect
  LowLevel.setAlign b (Alignments [AlignTypeTextNextToImage])
  iM <- LowLevel.copy returnButtonImage Nothing
  case iM of
    Nothing -> return ()
    Just i -> do
      LowLevel.scale i (Size (Width (w' `intDiv` 3)) (Height (h' `intDiv` 2))) Nothing Nothing
      LowLevel.setImage b iM
  return b

okButtonNew :: (?assets :: Assets) => Rectangle -> IO (Ref LowLevel.Button)
okButtonNew rect = do
  b <- buttonNew rect (Just "OK")
  iM <- LowLevel.copy okButtonImage Nothing
  let (_,_,w',h') = fromRectangle rect
  case iM of
    Nothing -> return ()
    Just i -> do
      LowLevel.scale i (Size (Width (w' `intDiv` 3)) (Height (h' `intDiv` 2))) Nothing Nothing
      LowLevel.setImage b iM
  return b

cancelButtonNew :: (?assets :: Assets) => Rectangle -> IO (Ref LowLevel.Button)
cancelButtonNew rect = do
  b <- buttonNew rect (Just "Cancel")
  iM <- LowLevel.copy cancelButtonImage Nothing
  let (_,_,w',h') = fromRectangle rect
  case iM of
    Nothing -> return ()
    Just i -> do
      LowLevel.scale i (Size (Width (w' `intDiv` 3)) (Height (h' `intDiv` 2))) Nothing Nothing
      LowLevel.setImage b iM
  return b
