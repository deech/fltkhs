{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.Tree
  (
    treeNew,
    treeCustom
  , drawTreeBase
  , handleTreeBase
  , resizeTreeBase
  , hideTreeBase
  , showWidgetTreeBase
    -- * Hierarchy
    --
    -- $hierarchy

    -- * Functions
    --
    -- $functions
  )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_TreeC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.TreeItem
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Base.Widget

{# fun Fl_OverriddenTree_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenTree_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
treeCustom ::
       Rectangle                         -- ^ The bounds of this Tree
    -> Maybe T.Text                      -- ^ The Tree label
    -> Maybe (Ref Tree -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs Tree)      -- ^ Optional custom widget functions
    -> IO (Ref Tree)
treeCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'


{# fun Fl_Tree_New as treeNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Tree_New_WithLabel as treeNewWithLabel' { `Int',`Int',`Int',`Int',`CString'} -> `Ptr ()' id #}
treeNew :: Rectangle -> Maybe T.Text -> IO (Ref Tree)
treeNew rectangle l' =
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Tree_Destroy as treeDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) TreeBase orig impl where
  runOp _ _ tree = swapRef tree $ \treePtr -> do
    treeDestroy' treePtr
    return nullPtr

{# fun Fl_Tree_show_self as showSelf' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ()) ) => Op (ShowSelf ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> showSelf' treePtr
{# fun Fl_Tree_root_label as rootLabel' { id `Ptr ()',id `Ptr CChar' } -> `()' #}
instance (impl ~ (T.Text ->  IO ()) ) => Op (RootLabel ()) TreeBase orig impl where
  runOp _ _ tree new_label = withRef tree $ \treePtr -> withText new_label (\new_labelPtr -> rootLabel' treePtr new_labelPtr)
{# fun Fl_Tree_root as root' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref TreeItem))) ) => Op (Root ()) TreeBase orig impl where
  runOp _ _  tree = withRef tree $ \treePtr -> root' treePtr >>= toMaybeRef
{# fun Fl_Tree_add as add' { id `Ptr ()',id `Ptr CChar' } -> `Ptr ()' id #}
{# fun Fl_Tree_add_with_item_name as addWithItemName' { id `Ptr ()',id `Ptr ()', id `Ptr CChar' } -> `Ptr ()' id #}
instance (impl ~ (T.Text ->  IO (Maybe (Ref TreeItem)))) => Op (Add ()) TreeBase orig impl where
  runOp _ _  tree path' = withRef tree $ \treePtr -> withText path' (\pathPtr' -> add' treePtr pathPtr' >>= toMaybeRef )
instance (Parent a TreeItem, impl ~ (T.Text -> Ref a -> IO (Maybe (Ref TreeItem)))) => Op (AddAt ()) TreeBase orig impl where
  runOp _ _ tree path' item' =
    withRef tree  $ \treePtr ->
    withRef item' $ \itemPtr ->
    withText path' $ \pathPtr ->
    addWithItemName' treePtr itemPtr pathPtr >>= toMaybeRef
{# fun Fl_Tree_insert_above as insertAbove' { id `Ptr ()',id `Ptr ()',`CString' } -> `Ptr ()' id #}
instance (Parent a TreeItem, impl ~ (Ref a -> T.Text ->  IO (Maybe (Ref a)))) => Op (InsertAbove ()) TreeBase orig impl where
  runOp _ _  tree above name = withRef tree $ \treePtr -> withRef above $ \abovePtr -> copyTextToCString name >>= \n -> insertAbove' treePtr abovePtr n >>= toMaybeRef
{# fun Fl_Tree_insert as insert' { id `Ptr ()',id `Ptr ()',`CString',`Int' } -> `Ptr ()' id #}
instance (Parent a TreeItem, impl ~ (Ref a -> T.Text -> AtIndex ->  IO (Maybe (Ref a)))) => Op (Insert ()) TreeBase orig impl where
  runOp _ _ tree item name (AtIndex pos) = withRef tree $ \treePtr -> withRef item $ \itemPtr -> copyTextToCString name >>= \n -> insert' treePtr itemPtr n pos >>= toMaybeRef
{# fun Fl_Tree_remove as remove' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
instance (impl ~ (Ref TreeItem  ->  IO (Either TreeItemNotFound ())) ) => Op (Remove ()) TreeBase orig impl where
  runOp _ _ tree item = withRef tree $ \treePtr -> withRef item $ \itemPtr -> do
    status' <- remove' treePtr itemPtr
    if (status' == (-1)) then (return $ Left TreeItemNotFound) else (return $ Right ())
{# fun Fl_Tree_clear as clear' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ()) ) => Op (Clear ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> clear' treePtr
{# fun Fl_Tree_clear_children as clearChildren' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a TreeItem, impl ~ (Ref a ->  IO ()) ) => Op (ClearChildren ()) TreeBase orig impl where
  runOp _ _ tree item = withRef tree $ \treePtr -> withRef item $ \itemPtr -> clearChildren' treePtr itemPtr
{# fun Fl_Tree_find_item as findItem' { id `Ptr ()',`CString' } -> `Ptr ()' id #}
instance (impl ~ (T.Text ->  IO (Maybe (Ref TreeItem))) ) => Op (FindItem ()) TreeBase orig impl where
  runOp _ _ tree path = withRef tree $ \treePtr -> withText path (\p -> findItem' treePtr p >>= toMaybeRef)
{# fun Fl_Tree_item_pathname as itemPathname' { id `Ptr ()', id `Ptr CChar', `Int', id `Ptr ()'} -> `Int' #}
instance (Parent a TreeItem, impl ~ (Ref a ->  IO (Maybe T.Text)) ) => Op (ItemPathname ()) TreeBase orig impl where
  runOp _ _ tree item =
    withRef tree $ \treePtr ->
    withRef item $ \itemPtr ->
    allocaBytes oneKb $ \pathPtr -> do
    retVal' <- itemPathname' treePtr pathPtr oneKb itemPtr
    if retVal' < 0
      then return Nothing
      else do
       b' <- cStringToText (castPtr pathPtr)
       return (Just b')
{# fun Fl_Tree_item_clicked as itemClicked' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref TreeItem))) ) => Op (ItemClicked ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> itemClicked' treePtr >>= toMaybeRef
{# fun Fl_Tree_first as first' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref TreeItem))) ) => Op (GetFirst ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> first' treePtr >>= toMaybeRef
{# fun Fl_Tree_first_visible as firstVisible' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref TreeItem))) ) => Op (FirstVisible ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> firstVisible' treePtr >>= toMaybeRef
{# fun Fl_Tree_next as next' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref TreeItem))) ) => Op (Next ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> next' treePtr >>= toMaybeRef
{# fun Fl_Tree_next_with_item as nextWithItem' { id `Ptr ()',id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ (Ref TreeItem  ->  IO (Maybe (Ref TreeItem))) ) => Op (NextAfterItem ()) TreeBase orig impl where
  runOp _ _ tree item = withRef tree $ \treePtr -> withRef item $ \itemPtr -> nextWithItem' treePtr itemPtr >>= toMaybeRef
{# fun Fl_Tree_next_item as nextItem' { id `Ptr ()',id `Ptr ()', id `CInt', cFromBool `Bool'} -> `Ptr ()' id #}
instance (impl ~ (Ref TreeItem  ->  Maybe SearchDirection -> Bool -> IO (Maybe (Ref TreeItem))) ) => Op (NextItem ()) TreeBase orig impl where
  runOp _ _ tree item dir visible' =
    withRef tree $ \treePtr -> withRef item $ \itemPtr -> nextItem' treePtr itemPtr (maybe 0 (fromIntegral . fromEnum) dir) visible'
       >>= toMaybeRef
{# fun Fl_Tree_prev as prev' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref TreeItem))) ) => Op (Prev ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> prev' treePtr >>= toMaybeRef
{# fun Fl_Tree_prev_with_item as prevWithItem' { id `Ptr ()',id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ (Ref TreeItem  ->  IO (Maybe (Ref TreeItem))) ) => Op (PrevBeforeItem ()) TreeBase orig impl where
  runOp _ _ tree item = withRef tree $ \treePtr -> withRef item $ \itemPtr -> prevWithItem' treePtr itemPtr >>= toMaybeRef
{# fun Fl_Tree_last as last' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref TreeItem))) ) => Op (GetLast ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> last' treePtr >>= toMaybeRef
{# fun Fl_Tree_last_visible as lastVisible' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref TreeItem))) ) => Op (LastVisible ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> lastVisible' treePtr >>= toMaybeRef
{# fun Fl_Tree_first_selected_item as firstSelectedItem' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref TreeItem))) ) => Op (FirstSelectedItem ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> firstSelectedItem' treePtr >>= toMaybeRef
{# fun Fl_Tree_last_selected_item as lastSelectedItem' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref TreeItem))) ) => Op (LastSelectedItem ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> lastSelectedItem' treePtr >>= toMaybeRef
{# fun Fl_Tree_next_selected_item as nextSelectedItem' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref TreeItem))) ) => Op (NextSelectedItem ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> nextSelectedItem' treePtr >>= toMaybeRef
{# fun Fl_Tree_next_selected_item_with_item_direction as nextSelectedItemWithItemDirection' { id `Ptr ()',id `Ptr ()', id `CInt' } -> `Ptr ()' id #}
instance (impl ~ (Ref TreeItem  ->  Maybe SearchDirection -> IO (Maybe (Ref TreeItem))) ) => Op (NextSelectedItemAfterItem ()) TreeBase orig impl where
  runOp _ _ tree item dir = withRef tree $ \treePtr -> withRef item $ \itemPtr -> nextSelectedItemWithItemDirection' treePtr itemPtr (maybe 0 (fromIntegral . fromEnum) dir) >>= toMaybeRef
{# fun Fl_Tree_open_with_item as openWithItem' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
{# fun Fl_Tree_open_with_item_docallback as openWithItemDocallback' { id `Ptr ()',id `Ptr ()', cFromBool `Bool' } -> `Int' #}
{# fun Fl_Tree_open_with_path as openWithPath' { id `Ptr ()',`CString' } -> `Int' #}
{# fun Fl_Tree_open_with_path_docallback as openWithPathDocallback' { id `Ptr ()', `CString', cFromBool `Bool' } -> `Int' #}
instance (impl ~ (TreeItemLocator -> IO ()) ) => Op (Open ()) TreeBase orig impl where
  runOp _ _ tree_item locator' =
    withRef tree_item $ \tree_itemPtr ->
    case locator' of
      TreeItemPointerLocator (TreeItemPointer itemRef) -> withRef itemRef $ \itemRefPtr -> openWithItem' tree_itemPtr itemRefPtr >> return ()
      TreeItemNameLocator (TreeItemName n') -> withText n' (\n'' -> openWithPath' tree_itemPtr n'' >> return ())
instance  (impl ~ (TreeItemLocator -> Bool -> IO ())) => Op (OpenAndCallback ()) TreeBase orig impl where
  runOp _ _ tree_item locator' docallback' =
    withRef tree_item $ \tree_itemPtr ->
    case locator' of
      TreeItemPointerLocator (TreeItemPointer itemRef) -> withRef itemRef $ \itemRefPtr -> openWithItemDocallback' tree_itemPtr itemRefPtr docallback' >> return ()
      TreeItemNameLocator (TreeItemName n') -> withText n' (\n'' -> openWithPathDocallback' tree_itemPtr n'' docallback' >> return ())
{# fun Fl_Tree_open_toggle as openToggle' { id `Ptr ()',id `Ptr ()' } -> `()' #}
{# fun Fl_Tree_open_toggle_with_docallback as openToggleWithDocallback' { id `Ptr ()',id `Ptr ()', cFromBool `Bool' } -> `()' #}
instance (impl ~ (Ref TreeItem  ->  IO ()) ) => Op (OpenToggle ()) TreeBase orig impl where
  runOp _ _ tree item = withRef tree $ \treePtr -> withRef item $ \itemPtr -> openToggle' treePtr itemPtr
instance (impl ~ (Ref TreeItem  -> Bool ->  IO ()) ) => Op (OpenToggleAndCallback ()) TreeBase orig impl where
  runOp _ _ tree item docallback = withRef tree $ \treePtr -> withRef item $ \itemPtr -> openToggleWithDocallback' treePtr itemPtr docallback
{# fun Fl_Tree_close_with_item as closeWithItem' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
{# fun Fl_Tree_close_with_item_docallback as closeWithItemDocallback' { id `Ptr ()',id `Ptr ()', cFromBool `Bool' } -> `Int' #}
{# fun Fl_Tree_close_with_path as closeWithPath' { id `Ptr ()',`CString' } -> `Int' #}
{# fun Fl_Tree_close_with_path_docallback as closeWithPathDocallback' { id `Ptr ()',`CString', cFromBool `Bool' } -> `Int' #}
instance (impl ~ (TreeItemLocator -> IO ()) ) => Op (Close ()) TreeBase orig impl where
  runOp _ _ tree_item locator' =
    withRef tree_item $ \tree_itemPtr ->
    case locator' of
      TreeItemPointerLocator (TreeItemPointer itemRef) -> withRef itemRef $ \itemRefPtr -> closeWithItem' tree_itemPtr itemRefPtr >> return ()
      TreeItemNameLocator (TreeItemName n') -> withText n' (\n'' -> closeWithPath' tree_itemPtr n'' >> return ())
instance  (impl ~ (TreeItemLocator -> Bool -> IO ())) => Op (CloseAndCallback ()) TreeBase orig impl where
  runOp _ _ tree_item locator' docallback' =
    withRef tree_item $ \tree_itemPtr ->
    case locator' of
      TreeItemPointerLocator (TreeItemPointer itemRef) -> withRef itemRef $ \itemRefPtr -> closeWithItemDocallback' tree_itemPtr itemRefPtr docallback' >> return ()
      TreeItemNameLocator (TreeItemName n') -> withText n' (\n'' -> closeWithPathDocallback' tree_itemPtr n'' docallback' >> return ())
{# fun Fl_Tree_is_open_with_item as isOpenWithItem' { id `Ptr ()',id `Ptr ()' } -> `Bool' cToBool #}
{# fun Fl_Tree_is_open_with_path as isOpenWithPath' { id `Ptr ()',`CString' } -> `Bool' cToBool  #}
instance (impl ~ (TreeItemLocator ->  IO (Bool)) ) => Op (IsOpen ()) TreeBase orig impl where
  runOp _ _ tree locator' = withRef tree $ \treePtr ->
    case locator' of
      TreeItemPointerLocator (TreeItemPointer r') -> withRef r' $ \r'Ptr -> isOpenWithItem' treePtr r'Ptr
      TreeItemNameLocator (TreeItemName n') -> withText n' (\n'' -> isOpenWithPath' treePtr n'')
{# fun Fl_Tree_is_close_with_item as isCloseWithItem' { id `Ptr ()',id `Ptr ()' } -> `Bool' cToBool #}
{# fun Fl_Tree_is_close_with_path as isCloseWithPath' { id `Ptr ()',`CString' } -> `Bool' cToBool  #}
instance (impl ~ (TreeItemLocator ->  IO (Bool)) ) => Op (IsClose ()) TreeBase orig impl where
  runOp _ _ tree locator' = withRef tree $ \treePtr ->
    case locator' of
      TreeItemPointerLocator (TreeItemPointer r') -> withRef r' $ \r'Ptr -> isCloseWithItem' treePtr r'Ptr
      TreeItemNameLocator (TreeItemName n') -> withText n' (\n'' -> isCloseWithPath' treePtr n'')
{# fun Fl_Tree_select_with_item as selectWithItem' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
{# fun Fl_Tree_select_with_item_docallback as selectWithItemDocallback' { id `Ptr ()',id `Ptr ()',cFromBool `Bool' } -> `Int' #}
{# fun Fl_Tree_select_with_path as selectWithPath' { id `Ptr ()',`CString' } -> `Int' #}
{# fun Fl_Tree_select_with_path_docallback as selectWithPathDocallback' { id `Ptr ()',`CString',cFromBool `Bool' } -> `Int' #}
instance (impl ~ (TreeItemLocator  ->  IO (Either NoChange ())) ) => Op (Select ()) TreeBase orig impl where
  runOp _ _ tree locator' =
    withRef tree $ \treePtr ->
    case locator' of
      TreeItemPointerLocator (TreeItemPointer r') -> withRef r' $ \r'Ptr -> selectWithItem' treePtr r'Ptr >>= return . successOrNoChange
      TreeItemNameLocator (TreeItemName n') -> withText n' (\n'' -> selectWithPath' treePtr n'' >>= return . successOrNoChange)
instance  (impl ~ (TreeItemLocator -> Bool -> IO ())) => Op (SelectAndCallback ()) TreeBase orig impl where
  runOp _ _ tree_item locator' docallback' =
    withRef tree_item $ \tree_itemPtr ->
    case locator' of
      TreeItemPointerLocator (TreeItemPointer itemRef) -> withRef itemRef $ \itemRefPtr -> selectWithItemDocallback' tree_itemPtr itemRefPtr docallback' >> return ()
      TreeItemNameLocator (TreeItemName n') -> withText n' (\n'' -> selectWithPathDocallback' tree_itemPtr n'' docallback' >> return ())
{# fun Fl_Tree_select_toggle as selectToggle' { id `Ptr ()',id `Ptr ()' } -> `()' #}
{# fun Fl_Tree_select_toggle_with_docallback as selectToggleWithDocallback' { id `Ptr ()',id `Ptr ()',cFromBool `Bool' } -> `()' #}
instance (impl ~ (Ref TreeItem  ->  IO ()) ) => Op (SelectToggle ()) TreeBase orig impl where
  runOp _ _ tree item = withRef tree $ \treePtr -> withRef item $ \itemPtr -> selectToggle' treePtr itemPtr
instance (impl ~ (Ref TreeItem  -> Bool ->  IO ()) ) => Op (SelectToggleAndCallback ()) TreeBase orig impl where
  runOp _ _ tree item docallback = withRef tree $ \treePtr -> withRef item $ \itemPtr -> selectToggleWithDocallback' treePtr itemPtr docallback
{# fun Fl_Tree_deselect_with_item as deselectWithItem' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
{# fun Fl_Tree_deselect_with_item_docallback as deselectWithItemDocallback' { id `Ptr ()',id `Ptr ()',cFromBool `Bool' } -> `Int' #}
{# fun Fl_Tree_deselect_with_path as deselectWithPath' { id `Ptr ()', `CString'} -> `Int' #}
{# fun Fl_Tree_deselect_with_path_docallback as deselectWithPathDocallback' { id `Ptr ()',`CString',cFromBool `Bool' } -> `Int' #}
instance (impl ~ (TreeItemLocator  ->  IO (Either NoChange ())) ) => Op (Deselect ()) TreeBase orig impl where
  runOp _ _ tree locator' =
    withRef tree $ \treePtr ->
    case locator' of
      TreeItemPointerLocator (TreeItemPointer r') -> withRef r' $ \r'Ptr -> deselectWithItem' treePtr r'Ptr >>= return . successOrNoChange
      TreeItemNameLocator (TreeItemName n') -> withText n' (\n'' -> deselectWithPath' treePtr n'' >>= return . successOrNoChange)
instance  (impl ~ (TreeItemLocator -> Bool -> IO ())) => Op (DeselectAndCallback ()) TreeBase orig impl where
  runOp _ _ tree_item locator' docallback' =
    withRef tree_item $ \tree_itemPtr ->
    case locator' of
      TreeItemPointerLocator (TreeItemPointer itemRef) -> withRef itemRef $ \itemRefPtr -> deselectWithItemDocallback' tree_itemPtr itemRefPtr docallback' >> return ()
      TreeItemNameLocator (TreeItemName n') -> withText n' (\n'' -> deselectWithPathDocallback' tree_itemPtr n'' docallback' >> return ())
{# fun Fl_Tree_select_only as selectOnly' { id `Ptr ()',id `Ptr ()' } -> `()' #}
{# fun Fl_Tree_select_only_with_docallback as selectOnlyWithDocallback' { id `Ptr ()',id `Ptr ()', cFromBool `Bool' } -> `()' #}
instance (impl ~ (Ref TreeItem  ->  IO ()) ) => Op (SelectOnly ()) TreeBase orig impl where
  runOp _ _ tree item = withRef tree $ \treePtr -> withRef item $ \itemPtr -> selectOnly' treePtr itemPtr
instance (impl ~ (Ref TreeItem  -> Bool ->  IO ()) ) => Op (SelectOnlyAndCallback ()) TreeBase orig impl where
  runOp _ _ tree item docallback = withRef tree $ \treePtr -> withRef item $ \itemPtr -> selectOnlyWithDocallback' treePtr itemPtr docallback
{# fun Fl_Tree_select_all as selectAll' { id `Ptr ()',id `Ptr ()' } -> `()' #}
{# fun Fl_Tree_select_all_with_docallback as selectAllWithDocallback' { id `Ptr ()',id `Ptr ()',cFromBool `Bool' } -> `()' #}
instance (impl ~ (IO ()) ) => Op (SelectAll ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr ->  selectAll' treePtr nullPtr
instance (impl ~ (Maybe (Ref TreeItem)  -> Bool ->  IO ()) ) => Op (SelectAllAndCallback ()) TreeBase orig impl where
  runOp _ _ tree item docallback = withRef tree $ \treePtr -> withMaybeRef item $ \itemPtr -> selectAllWithDocallback' treePtr itemPtr docallback
{# fun Fl_Tree_deselect_all_with_item as deselectAll' { id `Ptr ()',id `Ptr ()' } -> `()' #}
{# fun Fl_Tree_deselect_all_with_item_docallback as deselectAllWithDocallback' { id `Ptr ()',id `Ptr ()',cFromBool `Bool' } -> `()' #}
instance (impl ~ (IO ()) ) => Op (DeselectAll ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr ->  deselectAll' treePtr nullPtr
instance (impl ~ (Maybe (Ref TreeItem)  -> Bool ->  IO ()) ) => Op (DeselectAllAndCallback ()) TreeBase orig impl where
  runOp _ _ tree item docallback = withRef tree $ \treePtr -> withMaybeRef item $ \itemPtr -> deselectAllWithDocallback' treePtr itemPtr docallback
{# fun Fl_Tree_set_item_focus as setItemFocus' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (impl ~ (Ref TreeItem  ->  IO ()) ) => Op (SetItemFocus ()) TreeBase orig impl where
  runOp _ _ tree item = withRef tree $ \treePtr -> withRef item $ \itemPtr -> setItemFocus' treePtr itemPtr
{# fun Fl_Tree_get_item_focus as getItemFocus' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref TreeItem))) ) => Op (GetItemFocus ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> getItemFocus' treePtr >>= toMaybeRef
{# fun Fl_Tree_is_selected_with_item as isSelectedWithItem' { id `Ptr ()',id `Ptr ()' } -> `Bool' cToBool #}
{# fun Fl_Tree_is_selected_with_path as isSelectedWithPath' { id `Ptr ()',`CString' } -> `Bool' cToBool #}
instance (impl ~ (TreeItemLocator ->  IO (Bool)) ) => Op (IsSelected ()) TreeBase orig impl where
  runOp _ _ tree locator' = withRef tree $ \treePtr ->
    case locator' of
      TreeItemPointerLocator (TreeItemPointer item) -> withRef item $ \itemPtr -> isSelectedWithItem' treePtr itemPtr
      TreeItemNameLocator (TreeItemName path) -> withText path (\p -> isSelectedWithPath' treePtr p)
{# fun Fl_Tree_item_labelfont as itemLabelfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ ( IO (Font)) ) => Op (GetItemLabelfont ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> itemLabelfont' treePtr
{# fun Fl_Tree_set_item_labelfont as itemSetLabelfont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
instance (impl ~ (Font ->  IO ()) ) => Op (SetItemLabelfont ()) TreeBase orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> itemSetLabelfont' treePtr val
{# fun Fl_Tree_item_labelsize as itemLabelsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ ( IO (FontSize)) ) => Op (GetItemLabelsize ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> itemLabelsize' treePtr >>= return . FontSize
{# fun Fl_Tree_set_item_labelsize as itemSetLabelsize' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ()) ) => Op (SetItemLabelsize ()) TreeBase orig impl where
  runOp _ _ tree (FontSize val) = withRef tree $ \treePtr -> itemSetLabelsize' treePtr val
{# fun Fl_Tree_item_labelfgcolor as itemLabelfgcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color)) ) => Op (GetItemLabelfgcolor ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> itemLabelfgcolor' treePtr
{# fun Fl_Tree_set_item_labelfgcolor as setItemLabelfgcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ()) ) => Op (SetItemLabelfgcolor ()) TreeBase orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setItemLabelfgcolor' treePtr val
{# fun Fl_Tree_item_labelbgcolor as itemLabelbgcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color)) ) => Op (GetItemLabelbgcolor ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> itemLabelbgcolor' treePtr
{# fun Fl_Tree_set_item_labelbgcolor as setItemLabelbgcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ()) ) => Op (SetItemLabelbgcolor ()) TreeBase orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setItemLabelbgcolor' treePtr val
{# fun Fl_Tree_connectorcolor as connectorcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color)) ) => Op (GetConnectorcolor ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> connectorcolor' treePtr
{# fun Fl_Tree_set_connectorcolor as setConnectorcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ()) ) => Op (SetConnectorcolor ()) TreeBase orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setConnectorcolor' treePtr val
{# fun Fl_Tree_marginleft as marginleft' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int)) ) => Op (GetMarginleft ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> marginleft' treePtr
{# fun Fl_Tree_set_marginleft as setMarginleft' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ()) ) => Op (SetMarginleft ()) TreeBase orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setMarginleft' treePtr val
{# fun Fl_Tree_margintop as margintop' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int)) ) => Op (GetMargintop ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> margintop' treePtr
{# fun Fl_Tree_set_margintop as setMargintop' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ()) ) => Op (SetMargintop ()) TreeBase orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setMargintop' treePtr val
{# fun Fl_Tree_linespacing as linespacing' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int)) ) => Op (GetLinespacing ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> linespacing' treePtr
{# fun Fl_Tree_set_linespacing as setLinespacing' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ()) ) => Op (SetLinespacing ()) TreeBase orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setLinespacing' treePtr val
{# fun Fl_Tree_openchild_marginbottom as openchildMarginbottom' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int)) ) => Op (GetOpenchildMarginbottom ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> openchildMarginbottom' treePtr
{# fun Fl_Tree_set_openchild_marginbottom as setOpenchildMarginbottom' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ()) ) => Op (SetOpenchildMarginbottom ()) TreeBase orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setOpenchildMarginbottom' treePtr val
{# fun Fl_Tree_usericonmarginleft as usericonmarginleft' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int)) ) => Op (GetUsericonmarginleft ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> usericonmarginleft' treePtr
{# fun Fl_Tree_set_usericonmarginleft as setUsericonmarginleft' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ()) ) => Op (SetUsericonmarginleft ()) TreeBase orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setUsericonmarginleft' treePtr val
{# fun Fl_Tree_labelmarginleft as labelmarginleft' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int)) ) => Op (GetLabelmarginleft ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> labelmarginleft' treePtr
{# fun Fl_Tree_set_labelmarginleft as setLabelmarginleft' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ()) ) => Op (SetLabelmarginleft ()) TreeBase orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setLabelmarginleft' treePtr val
{# fun Fl_Tree_connectorwidth as connectorwidth' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int)) ) => Op (GetConnectorwidth ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> connectorwidth' treePtr
{# fun Fl_Tree_set_connectorwidth as setConnectorwidth' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ()) ) => Op (SetConnectorwidth ()) TreeBase orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setConnectorwidth' treePtr val
{# fun Fl_Tree_usericon as usericon' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref Image))) ) => Op (GetUsericon ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> usericon' treePtr >>= toMaybeRef
{# fun Fl_Tree_set_usericon as setUsericon' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a Image, impl ~ (Maybe( Ref a )  ->  IO ()) ) => Op (SetUsericon ()) TreeBase orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> withMaybeRef val $ \valPtr -> setUsericon' treePtr valPtr
{# fun Fl_Tree_openicon as openicon' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref Image))) ) => Op (GetOpenicon ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> openicon' treePtr >>= toMaybeRef
{# fun Fl_Tree_set_openicon as setOpenicon' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a Image , impl ~ (Maybe( Ref a )  ->  IO ()) ) => Op (SetOpenicon ()) TreeBase orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> withMaybeRef val $ \valPtr -> setOpenicon' treePtr valPtr
{# fun Fl_Tree_closeicon as closeicon' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref Image))) ) => Op (GetCloseicon ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> closeicon' treePtr >>= toMaybeRef
{# fun Fl_Tree_set_closeicon as setCloseicon' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a Image, impl ~ (Maybe( Ref a )  ->  IO ()) ) => Op (SetCloseicon ()) TreeBase orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> withMaybeRef val $ \valPtr -> setCloseicon' treePtr valPtr
{# fun Fl_Tree_showcollapse as showcollapse' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ ( IO (Bool)) ) => Op (GetShowcollapse ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> showcollapse' treePtr
{# fun Fl_Tree_set_showcollapse as setShowcollapse' { id `Ptr ()', cFromBool `Bool' } -> `()' #}
instance (impl ~ (Bool ->  IO ()) ) => Op (SetShowcollapse ()) TreeBase orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setShowcollapse' treePtr val
{# fun Fl_Tree_showroot as showroot' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ ( IO (Bool)) ) => Op (GetShowroot ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> showroot' treePtr
{# fun Fl_Tree_set_showroot as setShowroot' { id `Ptr ()', cFromBool `Bool' } -> `()' #}
instance (impl ~ (Bool ->  IO ()) ) => Op (SetShowroot ()) TreeBase orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setShowroot' treePtr val
{# fun Fl_Tree_connectorstyle as connectorstyle' { id `Ptr ()' } -> `TreeConnector' cToEnum #}
instance (impl ~ ( IO (TreeConnector)) ) => Op (GetConnectorstyle ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> connectorstyle' treePtr
{# fun Fl_Tree_set_connectorstyle as setConnectorstyle' { id `Ptr ()', cFromEnum `TreeConnector' } -> `()' #}
instance (impl ~ (TreeConnector ->  IO ()) ) => Op (SetConnectorstyle ()) TreeBase orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setConnectorstyle' treePtr val
{# fun Fl_Tree_sortorder as sortorder' { id `Ptr ()' } -> `TreeSort' cToEnum #}
instance (impl ~ ( IO (TreeSort)) ) => Op (GetSortorder ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> sortorder' treePtr
{# fun Fl_Tree_set_sortorder as setSortorder' { id `Ptr ()', cFromEnum `TreeSort' } -> `()' #}
instance (impl ~ (TreeSort ->  IO ()) ) => Op (SetSortorder ()) TreeBase orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setSortorder' treePtr val
{# fun Fl_Tree_selectbox as selectbox' { id `Ptr ()' } -> `Boxtype' cToEnum #}
instance (impl ~ ( IO (Boxtype)) ) => Op (GetSelectbox ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> selectbox' treePtr
{# fun Fl_Tree_set_selectbox as setSelectbox' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' #}
instance (impl ~ (Boxtype ->  IO ()) ) => Op (SetSelectbox ()) TreeBase orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setSelectbox' treePtr val
{# fun Fl_Tree_selectmode as selectmode' { id `Ptr ()' } -> `TreeSelect' cToEnum #}
instance (impl ~ ( IO (TreeSelect)) ) => Op (Selectmode ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> selectmode' treePtr
{# fun Fl_Tree_set_selectmode as setSelectmode' { id `Ptr ()', cFromEnum `TreeSelect' } -> `()' #}
instance (impl ~ (TreeSelect ->  IO ()) ) => Op (SetSelectmode ()) TreeBase orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setSelectmode' treePtr val
{# fun Fl_Tree_displayed as displayed' { id `Ptr ()',id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (Ref TreeItem  ->  IO (Bool)) ) => Op (Displayed ()) TreeBase orig impl where
  runOp _ _ tree item = withRef tree $ \treePtr -> withRef item $ \itemPtr -> displayed' treePtr itemPtr
{# fun Fl_Tree_show_item_with_yoff as showItemWithYoff' { id `Ptr ()',id `Ptr ()',`Int' } -> `()' #}
{# fun Fl_Tree_show_item as showItem' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (impl ~ (Ref TreeItem  -> Maybe Y ->  IO ()) ) => Op (ShowItemWithYoff ()) TreeBase orig impl where
  runOp _ _ tree item yoff =
    withRef tree $ \treePtr ->
    withRef item $ \itemPtr ->
    case yoff of
      Just (Y y') -> showItemWithYoff' treePtr itemPtr y'
      Nothing -> showItem' treePtr itemPtr
{# fun Fl_Tree_show_item_top as showItemTop' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (impl ~ (Ref TreeItem  ->  IO ()) ) => Op (ShowItemTop ()) TreeBase orig impl where
  runOp _ _ tree item = withRef tree $ \treePtr -> withRef item $ \itemPtr -> showItemTop' treePtr itemPtr
{# fun Fl_Tree_show_item_middle as showItemMiddle' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (impl ~ (Ref TreeItem  ->  IO ()) ) => Op (ShowItemMiddle ()) TreeBase orig impl where
  runOp _ _ tree item = withRef tree $ \treePtr -> withRef item $ \itemPtr -> showItemMiddle' treePtr itemPtr
{# fun Fl_Tree_show_item_bottom as showItemBottom' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (impl ~ (Ref TreeItem  ->  IO ()) ) => Op (ShowItemBottom ()) TreeBase orig impl where
  runOp _ _ tree item = withRef tree $ \treePtr -> withRef item $ \itemPtr -> showItemBottom' treePtr itemPtr
{# fun Fl_Tree_display as display' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (impl ~ (Ref TreeItem  ->  IO ()) ) => Op (Display ()) TreeBase orig impl where
  runOp _ _ tree item = withRef tree $ \treePtr -> withRef item $ \itemPtr -> display' treePtr itemPtr
{# fun Fl_Tree_vposition as vposition' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int)) ) => Op (GetVposition ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> vposition' treePtr
{# fun Fl_Tree_set_vposition as setVposition' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ()) ) => Op (SetVposition ()) TreeBase orig impl where
  runOp _ _ tree pos = withRef tree $ \treePtr -> setVposition' treePtr pos
{# fun Fl_Tree_is_scrollbar as isScrollbar' { id `Ptr ()',id `Ptr ()' } -> `Bool' cToBool #}
instance (Parent a WidgetBase, impl ~ (Ref a  ->  IO (Bool)) ) => Op (IsScrollbar ()) TreeBase orig impl where
  runOp _ _ tree w = withRef tree $ \treePtr -> withRef w $ \wPtr -> isScrollbar' treePtr wPtr
{# fun Fl_Tree_scrollbar_size as scrollbarSize' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Int)) ) => Op (GetScrollbarSize ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> scrollbarSize' treePtr
{# fun Fl_Tree_set_scrollbar_size as setScrollbarSize' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ()) ) => Op (SetScrollbarSize ()) TreeBase orig impl where
  runOp _ _ tree size = withRef tree $ \treePtr -> setScrollbarSize' treePtr size
{# fun Fl_Tree_is_vscroll_visible as isVscrollVisible' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ ( IO (Bool)) ) => Op (IsVscrollVisible ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> isVscrollVisible' treePtr
{# fun Fl_Tree_set_callback_item as setCallbackItem' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a TreeItem, impl ~ (Ref a ->  IO ()) ) => Op (SetCallbackItem ()) TreeBase orig impl where
  runOp _ _ tree item = withRef tree $ \treePtr -> withRef item $ \itemPtr -> setCallbackItem' treePtr itemPtr
{# fun Fl_Tree_callback_item as callbackItem' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref TreeItem))) ) => Op (GetCallbackItem ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> callbackItem' treePtr >>= toMaybeRef
{# fun Fl_Tree_set_callback_reason as setCallbackReason' { id `Ptr ()', cFromEnum `TreeReasonType' } -> `()' #}
instance (impl ~ (TreeReasonType ->  IO ()) ) => Op (SetCallbackReason ()) TreeBase orig impl where
  runOp _ _ tree reason = withRef tree $ \treePtr -> setCallbackReason' treePtr reason
{# fun Fl_Tree_callback_reason as callbackReason' { id `Ptr ()' } -> `TreeReasonType' cToEnum #}
instance (impl ~ ( IO (TreeReasonType)) ) => Op (GetCallbackReason ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> callbackReason' treePtr
{# fun Fl_Tree_recalc_tree as recalcTree' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (RecalcTree ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> recalcTree' treePtr
{# fun Fl_Tree_marginbottom as marginbottom' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int)) ) => Op (GetMarginbottom ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> marginbottom' treePtr
{# fun Fl_Tree_set_marginbottom as setMarginbottom' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ()) ) => Op (SetMarginbottom ()) TreeBase orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setMarginbottom' treePtr val
{# fun Fl_Tree_widgetmarginleft as widgetmarginleft' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int)) ) => Op (GetWidgetmarginleft ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> widgetmarginleft' treePtr
{# fun Fl_Tree_set_widgetmarginleft as setWidgetmarginleft' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ()) ) => Op (SetWidgetmarginleft ()) TreeBase orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setWidgetmarginleft' treePtr val
{# fun Fl_Tree_item_reselect_mode as item_reselect_mode' { id `Ptr ()' } -> `TreeItemReselectMode' cToEnum #}
instance (impl ~ ( IO (TreeItemReselectMode)) ) => Op (GetItemReselectMode ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> item_reselect_mode' treePtr
{# fun Fl_Tree_set_item_reselect_mode as setItem_Reselect_Mode' { id `Ptr ()', cFromEnum `TreeItemReselectMode' } -> `()' #}
instance (impl ~ (TreeItemReselectMode ->  IO ()) ) => Op (SetItemReselectMode ()) TreeBase orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setItem_Reselect_Mode' treePtr val
{# fun Fl_Tree_item_draw_mode as item_draw_mode' { id `Ptr ()' } -> `CInt'#}
instance (impl ~ ( IO ([TreeItemDrawMode])) ) => Op (GetItemDrawMode ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> item_draw_mode' treePtr >>= return . extract allTreeItemDrawModes
{# fun Fl_Tree_set_item_draw_mode as setItem_Draw_Mode' { id `Ptr ()', `CInt' } -> `()' #}
instance (impl ~ ([TreeItemDrawMode] ->  IO ()) ) => Op (SetItemDrawMode ()) TreeBase orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setItem_Draw_Mode' treePtr (fromIntegral (combine val))


{# fun Fl_Tree_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawTreeBase ::  Ref TreeBase -> IO ()
drawTreeBase tree = withRef tree $ \treePtr -> drawSuper' treePtr
{# fun Fl_Tree_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleTreeBase :: Ref TreeBase -> Event ->  IO (Either UnknownEvent ())
handleTreeBase tree event = withRef tree $ \treePtr -> handleSuper' treePtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Tree_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeTreeBase :: Ref TreeBase -> Rectangle -> IO ()
resizeTreeBase tree rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef tree $ \treePtr -> resizeSuper' treePtr x_pos y_pos width height
{# fun Fl_Tree_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideTreeBase ::  Ref TreeBase -> IO ()
hideTreeBase tree = withRef tree $ \treePtr -> hideSuper' treePtr
{# fun Fl_Tree_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetTreeBase ::  Ref TreeBase -> IO ()
showWidgetTreeBase tree = withRef tree $ \treePtr -> showSuper' treePtr

{# fun Fl_Tree_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> draw'' treePtr
{#fun Fl_Tree_handle as treeHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) TreeBase orig impl where
  runOp _ _ tree event = withRef tree (\p -> treeHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Tree_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> show' treePtr
{# fun Fl_Tree_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) TreeBase orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> hide' treePtr
{# fun Fl_Tree_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) TreeBase orig impl where
  runOp _ _ tree rectangle = withRef tree $ \treePtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' treePtr x_pos y_pos w_pos h_pos


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Tree"
-- @

-- $functions
-- @
-- add :: 'Ref' 'TreeBase' -> 'T.Text' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- addAt:: ('Parent' a 'TreeItem') => 'Ref' 'TreeBase' -> 'T.Text' -> 'Ref' a -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- clear :: 'Ref' 'TreeBase' -> 'IO' ()
--
-- clearChildren:: ('Parent' a 'TreeItem') => 'Ref' 'TreeBase' -> 'Ref' a -> 'IO' ()
--
-- close :: 'Ref' 'TreeBase' -> 'TreeItemLocator' -> 'IO' ()
--
-- closeAndCallback :: 'Ref' 'TreeBase' -> 'TreeItemLocator' -> 'Bool' -> 'IO' ()
--
-- deselect :: 'Ref' 'TreeBase' -> 'TreeItemLocator' -> 'IO' ('Either' 'NoChange' ())
--
-- deselectAll :: 'Ref' 'TreeBase' -> 'IO' ()
--
-- deselectAllAndCallback :: 'Ref' 'TreeBase' -> 'Maybe' ('Ref' 'TreeItem') -> 'Bool' -> 'IO' ()
--
-- deselectAndCallback :: 'Ref' 'TreeBase' -> 'TreeItemLocator' -> 'Bool' -> 'IO' ()
--
-- destroy :: 'Ref' 'TreeBase' -> 'IO' ()
--
-- display :: 'Ref' 'TreeBase' -> 'Ref' 'TreeItem' -> 'IO' ()
--
-- displayed :: 'Ref' 'TreeBase' -> 'Ref' 'TreeItem' -> 'IO' ('Bool')
--
-- draw :: 'Ref' 'TreeBase' -> 'IO' ()
--
-- findItem :: 'Ref' 'TreeBase' -> 'T.Text' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- firstSelectedItem :: 'Ref' 'TreeBase' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- firstVisible :: 'Ref' 'TreeBase' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- getCallbackItem :: 'Ref' 'TreeBase' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- getCallbackReason :: 'Ref' 'TreeBase' -> 'IO' ('TreeReasonType')
--
-- getCloseicon :: 'Ref' 'TreeBase' -> 'IO' ('Maybe' ('Ref' 'Image'))
--
-- getConnectorcolor :: 'Ref' 'TreeBase' -> 'IO' ('Color')
--
-- getConnectorstyle :: 'Ref' 'TreeBase' -> 'IO' ('TreeConnector')
--
-- getConnectorwidth :: 'Ref' 'TreeBase' -> 'IO' ('Int')
--
-- getFirst :: 'Ref' 'TreeBase' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- getItemDrawMode :: 'Ref' 'TreeBase' -> 'IO' (['TreeItemDrawMode')]
--
-- getItemFocus :: 'Ref' 'TreeBase' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- getItemLabelbgcolor :: 'Ref' 'TreeBase' -> 'IO' ('Color')
--
-- getItemLabelfgcolor :: 'Ref' 'TreeBase' -> 'IO' ('Color')
--
-- getItemLabelfont :: 'Ref' 'TreeBase' -> 'IO' ('Font')
--
-- getItemLabelsize :: 'Ref' 'TreeBase' -> 'IO' ('FontSize')
--
-- getItemReselectMode :: 'Ref' 'TreeBase' -> 'IO' ('TreeItemReselectMode')
--
-- getLabelmarginleft :: 'Ref' 'TreeBase' -> 'IO' ('Int')
--
-- getLast :: 'Ref' 'TreeBase' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- getLinespacing :: 'Ref' 'TreeBase' -> 'IO' ('Int')
--
-- getMarginbottom :: 'Ref' 'TreeBase' -> 'IO' ('Int')
--
-- getMarginleft :: 'Ref' 'TreeBase' -> 'IO' ('Int')
--
-- getMargintop :: 'Ref' 'TreeBase' -> 'IO' ('Int')
--
-- getOpenchildMarginbottom :: 'Ref' 'TreeBase' -> 'IO' ('Int')
--
-- getOpenicon :: 'Ref' 'TreeBase' -> 'IO' ('Maybe' ('Ref' 'Image'))
--
-- getScrollbarSize :: 'Ref' 'TreeBase' -> 'IO' ('Int')
--
-- getSelectbox :: 'Ref' 'TreeBase' -> 'IO' ('Boxtype')
--
-- getShowcollapse :: 'Ref' 'TreeBase' -> 'IO' ('Bool')
--
-- getShowroot :: 'Ref' 'TreeBase' -> 'IO' ('Bool')
--
-- getSortorder :: 'Ref' 'TreeBase' -> 'IO' ('TreeSort')
--
-- getUsericon :: 'Ref' 'TreeBase' -> 'IO' ('Maybe' ('Ref' 'Image'))
--
-- getUsericonmarginleft :: 'Ref' 'TreeBase' -> 'IO' ('Int')
--
-- getVposition :: 'Ref' 'TreeBase' -> 'IO' ('Int')
--
-- getWidgetmarginleft :: 'Ref' 'TreeBase' -> 'IO' ('Int')
--
-- handle :: 'Ref' 'TreeBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'TreeBase' -> 'IO' ()
--
-- insert:: ('Parent' a 'TreeItem') => 'Ref' 'TreeBase' -> 'Ref' a -> 'T.Text' -> 'AtIndex' -> 'IO' ('Maybe' ('Ref' a))
--
-- insertAbove:: ('Parent' a 'TreeItem') => 'Ref' 'TreeBase' -> 'Ref' a -> 'T.Text' -> 'IO' ('Maybe' ('Ref' a))
--
-- isClose :: 'Ref' 'TreeBase' -> 'TreeItemLocator' -> 'IO' ('Bool')
--
-- isOpen :: 'Ref' 'TreeBase' -> 'TreeItemLocator' -> 'IO' ('Bool')
--
-- isScrollbar:: ('Parent' a 'WidgetBase') => 'Ref' 'TreeBase' -> 'Ref' a -> 'IO' ('Bool')
--
-- isSelected :: 'Ref' 'TreeBase' -> 'TreeItemLocator' -> 'IO' ('Bool')
--
-- isVscrollVisible :: 'Ref' 'TreeBase' -> 'IO' ('Bool')
--
-- itemClicked :: 'Ref' 'TreeBase' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- itemPathname:: ('Parent' a 'TreeItem') => 'Ref' 'TreeBase' -> 'Ref' a -> 'IO' ('Maybe' 'T.Text')
--
-- lastSelectedItem :: 'Ref' 'TreeBase' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- lastVisible :: 'Ref' 'TreeBase' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- next :: 'Ref' 'TreeBase' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- nextAfterItem :: 'Ref' 'TreeBase' -> 'Ref' 'TreeItem' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- nextItem :: 'Ref' 'TreeBase' -> 'Ref' 'TreeItem' -> 'Maybe' 'SearchDirection' -> 'Bool' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- nextSelectedItem :: 'Ref' 'TreeBase' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- nextSelectedItemAfterItem :: 'Ref' 'TreeBase' -> 'Ref' 'TreeItem' -> 'Maybe' 'SearchDirection' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- open :: 'Ref' 'TreeBase' -> 'TreeItemLocator' -> 'IO' ()
--
-- openAndCallback :: 'Ref' 'TreeBase' -> 'TreeItemLocator' -> 'Bool' -> 'IO' ()
--
-- openToggle :: 'Ref' 'TreeBase' -> 'Ref' 'TreeItem' -> 'IO' ()
--
-- openToggleAndCallback :: 'Ref' 'TreeBase' -> 'Ref' 'TreeItem' -> 'Bool' -> 'IO' ()
--
-- prev :: 'Ref' 'TreeBase' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- prevBeforeItem :: 'Ref' 'TreeBase' -> 'Ref' 'TreeItem' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- recalcTree :: 'Ref' 'TreeBase' -> 'IO' ()
--
-- remove :: 'Ref' 'TreeBase' -> 'Ref' 'TreeItem' -> 'IO' ('Either' 'TreeItemNotFound' ())
--
-- resize :: 'Ref' 'TreeBase' -> 'Rectangle' -> 'IO' ()
--
-- root :: 'Ref' 'TreeBase' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- rootLabel :: 'Ref' 'TreeBase' -> 'T.Text' -> 'IO' ()
--
-- select :: 'Ref' 'TreeBase' -> 'TreeItemLocator' -> 'IO' ('Either' 'NoChange' ())
--
-- selectAll :: 'Ref' 'TreeBase' -> 'IO' ()
--
-- selectAllAndCallback :: 'Ref' 'TreeBase' -> 'Maybe' ('Ref' 'TreeItem') -> 'Bool' -> 'IO' ()
--
-- selectAndCallback :: 'Ref' 'TreeBase' -> 'TreeItemLocator' -> 'Bool' -> 'IO' ()
--
-- selectOnly :: 'Ref' 'TreeBase' -> 'Ref' 'TreeItem' -> 'IO' ()
--
-- selectOnlyAndCallback :: 'Ref' 'TreeBase' -> 'Ref' 'TreeItem' -> 'Bool' -> 'IO' ()
--
-- selectToggle :: 'Ref' 'TreeBase' -> 'Ref' 'TreeItem' -> 'IO' ()
--
-- selectToggleAndCallback :: 'Ref' 'TreeBase' -> 'Ref' 'TreeItem' -> 'Bool' -> 'IO' ()
--
-- selectmode :: 'Ref' 'TreeBase' -> 'IO' ('TreeSelect')
--
-- setCallbackItem:: ('Parent' a 'TreeItem') => 'Ref' 'TreeBase' -> 'Ref' a -> 'IO' ()
--
-- setCallbackReason :: 'Ref' 'TreeBase' -> 'TreeReasonType' -> 'IO' ()
--
-- setCloseicon:: ('Parent' a 'Image') => 'Ref' 'TreeBase' -> 'Maybe'( 'Ref' a ) -> 'IO' ()
--
-- setConnectorcolor :: 'Ref' 'TreeBase' -> 'Color' -> 'IO' ()
--
-- setConnectorstyle :: 'Ref' 'TreeBase' -> 'TreeConnector' -> 'IO' ()
--
-- setConnectorwidth :: 'Ref' 'TreeBase' -> 'Int' -> 'IO' ()
--
-- setItemDrawMode :: 'Ref' 'TreeBase' -> ['TreeItemDrawMode'] -> 'IO' ()
--
-- setItemFocus :: 'Ref' 'TreeBase' -> 'Ref' 'TreeItem' -> 'IO' ()
--
-- setItemLabelbgcolor :: 'Ref' 'TreeBase' -> 'Color' -> 'IO' ()
--
-- setItemLabelfgcolor :: 'Ref' 'TreeBase' -> 'Color' -> 'IO' ()
--
-- setItemLabelfont :: 'Ref' 'TreeBase' -> 'Font' -> 'IO' ()
--
-- setItemLabelsize :: 'Ref' 'TreeBase' -> 'FontSize' -> 'IO' ()
--
-- setItemReselectMode :: 'Ref' 'TreeBase' -> 'TreeItemReselectMode' -> 'IO' ()
--
-- setLabelmarginleft :: 'Ref' 'TreeBase' -> 'Int' -> 'IO' ()
--
-- setLinespacing :: 'Ref' 'TreeBase' -> 'Int' -> 'IO' ()
--
-- setMarginbottom :: 'Ref' 'TreeBase' -> 'Int' -> 'IO' ()
--
-- setMarginleft :: 'Ref' 'TreeBase' -> 'Int' -> 'IO' ()
--
-- setMargintop :: 'Ref' 'TreeBase' -> 'Int' -> 'IO' ()
--
-- setOpenchildMarginbottom :: 'Ref' 'TreeBase' -> 'Int' -> 'IO' ()
--
-- setOpenicon:: ('Parent' a 'Image') => 'Ref' 'TreeBase' -> 'Maybe'( 'Ref' a ) -> 'IO' ()
--
-- setScrollbarSize :: 'Ref' 'TreeBase' -> 'Int' -> 'IO' ()
--
-- setSelectbox :: 'Ref' 'TreeBase' -> 'Boxtype' -> 'IO' ()
--
-- setSelectmode :: 'Ref' 'TreeBase' -> 'TreeSelect' -> 'IO' ()
--
-- setShowcollapse :: 'Ref' 'TreeBase' -> 'Bool' -> 'IO' ()
--
-- setShowroot :: 'Ref' 'TreeBase' -> 'Bool' -> 'IO' ()
--
-- setSortorder :: 'Ref' 'TreeBase' -> 'TreeSort' -> 'IO' ()
--
-- setUsericon:: ('Parent' a 'Image') => 'Ref' 'TreeBase' -> 'Maybe'( 'Ref' a ) -> 'IO' ()
--
-- setUsericonmarginleft :: 'Ref' 'TreeBase' -> 'Int' -> 'IO' ()
--
-- setVposition :: 'Ref' 'TreeBase' -> 'Int' -> 'IO' ()
--
-- setWidgetmarginleft :: 'Ref' 'TreeBase' -> 'Int' -> 'IO' ()
--
-- showItemBottom :: 'Ref' 'TreeBase' -> 'Ref' 'TreeItem' -> 'IO' ()
--
-- showItemMiddle :: 'Ref' 'TreeBase' -> 'Ref' 'TreeItem' -> 'IO' ()
--
-- showItemTop :: 'Ref' 'TreeBase' -> 'Ref' 'TreeItem' -> 'IO' ()
--
-- showItemWithYoff :: 'Ref' 'TreeBase' -> 'Ref' 'TreeItem' -> 'Maybe' 'Y' -> 'IO' ()
--
-- showSelf :: 'Ref' 'TreeBase' -> 'IO' ()
--
-- showWidget :: 'Ref' 'TreeBase' -> 'IO' ()
-- @
