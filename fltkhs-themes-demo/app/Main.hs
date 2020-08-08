{-# LANGUAGE ImplicitParams, OverloadedStrings, ScopedTypeVariables, FlexibleContexts #-}
module Main where
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.Theme.Light
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Control.Arrow
import qualified Data.Text as T
import Paths_fltkhs_themes_demo
import Data.Maybe

data AppState =
  AppState
  {
    appStateButtonDemo :: Ref Group
  , appStateColorChooserDemo :: Ref Group
  , appStateDialsDemo :: Ref Group
  , appStateNoDemo :: Ref Group
  , appStateTabDemo :: Ref Group
  , appStateTablesDemo :: Ref Group
  , appStateTreesDemo :: Ref Group
  , appStateSlidersDemo :: Ref Group
  }

folderXpm :: [T.Text]
folderXpm =
  [
    "13 11 3 1"
  , "   c None"
  , "x  c #d8d833"
  , "@  c #808011"
  , "             "
  , "     @@@@    "
  , "    @xxxx@   "
  , "@@@@@xxxx@@  "
  , "@xxxxxxxxx@  "
  , "@xxxxxxxxx@  "
  , "@xxxxxxxxx@  "
  , "@xxxxxxxxx@  "
  , "@xxxxxxxxx@  "
  , "@xxxxxxxxx@  "
  , "@@@@@@@@@@@  "
  ]

buttonDemo :: (?assets :: Assets) => Rectangle -> IO (Ref Group)
buttonDemo r =
  let buttonBankSize = toSize (170,180)
      leftButtonBankBounds = positionInside r buttonBankSize (X 0) (Y 10)
      (b1Bounds,bounds') = splitHorizontally leftButtonBankBounds 0.25
      (b2Bounds,bounds'') = splitHorizontally bounds' 0.33
      (b3Bounds,b4Bounds) = splitHorizontally bounds'' 0.5
      buttonSize = toSize (150,40)
      rightButtonBankBounds = Rectangle (withPositionX (rectanglePosition leftButtonBankBounds) (\(X x) -> (X (x+170)))) (rectangleSize leftButtonBankBounds)
      (b5Bounds,bounds''') = splitHorizontally rightButtonBankBounds 0.25
      (b6Bounds,bounds'''') = splitHorizontally bounds''' 0.33
      (b7Bounds,b8Bounds) = splitHorizontally bounds'''' 0.5
      makeButtonBounds bBounds = Rectangle (centerInRectangle bBounds buttonSize) buttonSize
  in do
    g <- groupNew (Rectangle (rectanglePosition leftButtonBankBounds) (toSize (170*2,180))) (Just "Buttons")
    b1 <- buttonNew  (makeButtonBounds b1Bounds) (Just "Normal Button")
    path <- getDataFileName "images/world.png"
    imageE <- pngImageNew (T.pack path)
    case imageE of
      Left err -> return ()
      Right(image) -> setImage b1 (Just image)
    b2 <- toggleButtonNew (makeButtonBounds b2Bounds) (Just "Toggle Button")
    b3 <- lightButtonNew (makeButtonBounds b3Bounds) (Just "Light Button")
    b4 <- menuButtonNew (makeButtonBounds b4Bounds) (Just "Menu Button")
    _ <- addName b4 "Option 1"
    _ <- addName b4 "Sub Menu/Option Sub 1"
    _ <- addName b4 "Sub Menu/Option Sub 2"
    mi <- addAndGetMenuItem b4 "Option 3" Nothing (Nothing :: Maybe (Ref MenuItem -> IO ())) (MenuItemFlags [])
    pic <- pixmapNew (PixmapHs folderXpm)
    ml <- multiLabelNew [MultiLabelContentImage pic, MultiLabelContentText (NormalLabelType, "Option 3")]
    menuItemLabel ml mi
    b5 <- okButtonNew (makeButtonBounds b5Bounds)
    b6 <- cancelButtonNew (makeButtonBounds b6Bounds)
    b7 <- returnButtonNew (makeButtonBounds b7Bounds) (Just "Return")
    setResizable g (Nothing :: Maybe (Ref Widget))
    end g
    return g

slidersDemo :: (?assets :: Assets) => Rectangle -> IO (Ref Group)
slidersDemo r =
  let sliderWidth = 150
      sliderHeight = 25
      horizontalSliderSize = toSize (sliderWidth,sliderHeight)
      verticalSliderSize = toSize (sliderHeight,sliderWidth)
      boxPadding = 10
      packSide = 150+20
      packSquare = toSize (packSide,packSide)
      horizontalPackSize = (withSizeWidth packSquare (\(Width w) -> (Width (w*2))))
      overallPackBounds = positionInside r (withSizeHeight horizontalPackSize (\(Height h) -> (Height (h*3)))) (X 10) (Y 10)
      (pX,pY,_,_) = fromRectangle overallPackBounds
      (sliderBounds,_) = splitVertically r 0.33
  in do
    g <- groupNew sliderBounds Nothing
    s <- sliderNew (Rectangle (centerInRectangle (Rectangle (toPosition (pX,pY)) packSquare) horizontalSliderSize) horizontalSliderSize) (Just "Slider")
    setType s HorSliderType
    _ <- sliderNew (Rectangle (toPosition (pX+packSide,pY)) verticalSliderSize) (Just "Vertical Slider")
    s <- valueSliderNew (Rectangle (centerInRectangle (Rectangle (toPosition (pX,pY+packSide)) packSquare) horizontalSliderSize) horizontalSliderSize) (Just "Value Slider")
    setType s HorSliderType
    _ <- valueSliderNew (Rectangle (toPosition (pX+packSide,pY+packSide)) verticalSliderSize) (Just "Vertical Value Slider")
    s <- gaugeSliderNew (Rectangle (centerInRectangle (Rectangle (toPosition (pX,pY+packSide+packSide)) packSquare) horizontalSliderSize) horizontalSliderSize) (Just "Gauge Slider")
    setType s HorSliderType
    _ <- gaugeSliderNew (Rectangle (toPosition (pX+packSide,pY+packSide+packSide)) verticalSliderSize) (Just "Vertical Gauge Slider")
    end g
    setResizable g (Nothing :: Maybe (Ref Widget))
    return g

noDemo :: (?assets :: Assets) => Rectangle -> IO (Ref Group)
noDemo r = do
  g <- groupNew r Nothing
  b <- boxNew r (Just "Click one of the demos on the left to get started.")
  setBox b FlatBox
  setColor b lightBackground
  end g
  return g

treesDemo :: (?assets :: Assets) => Rectangle -> IO (Ref Group)
treesDemo r = do
  g <- groupNew r Nothing
  let (treeBounds,_) = splitVertically (centerInRectangleByRelativePosition r (X 10) (Y 20)) 0.5
  begin g
  tree <- treeNew
           treeBounds
           (Just "A tree")
  setShowroot tree False
  _ <- add tree "Flintstones/Fred"
  _ <- add tree "Flintstones/Wilma"
  _ <- add tree "Flintstones/Pebbles"
  _ <- add tree "Simpsons/Homer"
  _ <- add tree "Simpsons/Marge"
  _ <- add tree "Simpsons/Bart"
  _ <- add tree "Simpsons/Lisa"
  _ <- add tree "Pathnames/\\/bin"
  _ <- add tree "Pathnames/\\/usr\\/sbin"
  _ <- add tree "Pathnames/C:\\\\Program Files"
  _ <- add tree "Pathnames/C:\\\\Documents and Settings"
  close tree (TreeItemNameLocator (TreeItemName "Simpsons"))
  close tree (TreeItemNameLocator (TreeItemName "Pathnames"))
  end g
  return g

tablesDemo :: (?assets :: Assets) => Rectangle -> IO (Ref Group)
tablesDemo r = do
  g <- groupNew r Nothing
  let tableBounds = centerInRectangleByRelativePosition r (X 10) (Y 20)
  begin g
  table <- tableRowNew
            tableBounds
            (Just "Table")
            Nothing
            drawCell
            defaultCustomWidgetFuncs
            defaultCustomTableFuncs
  setRows table (Rows 50)
  setCols table (Columns 50)
  begin table
  setColHeader table True
  setColResize table True
  setColHeaderHeight table 25
  setRowHeader table True
  setRowResize table True
  setRowHeaderWidth table 80
  end table
  end g
  return g

tabsDemo :: (?assets :: Assets) => Rectangle -> IO (Ref Group)
tabsDemo r =
  let (topTabsContainer, bottomTabsContainer) = splitHorizontally r 0.5
      topTabBounds = centerInRectangleByRelativePosition topTabsContainer (X 10) (Y 10)
      bottomTabBounds = centerInRectangleByRelativePosition bottomTabsContainer (X 10) (Y 10)
      makeTabContents bounds =
        mapM_
          (\i -> do
             let tabName = "Tab " ++ (show i)
             g <- groupNew bounds (Just (T.pack tabName))
             b <- boxNew bounds (Just (T.pack (tabName ++ " " ++ "contents")))
             setBox b NoBox
             end g
          )
          [0 .. 20]
  in do
    g <- groupNew r Nothing
    begin g
    topTabs <- tabsNew
              topTabBounds
              Nothing
    widgetArea <- clientArea topTabs (TabsAtTop Nothing)
    begin topTabs
    makeTabContents widgetArea
    end topTabs
    setResizable topTabs (Just topTabs)

    bottomTabs <- tabsNew
                    bottomTabBounds
                    Nothing
    widgetArea <- clientArea bottomTabs (TabsAtBottom Nothing)
    begin bottomTabs
    makeTabContents widgetArea
    end bottomTabs
    end g
    return g

dialsDemo :: (?assets :: Assets) => Rectangle -> IO (Ref Group)
dialsDemo r = do
  g <- groupNew r Nothing
  begin g
  let (dialsContainer,_) = splitVertically r 0.66
      (dialWidgetsContainer,outputBoxContainer) = splitVertically dialsContainer 0.5
      (trimmedDialWidgetsContainer,_) = splitHorizontally dialWidgetsContainer 0.75
      (normalDialBounds,rest') = splitHorizontally trimmedDialWidgetsContainer 0.33
      (fillDialBounds,lineDialBounds) = splitHorizontally rest' 0.5
      dialSize = toSize (120,120)
  s <- scrolledNew dialWidgetsContainer Nothing
  begin s
  d <- dialNew
         (Rectangle (centerInRectangle normalDialBounds dialSize) dialSize)
         (Just "Normal Dial")
  d <- dialNew
         (Rectangle (centerInRectangle fillDialBounds dialSize) dialSize)
         (Just "Fill Dial")
  setType d FillDialType
  d <- dialNew
         (Rectangle (centerInRectangle lineDialBounds dialSize) dialSize)
         (Just "Line Dial")
  setType d LineDialType
  end s
  end g
  return g

colorChooserDemo :: (?assets :: Assets) => Rectangle -> IO (Ref Group)
colorChooserDemo r = do
  g <- groupNew r Nothing
  let colorChooserSize = toSize (600,300)
      (ccContainerX,ccContainerY,ccContainerW,ccContainerH) = fromRectangle (centerInRectangleByRelativePosition r (X 10) (Y 10))
      colorChooserBounds = Rectangle (toPosition (ccContainerX+10, ccContainerY+10)) colorChooserSize
      (colorChooserX,colorChooserY,colorChooserW,colorChooserH) = fromRectangle colorChooserBounds
      buttonPadding = 10
      buttonPosition = toPosition (colorChooserX+colorChooserW-130,colorChooserY+colorChooserH+buttonPadding)
      buttonHeight = 30
      buttonSize = toSize (130,buttonHeight)
      buttonBounds = Rectangle buttonPosition buttonSize
  begin g
  c <- colorChooserNew
         colorChooserBounds
         Nothing
         (Just whiteColor)
  buttonGroup <- groupNew (toRectangle (colorChooserX,colorChooserY+colorChooserH+buttonPadding,colorChooserW,buttonHeight+10)) Nothing
  begin buttonGroup
  b <- buttonNew
         buttonBounds
         (Just "Popup Color Selector")
  catchResize <- boxNew (Rectangle (toPosition (colorChooserX,colorChooserY+colorChooserH+buttonPadding+buttonHeight)) (toSize (10,10))) Nothing
  hide catchResize
  end buttonGroup
  setCallback b (\_ -> flcColorChooser (Just (T.pack "Choose a color ...")) Nothing Nothing Nothing >>= print)
  setResizable buttonGroup (Just catchResize)
  end g
  return g

selectorCallback :: AppState -> Ref Wizard -> Ref Browser -> IO ()
selectorCallback s w b = do
  ln <- getValue b
  v <- getText b ln
  case v of
    "Tabs" -> setValue w (Just (appStateTabDemo s))
    "Trees" -> setValue w (Just (appStateTreesDemo s))
    "Tables" -> setValue w (Just (appStateTablesDemo s))
    "Dials" -> setValue w (Just (appStateDialsDemo s))
    "Buttons" -> setValue w (Just (appStateButtonDemo s))
    "Color Chooser" -> setValue w (Just (appStateColorChooserDemo s))
    "Sliders" -> setValue w (Just (appStateSlidersDemo s))
    _ -> setValue w (Just (appStateNoDemo s))

ui :: (?assets:: Assets) => IO ()
ui = do
  let appBounds = toRectangle (0,0,800,600)
  window <- doubleWindowNew
             (rectangleSize appBounds)
             Nothing
             Nothing
  begin window
  let headerHeight = 50
      -- menuBarHeight = 20
      -- (menuBarBounds, appContainer) = splitHorizontallyByPixels appBounds menuBarHeight
      (headerBounds, appArea) = splitHorizontallyByPixels appBounds headerHeight
  -- addMenuBar menuBarBounds
  h <- darkHeader
         headerBounds
         " Light Theme Demo"
         (Alignments [AlignTypeLeft])
  appContainer <- tileNew appArea Nothing
  begin appContainer
  let (selectorContainerBounds, demoContainerBounds) = splitVertically appArea 0.2
  selector <- browserNew selectorContainerBounds Nothing
  modifyVisibleFocus selector False
  setType selector HoldBrowserType
  setTextsize selector (FontSize 14)
  mapM_ (add selector)
   [
    "Buttons"
   ,"Color Chooser"
   ,"Dials"
   ,"Sliders"
   ,"Tables"
   ,"Tabs"
   ,"Trees"
   ]
  demos <- wizardNew demoContainerBounds Nothing
  setBox demos FlatBox
  begin demos
  empty <- noDemo demoContainerBounds
  buttons <- buttonDemo demoContainerBounds
  tables <- tablesDemo demoContainerBounds
  trees <- treesDemo demoContainerBounds
  ts <- tabsDemo demoContainerBounds
  dials <- dialsDemo demoContainerBounds
  colorchooser <- colorChooserDemo demoContainerBounds
  sliders <- slidersDemo demoContainerBounds
  end demos
  end appContainer
  let appState =
        AppState
        {
          appStateTabDemo = ts
        , appStateTreesDemo = trees
        , appStateTablesDemo = tables
        , appStateDialsDemo = dials
        , appStateColorChooserDemo = colorchooser
        , appStateNoDemo = empty
        , appStateButtonDemo = buttons
        , appStateSlidersDemo = sliders
        }
  setCallback selector (selectorCallback appState demos)
  end window
  setResizable window (Just appContainer)
  showWidget window

drawCell :: (?assets :: Assets) => Ref TableRow -> TableContext -> TableCoordinate -> Rectangle -> IO ()
drawCell t tcontext (TableCoordinate (Row tr) (Column tc)) r =
  case tcontext of
    ContextRowHeader -> do
      c <- getRowHeaderColor t
      drawHeader c (Alignments [AlignTypeCenter]) (T.pack ("Row " ++ (show tr))) r
    ContextColHeader -> do
      c <- getColHeaderColor t
      drawHeader c (Alignments [AlignTypeCenter]) (T.pack ("Col " ++ (show tc))) r
    ContextCell -> do
      isSelected <- getRowSelected t (Row tr)
      c <- case isSelected of
        Right True -> getSelectionColor t
        _ -> getColor t
      drawDataCell c (Alignments [AlignTypeRight]) (T.pack ("(" ++ (show tr) ++ "," ++ (show tc) ++ ")")) r
    _ -> return ()

main :: IO ()
main = do
  assets <- configureTheme
  let ?assets = assets
  ui
  FL.run
  FL.flush
