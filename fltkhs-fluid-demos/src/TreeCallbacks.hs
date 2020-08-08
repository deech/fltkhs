{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE CPP              #-}
{-# LANGUAGE FlexibleContexts #-}
module TreeCallbacks where
import qualified Data.ByteString.Char8                     as C
import           Data.IORef
import           Data.Maybe
import qualified Graphics.UI.FLTK.LowLevel.FL              as FL
import           Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import           Graphics.UI.FLTK.LowLevel.Fl_Types
import           Graphics.UI.FLTK.LowLevel.FLTKHS
import           System.IO.Unsafe
import           Text.Printf
import           Foreign.C.String
import           Foreign.C.Types
import           Data.Bits
import qualified Data.Text as T

g_cb_counter :: IORef Int
g_cb_counter = unsafePerformIO $ newIORef 0

tree_in :: IORef (Maybe (Ref Input))
tree_in = unsafePerformIO $ newIORef Nothing

tree_but :: IORef (Maybe (Ref Button))
tree_but = unsafePerformIO $ newIORef Nothing

tree_grp :: IORef (Maybe (Ref Group))
tree_grp = unsafePerformIO $ newIORef Nothing

item_id :: IORef Int
item_id = unsafePerformIO $ newIORef 0

helpDialog :: IORef (Maybe (Ref DoubleWindow, Ref TextDisplay, Ref TextBuffer))
helpDialog = unsafePerformIO $ newIORef Nothing

treeCallback :: Ref Tree -> IO ()
treeCallback tree = do
  modifyIORef g_cb_counter (\c' -> c' + 1)
  item <- getCallbackItem tree
  reason <- getCallbackReason tree
  let reason_string :: String
      reason_string =
        case reason of
          TreeReasonNone       -> "none"
          TreeReasonSelected   -> "selected"
          TreeReasonDeselected -> "deselected"
          TreeReasonOpened     -> "opened"
          TreeReasonClosed     -> "closed"
          TreeReasonDragged    -> "dragged"
  has_changed <- changed tree
  case item of
    Just i -> do
      itemLabel <- getLabel i
      printf "TREE CALLBACK: label='%s' reason='%s' changed='%s'" (T.unpack itemLabel) reason_string
        (show has_changed)
      clicks <- FL.eventClicks
      if (clicks > 0)
        then printf ", clicks=%d\n" (clicks + 1)
        else print "\n"
    Nothing -> do
      printf
        "TREE CALLBACK: reason='%s' changed='%s' item=(no item -- probably multiple items were changed at once)\n"
        reason_string
        (show has_changed)
      clearChanged tree

margintop_slider_callback :: Ref Tree -> Ref ValueSlider -> IO ()
margintop_slider_callback tree slider = do
  val <- getValue slider
  setMargintop tree (truncate val)
  redraw tree

marginleft_slider_callback :: Ref Tree -> Ref ValueSlider -> IO ()
marginleft_slider_callback tree slider = do
  val <- getValue slider
  setMarginleft tree (truncate val)
  redraw tree

marginbottom_slider_callback :: Ref Tree -> Ref ValueSlider -> IO ()
marginbottom_slider_callback tree slider = do
  deactivate slider
  setTooltip slider ("DISABLED.\n" `T.append` "Set FLTK_ABI_VERSION to 10301 (or higher)\n" `T.append` "to enable this feature")

linespacing_slider_callback :: Ref Tree -> Ref ValueSlider -> IO ()
linespacing_slider_callback tree slider = do
  val <- getValue slider
  setLinespacing tree (truncate val)
  redraw tree

usericonmarginleft_slider_callback :: Ref Tree -> Ref ValueSlider -> IO ()
usericonmarginleft_slider_callback tree slider = do
  val <- getValue slider
  setUsericonmarginleft tree (truncate val)
  redraw tree

labelmarginleft_slider_callback :: Ref Tree -> Ref ValueSlider -> IO ()
labelmarginleft_slider_callback tree slider = do
  val <- getValue slider
  setLabelmarginleft tree (truncate val)
  redraw tree

widgetmarginleft_slider_callback :: Ref Tree -> Ref ValueSlider -> IO ()
widgetmarginleft_slider_callback tree slider = do
  deactivate slider
  setTooltip slider ("DISABLED.\n" `T.append` "Set FLTK_ABI_VERSION to 10301 (or higher)\n" `T.append` "to enable this feature")

openchild_marginbottom_slider_callback :: Ref Tree -> Ref ValueSlider -> IO ()
openchild_marginbottom_slider_callback tree slider = do
  val <- getValue slider
  setOpenchildMarginbottom tree (truncate val)
  redraw tree

connectorwidth_slider_callback :: Ref Tree -> Ref ValueSlider -> IO ()
connectorwidth_slider_callback tree slider = do
  val <- getValue slider
  setConnectorwidth tree (truncate val)
  return ()

collapseicons_chooser_callback :: Ref Tree -> Ref Choice -> IO ()
collapseicons_chooser_callback tree chooser =
  let openXpm =
#ifdef __APPLE__
        [
          "11 11 3 1",
          ".	c #fefefe",
          "#	c #444444",
          "@	c #000000",
          "###########",
          "#.........#",
          "#.........#",
          "#....@....#",
          "#....@....#",
          "#..@@@@@..#",
          "#....@....#",
          "#....@....#",
          "#.........#",
          "#.........#",
          "###########"
        ]
#else
        [
          "11 11 2 1",
          ".  c None",
          "@  c #000000",
          "...@.......",
          "...@@......",
          "...@@@.....",
          "...@@@@....",
          "...@@@@@...",
          "...@@@@@@..",
          "...@@@@@...",
          "...@@@@....",
          "...@@@.....",
          "...@@......",
          "...@......."
        ]
#endif
      closeXpm =
#ifdef __APPLE__
        [
          "11 11 3 1",
          ".	c #fefefe",
          "#	c #444444",
          "@	c #000000",
          "###########",
          "#.........#",
          "#.........#",
          "#.........#",
          "#.........#",
          "#..@@@@@..#",
          "#.........#",
          "#.........#",
          "#.........#",
          "#.........#",
          "###########"
        ]
#else
        [
          "11 11 2 1",
          ".  c none",
          "@  c #000000",
          "...........",
          "...........",
          "...........",
          "...........",
          "...........",
          "@@@@@@@@@@@",
          ".@@@@@@@@@.",
          "..@@@@@@@..",
          "...@@@@@...",
          "....@@@....",
          ".....@....."

        ]
#endif
  in do
  val <- getValue chooser
  case val of
    (AtIndex 0)-> do
      setShowcollapse tree True
      setOpenicon tree (Nothing :: Maybe (Ref Image))
      setCloseicon tree (Nothing :: Maybe (Ref Image))
    (AtIndex 1) -> do
      setShowcollapse tree True
      openPixmap <- pixmapNew (PixmapHs openXpm)
      setOpenicon tree (Just openPixmap)
      closePixmap <- pixmapNew (PixmapHs closeXpm)
      setCloseicon tree (Just closePixmap)
    (AtIndex 2) -> setShowcollapse tree False
    _ -> return ()

connectorstyle_chooser_callback :: Ref Tree -> Ref Choice -> IO ()
connectorstyle_chooser_callback tree chooser = do
   val <- getValue chooser
   case val of
     (AtIndex 0) -> setConnectorstyle tree TreeConnectorNone
     (AtIndex 1) -> setConnectorstyle tree TreeConnectorDotted
     (AtIndex 2) -> setConnectorstyle tree TreeConnectorSolid
     _ -> return ()

set_connectorstyle_chooser :: Ref Choice -> TreeConnector -> IO ()
set_connectorstyle_chooser chooser connectorStyle =
    case connectorStyle of
      TreeConnectorNone -> setValue chooser (MenuItemByIndex (AtIndex 0)) >> return ()
      TreeConnectorDotted -> setValue chooser (MenuItemByIndex (AtIndex 1)) >> return ()
      TreeConnectorSolid -> setValue chooser (MenuItemByIndex (AtIndex 2)) >> return ()

selectmode_chooser_callback :: Ref Tree -> Ref Choice -> IO ()
selectmode_chooser_callback tree chooser = do
   val <- getValue chooser
   let mode = case val of
               (AtIndex 0) -> TreeSelectNone
               (AtIndex 1) -> TreeSelectSingle
               (AtIndex 2) -> TreeSelectMulti
               (AtIndex 3) -> TreeSelectSingleDraggable
               (AtIndex _) -> TreeSelectSingle
   setSelectmode tree mode

reselectmode_chooser_callback :: Ref Tree -> Ref Choice -> IO ()
reselectmode_chooser_callback _ chooser = do
  deactivate chooser
  setTooltip chooser ("DISABLED.\n" `T.append` "Set FLTK_ABI_VERSION to 10301 (or higher)\n" `T.append` "to enable this feature")

whenmode_chooser_callback :: Ref Tree -> Ref Choice -> IO ()
whenmode_chooser_callback tree chooser = do
  val <- getValue chooser
  let whenMode = case val of
                   (AtIndex 0) -> WhenRelease
                   (AtIndex 1) -> WhenChanged
                   (AtIndex 2) -> WhenNever
                   (AtIndex _) -> WhenRelease
  setWhen tree [whenMode]

set_tree_showroot ::  Ref Tree -> Ref CheckButton -> IO ()
set_tree_showroot tree button = getValue button >>= setShowroot tree

radio_button_deactivate_callback :: Ref Window -> Ref CheckButton -> IO ()
radio_button_deactivate_callback window button = do
  deactivate button
  setTooltip button ("DISABLED.\n" `T.append` "Set FLTK_ABI_VERSION to 10301 (or higher)\n" `T.append` "to enable this feature")
  redraw window

goto_next_selected_item :: Ref Tree -> Ref Button -> IO ()
goto_next_selected_item tree _ = do
  item <- nextSelectedItem tree
  maybe (return ()) (showItemTop tree) item

goto_next_selected_item_bottom :: Ref Tree -> Ref Button -> IO ()
goto_next_selected_item_bottom  tree _ = do
  item <- nextSelectedItem tree
  maybe (return ()) (showItemBottom tree) item

goto_next_selected_item_middle :: Ref Tree -> Ref Button -> IO ()
goto_next_selected_item_middle tree _ = do
  item <- nextSelectedItem tree
  maybe (return ()) (showItemMiddle tree) item

openall_button_callback :: Ref Tree -> Ref Button -> IO ()
openall_button_callback tree button = do
  item <- getFirst tree
  go item
  redraw tree
  where
    go :: Maybe (Ref TreeItem) -> IO ()
    go Nothing = return ()
    go (Just i) = do
        children <- hasChildren i
        if children then open i else return ()
        next tree >>= go

insertabove_button_callback :: Ref Tree -> Ref Button -> IO ()
insertabove_button_callback tree button = do
  item <- getFirst tree
  go item
  redraw tree
  where
    go :: Maybe (Ref TreeItem) -> IO ()
    go Nothing = return ()
    go (Just i) = do
        selected <- isSelected tree (TreeItemPointerLocator (TreeItemPointer i))
        if selected
         then do
           insertAbove tree i "AaaAaa"
           insertAbove tree i "BbbBbb"
           insertAbove tree i "CccCcc"
           return ()
         else return ()
        next tree >>= go

assignUserIcons :: Ref Tree -> Ref CheckButton -> IO ()
assignUserIcons tree button = do
   first <- getFirst tree
   go first
   redraw tree
   where
     go :: Maybe (Ref TreeItem) -> IO ()
     go Nothing = return ()
     go (Just i) = do
        val <- getValue button
        if val
          then do
            children <- hasChildren i
            if children
              then pixmapNew (PixmapHs folderXpm) >>= setUsericon i . Just
              else pixmapNew (PixmapHs documentXpm) >>= setUsericon i . Just
          else setUsericon i (Nothing :: Maybe (Ref Image))
     folderXpm =
        [
          "11 11 3 1",
          ".  c None",
          "x  c #d8d833",
          "@  c #808011",
          "...........",
          ".....@@@@..",
          "....@xxxx@.",
          "@@@@@xxxx@@",
          "@xxxxxxxxx@",
          "@xxxxxxxxx@",
          "@xxxxxxxxx@",
          "@xxxxxxxxx@",
          "@xxxxxxxxx@",
          "@xxxxxxxxx@",
          "@@@@@@@@@@@"
        ]
     documentXpm =
        [
          "11 11 3 1",
           ".  c None",
           "x  c #d8d8f8",
           "@  c #202060",
           ".@@@@@@@@@.",
           ".@xxxxxxx@.",
           ".@xxxxxxx@.",
           ".@xxxxxxx@.",
           ".@xxxxxxx@.",
           ".@xxxxxxx@.",
           ".@xxxxxxx@.",
           ".@xxxxxxx@.",
           ".@xxxxxxx@.",
           ".@xxxxxxx@.",
           ".@@@@@@@@@."
        ]


tree_button_cb :: Ref Tree -> Ref Button -> IO ()
tree_button_cb tree button = do
  button_label <- getLabel button
  cw <- if (button_label == "ccc button")
        then return (Just (safeCast button :: Ref WidgetBase))
        else getParent button >>= return . maybe Nothing (Just . safeCast)
  case cw of
    Just cw' -> do
       (cwh, cwx, cwy, cww) <- fmap fromRectangle (getRectangle cw')
       let newHeight = if (cwh + 10 > 50) then 20 else cwh + 10
       resize cw' (toRectangle (cwx, cwy, cww, newHeight))
       redraw tree
       printf "'%s' button pushed (height=%d)\n" button_label newHeight

rebuildTree :: Ref Tree -> Ref CheckButton -> Ref Button -> IO ()
rebuildTree tree button _ = do
  clear tree
  _ <- add tree "Aaa"
  _ <- add tree "Bbb"
  _ <- add tree "Ccc"
  _ <- add tree "Ddd"
  _ <- add tree "Bbb/child-01"
  _ <- add tree "Bbb/child-01/111"
  _ <- add tree "Bbb/child-01/222"
  _ <- add tree "Bbb/child-01/333"
  _ <- add tree "Bbb/child-02"
  _ <- add tree "Bbb/child-03"
  _ <- add tree "Bbb/child-04"
  bbChild02 <- findItem tree "Bbb/child-02"
  maybe (return ())
        (\child -> do
           input <- readIORef tree_in
           case input of
             Nothing -> do
               begin tree
               newIn <- inputNew (toRectangle (1,1,100,1)) (Just "Input Test") Nothing
               writeIORef tree_in (Just newIn)
               setLabelsize newIn (FontSize 10)
               setTextsize newIn (FontSize 10)
               setAlign newIn alignRight
               setTooltip newIn ("Fl_Input inside tree.\n" `T.append`
                                 "The widget's label 'Fl_Input test' should appear to the widget's right.")
               setWidget child (Just newIn)
               end tree
             _ -> setWidget child input)
        bbChild02
  bbChild03 <- findItem tree "Bbb/child-03"
  maybe (return ())
        (\child -> do
           tree_button <- readIORef tree_but
           case tree_button of
             Nothing -> do
               begin tree
               newButton <- buttonNew (toRectangle (1,1,140,1)) (Just "ccc button")
               writeIORef tree_but (Just newButton)
               setLabelsize newButton (FontSize 10)
               setCallback newButton (tree_button_cb tree)
               setTooltip newButton ("Button inside tree.\n" `T.append`
                                     "If 'Item h() from widget' enabled, " `T.append`
                                     "pressing button enlarges it.")
               setWidget child (Just newButton)
               end tree
             _ -> setWidget child tree_button)
         bbChild03
  bbChild04 <- findItem tree "Bbb/child-04"
  maybe (return ())
        (\child ->
           let tipmsg = "A group of two buttons inside the tree.\n" `T.append`
                        "If 'Item h() from widget' enabled, " `T.append`
                        "pressing either button enlarges the group " `T.append`
                        "and both buttons together."
           in
           do
             tree_group <- readIORef tree_grp
             case tree_group of
               Nothing -> do
                 begin tree
                 newGroup <- groupNew (toRectangle (100,100,140,18)) Nothing
                 writeIORef tree_grp (Just newGroup)
                 setColor newGroup whiteColor
                 (X grpX) <- getX newGroup
                 (Y grpY) <- getY newGroup
                 begin newGroup
                 abut <- buttonNew (toRectangle (grpX, grpY + 2, 65,15)) (Just "D1")
                 setLabelsize abut (FontSize 10)
                 setCallback abut (tree_button_cb tree)
                 bbut <- buttonNew (toRectangle (grpX + 75, grpY + 2, 65,15)) (Just "D2")
                 setLabelsize bbut (FontSize 10)
                 setCallback bbut (tree_button_cb tree)
                 end newGroup
                 setResizable newGroup (Just newGroup)
                 setWidget child (Just newGroup)
                 end tree
               Just _ -> setWidget child tree_group
                 )
        bbChild04

  setSortorder tree TreeSortNone
  add tree "Ascending" >>= maybe (return ()) close
  setSortorder tree TreeSortAscending
  add tree "Ascending/Zzz"
  add tree "Ascending/Xxx"
  add tree "Ascending/Aaa"
  add tree "Ascending/Bbb"
  add tree "Ascending/Yyy"
  add tree "Ascending/Ccc"

  setSortorder tree TreeSortNone
  add tree "Descending" >>= maybe (return ()) close
  setSortorder tree TreeSortDescending
  add tree "Descending/Zzz"
  add tree "Descending/Xxx"
  add tree "Descending/Aaa"
  add tree "Descending/Bbb"
  add tree "Descending/Yyy"
  add tree "Descending/Ccc"

  setSortorder tree TreeSortNone
  add tree "Long Line" >>= maybe (return ()) close
  add tree "Long Line/The quick brown fox jumped over the lazy dog. 0123456789"
  add tree "Long Line/Longer Line"
  add tree "Long Line/Longer Line/The quick brown fox jumped over the lazy dog. ---------------- 0123456789"

  mapM_ (\t ->
           let s :: T.Text
               s = T.pack (printf "500 Items/item %04d" ((t + 1) :: Int))
           in add tree s)
        [0 .. 499]
  close tree (TreeItemNameLocator (TreeItemName "500 Items"))
  assignUserIcons tree button
  redraw tree

showpathname_button_callback :: Ref Tree -> Ref Button -> IO ()
showpathname_button_callback tree button = do
  item <- firstSelectedItem tree
  maybe (flMessage "No item was selected")
        (\i -> do
           path <- itemPathname tree i
           case path of
            Just p -> do
              l <- getLabel i >>= \s -> return (if (T.null s) then "???" else s)
              flMessage (T.pack (printf "Pathname for '%s' is: \"%s\"" (T.unpack l) (T.unpack p)))
            Nothing -> flMessage "itemPathname returned Nothing (NOT FOUND)")
        item

closeall_button_callback :: Ref Tree -> Ref Button -> IO ()
closeall_button_callback tree button = do
  first <- getFirst tree
  go first
  redraw tree
  where
    go :: Maybe (Ref TreeItem) -> IO ()
    go Nothing = return ()
    go (Just i) = do
      children <- hasChildren i
      root <- isRoot i
      if ((not root) && children)
        then close i
        else return ()

clearall_button_callback :: Ref Tree -> Ref Button -> IO ()
clearall_button_callback tree _ = do
  clear tree
  redraw tree

testcallbackflag_button_callback :: Ref Tree -> Ref Button -> IO ()
testcallbackflag_button_callback tree button = do
  root' <- root tree
  print "--- Checking docallback of\n"
  case root' of
    Nothing -> return ()
    Just root'' -> do
      let rootItemLocator = TreeItemPointerLocator (TreeItemPointer root'')
      let rootNameLocator = TreeItemNameLocator (TreeItemName "ROOT")
      writeIORef g_cb_counter 0
      closeAndCallback tree rootItemLocator False
      readIORef g_cb_counter >>= \c -> if (c > 0)
                             then flAlert("FAILED 'OFF' TEST\n closeAndCallback item false triggered cb!")
                             else return ()

      writeIORef g_cb_counter 0
      openAndCallback tree rootItemLocator False
      readIORef g_cb_counter
                   >>= \c -> if (c > 0)
                             then flAlert("FAILED 'OFF' TEST\n openAndCallback item false triggered cb!")
                             else return ()

      writeIORef g_cb_counter 0
      openToggleAndCallback tree root'' False
      readIORef g_cb_counter
                   >>= \c -> if (c > 0)
                             then flAlert("FAILED 'OFF' TEST\n openToggleAndCallback item false triggered cb!")
                             else return ()

      writeIORef g_cb_counter 0
      closeAndCallback tree rootNameLocator False
      readIORef g_cb_counter
                   >>= \c -> if (c > 0)
                             then flAlert("FAILED 'OFF' TEST\n closeAndCallback path False triggered cb!")
                             else return ()

      writeIORef g_cb_counter 0
      openAndCallback tree rootNameLocator False
      readIORef g_cb_counter
                   >>= \c -> if (c > 0)
                             then flAlert("FAILED 'OFF' TEST\n openAndCallback path False triggered cb!")
                             else return ()
      openAndCallback tree rootItemLocator False

      writeIORef g_cb_counter 0
      deselectAndCallback tree rootItemLocator False
      readIORef g_cb_counter
                   >>= \c -> if (c > 0)
                             then flAlert("FAILED 'OFF' TEST\n deselectAndCallback item false triggered cb!")
                             else return ()

      writeIORef g_cb_counter 0
      selectAndCallback tree rootItemLocator False
      readIORef g_cb_counter
                   >>= \c -> if (c > 0)
                             then flAlert("FAILED 'OFF' TEST\n selectAndCallback item false triggered cb!")
                             else return ()

      writeIORef g_cb_counter 0
      selectToggleAndCallback tree root'' False
      readIORef g_cb_counter
                   >>= \c -> if (c > 0)
                             then flAlert("FAILED 'OFF' TEST\n selectToggleAndCallback item false triggered cb!")
                             else return ()

      writeIORef g_cb_counter 0
      deselectAndCallback tree rootNameLocator False
      readIORef g_cb_counter
                   >>= \c -> if (c > 0)
                             then flAlert("FAILED 'OFF' TEST\n deselectAndCallback path False triggered cb!")
                             else return ()

      writeIORef g_cb_counter 0
      selectAndCallback tree rootNameLocator False
      readIORef g_cb_counter
                   >>= \c -> if (c > 0)
                             then flAlert("FAILED 'OFF' TEST\n selectAndCallback path False triggered cb!")
                             else return ()
      deselectAndCallback tree rootItemLocator False

      writeIORef g_cb_counter 0
      closeAndCallback tree rootItemLocator True
      readIORef g_cb_counter
                   >>= \c -> if (c == 0)
                             then flAlert("FAILED 'ON' TEST\n closeAndCallback item True did not trigger cb!")
                             else return ()

      writeIORef g_cb_counter 0
      openAndCallback tree rootItemLocator True
      readIORef g_cb_counter
                   >>= \c -> if (c == 0)
                             then flAlert("FAILED 'ON' TEST\n openAndCallback item True did not trigger cb!")
                             else return ()
      writeIORef g_cb_counter 0
      openToggleAndCallback tree root'' True
      readIORef g_cb_counter
                   >>= \c -> if (c == 0)
                             then flAlert("FAILED 'ON' TEST\n openToggleAndCallback item True did not trigger cb!")
                             else return ()

      writeIORef g_cb_counter 0
      openAndCallback tree rootItemLocator True
      readIORef g_cb_counter
                   >>= \c -> if (c == 0)
                             then flAlert("FAILED 'ON' TEST\n openAndCallback [2] item True did not trigger cb!")
                             else return ()
      writeIORef g_cb_counter 0
      closeAndCallback tree rootItemLocator True
      readIORef g_cb_counter
                   >>= \c -> if (c == 0)
                             then flAlert("FAILED 'ON' TEST\n closeAndCallback [2] item True did not trigger cb!")
                             else return ()

      writeIORef g_cb_counter 0
      openAndCallback tree rootNameLocator True
      readIORef g_cb_counter
                   >>= \c -> if (c == 0)
                             then flAlert("FAILED 'ON' TEST\n openAndCallback path True did not trigger cb!")
                             else return ()
      writeIORef g_cb_counter 0
      closeAndCallback tree rootNameLocator True
      readIORef g_cb_counter
                   >>= \c -> if (c == 0)
                             then flAlert("FAILED 'ON' TEST\n closeAndCallback path True did not trigger cb!")
                             else return ()

      openAndCallback tree rootItemLocator False

      writeIORef g_cb_counter 0
      selectAndCallback tree rootItemLocator True
      readIORef g_cb_counter
                   >>= \c -> if (c == 0)
                             then flAlert("FAILED 'ON' TEST\n selectAndCallback item True did not trigger cb!")
                             else return ()

      writeIORef g_cb_counter 0
      deselectAndCallback tree rootItemLocator True
      readIORef g_cb_counter
                   >>= \c -> if (c == 0)
                             then flAlert("FAILED 'ON' TEST\n deselectAndCallback item True did not trigger cb!")
                             else return ()

      writeIORef g_cb_counter 0
      selectToggleAndCallback tree root'' True
      readIORef g_cb_counter
                   >>= \c -> if (c == 0)
                             then flAlert("FAILED 'ON' TEST\n selectToggleAndCallback item True did not trigger cb!")
                             else return ()

      writeIORef g_cb_counter 0
      deselectAndCallback tree rootNameLocator True
      readIORef g_cb_counter
                   >>= \c -> if (c == 0)
                             then flAlert("FAILED 'ON' TEST\n deselectAndCallback path True did not trigger cb!")
                             else return ()

      writeIORef g_cb_counter 0
      selectAndCallback tree rootNameLocator True
      readIORef g_cb_counter
                   >>= \c -> if (c == 0)
                             then flAlert("FAILED 'ON' TEST\n selectAndCallback path True did not trigger cb!")
                             else return ()
      deselectAndCallback tree rootNameLocator False

      writeIORef g_cb_counter 0
      close tree rootItemLocator
      readIORef g_cb_counter
                   >>= \c -> if (c == 0)
                             then flAlert("FAILED 'DEFAULT' TEST\n close item false did not trigger cb!")
                             else return ()

      writeIORef g_cb_counter 0
      open tree rootItemLocator
      readIORef g_cb_counter
                   >>= \c -> if (c == 0)
                             then flAlert("FAILED 'DEFAULT' TEST\n open item false did not trigger cb!")
                             else return ()

      writeIORef g_cb_counter 0
      openToggle tree root''
      readIORef g_cb_counter
                   >>= \c -> if (c == 0)
                             then flAlert("FAILED 'DEFAULT' TEST\n openToggle item false did not trigger cb!")
                             else return ()

      writeIORef g_cb_counter 0
      open tree rootNameLocator
      readIORef g_cb_counter
                   >>= \c -> if (c == 0)
                             then flAlert("FAILED 'DEFAULT' TEST\n open path did not trigger cb!")
                             else return ()
      writeIORef g_cb_counter 0
      close tree rootNameLocator
      readIORef g_cb_counter
                   >>= \c -> if (c == 0)
                             then flAlert("FAILED 'DEFAULT' TEST\n close path did not trigger cb!")
                             else return ()

      openAndCallback tree rootItemLocator False

      writeIORef g_cb_counter 0
      select tree rootItemLocator
      readIORef g_cb_counter
                   >>= \c -> if (c == 0)
                             then flAlert("FAILED 'DEFAULT' TEST\n select item false did not trigger cb!")
                             else return ()

      writeIORef g_cb_counter 0
      deselect tree rootItemLocator
      readIORef g_cb_counter
                   >>= \c -> if (c == 0)
                             then flAlert("FAILED 'DEFAULT' TEST\n deselect item false did not trigger cb!")
                             else return ()

      writeIORef g_cb_counter 0
      selectToggle tree root''
      readIORef g_cb_counter
                   >>= \c -> if (c == 0)
                             then flAlert("FAILED 'DEFAULT' TEST\n selectToggle item false did not trigger cb!")
                             else return ()


      writeIORef g_cb_counter 0
      deselect tree rootNameLocator
      readIORef g_cb_counter
                   >>= \c -> if (c == 0)
                             then flAlert("FAILED 'DEFAULT' TEST\n deselect path did not trigger cb!")
                             else return ()

      writeIORef g_cb_counter 0
      select tree rootNameLocator
      readIORef g_cb_counter
                   >>= \c -> if (c == 0)
                             then flAlert("FAILED 'DEFAULT' TEST\n select path did not trigger cb!")
                             else return ()
      deselect tree rootNameLocator
      flAlert "TEST COMPLETED\n If you didn't see any error dialogs, test PASSED."

testrootshowself_button_callback :: Ref Tree -> Ref Button -> IO ()
testrootshowself_button_callback tree _ = do
  root' <- root tree
  maybe (return ()) (\root'' -> showSelf root'' Nothing) root'

add20k_button_callback :: Ref Tree -> Ref Button -> IO ()
add20k_button_callback tree _ = do
  first <- getFirst tree
  go first
  redraw tree
  where
     go :: Maybe (Ref TreeItem) -> IO ()
     go Nothing = return ()
     go (Just i) = do
        selected <- isSelected i
        root' <- root tree
        if selected
          then do
            parent' <- getParent i >>= maybe (return root') (return . Just)
            maybe (return ())
                  (\p' -> do
                    mapM_ (\item_id' -> let s :: T.Text
                                            s = (T.pack (printf "Item #%d" ((item_id' :: Int) + 1)))
                                        in
                                        add tree s)
                           [0 .. 19999]
                    modifyIORef item_id (\i -> i + 20000))
                  parent'
           else next i >>= go

getMatchingItems :: Ref Tree -> (Ref TreeItem -> IO Bool) -> IO [Ref TreeItem]
getMatchingItems tree pred = do
  first <- getFirst tree
  go first pred []
  where
    go :: Maybe (Ref TreeItem) -> (Ref TreeItem -> IO Bool) -> [Ref TreeItem] -> IO [Ref TreeItem]
    go Nothing _ accum = return accum
    go (Just i) pred accum = do
      passes <- pred i
      next' <- next i
      if passes
        then go next' pred (accum ++ [i])
        else go next' pred accum

toSelectedItemOrAll :: Ref Tree -> (Ref TreeItem -> IO()) -> IO ()
toSelectedItemOrAll tree f = do
  items' <- getMatchingItems tree isSelected
  if (null items')
   then do
     allItems' <- getMatchingItems tree (\_ -> return True)
     mapM_ f allItems'
    else mapM_ f items'
  redraw tree

withFoundItemOrDefault :: Ref Tree ->
                          (Ref TreeItem -> IO a) ->
                          (Ref TreeItem -> IO Bool) ->
                          IO a ->
                          IO a
withFoundItemOrDefault tree f pred fallback = do
  first <- getFirst tree
  res <- go first f pred
  maybe fallback return res
  where
    go :: Maybe (Ref TreeItem) -> (Ref TreeItem -> IO a ) -> (Ref TreeItem -> IO Bool) -> IO (Maybe a)
    go Nothing _ _ = return Nothing
    go (Just i) f pred = do
      passes <- pred i
      if passes
        then f i >>= return . Just
        else next i >>= \i' -> go i' f pred

selected_labelfont_choice_callback :: Ref Tree -> Ref Choice -> IO ()
selected_labelfont_choice_callback tree chooser = do
  (AtIndex idx) <- getValue chooser
  toSelectedItemOrAll tree (\i -> setLabelfont i (Font idx))

assignTreeFontToButton :: Ref Tree -> Ref Choice -> IO ()
assignTreeFontToButton tree chooser = do
  (Font fontNumber) <- getItemLabelfont tree
  setValue chooser (MenuItemByIndex (AtIndex fontNumber))
  return ()

selected_labelsize_slider_callback :: Ref Tree -> Ref ValueSlider -> IO ()
selected_labelsize_slider_callback tree slider = do
  val <- getValue slider
  toSelectedItemOrAll tree (\i -> setLabelsize i (FontSize (truncate val)))

assignTreeLabelsizeToSlider :: Ref Tree -> Ref ValueSlider -> IO ()
assignTreeLabelsizeToSlider tree slider = do
  (FontSize size) <- getLabelsize tree
  setValue slider (fromIntegral size)
  return ()

editColor :: Color -> IO (Maybe Color)
editColor val = do
 (r,g,b) <- FL.getColorRgb val
 rgb <- flcColorChooser
        "Choose Color"
        (Words (r,g,b))
        Nothing
 case rgb of
   (Just (Words rgb'@(r',g',b'))) ->
     rgbColorWithRgb rgb' >>= return . Just
   _ -> return Nothing

getSelectedItemFgColor :: Ref Tree -> IO Color
getSelectedItemFgColor tree =
  withFoundItemOrDefault tree getLabelfgcolor isSelected (getItemLabelfgcolor tree)

getSelectedItemBgColor :: Ref Tree -> IO Color
getSelectedItemBgColor tree =
  withFoundItemOrDefault tree getLabelbgcolor isSelected (getItemLabelbgcolor tree)

all_labelfgcolor_button_callback :: Ref Tree -> Ref Button -> IO ()
all_labelfgcolor_button_callback tree button = do
  fgColor <- getSelectedItemFgColor tree
  newColor <- editColor fgColor
  maybe (return ())
        (\color' -> toSelectedItemOrAll tree (\i -> setLabelfgcolor i color'))
        newColor

all_labelbgcolor_button_callback :: Ref Tree -> Ref Button -> IO ()
all_labelbgcolor_button_callback tree button = do
  bgColor <- getSelectedItemBgColor tree
  newColor <- editColor bgColor
  maybe (return ())
        (\color' -> toSelectedItemOrAll tree (\i -> setLabelbgcolor i color'))
        newColor

deactivate_toggle_callback :: Ref Tree -> Ref LightButton -> IO ()
deactivate_toggle_callback tree button = do
  toggleValue <- getValue button
  toSelectedItemOrAll tree (\i -> activateWith i (not toggleValue))

bold_toggle_callback :: Ref Tree -> Ref LightButton -> IO ()
bold_toggle_callback tree button = do
  toggleValue <- getValue button
  toSelectedItemOrAll tree (\i -> setLabelfont i (if toggleValue then helveticaBold else helvetica))

showselected_button_callback :: Ref Tree -> Ref Button -> IO ()
showselected_button_callback tree button = do
  print "--- SELECTED ITEMS\n"
  items' <- getMatchingItems tree isSelected
  mapM_ (\i -> getLabel i >>= \l -> printf "\t%s\n" (if (T.null l) then "???" else l)) items'

clearselected_button_callback :: Ref Tree -> Ref Button -> IO ()
clearselected_button_callback tree button = do
  items' <- getMatchingItems tree isSelected
  mapM_ (\i -> remove tree i >> return ()) items'

swapselected_button_callback :: Ref Tree -> Ref Button -> IO ()
swapselected_button_callback tree button = do
  items' <- getMatchingItems tree isSelected
  case items' of
    (a':b':[]) -> do
      pa' <- getParent a'
      pb' <- getParent b'
      if (isNothing pa' || isNothing pb')
       then flAlert "Could not get the parent."
       else if (pa' /= pb')
            then flAlert "The two selected items must be siblings."
            else swapChildrenByTreeItem (fromJust pa') a' b' >> return ()
    is' | length is' > 2 -> flAlert "Too many items selected. (must select only two)"
        | length is' < 1 -> flAlert "Too few items selected. (you must select two)"
        | otherwise -> return ()

setLabelfontFromTree :: Ref Tree -> Ref Choice -> IO ()
setLabelfontFromTree tree chooser = do
  (Font f) <- getLabelfont tree
  setValue chooser (MenuItemByIndex (AtIndex f))
  redraw tree

labelfont_choice_callback :: Ref Tree -> Ref Window -> Ref Choice -> IO ()
labelfont_choice_callback tree window chooser = do
  (AtIndex val) <- getValue chooser
  setLabelfont tree (Font val)
  redraw window

item_labelfont_choice_callback :: Ref Tree -> Ref Choice -> IO ()
item_labelfont_choice_callback tree chooser = do
  (AtIndex val) <- getValue chooser
  setLabelfont tree (Font val)
  redraw tree

labelsize_slider_callback :: Ref Tree -> Ref Window -> Ref ValueSlider -> IO ()
labelsize_slider_callback tree window slider = do
  val <- getValue slider
  setLabelsize tree (FontSize (truncate val))
  redraw window

selectall_button_callback :: Ref Tree -> Ref Button -> IO ()
selectall_button_callback tree button = do
  selectAllAndCallback tree Nothing False
  redraw tree

deselectall_button_callback :: Ref Tree -> Ref Button -> IO ()
deselectall_button_callback tree button = do
  deselectAllAndCallback tree Nothing False
  redraw tree

nextselected_button_callback :: Ref Tree -> Ref Button -> IO ()
nextselected_button_callback tree button = do
  print "--- TEST nextSelectedItemAfterItem\n"
  print "   Walk down the tree (forwards) \n"
  first' <- firstSelectedItem tree
  walkDown first'
  print "   Walk up the tree (backwards) \n"
  last' <- lastSelectedItem tree
  walkUp last'
  where
    walkDown :: Maybe (Ref TreeItem) -> IO ()
    walkDown Nothing = return ()
    walkDown (Just i) = do
      next' <- nextSelectedItemAfterItem tree i (Just SearchDirectionDown)
      l' <- getLabel i
      printf "   Selected item: %s\n" (if (T.null l') then "<nolabel>" else l')
      walkDown next'
    walkUp :: Maybe (Ref TreeItem) -> IO ()
    walkUp Nothing = return ()
    walkUp (Just i) = do
      next' <- nextSelectedItemAfterItem tree i (Just SearchDirectionUp)
      l' <- getLabel i
      printf "   Selected item: %s\n" (if (T.null l') then "<nolabel>" else l')
      walkUp next'

selectPath :: Ref Tree -> T.Text -> Ref LightButton -> IO ()
selectPath tree path button = do
  i <- findItem tree path
  case i of
    Nothing -> flAlert $ "FAIL: Couldn't find item " `T.append` (T.pack (show path)) `T.append` "???"
    (Just i') -> do
      onoff <- getValue button
      if onoff
        then select tree (TreeItemPointerLocator (TreeItemPointer i')) >> return ()
        else deselect tree (TreeItemPointerLocator (TreeItemPointer i')) >> return ()

selectChildrenWithPath :: Ref Tree -> T.Text -> Ref LightButton -> IO ()
selectChildrenWithPath tree path button = do
  i <- findItem tree path
  case i of
    Nothing -> flAlert $ "FAIL: Couldn't find item " `T.append` (T.pack (show path)) `T.append` "???"
    (Just _) -> do
      onoff <- getValue button
      if onoff
        then selectAllAndCallback tree i True
        else deselectAllAndCallback tree i True
tree_scrollbar_size_slider_callback :: Ref Tree -> Ref ValueSlider -> IO ()
tree_scrollbar_size_slider_callback tree slider = do
  v <- getValue slider
  setScrollbarSize tree (truncate v)
  redraw tree
scrollbar_size_slider_callback :: Ref Tree -> Ref ValueSlider -> IO ()
scrollbar_size_slider_callback tree slider = getValue slider >>= FL.setScrollbarSize . truncate >> redraw tree

item_labelsize_slider_callback :: Ref Tree -> Ref ValueSlider -> IO ()
item_labelsize_slider_callback tree slider = do
  v <- getValue slider
  setLabelsize tree (FontSize (truncate v))
  redraw tree

updateColorChips ::
  Ref Button ->
  Ref Button ->
  Ref Button ->
  Ref Button ->
  Ref Button ->
  Ref Button ->
  Ref Button ->
  Ref Tree ->
  Ref Window ->
  IO ()
updateColorChips
   color_button
   labelcolor_button
   selection_color_button
   item_labelfgcolor_button
   item_labelbgcolor_button
   all_labelfgcolor_button
   all_labelbgcolor_button
   tree
   window = do
     getColor tree >>= setColor color_button
     getLabelcolor tree >>= setColor labelcolor_button
     getSelectionColor tree >>= setColor selection_color_button
     getItemLabelfgcolor tree >>= setColor item_labelfgcolor_button
     getItemLabelbgcolor tree >>= setColor item_labelbgcolor_button
     getItemLabelfgcolor tree >>= setColor all_labelfgcolor_button
     getItemLabelbgcolor tree >>= setColor all_labelbgcolor_button
     redraw window

updateColor :: Ref Tree -> (Ref Tree -> IO Color) -> (Ref Button -> Color -> IO ()) -> (Ref Tree -> Color -> IO ()) -> IO () -> Ref Window -> Ref Button -> IO ()
updateColor tree colorGetter buttonColorSetter treeColorSetter _updateColorChips window button = do
  v <- colorGetter tree
  res <- editColor v
  maybe (return ())
        (\c -> do
             buttonColorSetter button c
             treeColorSetter tree c
             _updateColorChips
             redraw window
             )
        res

color_button_callback :: Ref Tree -> IO () -> Ref Button -> IO ()
color_button_callback tree _updateColorChips button = do
  v <- getColor tree
  res <- editColor v
  maybe (return ())
        (\c -> do
             setColor tree c
             _updateColorChips
             redraw tree
        )
        res

x_item_labelbgcolor_button_callback :: Ref Tree -> IO () ->  Ref Button -> IO ()
x_item_labelbgcolor_button_callback tree _updateColorChips _ = do
  setItemLabelbgcolor tree (Color 0xffffffff)
  _updateColorChips
  redraw tree
testsuggs_button_callback :: Ref Button -> IO ()
testsuggs_button_callback button =
  let helpmsg = "CHILD WIDGET SIZING TESTS\n" `T.append`
                "=========================\n" `T.append`
                "   1) Start program\n" `T.append`
                "   2) Click the 'ccc button' and D1/D2 buttons.\n" `T.append`
                "      Their sizes should not change.\n" `T.append`
                "   3) Click the 'Item h() from widget' checkbox.\n" `T.append`
                "   4) Click the 'ccc button' and D1/D2 buttons.\n" `T.append`
                "      Their sizes should change, getting larger vertically.\n" `T.append`
                "      This validates that widget's size can affect the tree.\n" `T.append`
                "   5) Disable the checkbox, widgets should resize back to the\n" `T.append`
                "      size of the other items.\n" `T.append`
                "   6) Hit ^A to select all items\n" `T.append`
                "   7) Under 'Selected Items', drag the 'Label Size' slider around.\n" `T.append`
                "      All the item's height should change, as well as child widgets.\n" `T.append`
                "   8) Put Label Size' slider back to normal\n" `T.append`
                "\n" `T.append`
                "CHILD WIDGET + LABEL ITEM DRAWING TESTS\n" `T.append`
                "=======================================\n" `T.append`
                "   1) Start program\n" `T.append`
                "   2) Click 'Show label + widget'.\n" `T.append`
                "      The widgets should all show item labels to their left.\n" `T.append`
                "   3) Disable same, item labels should disappear,\n" `T.append`
                "      showing the widgets in their place.\n" `T.append`
                "\n" `T.append`
                "COLORS\n" `T.append`
                "======\n" `T.append`
                "   1) Start program\n" `T.append`
                "   2) Change 'Tree Fonts+Colors' -> color()\n" `T.append`
                "   3) Entire tree's background color will change, including items.\n" `T.append`
                "   4) Change the 'Tree Fonts + Colors -> item_labelbgcolor()'\n" `T.append`
                "   6) Click the '111' item to select it.\n" `T.append`
                "   7) Click 'Test Operations -> Insert Above'\n" `T.append`
                "      New items should appear above the selected item using the new color.\n" `T.append`
                "      This color will be different from the background color.\n" `T.append`
                "   8) Change the 'Tree Fonts+Colors' -> color()\n" `T.append`
                "      The entire tree's bg should change, except the new items.\n" `T.append`
                "   9) Click the Tree Fonts+Colors -> item_labelbgcolor() 'X' button.\n" `T.append`
                "      This resets item_labelbgcolor() to the default 'transparent' color (0xffffffff)\n" `T.append`
                "  10) Again, click the 'Insert Above' button.\n" `T.append`
                "      New items will be created in the background color, and changing the color()\n" `T.append`
                "      should affect the new items too.\n" `T.append`
                "\n" `T.append`
                "SCROLLING\n" `T.append`
                "=========\n" `T.append`
                "   1) Open '500 items' and 'Long Line' so that both scrollbars appear:\n" `T.append`
                "        * The 'focus box' for the selected item should not be clipped\n" `T.append`
                "          horizontally by the vertical scrollbar.\n" `T.append`
                "        * Resizing the window horizontally should resize the focus box\n" `T.append`
                "        * Scrolling vertically/horizontally should show reveal all\n" `T.append`
                "          edges of the tree. One *exception* is the widget label\n" `T.append`
                "          to the right of the 'ccc button'; labels aren't part\n" `T.append`
                "          of the widget, and therefore don't affect scroll tabs\n" `T.append`
                "   2) Scroll vertical scroller to the middle of the tree\n" `T.append`
                "   3) Left click and drag up/down to extend the selection:\n" `T.append`
                "        * Selection should autoscroll if you drag off the top/bottom\n" `T.append`
                "        * Selection should work *even* if you drag horizontally\n" `T.append`
                "          off the window edge; moving up/down outside the window\n" `T.append`
                "          should continue to autoscroll\n" `T.append`
                "   4) Click either of the the scrollbar tabs and drag:\n" `T.append`
                "        * Even if you drag off the scrollbar, the scrollbar\n" `T.append`
                "          tab should continue to move\n" `T.append`
                "        * Should continue to work if you drag off the window edge\n" `T.append`
                "          horizontally drag off the window.\n" `T.append`
                "   5) Click 'Bbb' and hit 'Add 20,000', then position the\n" `T.append`
                "      'ccc button' so it's partially obscured by a scrollbar tab:\n" `T.append`
                "        * Clicking the obscured button should work\n" `T.append`
                "        * Clicking on the tab over the button should not 'click through'\n" `T.append`
                "          to the button.\n" `T.append`
                ""
  in do
  dialog' <- readIORef helpDialog
  case dialog' of
    Nothing -> do
      groupSetCurrent (Nothing :: Maybe (Ref Group))
      win <- doubleWindowNew (toSize (600,600)) Nothing (Just "Test Suggestions")
      (Width winW) <- getW win
      (Height winH) <- getH win
      disp <- textDisplayNew (toRectangle (0,0,winW,winH)) Nothing
      buff <- textBufferNew Nothing Nothing
      setBuffer disp (Just buff)
      setTextfont disp courier
      setTextsize disp (FontSize 12)
      setText buff helpmsg
      end win
      writeIORef helpDialog (Just (win, disp, buff))
      setResizable win (Just disp) >> showWidget win
    Just (win, disp, buff) ->
      setResizable win (Just disp) >> showWidget win
