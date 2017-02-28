{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Tree
  (
    treeNew,
    treeCustom
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
import Graphics.UI.FLTK.LowLevel.Widget

{# fun Fl_OverriddenTree_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
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
{# fun Fl_Tree_New_WithLabel as treeNewWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `T.Text'} -> `Ptr ()' id #}
treeNew :: Rectangle -> Maybe T.Text -> IO (Ref Tree)
treeNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> treeNew' x_pos y_pos width height >>=
                             toRef
        Just l -> treeNewWithLabel' x_pos y_pos width height l >>=
                             toRef
{# fun Fl_Tree_Destroy as treeDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) Tree orig impl where
  runOp _ _ tree = swapRef tree $ \treePtr -> do
    treeDestroy' treePtr
    return nullPtr

{# fun Fl_Tree_show_self as showSelf' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ()) ) => Op (ShowSelf ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> showSelf' treePtr
{# fun Fl_Tree_root_label as rootLabel' { id `Ptr ()',unsafeToCString `T.Text' } -> `()' #}
instance (impl ~ (T.Text ->  IO ()) ) => Op (RootLabel ()) Tree orig impl where
  runOp _ _ tree new_label = withRef tree $ \treePtr -> rootLabel' treePtr new_label
{# fun Fl_Tree_root as root' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref TreeItem))) ) => Op (Root ()) Tree orig impl where
  runOp _ _  tree = withRef tree $ \treePtr -> root' treePtr >>= toMaybeRef
{# fun Fl_Tree_add as add' { id `Ptr ()',unsafeToCString `T.Text' } -> `Ptr ()' id #}
{# fun Fl_Tree_add_with_item_name as addWithItemName' { id `Ptr ()',id `Ptr ()',unsafeToCString `T.Text' } -> `Ptr ()' id #}
instance (impl ~ (T.Text ->  IO (Maybe (Ref TreeItem)))) => Op (Add ()) Tree orig impl where
  runOp _ _  tree path' = withRef tree $ \treePtr -> add' treePtr path' >>= toMaybeRef
instance (Parent a TreeItem, impl ~ (T.Text -> Ref a -> IO (Maybe (Ref TreeItem)))) => Op (AddAt ()) Tree orig impl where
  runOp _ _ tree path' item' =
    withRef tree  $ \treePtr ->
    withRef item' $ \itemPtr ->
    addWithItemName' treePtr itemPtr path' >>= toMaybeRef
{# fun Fl_Tree_insert_above as insertAbove' { id `Ptr ()',id `Ptr ()',unsafeToCString `T.Text' } -> `Ptr ()' id #}
instance (Parent a TreeItem, impl ~ (Ref a -> T.Text ->  IO (Maybe (Ref a)))) => Op (InsertAbove ()) Tree orig impl where
  runOp _ _  tree above name = withRef tree $ \treePtr -> withRef above $ \abovePtr -> insertAbove' treePtr abovePtr name >>= toMaybeRef
{# fun Fl_Tree_insert as insert' { id `Ptr ()',id `Ptr ()',unsafeToCString `T.Text',`Int' } -> `Ptr ()' id #}
instance (Parent a TreeItem, impl ~ (Ref a -> T.Text -> Int ->  IO (Maybe (Ref a)))) => Op (Insert ()) Tree orig impl where
  runOp _ _ tree item name pos = withRef tree $ \treePtr -> withRef item $ \itemPtr -> insert' treePtr itemPtr name pos >>= toMaybeRef
{# fun Fl_Tree_remove as remove' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
instance (impl ~ (Ref TreeItem  ->  IO (Either TreeItemNotFound ())) ) => Op (Remove ()) Tree orig impl where
  runOp _ _ tree item = withRef tree $ \treePtr -> withRef item $ \itemPtr -> do
    status' <- remove' treePtr itemPtr
    if (status' == (-1)) then (return $ Left TreeItemNotFound) else (return $ Right ())
{# fun Fl_Tree_clear as clear' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ()) ) => Op (Clear ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> clear' treePtr
{# fun Fl_Tree_clear_children as clearChildren' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a TreeItem, impl ~ (Ref a ->  IO ()) ) => Op (ClearChildren ()) Tree orig impl where
  runOp _ _ tree item = withRef tree $ \treePtr -> withRef item $ \itemPtr -> clearChildren' treePtr itemPtr
{# fun Fl_Tree_find_item as findItem' { id `Ptr ()',unsafeToCString `T.Text' } -> `Ptr ()' id #}
instance (impl ~ (T.Text ->  IO (Maybe (Ref TreeItem))) ) => Op (FindItem ()) Tree orig impl where
  runOp _ _ tree path = withRef tree $ \treePtr -> findItem' treePtr path >>= toMaybeRef
{# fun Fl_Tree_item_pathname as itemPathname' { id `Ptr ()', id `Ptr CChar', `Int', id `Ptr ()'} -> `Int' #}
instance (Parent a TreeItem, impl ~ (Ref a ->  IO (Maybe T.Text)) ) => Op (ItemPathname ()) Tree orig impl where
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
instance (impl ~ ( IO (Maybe (Ref TreeItem))) ) => Op (ItemClicked ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> itemClicked' treePtr >>= toMaybeRef
{# fun Fl_Tree_first as first' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref TreeItem))) ) => Op (GetFirst ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> first' treePtr >>= toMaybeRef
{# fun Fl_Tree_first_visible as firstVisible' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref TreeItem))) ) => Op (FirstVisible ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> firstVisible' treePtr >>= toMaybeRef
{# fun Fl_Tree_next as next' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref TreeItem))) ) => Op (Next ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> next' treePtr >>= toMaybeRef
{# fun Fl_Tree_next_with_item as nextWithItem' { id `Ptr ()',id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ (Ref TreeItem  ->  IO (Maybe (Ref TreeItem))) ) => Op (NextAfterItem ()) Tree orig impl where
  runOp _ _ tree item = withRef tree $ \treePtr -> withRef item $ \itemPtr -> nextWithItem' treePtr itemPtr >>= toMaybeRef
{# fun Fl_Tree_next_item as nextItem' { id `Ptr ()',id `Ptr ()', id `CInt', cFromBool `Bool'} -> `Ptr ()' id #}
instance (impl ~ (Ref TreeItem  ->  Maybe SearchDirection -> Bool -> IO (Maybe (Ref TreeItem))) ) => Op (NextItem ()) Tree orig impl where
  runOp _ _ tree item dir visible' =
    withRef tree $ \treePtr -> withRef item $ \itemPtr -> nextItem' treePtr itemPtr (maybe 0 (fromIntegral . fromEnum) dir) visible'
       >>= toMaybeRef
{# fun Fl_Tree_prev as prev' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref TreeItem))) ) => Op (Prev ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> prev' treePtr >>= toMaybeRef
{# fun Fl_Tree_prev_with_item as prevWithItem' { id `Ptr ()',id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ (Ref TreeItem  ->  IO (Maybe (Ref TreeItem))) ) => Op (PrevBeforeItem ()) Tree orig impl where
  runOp _ _ tree item = withRef tree $ \treePtr -> withRef item $ \itemPtr -> prevWithItem' treePtr itemPtr >>= toMaybeRef
{# fun Fl_Tree_last as last' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref TreeItem))) ) => Op (GetLast ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> last' treePtr >>= toMaybeRef
{# fun Fl_Tree_last_visible as lastVisible' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref TreeItem))) ) => Op (LastVisible ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> lastVisible' treePtr >>= toMaybeRef
{# fun Fl_Tree_first_selected_item as firstSelectedItem' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref TreeItem))) ) => Op (FirstSelectedItem ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> firstSelectedItem' treePtr >>= toMaybeRef
{# fun Fl_Tree_last_selected_item as lastSelectedItem' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref TreeItem))) ) => Op (LastSelectedItem ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> lastSelectedItem' treePtr >>= toMaybeRef
{# fun Fl_Tree_next_selected_item as nextSelectedItem' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref TreeItem))) ) => Op (NextSelectedItem ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> nextSelectedItem' treePtr >>= toMaybeRef
{# fun Fl_Tree_next_selected_item_with_item_direction as nextSelectedItemWithItemDirection' { id `Ptr ()',id `Ptr ()', id `CInt' } -> `Ptr ()' id #}
instance (impl ~ (Ref TreeItem  ->  Maybe SearchDirection -> IO (Maybe (Ref TreeItem))) ) => Op (NextSelectedItemAfterItem ()) Tree orig impl where
  runOp _ _ tree item dir = withRef tree $ \treePtr -> withRef item $ \itemPtr -> nextSelectedItemWithItemDirection' treePtr itemPtr (maybe 0 (fromIntegral . fromEnum) dir) >>= toMaybeRef
{# fun Fl_Tree_open_with_item as openWithItem' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
{# fun Fl_Tree_open_with_item_docallback as openWithItemDocallback' { id `Ptr ()',id `Ptr ()', cFromBool `Bool' } -> `Int' #}
{# fun Fl_Tree_open_with_path as openWithPath' { id `Ptr ()',unsafeToCString `T.Text' } -> `Int' #}
{# fun Fl_Tree_open_with_path_docallback as openWithPathDocallback' { id `Ptr ()', unsafeToCString `T.Text', cFromBool `Bool' } -> `Int' #}
instance (impl ~ (TreeItemLocator -> IO ()) ) => Op (Open ()) Tree orig impl where
  runOp _ _ tree_item locator' =
    withRef tree_item $ \tree_itemPtr ->
    case locator' of
      TreeItemPointerLocator (TreeItemPointer itemRef) -> withRef itemRef $ \itemRefPtr -> openWithItem' tree_itemPtr itemRefPtr >> return ()
      TreeItemNameLocator (TreeItemName n') -> openWithPath' tree_itemPtr n' >> return ()
instance  (impl ~ (TreeItemLocator -> Bool -> IO ())) => Op (OpenAndCallback ()) Tree orig impl where
  runOp _ _ tree_item locator' docallback' =
    withRef tree_item $ \tree_itemPtr ->
    case locator' of
      TreeItemPointerLocator (TreeItemPointer itemRef) -> withRef itemRef $ \itemRefPtr -> openWithItemDocallback' tree_itemPtr itemRefPtr docallback' >> return ()
      TreeItemNameLocator (TreeItemName n') -> openWithPathDocallback' tree_itemPtr n' docallback' >> return ()
{# fun Fl_Tree_open_toggle as openToggle' { id `Ptr ()',id `Ptr ()' } -> `()' #}
{# fun Fl_Tree_open_toggle_with_docallback as openToggleWithDocallback' { id `Ptr ()',id `Ptr ()', cFromBool `Bool' } -> `()' #}
instance (impl ~ (Ref TreeItem  ->  IO ()) ) => Op (OpenToggle ()) Tree orig impl where
  runOp _ _ tree item = withRef tree $ \treePtr -> withRef item $ \itemPtr -> openToggle' treePtr itemPtr
instance (impl ~ (Ref TreeItem  -> Bool ->  IO ()) ) => Op (OpenToggleAndCallback ()) Tree orig impl where
  runOp _ _ tree item docallback = withRef tree $ \treePtr -> withRef item $ \itemPtr -> openToggleWithDocallback' treePtr itemPtr docallback
{# fun Fl_Tree_close_with_item as closeWithItem' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
{# fun Fl_Tree_close_with_item_docallback as closeWithItemDocallback' { id `Ptr ()',id `Ptr ()', cFromBool `Bool' } -> `Int' #}
{# fun Fl_Tree_close_with_path as closeWithPath' { id `Ptr ()',unsafeToCString `T.Text' } -> `Int' #}
{# fun Fl_Tree_close_with_path_docallback as closeWithPathDocallback' { id `Ptr ()',unsafeToCString `T.Text', cFromBool `Bool' } -> `Int' #}
instance (impl ~ (TreeItemLocator -> IO ()) ) => Op (Close ()) Tree orig impl where
  runOp _ _ tree_item locator' =
    withRef tree_item $ \tree_itemPtr ->
    case locator' of
      TreeItemPointerLocator (TreeItemPointer itemRef) -> withRef itemRef $ \itemRefPtr -> closeWithItem' tree_itemPtr itemRefPtr >> return ()
      TreeItemNameLocator (TreeItemName n') -> closeWithPath' tree_itemPtr n' >> return ()
instance  (impl ~ (TreeItemLocator -> Bool -> IO ())) => Op (CloseAndCallback ()) Tree orig impl where
  runOp _ _ tree_item locator' docallback' =
    withRef tree_item $ \tree_itemPtr ->
    case locator' of
      TreeItemPointerLocator (TreeItemPointer itemRef) -> withRef itemRef $ \itemRefPtr -> closeWithItemDocallback' tree_itemPtr itemRefPtr docallback' >> return ()
      TreeItemNameLocator (TreeItemName n') -> closeWithPathDocallback' tree_itemPtr n' docallback' >> return ()
{# fun Fl_Tree_is_open_with_item as isOpenWithItem' { id `Ptr ()',id `Ptr ()' } -> `Bool' cToBool #}
{# fun Fl_Tree_is_open_with_path as isOpenWithPath' { id `Ptr ()',unsafeToCString `T.Text' } -> `Bool' cToBool  #}
instance (impl ~ (TreeItemLocator ->  IO (Bool)) ) => Op (IsOpen ()) Tree orig impl where
  runOp _ _ tree locator' = withRef tree $ \treePtr ->
    case locator' of
      TreeItemPointerLocator (TreeItemPointer r') -> withRef r' $ \r'Ptr -> isOpenWithItem' treePtr r'Ptr
      TreeItemNameLocator (TreeItemName n') ->
        isOpenWithPath' treePtr n'
{# fun Fl_Tree_is_close_with_item as isCloseWithItem' { id `Ptr ()',id `Ptr ()' } -> `Bool' cToBool #}
{# fun Fl_Tree_is_close_with_path as isCloseWithPath' { id `Ptr ()',unsafeToCString `T.Text' } -> `Bool' cToBool  #}
instance (impl ~ (TreeItemLocator ->  IO (Bool)) ) => Op (IsClose ()) Tree orig impl where
  runOp _ _ tree locator' = withRef tree $ \treePtr ->
    case locator' of
      TreeItemPointerLocator (TreeItemPointer r') -> withRef r' $ \r'Ptr -> isCloseWithItem' treePtr r'Ptr
      TreeItemNameLocator (TreeItemName n') -> isCloseWithPath' treePtr n'
{# fun Fl_Tree_select_with_item as selectWithItem' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
{# fun Fl_Tree_select_with_item_docallback as selectWithItemDocallback' { id `Ptr ()',id `Ptr ()',cFromBool `Bool' } -> `Int' #}
{# fun Fl_Tree_select_with_path as selectWithPath' { id `Ptr ()',unsafeToCString `T.Text' } -> `Int' #}
{# fun Fl_Tree_select_with_path_docallback as selectWithPathDocallback' { id `Ptr ()',unsafeToCString `T.Text',cFromBool `Bool' } -> `Int' #}
instance (impl ~ (TreeItemLocator  ->  IO (Int)) ) => Op (Select ()) Tree orig impl where
  runOp _ _ tree locator' =
    withRef tree $ \treePtr ->
    case locator' of
      TreeItemPointerLocator (TreeItemPointer r') -> withRef r' $ \r'Ptr -> selectWithItem' treePtr r'Ptr
      TreeItemNameLocator (TreeItemName n') -> selectWithPath' treePtr n'
instance  (impl ~ (TreeItemLocator -> Bool -> IO ())) => Op (SelectAndCallback ()) Tree orig impl where
  runOp _ _ tree_item locator' docallback' =
    withRef tree_item $ \tree_itemPtr ->
    case locator' of
      TreeItemPointerLocator (TreeItemPointer itemRef) -> withRef itemRef $ \itemRefPtr -> selectWithItemDocallback' tree_itemPtr itemRefPtr docallback' >> return ()
      TreeItemNameLocator (TreeItemName n') -> selectWithPathDocallback' tree_itemPtr n' docallback' >> return ()
{# fun Fl_Tree_select_toggle as selectToggle' { id `Ptr ()',id `Ptr ()' } -> `()' #}
{# fun Fl_Tree_select_toggle_with_docallback as selectToggleWithDocallback' { id `Ptr ()',id `Ptr ()',cFromBool `Bool' } -> `()' #}
instance (impl ~ (Ref TreeItem  ->  IO ()) ) => Op (SelectToggle ()) Tree orig impl where
  runOp _ _ tree item = withRef tree $ \treePtr -> withRef item $ \itemPtr -> selectToggle' treePtr itemPtr
instance (impl ~ (Ref TreeItem  -> Bool ->  IO ()) ) => Op (SelectToggleAndCallback ()) Tree orig impl where
  runOp _ _ tree item docallback = withRef tree $ \treePtr -> withRef item $ \itemPtr -> selectToggleWithDocallback' treePtr itemPtr docallback
{# fun Fl_Tree_deselect_with_item as deselectWithItem' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
{# fun Fl_Tree_deselect_with_item_docallback as deselectWithItemDocallback' { id `Ptr ()',id `Ptr ()',cFromBool `Bool' } -> `Int' #}
{# fun Fl_Tree_deselect_with_path as deselectWithPath' { id `Ptr ()', unsafeToCString `T.Text'} -> `Int' #}
{# fun Fl_Tree_deselect_with_path_docallback as deselectWithPathDocallback' { id `Ptr ()',unsafeToCString `T.Text',cFromBool `Bool' } -> `Int' #}
instance (impl ~ (TreeItemLocator  ->  IO (Int)) ) => Op (Deselect ()) Tree orig impl where
  runOp _ _ tree locator' =
    withRef tree $ \treePtr ->
    case locator' of
      TreeItemPointerLocator (TreeItemPointer r') -> withRef r' $ \r'Ptr -> deselectWithItem' treePtr r'Ptr
      TreeItemNameLocator (TreeItemName n') -> deselectWithPath' treePtr n'
instance  (impl ~ (TreeItemLocator -> Bool -> IO ())) => Op (DeselectAndCallback ()) Tree orig impl where
  runOp _ _ tree_item locator' docallback' =
    withRef tree_item $ \tree_itemPtr ->
    case locator' of
      TreeItemPointerLocator (TreeItemPointer itemRef) -> withRef itemRef $ \itemRefPtr -> deselectWithItemDocallback' tree_itemPtr itemRefPtr docallback' >> return ()
      TreeItemNameLocator (TreeItemName n') -> deselectWithPathDocallback' tree_itemPtr n' docallback' >> return ()
{# fun Fl_Tree_select_only as selectOnly' { id `Ptr ()',id `Ptr ()' } -> `()' #}
{# fun Fl_Tree_select_only_with_docallback as selectOnlyWithDocallback' { id `Ptr ()',id `Ptr ()', cFromBool `Bool' } -> `()' #}
instance (impl ~ (Ref TreeItem  ->  IO ()) ) => Op (SelectOnly ()) Tree orig impl where
  runOp _ _ tree item = withRef tree $ \treePtr -> withRef item $ \itemPtr -> selectOnly' treePtr itemPtr
instance (impl ~ (Ref TreeItem  -> Bool ->  IO ()) ) => Op (SelectOnlyAndCallback ()) Tree orig impl where
  runOp _ _ tree item docallback = withRef tree $ \treePtr -> withRef item $ \itemPtr -> selectOnlyWithDocallback' treePtr itemPtr docallback
{# fun Fl_Tree_select_all as selectAll' { id `Ptr ()',id `Ptr ()' } -> `()' #}
{# fun Fl_Tree_select_all_with_docallback as selectAllWithDocallback' { id `Ptr ()',id `Ptr ()',cFromBool `Bool' } -> `()' #}
instance (impl ~ (IO ()) ) => Op (SelectAll ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr ->  selectAll' treePtr nullPtr
instance (impl ~ (Maybe (Ref TreeItem)  -> Bool ->  IO ()) ) => Op (SelectAllAndCallback ()) Tree orig impl where
  runOp _ _ tree item docallback = withRef tree $ \treePtr -> withMaybeRef item $ \itemPtr -> selectAllWithDocallback' treePtr itemPtr docallback
{# fun Fl_Tree_deselect_all_with_item as deselectAll' { id `Ptr ()',id `Ptr ()' } -> `()' #}
{# fun Fl_Tree_deselect_all_with_item_docallback as deselectAllWithDocallback' { id `Ptr ()',id `Ptr ()',cFromBool `Bool' } -> `()' #}
instance (impl ~ (IO ()) ) => Op (DeselectAll ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr ->  deselectAll' treePtr nullPtr
instance (impl ~ (Maybe (Ref TreeItem)  -> Bool ->  IO ()) ) => Op (DeselectAllAndCallback ()) Tree orig impl where
  runOp _ _ tree item docallback = withRef tree $ \treePtr -> withMaybeRef item $ \itemPtr -> deselectAllWithDocallback' treePtr itemPtr docallback
{# fun Fl_Tree_set_item_focus as setItemFocus' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (impl ~ (Ref TreeItem  ->  IO ()) ) => Op (SetItemFocus ()) Tree orig impl where
  runOp _ _ tree item = withRef tree $ \treePtr -> withRef item $ \itemPtr -> setItemFocus' treePtr itemPtr
{# fun Fl_Tree_get_item_focus as getItemFocus' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref TreeItem))) ) => Op (GetItemFocus ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> getItemFocus' treePtr >>= toMaybeRef
{# fun Fl_Tree_is_selected_with_item as isSelectedWithItem' { id `Ptr ()',id `Ptr ()' } -> `Bool' cToBool #}
{# fun Fl_Tree_is_selected_with_path as isSelectedWithPath' { id `Ptr ()',unsafeToCString `T.Text' } -> `Bool' cToBool #}
instance (impl ~ (TreeItemLocator ->  IO (Bool)) ) => Op (IsSelected ()) Tree orig impl where
  runOp _ _ tree locator' = withRef tree $ \treePtr ->
    case locator' of
      TreeItemPointerLocator (TreeItemPointer item) -> withRef item $ \itemPtr -> isSelectedWithItem' treePtr itemPtr
      TreeItemNameLocator (TreeItemName path) -> isSelectedWithPath' treePtr path
{# fun Fl_Tree_item_labelfont as itemLabelfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ ( IO (Font)) ) => Op (GetItemLabelfont ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> itemLabelfont' treePtr
{# fun Fl_Tree_set_item_labelfont as itemSetLabelfont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
instance (impl ~ (Font ->  IO ()) ) => Op (SetItemLabelfont ()) Tree orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> itemSetLabelfont' treePtr val
{# fun Fl_Tree_item_labelsize as itemLabelsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ ( IO (FontSize)) ) => Op (GetItemLabelsize ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> itemLabelsize' treePtr >>= return . FontSize
{# fun Fl_Tree_set_item_labelsize as itemSetLabelsize' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ()) ) => Op (SetItemLabelsize ()) Tree orig impl where
  runOp _ _ tree (FontSize val) = withRef tree $ \treePtr -> itemSetLabelsize' treePtr val
{# fun Fl_Tree_item_labelfgcolor as itemLabelfgcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color)) ) => Op (GetItemLabelfgcolor ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> itemLabelfgcolor' treePtr
{# fun Fl_Tree_set_item_labelfgcolor as setItemLabelfgcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ()) ) => Op (SetItemLabelfgcolor ()) Tree orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setItemLabelfgcolor' treePtr val
{# fun Fl_Tree_item_labelbgcolor as itemLabelbgcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color)) ) => Op (GetItemLabelbgcolor ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> itemLabelbgcolor' treePtr
{# fun Fl_Tree_set_item_labelbgcolor as setItemLabelbgcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ()) ) => Op (SetItemLabelbgcolor ()) Tree orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setItemLabelbgcolor' treePtr val
{# fun Fl_Tree_connectorcolor as connectorcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color)) ) => Op (GetConnectorcolor ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> connectorcolor' treePtr
{# fun Fl_Tree_set_connectorcolor as setConnectorcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ()) ) => Op (SetConnectorcolor ()) Tree orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setConnectorcolor' treePtr val
{# fun Fl_Tree_marginleft as marginleft' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int)) ) => Op (GetMarginleft ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> marginleft' treePtr
{# fun Fl_Tree_set_marginleft as setMarginleft' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ()) ) => Op (SetMarginleft ()) Tree orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setMarginleft' treePtr val
{# fun Fl_Tree_margintop as margintop' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int)) ) => Op (GetMargintop ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> margintop' treePtr
{# fun Fl_Tree_set_margintop as setMargintop' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ()) ) => Op (SetMargintop ()) Tree orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setMargintop' treePtr val
{# fun Fl_Tree_linespacing as linespacing' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int)) ) => Op (GetLinespacing ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> linespacing' treePtr
{# fun Fl_Tree_set_linespacing as setLinespacing' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ()) ) => Op (SetLinespacing ()) Tree orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setLinespacing' treePtr val
{# fun Fl_Tree_openchild_marginbottom as openchildMarginbottom' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int)) ) => Op (GetOpenchildMarginbottom ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> openchildMarginbottom' treePtr
{# fun Fl_Tree_set_openchild_marginbottom as setOpenchildMarginbottom' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ()) ) => Op (SetOpenchildMarginbottom ()) Tree orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setOpenchildMarginbottom' treePtr val
{# fun Fl_Tree_usericonmarginleft as usericonmarginleft' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int)) ) => Op (GetUsericonmarginleft ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> usericonmarginleft' treePtr
{# fun Fl_Tree_set_usericonmarginleft as setUsericonmarginleft' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ()) ) => Op (SetUsericonmarginleft ()) Tree orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setUsericonmarginleft' treePtr val
{# fun Fl_Tree_labelmarginleft as labelmarginleft' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int)) ) => Op (GetLabelmarginleft ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> labelmarginleft' treePtr
{# fun Fl_Tree_set_labelmarginleft as setLabelmarginleft' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ()) ) => Op (SetLabelmarginleft ()) Tree orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setLabelmarginleft' treePtr val
{# fun Fl_Tree_connectorwidth as connectorwidth' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int)) ) => Op (GetConnectorwidth ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> connectorwidth' treePtr
{# fun Fl_Tree_set_connectorwidth as setConnectorwidth' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ()) ) => Op (SetConnectorwidth ()) Tree orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setConnectorwidth' treePtr val
{# fun Fl_Tree_usericon as usericon' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref Image))) ) => Op (GetUsericon ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> usericon' treePtr >>= toMaybeRef
{# fun Fl_Tree_set_usericon as setUsericon' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a Image, impl ~ (Maybe( Ref a )  ->  IO ()) ) => Op (SetUsericon ()) Tree orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> withMaybeRef val $ \valPtr -> setUsericon' treePtr valPtr
{# fun Fl_Tree_openicon as openicon' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref Image))) ) => Op (GetOpenicon ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> openicon' treePtr >>= toMaybeRef
{# fun Fl_Tree_set_openicon as setOpenicon' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a Image , impl ~ (Maybe( Ref a )  ->  IO ()) ) => Op (SetOpenicon ()) Tree orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> withMaybeRef val $ \valPtr -> setOpenicon' treePtr valPtr
{# fun Fl_Tree_closeicon as closeicon' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref Image))) ) => Op (GetCloseicon ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> closeicon' treePtr >>= toMaybeRef
{# fun Fl_Tree_set_closeicon as setCloseicon' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a Image, impl ~ (Maybe( Ref a )  ->  IO ()) ) => Op (SetCloseicon ()) Tree orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> withMaybeRef val $ \valPtr -> setCloseicon' treePtr valPtr
{# fun Fl_Tree_showcollapse as showcollapse' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ ( IO (Bool)) ) => Op (GetShowcollapse ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> showcollapse' treePtr
{# fun Fl_Tree_set_showcollapse as setShowcollapse' { id `Ptr ()', cFromBool `Bool' } -> `()' #}
instance (impl ~ (Bool ->  IO ()) ) => Op (SetShowcollapse ()) Tree orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setShowcollapse' treePtr val
{# fun Fl_Tree_showroot as showroot' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ ( IO (Bool)) ) => Op (GetShowroot ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> showroot' treePtr
{# fun Fl_Tree_set_showroot as setShowroot' { id `Ptr ()', cFromBool `Bool' } -> `()' #}
instance (impl ~ (Bool ->  IO ()) ) => Op (SetShowroot ()) Tree orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setShowroot' treePtr val
{# fun Fl_Tree_connectorstyle as connectorstyle' { id `Ptr ()' } -> `TreeConnector' cToEnum #}
instance (impl ~ ( IO (TreeConnector)) ) => Op (GetConnectorstyle ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> connectorstyle' treePtr
{# fun Fl_Tree_set_connectorstyle as setConnectorstyle' { id `Ptr ()', cFromEnum `TreeConnector' } -> `()' #}
instance (impl ~ (TreeConnector ->  IO ()) ) => Op (SetConnectorstyle ()) Tree orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setConnectorstyle' treePtr val
{# fun Fl_Tree_sortorder as sortorder' { id `Ptr ()' } -> `TreeSort' cToEnum #}
instance (impl ~ ( IO (TreeSort)) ) => Op (GetSortorder ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> sortorder' treePtr
{# fun Fl_Tree_set_sortorder as setSortorder' { id `Ptr ()', cFromEnum `TreeSort' } -> `()' #}
instance (impl ~ (TreeSort ->  IO ()) ) => Op (SetSortorder ()) Tree orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setSortorder' treePtr val
{# fun Fl_Tree_selectbox as selectbox' { id `Ptr ()' } -> `Boxtype' cToEnum #}
instance (impl ~ ( IO (Boxtype)) ) => Op (GetSelectbox ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> selectbox' treePtr
{# fun Fl_Tree_set_selectbox as setSelectbox' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' #}
instance (impl ~ (Boxtype ->  IO ()) ) => Op (SetSelectbox ()) Tree orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setSelectbox' treePtr val
{# fun Fl_Tree_selectmode as selectmode' { id `Ptr ()' } -> `TreeSelect' cToEnum #}
instance (impl ~ ( IO (TreeSelect)) ) => Op (Selectmode ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> selectmode' treePtr
{# fun Fl_Tree_set_selectmode as setSelectmode' { id `Ptr ()', cFromEnum `TreeSelect' } -> `()' #}
instance (impl ~ (TreeSelect ->  IO ()) ) => Op (SetSelectmode ()) Tree orig impl where
  runOp _ _ tree val = withRef tree $ \treePtr -> setSelectmode' treePtr val
{# fun Fl_Tree_displayed as displayed' { id `Ptr ()',id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (Ref TreeItem  ->  IO (Bool)) ) => Op (Displayed ()) Tree orig impl where
  runOp _ _ tree item = withRef tree $ \treePtr -> withRef item $ \itemPtr -> displayed' treePtr itemPtr
{# fun Fl_Tree_show_item_with_yoff as showItemWithYoff' { id `Ptr ()',id `Ptr ()',`Int' } -> `()' #}
{# fun Fl_Tree_show_item as showItem' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (impl ~ (Ref TreeItem  -> Maybe Int ->  IO ()) ) => Op (ShowItemWithYoff ()) Tree orig impl where
  runOp _ _ tree item yoff =
    withRef tree $ \treePtr ->
    withRef item $ \itemPtr ->
    case yoff of
      Just y' -> showItemWithYoff' treePtr itemPtr y'
      Nothing -> showItem' treePtr itemPtr
{# fun Fl_Tree_show_item_top as showItemTop' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (impl ~ (Ref TreeItem  ->  IO ()) ) => Op (ShowItemTop ()) Tree orig impl where
  runOp _ _ tree item = withRef tree $ \treePtr -> withRef item $ \itemPtr -> showItemTop' treePtr itemPtr
{# fun Fl_Tree_show_item_middle as showItemMiddle' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (impl ~ (Ref TreeItem  ->  IO ()) ) => Op (ShowItemMiddle ()) Tree orig impl where
  runOp _ _ tree item = withRef tree $ \treePtr -> withRef item $ \itemPtr -> showItemMiddle' treePtr itemPtr
{# fun Fl_Tree_show_item_bottom as showItemBottom' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (impl ~ (Ref TreeItem  ->  IO ()) ) => Op (ShowItemBottom ()) Tree orig impl where
  runOp _ _ tree item = withRef tree $ \treePtr -> withRef item $ \itemPtr -> showItemBottom' treePtr itemPtr
{# fun Fl_Tree_display as display' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (impl ~ (Ref TreeItem  ->  IO ()) ) => Op (Display ()) Tree orig impl where
  runOp _ _ tree item = withRef tree $ \treePtr -> withRef item $ \itemPtr -> display' treePtr itemPtr
{# fun Fl_Tree_vposition as vposition' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int)) ) => Op (GetVposition ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> vposition' treePtr
{# fun Fl_Tree_set_vposition as setVposition' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ()) ) => Op (SetVposition ()) Tree orig impl where
  runOp _ _ tree pos = withRef tree $ \treePtr -> setVposition' treePtr pos
{# fun Fl_Tree_is_scrollbar as isScrollbar' { id `Ptr ()',id `Ptr ()' } -> `Bool' cToBool #}
instance (Parent a Widget, impl ~ (Ref a  ->  IO (Bool)) ) => Op (IsScrollbar ()) Tree orig impl where
  runOp _ _ tree w = withRef tree $ \treePtr -> withRef w $ \wPtr -> isScrollbar' treePtr wPtr
{# fun Fl_Tree_scrollbar_size as scrollbarSize' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Int)) ) => Op (GetScrollbarSize ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> scrollbarSize' treePtr
{# fun Fl_Tree_set_scrollbar_size as setScrollbarSize' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ()) ) => Op (SetScrollbarSize ()) Tree orig impl where
  runOp _ _ tree size = withRef tree $ \treePtr -> setScrollbarSize' treePtr size
{# fun Fl_Tree_is_vscroll_visible as isVscrollVisible' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ ( IO (Bool)) ) => Op (IsVscrollVisible ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> isVscrollVisible' treePtr
{# fun Fl_Tree_set_callback_item as setCallbackItem' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a TreeItem, impl ~ (Ref a ->  IO ()) ) => Op (SetCallbackItem ()) Tree orig impl where
  runOp _ _ tree item = withRef tree $ \treePtr -> withRef item $ \itemPtr -> setCallbackItem' treePtr itemPtr
{# fun Fl_Tree_callback_item as callbackItem' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref TreeItem))) ) => Op (GetCallbackItem ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> callbackItem' treePtr >>= toMaybeRef
{# fun Fl_Tree_set_callback_reason as setCallbackReason' { id `Ptr ()', cFromEnum `TreeReasonType' } -> `()' #}
instance (impl ~ (TreeReasonType ->  IO ()) ) => Op (SetCallbackReason ()) Tree orig impl where
  runOp _ _ tree reason = withRef tree $ \treePtr -> setCallbackReason' treePtr reason
{# fun Fl_Tree_callback_reason as callbackReason' { id `Ptr ()' } -> `TreeReasonType' cToEnum #}
instance (impl ~ ( IO (TreeReasonType)) ) => Op (GetCallbackReason ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> callbackReason' treePtr
{# fun Fl_Tree_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> draw'' treePtr
{# fun Fl_Tree_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> drawSuper' treePtr
{#fun Fl_Tree_handle as treeHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Tree orig impl where
  runOp _ _ tree event = withRef tree (\p -> treeHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Tree_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) Tree orig impl where
  runOp _ _ tree event = withRef tree $ \treePtr -> handleSuper' treePtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Tree_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Tree orig impl where
  runOp _ _ tree rectangle = withRef tree $ \treePtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' treePtr x_pos y_pos w_pos h_pos
{# fun Fl_Tree_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) Tree orig impl where
  runOp _ _ tree rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef tree $ \treePtr -> resizeSuper' treePtr x_pos y_pos width height
{# fun Fl_Tree_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> hide' treePtr
{# fun Fl_Tree_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> hideSuper' treePtr
{# fun Fl_Tree_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> show' treePtr
{# fun Fl_Tree_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> showSuper' treePtr

-- $functions
-- @
-- add :: 'Ref' 'Tree' -> 'T.Text' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- addAt:: ('Parent' a 'TreeItem') => 'Ref' 'Tree' -> 'T.Text' -> 'Ref' a -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- clear :: 'Ref' 'Tree' -> 'IO' ()
--
-- clearChildren:: ('Parent' a 'TreeItem') => 'Ref' 'Tree' -> 'Ref' a -> 'IO' ()
--
-- close :: 'Ref' 'Tree' -> 'TreeItemLocator' -> 'IO' ()
--
-- closeAndCallback :: 'Ref' 'Tree' -> 'TreeItemLocator' -> 'Bool' -> 'IO' ()
--
-- deselect :: 'Ref' 'Tree' -> 'TreeItemLocator' -> 'IO' ('Int')
--
-- deselectAll :: 'Ref' 'Tree' -> 'IO' ()
--
-- deselectAllAndCallback :: 'Ref' 'Tree' -> 'Maybe' ('Ref' 'TreeItem') -> 'Bool' -> 'IO' ()
--
-- deselectAndCallback :: 'Ref' 'Tree' -> 'TreeItemLocator' -> 'Bool' -> 'IO' ()
--
-- destroy :: 'Ref' 'Tree' -> 'IO' ()
--
-- display :: 'Ref' 'Tree' -> 'Ref' 'TreeItem' -> 'IO' ()
--
-- displayed :: 'Ref' 'Tree' -> 'Ref' 'TreeItem' -> 'IO' ('Bool')
--
-- draw :: 'Ref' 'Tree' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'Tree' -> 'IO' ()
--
-- findItem :: 'Ref' 'Tree' -> 'T.Text' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- firstSelectedItem :: 'Ref' 'Tree' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- firstVisible :: 'Ref' 'Tree' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- getCallbackItem :: 'Ref' 'Tree' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- getCallbackReason :: 'Ref' 'Tree' -> 'IO' ('TreeReasonType')
--
-- getCloseicon :: 'Ref' 'Tree' -> 'IO' ('Maybe' ('Ref' 'Image'))
--
-- getConnectorcolor :: 'Ref' 'Tree' -> 'IO' ('Color')
--
-- getConnectorstyle :: 'Ref' 'Tree' -> 'IO' ('TreeConnector')
--
-- getConnectorwidth :: 'Ref' 'Tree' -> 'IO' ('Int')
--
-- getFirst :: 'Ref' 'Tree' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- getItemFocus :: 'Ref' 'Tree' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- getItemLabelbgcolor :: 'Ref' 'Tree' -> 'IO' ('Color')
--
-- getItemLabelfgcolor :: 'Ref' 'Tree' -> 'IO' ('Color')
--
-- getItemLabelfont :: 'Ref' 'Tree' -> 'IO' ('Font')
--
-- getItemLabelsize :: 'Ref' 'Tree' -> 'IO' ('FontSize')
--
-- getLabelmarginleft :: 'Ref' 'Tree' -> 'IO' ('Int')
--
-- getLast :: 'Ref' 'Tree' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- getLinespacing :: 'Ref' 'Tree' -> 'IO' ('Int')
--
-- getMarginleft :: 'Ref' 'Tree' -> 'IO' ('Int')
--
-- getMargintop :: 'Ref' 'Tree' -> 'IO' ('Int')
--
-- getOpenchildMarginbottom :: 'Ref' 'Tree' -> 'IO' ('Int')
--
-- getOpenicon :: 'Ref' 'Tree' -> 'IO' ('Maybe' ('Ref' 'Image'))
--
-- getScrollbarSize :: 'Ref' 'Tree' -> 'IO' ('Int')
--
-- getSelectbox :: 'Ref' 'Tree' -> 'IO' ('Boxtype')
--
-- getShowcollapse :: 'Ref' 'Tree' -> 'IO' ('Bool')
--
-- getShowroot :: 'Ref' 'Tree' -> 'IO' ('Bool')
--
-- getSortorder :: 'Ref' 'Tree' -> 'IO' ('TreeSort')
--
-- getUsericon :: 'Ref' 'Tree' -> 'IO' ('Maybe' ('Ref' 'Image'))
--
-- getUsericonmarginleft :: 'Ref' 'Tree' -> 'IO' ('Int')
--
-- getVposition :: 'Ref' 'Tree' -> 'IO' ('Int')
--
-- handle :: 'Ref' 'Tree' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'Tree' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Tree' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'Tree' -> 'IO' ()
--
-- insert:: ('Parent' a 'TreeItem') => 'Ref' 'Tree' -> 'Ref' a -> 'T.Text' -> 'Int' -> 'IO' ('Maybe' ('Ref' a))
--
-- insertAbove:: ('Parent' a 'TreeItem') => 'Ref' 'Tree' -> 'Ref' a -> 'T.Text' -> 'IO' ('Maybe' ('Ref' a))
--
-- isClose :: 'Ref' 'Tree' -> 'TreeItemLocator' -> 'IO' ('Bool')
--
-- isOpen :: 'Ref' 'Tree' -> 'TreeItemLocator' -> 'IO' ('Bool')
--
-- isScrollbar:: ('Parent' a 'Widget') => 'Ref' 'Tree' -> 'Ref' a -> 'IO' ('Bool')
--
-- isSelected :: 'Ref' 'Tree' -> 'TreeItemLocator' -> 'IO' ('Bool')
--
-- isVscrollVisible :: 'Ref' 'Tree' -> 'IO' ('Bool')
--
-- itemClicked :: 'Ref' 'Tree' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- itemPathname:: ('Parent' a 'TreeItem') => 'Ref' 'Tree' -> 'Ref' a -> 'IO' ('Maybe' 'T.Text')
--
-- lastSelectedItem :: 'Ref' 'Tree' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- lastVisible :: 'Ref' 'Tree' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- next :: 'Ref' 'Tree' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- nextAfterItem :: 'Ref' 'Tree' -> 'Ref' 'TreeItem' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- nextItem :: 'Ref' 'Tree' -> 'Ref' 'TreeItem' -> 'Maybe' 'SearchDirection' -> 'Bool' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- nextSelectedItem :: 'Ref' 'Tree' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- nextSelectedItemAfterItem :: 'Ref' 'Tree' -> 'Ref' 'TreeItem' -> 'Maybe' 'SearchDirection' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- open :: 'Ref' 'Tree' -> 'TreeItemLocator' -> 'IO' ()
--
-- openAndCallback :: 'Ref' 'Tree' -> 'TreeItemLocator' -> 'Bool' -> 'IO' ()
--
-- openToggle :: 'Ref' 'Tree' -> 'Ref' 'TreeItem' -> 'IO' ()
--
-- openToggleAndCallback :: 'Ref' 'Tree' -> 'Ref' 'TreeItem' -> 'Bool' -> 'IO' ()
--
-- prev :: 'Ref' 'Tree' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- prevBeforeItem :: 'Ref' 'Tree' -> 'Ref' 'TreeItem' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- remove :: 'Ref' 'Tree' -> 'Ref' 'TreeItem' -> 'IO' ('Either' 'TreeItemNotFound' ())
--
-- resize :: 'Ref' 'Tree' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'Tree' -> 'Rectangle' -> 'IO' ()
--
-- root :: 'Ref' 'Tree' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- rootLabel :: 'Ref' 'Tree' -> 'T.Text' -> 'IO' ()
--
-- select :: 'Ref' 'Tree' -> 'TreeItemLocator' -> 'IO' ('Int')
--
-- selectAll :: 'Ref' 'Tree' -> 'IO' ()
--
-- selectAllAndCallback :: 'Ref' 'Tree' -> 'Maybe' ('Ref' 'TreeItem') -> 'Bool' -> 'IO' ()
--
-- selectAndCallback :: 'Ref' 'Tree' -> 'TreeItemLocator' -> 'Bool' -> 'IO' ()
--
-- selectOnly :: 'Ref' 'Tree' -> 'Ref' 'TreeItem' -> 'IO' ()
--
-- selectOnlyAndCallback :: 'Ref' 'Tree' -> 'Ref' 'TreeItem' -> 'Bool' -> 'IO' ()
--
-- selectToggle :: 'Ref' 'Tree' -> 'Ref' 'TreeItem' -> 'IO' ()
--
-- selectToggleAndCallback :: 'Ref' 'Tree' -> 'Ref' 'TreeItem' -> 'Bool' -> 'IO' ()
--
-- selectmode :: 'Ref' 'Tree' -> 'IO' ('TreeSelect')
--
-- setCallbackItem:: ('Parent' a 'TreeItem') => 'Ref' 'Tree' -> 'Ref' a -> 'IO' ()
--
-- setCallbackReason :: 'Ref' 'Tree' -> 'TreeReasonType' -> 'IO' ()
--
-- setCloseicon:: ('Parent' a 'Image') => 'Ref' 'Tree' -> 'Maybe'( 'Ref' a ) -> 'IO' ()
--
-- setConnectorcolor :: 'Ref' 'Tree' -> 'Color' -> 'IO' ()
--
-- setConnectorstyle :: 'Ref' 'Tree' -> 'TreeConnector' -> 'IO' ()
--
-- setConnectorwidth :: 'Ref' 'Tree' -> 'Int' -> 'IO' ()
--
-- setItemFocus :: 'Ref' 'Tree' -> 'Ref' 'TreeItem' -> 'IO' ()
--
-- setItemLabelbgcolor :: 'Ref' 'Tree' -> 'Color' -> 'IO' ()
--
-- setItemLabelfgcolor :: 'Ref' 'Tree' -> 'Color' -> 'IO' ()
--
-- setItemLabelfont :: 'Ref' 'Tree' -> 'Font' -> 'IO' ()
--
-- setItemLabelsize :: 'Ref' 'Tree' -> 'FontSize' -> 'IO' ()
--
-- setLabelmarginleft :: 'Ref' 'Tree' -> 'Int' -> 'IO' ()
--
-- setLinespacing :: 'Ref' 'Tree' -> 'Int' -> 'IO' ()
--
-- setMarginleft :: 'Ref' 'Tree' -> 'Int' -> 'IO' ()
--
-- setMargintop :: 'Ref' 'Tree' -> 'Int' -> 'IO' ()
--
-- setOpenchildMarginbottom :: 'Ref' 'Tree' -> 'Int' -> 'IO' ()
--
-- setOpenicon:: ('Parent' a 'Image') => 'Ref' 'Tree' -> 'Maybe'( 'Ref' a ) -> 'IO' ()
--
-- setScrollbarSize :: 'Ref' 'Tree' -> 'Int' -> 'IO' ()
--
-- setSelectbox :: 'Ref' 'Tree' -> 'Boxtype' -> 'IO' ()
--
-- setSelectmode :: 'Ref' 'Tree' -> 'TreeSelect' -> 'IO' ()
--
-- setShowcollapse :: 'Ref' 'Tree' -> 'Bool' -> 'IO' ()
--
-- setShowroot :: 'Ref' 'Tree' -> 'Bool' -> 'IO' ()
--
-- setSortorder :: 'Ref' 'Tree' -> 'TreeSort' -> 'IO' ()
--
-- setUsericon:: ('Parent' a 'Image') => 'Ref' 'Tree' -> 'Maybe'( 'Ref' a ) -> 'IO' ()
--
-- setUsericonmarginleft :: 'Ref' 'Tree' -> 'Int' -> 'IO' ()
--
-- setVposition :: 'Ref' 'Tree' -> 'Int' -> 'IO' ()
--
-- showItemBottom :: 'Ref' 'Tree' -> 'Ref' 'TreeItem' -> 'IO' ()
--
-- showItemMiddle :: 'Ref' 'Tree' -> 'Ref' 'TreeItem' -> 'IO' ()
--
-- showItemTop :: 'Ref' 'Tree' -> 'Ref' 'TreeItem' -> 'IO' ()
--
-- showItemWithYoff :: 'Ref' 'Tree' -> 'Ref' 'TreeItem' -> 'Maybe' 'Int' -> 'IO' ()
--
-- showSelf :: 'Ref' 'Tree' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Tree' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'Tree' -> 'IO' ()
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Tree"
-- @
