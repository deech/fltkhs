{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.TreeItem
  (
    TreeItemIndex(..),
    TreeItemPointer(..),
    TreeItemName(..),
    TreeItemReference(..),
    TreeItemLocator(..),
    MoveError(..),
    MoveType(..),
    SiblingPosition(..),
    TreeItemNotFound(..),
    treeItemNew
    -- * Hierarchy
    --
    -- $hierarchy

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
#include "Fl_Tree_ItemC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch

newtype TreeItemIndex = TreeItemIndex Int
data TreeItemPointer = forall a. (Parent a TreeItem) => TreeItemPointer (Ref a)
newtype TreeItemName = TreeItemName String
data TreeItemReference = TreeItemByIndex TreeItemIndex | TreeItemByPointer TreeItemPointer
data TreeItemLocator = TreeItemPointerLocator TreeItemPointer | TreeItemNameLocator TreeItemName
data MoveError = NoParent | NoIndexFound | IndexRangeError | CouldNotDeparent | CouldNotReparent
data MoveType = MoveAbove | MoveBelow | MoveInto SiblingPosition
data TreeItemNotFound = TreeItemNotFound
data SiblingPosition = SiblingPosition (Maybe Int)
instance Enum MoveError where
  fromEnum NoParent = (-1)
  fromEnum  NoIndexFound = (-2)
  fromEnum  IndexRangeError = (-4)
  fromEnum  CouldNotDeparent = (-5)
  fromEnum  CouldNotReparent = (-6)

  toEnum (-1) = NoParent
  toEnum (-2) = NoIndexFound
  toEnum (-4) = IndexRangeError
  toEnum (-5) = CouldNotDeparent
  toEnum (-6) = CouldNotReparent
  toEnum e = error $ "No MoveError found for " ++ (show e)
{# fun unsafe Fl_Tree_Item_New_WithPrefs as newTreeItem' {id `Ptr ()'} -> `Ptr ()' id #}
treeItemNew :: Ref TreePrefs -> IO (Ref TreeItem)
treeItemNew prefs' = withRef prefs' $ \prefs'Ptr -> newTreeItem' prefs'Ptr >>= toRef
{# fun Fl_Tree_Item_Destroy as destroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) TreeItem orig impl where
  runOp _ _ menu_ = swapRef menu_ $ \menu_Ptr -> destroy' menu_Ptr >> return nullPtr
{# fun unsafe Fl_Tree_Item_x as x' { id `Ptr ()' } -> `Int' #}
instance (impl ~ IO Int) => Op (GetX ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> x' tree_itemPtr
{# fun unsafe Fl_Tree_Item_y as y' { id `Ptr ()' } -> `Int' #}
instance (impl ~ IO Int) => Op (GetY ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> y' tree_itemPtr
{# fun unsafe Fl_Tree_Item_w as w' { id `Ptr ()' } -> `Int' #}
instance (impl ~ IO Int) => Op (GetW ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> w' tree_itemPtr
{# fun unsafe Fl_Tree_Item_h as h' { id `Ptr ()' } -> `Int' #}
instance (impl ~ IO Int) => Op (GetH ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> h' tree_itemPtr
{# fun unsafe Fl_Tree_Item_show_self_with_indent as showSelfWithIndent' { id `Ptr ()',unsafeToCString `String' } -> `()' #}
instance (impl ~ (Maybe String -> IO ())) => Op (ShowSelf ()) TreeItem orig impl where
  runOp _ _ tree_item indent = case indent of
    Just s' -> withRef tree_item $ \tree_itemPtr -> showSelfWithIndent' tree_itemPtr s'
    Nothing -> withRef tree_item $ \tree_itemPtr -> showSelfWithIndent' tree_itemPtr ""
{# fun unsafe Fl_Tree_Item_set_label as setLabel' { id `Ptr ()',unsafeToCString `String' } -> `()' #}
instance (impl ~ ( String ->  IO ())) => Op (SetLabel ()) TreeItem orig impl where
  runOp _ _ tree_item val = withRef tree_item $ \tree_itemPtr -> setLabel' tree_itemPtr val
{# fun unsafe Fl_Tree_Item_label as label' { id `Ptr ()' } -> `String' #}
instance (impl ~ (IO (String))) => Op (GetLabel ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> label' tree_itemPtr
{# fun unsafe Fl_Tree_Item_set_labelfont as setLabelfont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
instance (impl ~ ( Font ->  IO ())) => Op (SetLabelfont ()) TreeItem orig impl where
  runOp _ _ tree_item val = withRef tree_item $ \tree_itemPtr -> setLabelfont' tree_itemPtr val
{# fun unsafe Fl_Tree_Item_labelfont as labelfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ (IO (Font))) => Op (GetLabelfont ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> labelfont' tree_itemPtr
{# fun unsafe Fl_Tree_Item_set_labelsize as setLabelsize' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ ( FontSize ->  IO ())) => Op (SetLabelsize ()) TreeItem orig impl where
  runOp _ _ tree_item (FontSize val) = withRef tree_item $ \tree_itemPtr -> setLabelsize' tree_itemPtr val
{# fun unsafe Fl_Tree_Item_labelsize as labelsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ (IO (FontSize))) => Op (GetLabelsize ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> labelsize' tree_itemPtr >>= return . FontSize
{# fun unsafe Fl_Tree_Item_set_labelcolor as setLabelcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ ( Color ->  IO ())) => Op (SetLabelcolor ()) TreeItem orig impl where
  runOp _ _ tree_item val = withRef tree_item $ \tree_itemPtr -> setLabelcolor' tree_itemPtr val
{# fun unsafe Fl_Tree_Item_labelcolor as labelcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ (IO (Color))) => Op (GetLabelcolor ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> labelcolor' tree_itemPtr
{# fun unsafe Fl_Tree_Item_labelfgcolor as labelfgcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ (IO (Color))) => Op (GetLabelfgcolor ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> labelfgcolor' tree_itemPtr
{# fun unsafe Fl_Tree_Item_set_labelfgcolor as setLabelfgcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ ( Color ->  IO ())) => Op (SetLabelfgcolor ()) TreeItem orig impl where
  runOp _ _ tree_item val = withRef tree_item $ \tree_itemPtr -> setLabelfgcolor' tree_itemPtr val
{# fun unsafe Fl_Tree_Item_set_labelbgcolor as setLabelbgcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ ( Color ->  IO ())) => Op (SetLabelbgcolor ()) TreeItem orig impl where
  runOp _ _ tree_item val = withRef tree_item $ \tree_itemPtr -> setLabelbgcolor' tree_itemPtr val
{# fun unsafe Fl_Tree_Item_labelbgcolor as labelbgcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ (IO (Color))) => Op (GetLabelbgcolor ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> labelbgcolor' tree_itemPtr
{# fun unsafe Fl_Tree_Item_set_widget as setWidget' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a Widget, impl ~ (Ref a  ->  IO ())) => Op (SetWidget ()) TreeItem orig impl where
  runOp _ _ tree_item val = withRef tree_item $ \tree_itemPtr -> withRef val $ \valPtr -> setWidget' tree_itemPtr valPtr
{# fun unsafe Fl_Tree_Item_widget as widget' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ (IO (Ref Widget))) => Op (GetWidget ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> widget' tree_itemPtr >>= toRef
{# fun unsafe Fl_Tree_Item_children as children' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Int))) => Op (Children ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> children' tree_itemPtr
{# fun unsafe Fl_Tree_Item_child_by_index as childByIndex' { id `Ptr ()',`Int' } -> `Ptr ()' id #}
instance (impl ~ ( Int ->  IO (Maybe (Ref Widget)))) => Op (Child ()) TreeItem orig impl where
  runOp _ _ tree_item index' = withRef tree_item $ \tree_itemPtr -> childByIndex' tree_itemPtr index' >>= toMaybeRef
{# fun unsafe Fl_Tree_Item_has_children as hasChildren' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (IO (Bool))) => Op (HasChildren ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> hasChildren' tree_itemPtr

{# fun unsafe Fl_Tree_Item_find_child as findChild' { id `Ptr ()',unsafeToCString `String' } -> `Int' #}
{# fun unsafe Fl_Tree_Item_find_child_by_item as findChildByItem' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
instance (impl ~ ( TreeItemLocator ->  IO (Maybe TreeItemIndex))) => Op (FindChild ()) TreeItem orig impl where
  runOp _ _ tree_item locator' = withRef tree_item $ \tree_itemPtr -> do
    idx' <- case locator' of
             (TreeItemPointerLocator (TreeItemPointer item')) -> withRef item' $ \itemPtr-> findChildByItem' tree_itemPtr itemPtr
             (TreeItemNameLocator (TreeItemName name')) -> findChild' tree_itemPtr name'
    if idx' == -1 then return Nothing else (return $ Just (TreeItemIndex idx'))

{# fun unsafe Fl_Tree_Item_remove_child_by_item as removeChildByItem' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
{# fun unsafe Fl_Tree_Item_remove_child as removeChild' { id `Ptr ()',unsafeToCString `String' } -> `Int' #}
instance (impl ~ ( TreeItemLocator ->  IO (Either UnknownError ()))) => Op (RemoveChild ()) TreeItem orig impl where
  runOp _ _ tree_item locator' = withRef tree_item $ \tree_itemPtr -> do
     status' <- case locator' of
       (TreeItemPointerLocator (TreeItemPointer item')) -> withRef item' $ \itemPtr-> removeChildByItem' tree_itemPtr itemPtr
       (TreeItemNameLocator (TreeItemName name')) -> removeChild' tree_itemPtr name'
     if (status' < 0) then (return $ Left UnknownError) else (return $ Right ())
{# fun unsafe Fl_Tree_Item_clear_children as clearChildren' { id `Ptr ()' } -> `()' #}
instance (impl ~ (IO ())) => Op (ClearChildren ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> clearChildren' tree_itemPtr
{# fun unsafe Fl_Tree_Item_swap_children as swapChildren' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ ( Int -> Int ->  IO ())) => Op (SwapChildren ()) TreeItem orig impl where
  runOp _ _ tree_item ax bx = withRef tree_item $ \tree_itemPtr -> swapChildren' tree_itemPtr ax bx
{# fun unsafe Fl_Tree_Item_swap_children_by_tree_item as swapChildrenByTreeItem' { id `Ptr ()',id `Ptr ()',id `Ptr ()' } -> `Int' #}
instance (Parent a TreeItem, impl ~ (Ref a -> Ref a -> IO (Either TreeItemNotFound ()))) => Op (SwapChildrenByTreeItem ()) TreeItem orig impl where
  runOp _ _ tree_item a b = withRef tree_item $ \tree_itemPtr -> withRef a $ \aPtr -> withRef b $ \bPtr -> do
    status' <- swapChildrenByTreeItem' tree_itemPtr aPtr bPtr
    if (status' == 0) then return (Left TreeItemNotFound) else return (Right ())
{# fun unsafe Fl_Tree_Item_find_child_item as findChildItem' { id `Ptr ()',id `Ptr (Ptr CChar)' } -> `Ptr ()' id #}
instance (impl ~ ([String] ->  IO (Maybe (Ref TreeItem)))) => Op (FindInChildren ()) TreeItem orig impl where
  runOp _ _ tree_item path_ = withRef tree_item $ \tree_itemPtr -> withStrings path_ $ \pathPtr -> findChildItem' tree_itemPtr (castPtr pathPtr) >>= toMaybeRef
{# fun unsafe Fl_Tree_Item_find_item as findItem' { id `Ptr ()',id `Ptr (Ptr CChar)' } -> `Ptr ()' id #}
instance (impl ~ ( [String] ->  IO (Maybe (Ref TreeItem)))) => Op (FindItem ()) TreeItem orig impl where
  runOp _ _ tree_item path =
    withRef tree_item $ \tree_itemPtr ->
      withStrings path (\pathPtr -> findItem' tree_itemPtr (castPtr pathPtr) >>= toMaybeRef)
{# fun unsafe Fl_Tree_Item_add_with as addWith' {id `Ptr ()', id `Ptr ()', id `Ptr CChar', id `Ptr ()'} -> `Ptr ()' id #}
{# fun unsafe Fl_Tree_Item_add_with_at as addWithAt' {id `Ptr ()', id `Ptr ()', id `Ptr ()' , id `Ptr (Ptr CChar)'} -> `Ptr ()' id #}
{# fun unsafe Fl_Tree_Item_add as add' {id `Ptr ()', id `Ptr ()', unsafeToCString `String'} -> `Ptr ()' id #}
{# fun unsafe Fl_Tree_Item_add_at as addAt' {id `Ptr ()', id `Ptr ()', id `Ptr (Ptr CChar)' } -> `Ptr ()' id #}
instance (Parent a TreeItem, Parent b TreePrefs, impl ~ (Ref b  -> TreeItemLocator ->  IO (Maybe (Ref a)))) => Op (Add ()) TreeItem orig impl where
  runOp _ _ tree_item prefs arr =
    withRef tree_item $ \tree_itemPtr -> withRef prefs $ \prefsPtr ->
      case arr of
        TreeItemNameLocator (TreeItemName n') -> add' tree_itemPtr prefsPtr n' >>= toMaybeRef
        TreeItemPointerLocator (TreeItemPointer p') -> withRef p' $ \p'Ptr -> addWith' tree_itemPtr prefsPtr (castPtr nullPtr) p'Ptr >>= toMaybeRef
instance (Parent a TreeItem, Parent b TreePrefs, impl ~ (Ref b  ->  [String] -> Maybe (Ref a) -> IO (Maybe (Ref a)))) => Op (AddAt ()) TreeItem orig impl where
  runOp _ _ tree_item prefs path item' =
    withRef tree_item $ \tree_itemPtr -> withRef prefs $ \prefsPtr ->
    withStrings path $ \pathPtr ->
      case item' of
        Nothing -> addAt' tree_itemPtr prefsPtr (castPtr pathPtr) >>= toMaybeRef
        Just i' -> withRef i' $ \i'Ptr -> addWithAt' tree_itemPtr prefsPtr i'Ptr pathPtr >>= toMaybeRef
{# fun unsafe Fl_Tree_Item_insert as insert' { id `Ptr ()',id `Ptr ()',unsafeToCString `String' } -> `Ptr ()' id #}
{# fun unsafe Fl_Tree_Item_insert_with_pos as insertWithPos' { id `Ptr ()',id `Ptr ()',unsafeToCString `String',`Int' } -> `Ptr ()' id #}
instance (Parent a TreePrefs, impl ~ (Ref a  -> String ->  Maybe Int -> IO (Maybe (Ref TreeItem)))) => Op (Insert ()) TreeItem orig impl where
  runOp _ _ tree_item prefs new_label pos' =
    withRef tree_item $ \tree_itemPtr -> withRef prefs $ \prefsPtr ->
      case pos' of
        Nothing -> insert' tree_itemPtr prefsPtr new_label >>= toMaybeRef
        Just p' -> insertWithPos' tree_itemPtr prefsPtr new_label p' >>= toMaybeRef
{# fun unsafe Fl_Tree_Item_insert_above as insertAbove' { id `Ptr ()',id `Ptr ()', unsafeToCString `String' } -> `Ptr ()' id #}
instance (Parent a TreePrefs, impl ~ (Ref a -> String ->  IO (Maybe (Ref TreeItem)))) => Op (InsertAbove ()) TreeItem orig impl where
  runOp _ _ tree_item prefs new_label =
    withRef tree_item $
    \tree_itemPtr ->
     withRef prefs $ \prefsPtr -> insertAbove' tree_itemPtr prefsPtr new_label >>= toMaybeRef
{# fun unsafe Fl_Tree_Item_deparent as deparent' { id `Ptr ()', `Int'} -> `Ptr ()' id #}
instance (impl ~ (Int -> IO (Either UnknownError (Ref orig)))) => Op (Deparent ()) TreeItem orig impl where
  runOp _ _ tree_item pos' = withRef tree_item $ \tree_itemPtr -> do
    item' <- deparent' tree_itemPtr pos'
    if (item' == nullPtr) then (return $ Left UnknownError) else toRef item' >>= return . Right
{# fun unsafe Fl_Tree_Item_reparent as reparent' { id `Ptr ()', id `Ptr ()', `Int'} -> `Int' #}
instance (Parent a TreeItem, impl ~ (Ref a -> Int -> IO (Either UnknownError ()))) => Op (Reparent ()) TreeItem orig impl where
  runOp _ _ tree_item child_item pos' =
    withRef tree_item $ \tree_itemPtr -> withRef child_item $ \child_itemPtr -> do
      status' <- reparent' tree_itemPtr child_itemPtr pos'
      if (status' < 0) then (return $ Left UnknownError) else (return $ Right ())
{# fun unsafe Fl_Tree_Item_move as move' { id `Ptr ()', `Int', `Int'} -> `Int' #}
instance (impl ~ (Int -> Int -> IO (Either OutOfRange ()))) => Op (Move ()) TreeItem orig impl where
  runOp _ _ tree_item pos' spos' =
    withRef tree_item $ \tree_itemPtr -> do
      status' <- move' tree_itemPtr pos' spos'
      if status' == -1 then (return $ Left OutOfRange) else return (Right ())
{# fun unsafe Fl_Tree_Item_move_above as move_above' { id `Ptr ()', id `Ptr ()'} -> `Int' #}
{# fun unsafe Fl_Tree_Item_move_below as move_below' { id `Ptr ()', id `Ptr ()'} -> `Int' #}
{# fun unsafe Fl_Tree_Item_move_into as move_into' { id `Ptr ()', id `Ptr ()', `Int'} -> `Int' #}
instance (Parent a TreeItem, impl ~ (Ref a -> MoveType -> IO (Either MoveError ()))) => Op (MoveTo ()) TreeItem orig impl where
  runOp _ _ tree_item to_item moveType' =
    withRef tree_item $ \tree_itemPtr ->
    withRef to_item $ \to_itemPtr -> do
    statusCode' <- case moveType' of
      MoveInto (SiblingPosition (Just p')) -> move_into' tree_itemPtr to_itemPtr p'
      MoveInto (SiblingPosition Nothing)  -> move_into' tree_itemPtr to_itemPtr 0
      MoveAbove                           -> move_above' tree_itemPtr to_itemPtr
      MoveBelow                           -> move_below' tree_itemPtr to_itemPtr
    if (statusCode' < 0) then return (Left (toEnum statusCode')) else return (Right ())
{# fun unsafe Fl_Tree_Item_depth as depth' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Int))) => Op (GetDepth ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> depth' tree_itemPtr
{# fun unsafe Fl_Tree_Item_prev as prev' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ (IO (Maybe (Ref TreeItem)))) => Op (Prev ()) TreeItem orig impl where
  runOp _ _ tree_item =
    withRef tree_item $ \tree_itemPtr -> prev' tree_itemPtr >>= toMaybeRef
{# fun unsafe Fl_Tree_Item_next as next' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ (IO (Maybe (Ref TreeItem)))) => Op (Next ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> next' tree_itemPtr >>= toMaybeRef
{# fun unsafe Fl_Tree_Item_next_sibling as nextSibling' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ (IO (Maybe (Ref TreeItem)))) => Op (NextSibling ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> nextSibling' tree_itemPtr >>= toMaybeRef
{# fun unsafe Fl_Tree_Item_prev_sibling as prevSibling' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ (IO (Maybe (Ref TreeItem)))) => Op (PrevSibling ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> prevSibling' tree_itemPtr >>= toMaybeRef
{# fun unsafe Fl_Tree_Item_update_prev_next as updatePrevNext' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Int ->  IO ())) => Op (UpdatePrevNext ()) TreeItem orig impl where
  runOp _ _ tree_item index' = withRef tree_item $ \tree_itemPtr -> updatePrevNext' tree_itemPtr index'
{# fun unsafe Fl_Tree_Item_next_displayed as nextDisplayed' { id `Ptr ()',id `Ptr ()' } -> `Ptr ()' id #}
instance (Parent a TreePrefs, impl ~ (Ref a  ->  IO (Maybe (Ref TreeItem)))) => Op (NextDisplayed ()) TreeItem orig impl where
  runOp _ _ tree_item prefs = withRef tree_item $ \tree_itemPtr -> withRef prefs $ \prefsPtr -> nextDisplayed' tree_itemPtr prefsPtr >>= toMaybeRef
{# fun unsafe Fl_Tree_Item_prev_displayed as prevDisplayed' { id `Ptr ()',id `Ptr ()' } -> `Ptr ()' id #}
instance (Parent a TreePrefs, impl ~ (Ref a  ->  IO (Maybe (Ref TreeItem)))) => Op (PrevDisplayed ()) TreeItem orig impl where
  runOp _ _ tree_item prefs = withRef tree_item $ \tree_itemPtr -> withRef prefs $ \prefsPtr -> prevDisplayed' tree_itemPtr prefsPtr >>= toMaybeRef
{# fun unsafe Fl_Tree_Item_parent as parent' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ (IO (Maybe (Ref TreeItem)))) => Op (GetParent ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> parent' tree_itemPtr >>= toMaybeRef
{# fun unsafe Fl_Tree_Item_set_parent as setParent' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a TreeItem, impl ~ (Ref a  ->  IO ())) => Op (SetParent ()) TreeItem orig impl where
  runOp _ _ tree_item val = withRef tree_item $ \tree_itemPtr -> withRef val $ \valPtr -> setParent' tree_itemPtr valPtr
{# fun unsafe Fl_Tree_Item_open as open' { id `Ptr ()' } -> `()' #}
instance (impl ~ (IO ())) => Op (Open ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> open' tree_itemPtr
{# fun unsafe Fl_Tree_Item_close as close' { id `Ptr ()' } -> `()' #}
instance (impl ~ (IO ())) => Op (Close ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> close' tree_itemPtr
{# fun unsafe Fl_Tree_Item_is_open as isOpen' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (IO (Bool))) => Op (IsOpen ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> isOpen' tree_itemPtr
{# fun unsafe Fl_Tree_Item_is_close as isClose' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (IO (Bool))) => Op (IsClose ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> isClose' tree_itemPtr
{# fun unsafe Fl_Tree_Item_open_toggle as openToggle' { id `Ptr ()' } -> `()' #}
instance (impl ~ (IO ())) => Op (OpenToggle ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> openToggle' tree_itemPtr
{# fun unsafe Fl_Tree_Item_select as select' { id `Ptr ()' } -> `()' #}
instance (impl ~ (IO ())) => Op (Select ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> select' tree_itemPtr
{# fun unsafe Fl_Tree_Item_select_with_val as selectWithVal' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Int ->  IO ())) => Op (SelectWithVal ()) TreeItem orig impl where
  runOp _ _ tree_item val = withRef tree_item $ \tree_itemPtr -> selectWithVal' tree_itemPtr val
{# fun unsafe Fl_Tree_Item_select_toggle as selectToggle' { id `Ptr ()' } -> `()' #}
instance (impl ~ (IO ())) => Op (SelectToggle ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> selectToggle' tree_itemPtr
{# fun unsafe Fl_Tree_Item_select_all as selectAll' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Int))) => Op (SelectAll ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> selectAll' tree_itemPtr
{# fun unsafe Fl_Tree_Item_deselect as deselect' { id `Ptr ()' } -> `()' #}
instance (impl ~ (IO ())) => Op (Deselect ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> deselect' tree_itemPtr
{# fun unsafe Fl_Tree_Item_deselect_all as deselectAll' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Int))) => Op (DeselectAll ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> deselectAll' tree_itemPtr
{# fun unsafe Fl_Tree_Item_is_selected as isSelected' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (IO (Bool))) => Op (IsSelected ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> isSelected' tree_itemPtr
{# fun unsafe Fl_Tree_Item_activate as activate' { id `Ptr ()' } -> `()' #}
instance (impl ~ (IO ())) => Op (Activate ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> activate' tree_itemPtr
{# fun unsafe Fl_Tree_Item_activate_with_val as activateWithVal' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Int ->  IO ())) => Op (ActivateWithVal ()) TreeItem orig impl where
  runOp _ _ tree_item val = withRef tree_item $ \tree_itemPtr -> activateWithVal' tree_itemPtr val
{# fun unsafe Fl_Tree_Item_is_active as isActive' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (IO (Bool))) => Op (IsActive ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> isActive' tree_itemPtr
{# fun unsafe Fl_Tree_Item_visible as visible' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (IO (Bool))) => Op (Visible ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> visible' tree_itemPtr
{# fun unsafe Fl_Tree_Item_is_visible as isVisible' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (IO (Bool))) => Op (IsVisible ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> isVisible' tree_itemPtr
{# fun unsafe Fl_Tree_Item_visible_r as visibleR' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (IO (Bool))) => Op (VisibleR ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> visibleR' tree_itemPtr
{# fun unsafe Fl_Tree_Item_set_usericon as setUsericon' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a Image, impl ~ (Ref a  ->  IO ())) => Op (SetUsericon ()) TreeItem orig impl where
  runOp _ _ tree_item val = withRef tree_item $ \tree_itemPtr -> withRef val $ \valPtr -> setUsericon' tree_itemPtr valPtr
{# fun unsafe Fl_Tree_Item_usericon as usericon' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ (IO (Ref Image))) => Op (GetUsericon ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> usericon' tree_itemPtr >>= toRef
{# fun unsafe Fl_Tree_Item_find_clicked as findClicked' { id `Ptr ()',id `Ptr ()' } -> `Ptr ()' id #}
instance (Parent a TreePrefs, impl ~ (Ref a  ->  IO (Maybe (Ref TreeItem)))) => Op (FindClicked ()) TreeItem orig impl where
  runOp _ _ tree_item prefs = withRef tree_item $ \tree_itemPtr -> withRef prefs $ \prefsPtr -> findClicked' tree_itemPtr prefsPtr >>= toMaybeRef
{# fun unsafe Fl_Tree_Item_event_on_collapse_icon as eventOnCollapseIcon' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
instance (Parent a TreePrefs, impl ~ (Ref a  ->  IO (Int))) => Op (EventOnCollapseIcon ()) TreeItem orig impl where
  runOp _ _ tree_item prefs = withRef tree_item $ \tree_itemPtr -> withRef prefs $ \prefsPtr -> eventOnCollapseIcon' tree_itemPtr prefsPtr
{# fun unsafe Fl_Tree_Item_event_on_label as eventOnLabel' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
instance (Parent a TreePrefs, impl ~ (Ref a  ->  IO (Int))) => Op (EventOnLabel ()) TreeItem orig impl where
  runOp _ _ tree_item prefs = withRef tree_item $ \tree_itemPtr -> withRef prefs $ \prefsPtr -> eventOnLabel' tree_itemPtr prefsPtr
{# fun unsafe Fl_Tree_Item_is_root as isRoot' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (IO (Bool))) => Op (IsRoot ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> isRoot' tree_itemPtr
{# fun unsafe Fl_Tree_Item_label_x as labelX' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Int))) => Op (LabelX ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> labelX' tree_itemPtr
{# fun unsafe Fl_Tree_Item_label_y as labelY' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Int))) => Op (LabelY ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> labelY' tree_itemPtr
{# fun unsafe Fl_Tree_Item_label_w as labelW' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Int))) => Op (LabelW ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> labelW' tree_itemPtr
{# fun unsafe Fl_Tree_Item_label_h as labelH' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Int))) => Op (LabelH ()) TreeItem orig impl where
  runOp _ _ tree_item = withRef tree_item $ \tree_itemPtr -> labelH' tree_itemPtr

-- $functions
-- @
--
-- activate :: 'Ref' 'TreeItem' -> 'IO' ()
--
-- activateWithVal :: 'Ref' 'TreeItem' -> 'Int' -> 'IO' ()
--
-- add:: ('Parent' a 'TreeItem', 'Parent' b 'TreePrefs') => 'Ref' 'TreeItem' -> 'Ref' b -> 'TreeItemLocator' -> 'IO' ('Maybe' ('Ref' a)))
--
-- addAt:: ('Parent' a 'TreeItem', 'Parent' b 'TreePrefs') => 'Ref' 'TreeItem' -> 'Ref' b -> ['String'] -> 'Maybe' ('Ref' a) -> 'IO' ('Maybe' ('Ref' a)))
--
-- child :: 'Ref' 'TreeItem' -> 'Int' -> 'IO' ('Maybe' ('Ref' 'Widget'))
--
-- children :: 'Ref' 'TreeItem' -> 'IO' 'Int'
--
-- clearChildren :: 'Ref' 'TreeItem' -> 'IO' ()
--
-- close :: 'Ref' 'TreeItem' -> 'IO' ()
--
-- deparent :: 'Ref' 'TreeItem' -> 'Int' -> 'IO' ('Either' 'UnknownError' ('Ref' orig))
--
-- deselect :: 'Ref' 'TreeItem' -> 'IO' ()
--
-- deselectAll :: 'Ref' 'TreeItem' -> 'IO' 'Int'
--
-- destroy :: 'Ref' 'TreeItem' -> 'IO' ()
--
-- eventOnCollapseIcon:: ('Parent' a 'TreePrefs') => 'Ref' 'TreeItem' -> 'Ref' a -> 'IO' 'Int')
--
-- eventOnLabel:: ('Parent' a 'TreePrefs') => 'Ref' 'TreeItem' -> 'Ref' a -> 'IO' 'Int')
--
-- findChild :: 'Ref' 'TreeItem' -> 'TreeItemLocator' -> 'IO' ('Maybe' 'TreeItemIndex')
--
-- findClicked:: ('Parent' a 'TreePrefs') => 'Ref' 'TreeItem' -> 'Ref' a -> 'IO' ('Maybe' ('Ref' 'TreeItem')))
--
-- findInChildren :: 'Ref' 'TreeItem' -> ['String'] -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- findItem :: 'Ref' 'TreeItem' -> ['String'] -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- getDepth :: 'Ref' 'TreeItem' -> 'IO' 'Int'
--
-- getH :: 'Ref' 'TreeItem' -> 'IO' 'Int'
--
-- getLabel :: 'Ref' 'TreeItem' -> 'IO' 'String'
--
-- getLabelbgcolor :: 'Ref' 'TreeItem' -> 'IO' 'Color'
--
-- getLabelcolor :: 'Ref' 'TreeItem' -> 'IO' 'Color'
--
-- getLabelfgcolor :: 'Ref' 'TreeItem' -> 'IO' 'Color'
--
-- getLabelfont :: 'Ref' 'TreeItem' -> 'IO' 'Font'
--
-- getLabelsize :: 'Ref' 'TreeItem' -> 'IO' 'FontSize'
--
-- getParent :: 'Ref' 'TreeItem' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- getUsericon :: 'Ref' 'TreeItem' -> 'IO' ('Ref' 'Image')
--
-- getW :: 'Ref' 'TreeItem' -> 'IO' 'Int'
--
-- getWidget :: 'Ref' 'TreeItem' -> 'IO' ('Ref' 'Widget')
--
-- getX :: 'Ref' 'TreeItem' -> 'IO' 'Int'
--
-- getY :: 'Ref' 'TreeItem' -> 'IO' 'Int'
--
-- hasChildren :: 'Ref' 'TreeItem' -> 'IO' 'Bool'
--
-- insert:: ('Parent' a 'TreePrefs') => 'Ref' 'TreeItem' -> 'Ref' a -> 'String' -> 'Maybe' 'Int' -> 'IO' ('Maybe' ('Ref' 'TreeItem')))
--
-- insertAbove:: ('Parent' a 'TreePrefs') => 'Ref' 'TreeItem' -> 'Ref' a -> 'String' -> 'IO' ('Maybe' ('Ref' 'TreeItem')))
--
-- isActive :: 'Ref' 'TreeItem' -> 'IO' 'Bool'
--
-- isClose :: 'Ref' 'TreeItem' -> 'IO' 'Bool'
--
-- isOpen :: 'Ref' 'TreeItem' -> 'IO' 'Bool'
--
-- isRoot :: 'Ref' 'TreeItem' -> 'IO' 'Bool'
--
-- isSelected :: 'Ref' 'TreeItem' -> 'IO' 'Bool'
--
-- isVisible :: 'Ref' 'TreeItem' -> 'IO' 'Bool'
--
-- labelH :: 'Ref' 'TreeItem' -> 'IO' 'Int'
--
-- labelW :: 'Ref' 'TreeItem' -> 'IO' 'Int'
--
-- labelX :: 'Ref' 'TreeItem' -> 'IO' 'Int'
--
-- labelY :: 'Ref' 'TreeItem' -> 'IO' 'Int'
--
-- move :: 'Ref' 'TreeItem' -> 'Int' -> 'Int' -> 'IO' ('Either' 'OutOfRange' ())
--
-- moveTo:: ('Parent' a 'TreeItem') => 'Ref' 'TreeItem' -> 'Ref' a -> 'MoveType' -> 'IO' ('Either' 'MoveError' ()))
--
-- next :: 'Ref' 'TreeItem' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- nextDisplayed:: ('Parent' a 'TreePrefs') => 'Ref' 'TreeItem' -> 'Ref' a -> 'IO' ('Maybe' ('Ref' 'TreeItem')))
--
-- nextSibling :: 'Ref' 'TreeItem' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- open :: 'Ref' 'TreeItem' -> 'IO' ()
--
-- openToggle :: 'Ref' 'TreeItem' -> 'IO' ()
--
-- prev :: 'Ref' 'TreeItem' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- prevDisplayed:: ('Parent' a 'TreePrefs') => 'Ref' 'TreeItem' -> 'Ref' a -> 'IO' ('Maybe' ('Ref' 'TreeItem')))
--
-- prevSibling :: 'Ref' 'TreeItem' -> 'IO' ('Maybe' ('Ref' 'TreeItem'))
--
-- removeChild :: 'Ref' 'TreeItem' -> 'TreeItemLocator' -> 'IO' ('Either' 'UnknownError' ())
--
-- reparent:: ('Parent' a 'TreeItem') => 'Ref' 'TreeItem' -> 'Ref' a -> 'Int' -> 'IO' ('Either' 'UnknownError' ()))
--
-- select :: 'Ref' 'TreeItem' -> 'IO' ()
--
-- selectAll :: 'Ref' 'TreeItem' -> 'IO' 'Int'
--
-- selectToggle :: 'Ref' 'TreeItem' -> 'IO' ()
--
-- selectWithVal :: 'Ref' 'TreeItem' -> 'Int' -> 'IO' ()
--
-- setLabel :: 'Ref' 'TreeItem' -> 'String' -> 'IO' ()
--
-- setLabelbgcolor :: 'Ref' 'TreeItem' -> 'Color' -> 'IO' ()
--
-- setLabelcolor :: 'Ref' 'TreeItem' -> 'Color' -> 'IO' ()
--
-- setLabelfgcolor :: 'Ref' 'TreeItem' -> 'Color' -> 'IO' ()
--
-- setLabelfont :: 'Ref' 'TreeItem' -> 'Font' -> 'IO' ()
--
-- setLabelsize :: 'Ref' 'TreeItem' -> 'FontSize' -> 'IO' ()
--
-- setParent:: ('Parent' a 'TreeItem') => 'Ref' 'TreeItem' -> 'Ref' a -> 'IO' ())
--
-- setUsericon:: ('Parent' a 'Image') => 'Ref' 'TreeItem' -> 'Ref' a -> 'IO' ())
--
-- setWidget:: ('Parent' a 'Widget') => 'Ref' 'TreeItem' -> 'Ref' a -> 'IO' ())
--
-- showSelf :: 'Ref' 'TreeItem' -> 'Maybe' 'String' -> 'IO' ()
--
-- swapChildren :: 'Ref' 'TreeItem' -> 'Int' -> 'Int' -> 'IO' ()
--
-- swapChildrenByTreeItem:: ('Parent' a 'TreeItem') => 'Ref' 'TreeItem' -> 'Ref' a -> 'Ref' a -> 'IO' ('Either' 'TreeItemNotFound' ()))
--
-- updatePrevNext :: 'Ref' 'TreeItem' -> 'Int' -> 'IO' ()
--
-- visible :: 'Ref' 'TreeItem' -> 'IO' 'Bool'
--
-- visibleR :: 'Ref' 'TreeItem' -> 'IO' 'Bool'
-- @


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.TreeItem"
-- @