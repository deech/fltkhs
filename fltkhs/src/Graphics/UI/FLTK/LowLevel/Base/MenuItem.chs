{-# LANGUAGE OverloadedStrings, CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.MenuItem
  (
   menuItemNew,
   menuItemCustom,
   addMenuItem,
   MenuItemName(..),
   MenuItemPointer(..),
   MenuItemReference(..),
   MenuItemLocator(..),
   toMenuItemDrawF,
   drawMenuItemBase
   -- Hierarchy
   --
   -- $hierarchy
   --

   -- * Functions
   --
   -- $functions
  )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Menu_ItemC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Base.Widget(defaultDestroyCallbacks)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T

data MenuItemPointer = forall a. (Parent a MenuItemBase) => MenuItemPointer (Ref a)
newtype MenuItemName = MenuItemName T.Text
data MenuItemReference = MenuItemByIndex AtIndex | MenuItemByPointer MenuItemPointer
data MenuItemLocator = MenuItemPointerLocator MenuItemPointer | MenuItemNameLocator MenuItemName

toMenuItemDrawF ::
  (Parent a MenuItemBase) => (Ref a -> Rectangle -> Maybe (Ref MenuPrimBase) -> Bool -> IO ()) ->
  IO (FunPtr MenuItemDrawF)
toMenuItemDrawF f =
    mkMenuItemDrawFPtr (\menuItemPtr x' y' w' h' menuPtr selected -> do
                           pp <- wrapNonNull menuItemPtr "Null pointer : toMenuItemDrawFPrim"
                           maybeMenu <- toMaybeRef menuPtr
                           let rectangle = toRectangle (fromIntegral x',fromIntegral y',fromIntegral w',fromIntegral h')
                           f (castTo (wrapInRef pp)) rectangle maybeMenu (cToBool selected)
                       )
  
{# fun Fl_Menu_Item_New as new' { id `FunPtr DestroyCallbacksPrim'} -> `Ptr ()' id #}
menuItemNew :: IO (Ref MenuItem)
menuItemNew = do
  fptr <- toDestroyCallbacksPrim defaultDestroyCallbacks
  new' fptr >>= toRef

{# fun Fl_Menu_Item_New_With_Draw as newWithDraw' { id `FunPtr MenuItemDrawF', id `FunPtr DestroyCallbacksPrim' } -> `Ptr ()' id #}
menuItemCustom :: (Parent a MenuItemBase) => (Ref a -> Rectangle -> Maybe (Ref MenuPrimBase) -> Bool -> IO ()) -> IO (Ref MenuItem)
menuItemCustom drawF = do
  fPtr <- toMenuItemDrawF drawF
  destroyFptr <- toDestroyCallbacksPrim defaultDestroyCallbacks
  p <- newWithDraw' fPtr destroyFptr
  toRef p

{# fun Fl_Menu_Item_Destroy as destroy' { id `Ptr ()' } -> `()' id #}
instance (impl ~ IO ()) => Op (Destroy ()) MenuItemBase orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> destroy' menu_itemPtr

{# fun Fl_Menu_Item_next_with_step as nextWithStep' { id `Ptr ()',`Int' } -> `Ptr ()' id #}
instance (Parent a MenuItemBase, impl ~ (Int -> IO (Maybe (Ref a)))) => Op (NextWithStep ()) MenuItemBase orig impl where
  runOp _ _ menu_item step =
    withRef menu_item $ \menu_itemPtr -> nextWithStep' menu_itemPtr step >>= toMaybeRef

{# fun Fl_Menu_Item_next as next' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~  IO (Maybe (Ref MenuItemBase))) => Op (Next ()) MenuItemBase orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> next' menu_itemPtr >>= toMaybeRef

{# fun Fl_Menu_Item_first as first' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~  IO (Maybe (Ref MenuItemBase))) => Op (GetFirst ()) MenuItemBase orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> first' menu_itemPtr >>=toMaybeRef

{# fun Fl_Menu_Item_label as label' { id `Ptr ()' } -> `CString' #}
instance (impl ~  IO T.Text) => Op (GetLabel ()) MenuItemBase orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> label' menu_itemPtr >>= cStringToText

{# fun Fl_Menu_Item_set_label as setLabel' { id `Ptr ()', `CString' } -> `()' #}
instance (impl ~ (T.Text ->  IO ())) => Op (SetLabel ()) MenuItemBase orig impl where
  runOp _ _ menu_item a = withRef menu_item $ \menu_itemPtr -> copyTextToCString a >>= setLabel' menu_itemPtr

{# fun Fl_Menu_Item_set_label_with_labeltype as setLabelWithLabeltype' { id `Ptr ()',cFromEnum `Labeltype', `CString' } -> `()' #}
instance (impl ~ (Labeltype -> T.Text ->  IO ())) => Op (SetLabelWithLabeltype ()) MenuItemBase orig impl where
  runOp _ _ menu_item labeltype b = withRef menu_item $ \menu_itemPtr -> copyTextToCString b >>= setLabelWithLabeltype' menu_itemPtr labeltype

{# fun Fl_Menu_Item_labeltype as labeltype' { id `Ptr ()' } -> `Labeltype' cToEnum #}
instance (impl ~  IO (Labeltype)) => Op (GetLabeltype ()) MenuItemBase orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> labeltype' menu_itemPtr

{# fun Fl_Menu_Item_set_labeltype as setLabeltype' { id `Ptr ()',cFromEnum `Labeltype' } -> `()' #}
instance (impl ~ (Labeltype ->  IO ())) => Op (SetLabeltype ()) MenuItemBase orig impl where
  runOp _ _ menu_item a = withRef menu_item $ \menu_itemPtr -> setLabeltype' menu_itemPtr a

{# fun Fl_Menu_Item_labelcolor as labelcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~  IO (Color)) => Op (GetLabelcolor ()) MenuItemBase orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> labelcolor' menu_itemPtr

{# fun Fl_Menu_Item_set_labelcolor as setLabelcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetLabelcolor ()) MenuItemBase orig impl where
  runOp _ _ menu_item a = withRef menu_item $ \menu_itemPtr -> setLabelcolor' menu_itemPtr a

{# fun Fl_Menu_Item_labelfont as labelfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~  IO (Font)) => Op (GetLabelfont ()) MenuItemBase orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> labelfont' menu_itemPtr

{# fun Fl_Menu_Item_set_labelfont as setLabelfont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
instance (impl ~ (Font ->  IO ())) => Op (SetLabelfont ()) MenuItemBase orig impl where
  runOp _ _ menu_item a = withRef menu_item $ \menu_itemPtr -> setLabelfont' menu_itemPtr a

{# fun Fl_Menu_Item_labelsize as labelsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~  IO (FontSize)) => Op (GetLabelsize ()) MenuItemBase orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> labelsize' menu_itemPtr >>= return . FontSize

{# fun Fl_Menu_Item_set_labelsize as setLabelsize' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ())) => Op (SetLabelsize ()) MenuItemBase  orig impl where
  runOp _ _ menu_item (FontSize pix) = withRef menu_item $ \menu_itemPtr -> setLabelsize' menu_itemPtr pix

{# fun Fl_Menu_Item_set_callback as setCallback' { id `Ptr ()', id `FunPtr CallbackWithUserDataPrim'} -> `FunPtr CallbackWithUserDataPrim' id #}
instance (impl ~ ((Ref orig -> IO ()) -> IO ()) ) => Op (SetCallback ()) MenuItemBase orig impl where
  runOp _ _ menu_item c =
     withRef menu_item $ \menu_itemPtr -> do
      ptr <- toCallbackPrim c
      oldCb <- setCallback' menu_itemPtr (castFunPtr ptr)
      if (oldCb == nullFunPtr)
      then return ()
      else freeHaskellFunPtr oldCb

{# fun Fl_Menu_Item_callback as getCallback' { id `Ptr ()' } -> `FunPtr CallbackWithUserDataPrim' id #}
instance (impl ~ (IO (FunPtr CallbackWithUserDataPrim))) => Op (GetCallback ()) MenuItemBase orig impl where
  runOp _ _ menuItem = withRef menuItem $ \menuItemPtr -> getCallback' menuItemPtr

{# fun Fl_Menu_Item_shortcut as shortcut' { id `Ptr ()' } -> `CInt' #}
instance (impl ~  IO (Maybe ShortcutKeySequence)) => Op (GetShortcut ()) MenuItemBase orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> shortcut' menu_itemPtr >>= return . cIntToKeySequence

{# fun Fl_Menu_Item_set_shortcut as setShortcut' { id `Ptr ()',id `CInt' } -> `()' #}
instance (impl ~ (ShortcutKeySequence ->  IO ())) => Op (SetShortcut ()) MenuItemBase orig impl where
  runOp _ _ input (ShortcutKeySequence modifiers char) =
    withRef input $ \inputPtr -> setShortcut' inputPtr (keySequenceToCInt modifiers char)

{# fun Fl_Menu_Item_submenu as submenu' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~  IO (Bool)) => Op (Submenu ()) MenuItemBase orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> submenu' menu_itemPtr

{# fun Fl_Menu_Item_checkbox as checkbox' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~  IO (Bool)) => Op (Checkbox ()) MenuItemBase orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> checkbox' menu_itemPtr

{# fun Fl_Menu_Item_radio as radio' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~  IO (Bool)) => Op (Radio ()) MenuItemBase orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> radio' menu_itemPtr

{# fun Fl_Menu_Item_value as value' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~  IO (Bool)) => Op (GetValue ()) MenuItemBase orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> value' menu_itemPtr

{# fun Fl_Menu_Item_set as set' { id `Ptr ()' } -> `()' #}
instance (impl ~  IO ()) => Op (Set ()) MenuItemBase orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> set' menu_itemPtr

{# fun Fl_Menu_Item_clear as clear' { id `Ptr ()' } -> `()' #}
instance (impl ~  IO ()) => Op (Clear ()) MenuItemBase orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> clear' menu_itemPtr

{# fun Fl_Menu_Item_setonly as setonly' { id `Ptr ()' } -> `()' #}
instance (impl ~  IO ()) => Op (Setonly ()) MenuItemBase orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> setonly' menu_itemPtr

{# fun Fl_Menu_Item_visible as visible' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~  IO (Bool)) => Op (Visible ()) MenuItemBase orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> visible' menu_itemPtr

{# fun Fl_Menu_Item_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~  IO ()) => Op (ShowWidget ()) MenuItemBase orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> show' menu_itemPtr

{# fun Fl_Menu_Item_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~  IO ()) => Op (Hide ()) MenuItemBase orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> hide' menu_itemPtr

{# fun Fl_Menu_Item_active as active' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~  IO (Bool)) => Op (Active ()) MenuItemBase orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> active' menu_itemPtr

{# fun Fl_Menu_Item_activate as activate' { id `Ptr ()' } -> `()' #}
instance (impl ~  IO ()) => Op (Activate ()) MenuItemBase orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> activate' menu_itemPtr

{# fun Fl_Menu_Item_deactivate as deactivate' { id `Ptr ()' } -> `()' #}
instance (impl ~  IO ()) => Op (Deactivate ()) MenuItemBase orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> deactivate' menu_itemPtr

{# fun Fl_Menu_Item_activevisible as activevisible' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~  IO (Bool)) => Op (Activevisible ()) MenuItemBase orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> activevisible' menu_itemPtr

{# fun Fl_Menu_Item_measure as measure' { id `Ptr ()',alloca- `Int' peekIntConv*,id `Ptr ()' } -> `Int' #}
instance (Parent a MenuPrimBase, impl ~ (Ref a ->  IO (Size))) => Op (Measure ()) MenuItemBase orig impl where
  runOp _ _ menu_item menu' = withRef menu_item $ \menu_itemPtr -> withRef menu' $ \menuPtr -> measure' menu_itemPtr menuPtr >>= \(h', w') -> return (Size (Width w') (Height h'))

{# fun Fl_Menu_Item_draw_with_t as drawWithT' { id `Ptr ()',`Int',`Int',`Int',`Int',id `Ptr ()',cFromBool `Bool' } -> `()' #}
instance (Parent a MenuPrimBase, impl ~ (Rectangle -> Ref a -> Bool ->  IO ())) => Op (DrawWithT ()) MenuItemBase orig impl where
  runOp _ _ menu_item rectangle menu' selected =
    let (x_pos', y_pos', width', height') = fromRectangle rectangle in
    withRef menu_item $ \menu_itemPtr -> withRef menu' $ \menuPtr -> drawWithT' menu_itemPtr x_pos' y_pos' width' height' menuPtr selected

drawMenuItemBase :: Parent a MenuPrimBase => Ref MenuItemBase -> Rectangle -> Ref a ->  IO ()
drawMenuItemBase menu_item rectangle menu' =
  let (x_pos', y_pos', width', height') = fromRectangle rectangle in
  withRef menu_item $ \menu_itemPtr ->
  withRef menu' $ \menuPtr -> draw' menu_itemPtr x_pos' y_pos' width' height' menuPtr

{# fun Fl_DerivedMenu_Item_draw as draw' { id `Ptr ()',`Int',`Int',`Int',`Int',id `Ptr ()' } -> `()' #}
instance (Parent a MenuPrim, impl ~ (Rectangle -> Ref a ->  IO ())) => Op (Draw ()) MenuItemBase orig impl where
  runOp _ _ menu_item rectangle menu' =
    let (x_pos', y_pos', width', height') = fromRectangle rectangle in
    withRef menu_item $ \menu_itemPtr ->
    withRef menu' $ \menuPtr -> draw' menu_itemPtr x_pos' y_pos' width' height' menuPtr

{# fun Fl_Menu_Item_flags as flags' { id `Ptr ()' } -> `Int' #}
instance (impl ~  IO (Maybe MenuItemFlags)) => Op (GetFlags ()) MenuItemBase orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> flags' menu_itemPtr >>= return . intToMenuItemFlags

{# fun Fl_Menu_Item_set_flags as setFlags' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (MenuItemFlags ->  IO ())) => Op (SetFlags ()) MenuItemBase orig impl where
  runOp _ _ menu_item flags = withRef menu_item $ \menu_itemPtr -> setFlags' menu_itemPtr (menuItemFlagsToInt flags)

{# fun Fl_Menu_Item_text as text' { id `Ptr ()' } -> `CString' #}
instance (impl ~ ( IO T.Text)) => Op (GetText ()) MenuItemBase orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> text' menu_itemPtr >>= cStringToText

{# fun Fl_Menu_Item_pulldown_with_args as pulldownWithArgs' { id `Ptr ()',`Int',`Int',`Int',`Int',id `Ptr ()', id `Ptr ()', id `Ptr ()', fromBool `Bool'} -> `Ptr ()' id #}
instance (Parent a MenuPrimBase, Parent b MenuItemBase, Parent c MenuItemBase, impl ~ (Rectangle -> Maybe (Ref a) -> Maybe (Ref b) -> Maybe (Ref c) -> Maybe Bool -> IO (Maybe (Ref MenuItemBase)))) => Op (Pulldown ()) MenuItemBase orig impl where
  runOp _ _ menu_item rectangle picked' template_menu title menu_barFlag =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
        menu_bar = maybe False id menu_barFlag
    in
     withRef menu_item $ \menu_itemPtr ->
     withMaybeRef picked' $ \pickedPtr ->
     withMaybeRef template_menu $ \template_menuPtr ->
     withMaybeRef title $ \titlePtr ->
     pulldownWithArgs' menu_itemPtr x_pos y_pos width height pickedPtr template_menuPtr titlePtr menu_bar >>= toMaybeRef

{# fun Fl_Menu_Item_popup_with_args as popupWithArgs' { id `Ptr ()',`Int',`Int', id `Ptr CChar' , id `Ptr ()', id `Ptr ()'} -> `Ptr ()' id #}
instance (Parent a MenuItemBase, Parent b MenuPrimBase, Parent c MenuItemBase, impl ~ (Position -> Maybe T.Text -> Maybe (Ref a) -> Maybe (Ref b) -> IO (Maybe (Ref c)))) => Op (Popup ()) MenuItemBase orig impl where
  runOp _ _ menu_item (Position (X x_pos) (Y y_pos)) title picked' template_menu =
    withRef menu_item $ \menu_itemPtr ->
    withMaybeRef picked' $ \pickedPtr ->
    withMaybeRef template_menu $ \template_menuPtr ->
    maybeNew copyTextToCString title >>= \titlePtr ->
    popupWithArgs' menu_itemPtr x_pos y_pos titlePtr pickedPtr template_menuPtr >>= toMaybeRef

{# fun Fl_Menu_Item_test_shortcut as testShortcut' { id `Ptr ()' } -> `Ptr ()' id #}
instance (Parent a MenuItemBase, impl ~ ( IO (Maybe (Ref a)))) => Op (TestShortcut ()) MenuItemBase orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> testShortcut' menu_itemPtr >>= toMaybeRef

{# fun Fl_Menu_Item_find_shortcut_with_ip_require_alt as findShortcutWithIpRequireAlt' { id `Ptr ()',id `Ptr CInt',`Bool' } -> `Ptr ()' id #}
instance (Parent a MenuItemBase, impl ~ (Maybe AtIndex -> Bool -> IO (Maybe (Ref a)))) => Op (FindShortcut ()) MenuItemBase orig impl where
  runOp _ _ menu_item index' require_alt =
    withRef menu_item $ \menu_itemPtr ->
        maybeNew (new . fromIntegral) (fmap (\(AtIndex i) -> i) index') >>= \index_Ptr ->
            findShortcutWithIpRequireAlt' menu_itemPtr index_Ptr require_alt >>= toMaybeRef

{# fun Fl_Menu_Item_do_callback as doCallback' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (impl ~ (Ref Widget  ->  IO ())) => Op (DoCallback ()) MenuItemBase orig impl where
  runOp _ _ menu_item o = withRef menu_item $ \menu_itemPtr -> withRef o $ \oPtr -> doCallback' menu_itemPtr oPtr

addMenuItem ::
  (Parent menuItem MenuItemBase) =>
  Either (Ref MenuPrimBase) (Ref MenuItemBase) ->
  T.Text ->
  Maybe Shortcut ->
  Maybe (Ref menuItem -> IO ()) ->
  MenuItemFlags ->
  (Ptr () -> CString -> CInt -> FunPtr CallbackWithUserDataPrim -> Int -> IO Int) ->
  (Ptr () -> CString -> CString -> FunPtr CallbackWithUserDataPrim -> Int -> IO Int) ->
  IO (AtIndex)
addMenuItem refMenuOrMenuItem name shortcut cb flags addWithFlags addWithShortcutnameFlags =
     either
       (\menu -> withRef menu $ \menuPtr ->
           go "Menu_.add: Shortcut format string cannot be empty" menuPtr)
       (\menuItem -> withRef menuItem $ \menuItemPtr ->
           go "MenuItem.add: Shortcut format string cannot be empty" menuItemPtr)
       refMenuOrMenuItem
    where
      go :: String -> Ptr () -> IO AtIndex
      go errorMsg menu_Ptr = do
        let combinedFlags = menuItemFlagsToInt flags
        ptr <- maybe (return (castPtrToFunPtr nullPtr)) toCallbackPrim cb
        idx' <- case shortcut of
                 Just s' -> case s' of
                   KeySequence (ShortcutKeySequence modifiers char) -> do
                     nameString <- copyTextToCString name
                     addWithFlags
                      menu_Ptr
                      nameString
                      (keySequenceToCInt modifiers char)
                      (castFunPtr ptr)
                      combinedFlags
                   KeyFormat format' ->
                     if (not $ T.null format') then do
                       nameString <- copyTextToCString name
                       formatString <- copyTextToCString format'
                       addWithShortcutnameFlags
                         menu_Ptr
                         nameString
                         formatString
                         (castFunPtr ptr)
                         combinedFlags
                     else error errorMsg
                 Nothing -> do
                     nameString <- copyTextToCString name
                     addWithFlags
                      menu_Ptr
                      nameString
                      0
                      (castFunPtr ptr)
                      combinedFlags
        return (AtIndex idx')

{# fun Fl_Menu_Item_insert_with_flags as insertWithFlags' { id `Ptr ()',`Int', `CString',id `CInt',id `FunPtr CallbackWithUserDataPrim',`Int'} -> `Int' #}
{# fun Fl_Menu_Item_add_with_flags as addWithFlags' { id `Ptr ()', `CString',id `CInt',id `FunPtr CallbackWithUserDataPrim',`Int'} -> `Int' #}
{# fun Fl_Menu_Item_add_with_shortcutname_flags as addWithShortcutnameFlags' { id `Ptr ()', `CString', `CString',id `FunPtr CallbackWithUserDataPrim',`Int' } -> `Int' #}
instance (Parent a MenuItemBase, impl ~ (T.Text -> Maybe Shortcut -> Maybe (Ref a -> IO ()) -> MenuItemFlags -> IO (AtIndex))) => Op (Add ()) MenuItemBase orig impl where
  runOp _ _ menu_item name shortcut cb flags =
    addMenuItem (Right menu_item) name shortcut cb flags addWithFlags' addWithShortcutnameFlags'

instance (Parent a MenuItemBase, impl ~ (AtIndex -> T.Text -> Maybe ShortcutKeySequence -> (Ref a -> IO ()) -> MenuItemFlags -> IO (AtIndex))) => Op (Insert ()) MenuItemBase orig impl where
  runOp _ _ menu_item (AtIndex index') name ks cb flags =
    withRef menu_item $ \menu_itemPtr ->
      let combinedFlags = menuItemFlagsToInt flags
          shortcutCode = maybe 0 (\(ShortcutKeySequence modifiers char) -> keySequenceToCInt modifiers char ) ks
      in do
        ptr <- toCallbackPrim cb
        nameString <- copyTextToCString name
        idx' <- insertWithFlags'
                 menu_itemPtr
                 index'
                 nameString
                 shortcutCode
                 (castFunPtr ptr)
                 combinedFlags
        return (AtIndex idx')

{# fun Fl_Menu_Item_size as size' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetSize ()) MenuItemBase orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> size' menu_itemPtr


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.MenuItem"
-- @

-- $functions
-- @
-- activate :: 'Ref' 'MenuItemBase' -> 'IO' ()
--
-- active :: 'Ref' 'MenuItemBase' -> 'IO' ('Bool')
--
-- activevisible :: 'Ref' 'MenuItemBase' -> 'IO' ('Bool')
--
-- add:: ('Parent' a 'MenuItemBase') => 'Ref' 'MenuItemBase' -> 'T.Text' -> 'Maybe' 'Shortcut' -> 'Maybe' ('Ref' a -> 'IO' ()) -> 'MenuItemFlags' -> 'IO' ('AtIndex')
--
-- checkbox :: 'Ref' 'MenuItemBase' -> 'IO' ('Bool')
--
-- clear :: 'Ref' 'MenuItemBase' -> 'IO' ()
--
-- deactivate :: 'Ref' 'MenuItemBase' -> 'IO' ()
--
-- destroy :: 'Ref' 'MenuItemBase' -> 'IO' ()
--
-- doCallback :: 'Ref' 'MenuItemBase' -> 'Ref' 'Widget' -> 'IO' ()
--
-- draw:: ('Parent' a 'MenuPrim') => 'Ref' 'MenuItemBase' -> 'Rectangle' -> 'Ref' a -> 'IO' ()
--
-- drawWithT:: ('Parent' a 'MenuPrimBase') => 'Ref' 'MenuItemBase' -> 'Rectangle' -> 'Ref' a -> 'Bool' -> 'IO' ()
--
-- findShortcut:: ('Parent' a 'MenuItemBase') => 'Ref' 'MenuItemBase' -> 'Maybe' 'AtIndex' -> 'Bool' -> 'IO' ('Maybe' ('Ref' a))
--
-- getCallback :: 'Ref' 'MenuItemBase' -> 'IO' ('FunPtr' 'CallbackWithUserDataPrim')
--
-- getFirst :: 'Ref' 'MenuItemBase' -> 'IO' ('Maybe' ('Ref' 'MenuItemBase'))
--
-- getFlags :: 'Ref' 'MenuItemBase' -> 'IO' ('Maybe' 'MenuItemFlags')
--
-- getLabel :: 'Ref' 'MenuItemBase' -> 'IO' 'T.Text'
--
-- getLabelcolor :: 'Ref' 'MenuItemBase' -> 'IO' ('Color')
--
-- getLabelfont :: 'Ref' 'MenuItemBase' -> 'IO' ('Font')
--
-- getLabelsize :: 'Ref' 'MenuItemBase' -> 'IO' ('FontSize')
--
-- getLabeltype :: 'Ref' 'MenuItemBase' -> 'IO' ('Labeltype')
--
-- getShortcut :: 'Ref' 'MenuItemBase' -> 'IO' ('Maybe' 'ShortcutKeySequence')
--
-- getSize :: 'Ref' 'MenuItemBase' -> 'IO' ('Int')
--
-- getText :: 'Ref' 'MenuItemBase' -> 'IO' 'T.Text'
--
-- getValue :: 'Ref' 'MenuItemBase' -> 'IO' ('Bool')
--
-- hide :: 'Ref' 'MenuItemBase' -> 'IO' ()
--
-- insert:: ('Parent' a 'MenuItemBase') => 'Ref' 'MenuItemBase' -> 'AtIndex' -> 'T.Text' -> 'Maybe' 'ShortcutKeySequence' -> ('Ref' a -> 'IO' ()) -> 'MenuItemFlags' -> 'IO' ('AtIndex')
--
-- measure:: ('Parent' a 'MenuPrimBase') => 'Ref' 'MenuItemBase' -> 'Ref' a -> 'IO' ('Size')
--
-- next :: 'Ref' 'MenuItemBase' -> 'IO' ('Maybe' ('Ref' 'MenuItemBase'))
--
-- nextWithStep:: ('Parent' a 'MenuItemBase') => 'Ref' 'MenuItemBase' -> 'Int' -> 'IO' ('Maybe' ('Ref' a))
--
-- popup:: ('Parent' a 'MenuItemBase', 'Parent' b 'MenuPrimBase', 'Parent' c 'MenuItemBase') => 'Ref' 'MenuItemBase' -> 'Position' -> 'Maybe' 'T.Text' -> 'Maybe' ('Ref' a) -> 'Maybe' ('Ref' b) -> 'IO' ('Maybe' ('Ref' c))
--
-- pulldown:: ('Parent' a 'MenuPrimBase', 'Parent' b 'MenuItemBase', 'Parent' c 'MenuItemBase') => 'Ref' 'MenuItemBase' -> 'Rectangle' -> 'Maybe' ('Ref' a) -> 'Maybe' ('Ref' b) -> 'Maybe' ('Ref' c) -> 'Maybe' 'Bool' -> 'IO' ('Maybe' ('Ref' 'MenuItemBase'))
--
-- radio :: 'Ref' 'MenuItemBase' -> 'IO' ('Bool')
--
-- set :: 'Ref' 'MenuItemBase' -> 'IO' ()
--
-- setCallback :: 'Ref' 'MenuItemBase' -> ('Ref' orig -> 'IO' ()) -> 'IO' ()
--
-- setFlags :: 'Ref' 'MenuItemBase' -> 'MenuItemFlags' -> 'IO' ()
--
-- setLabel :: 'Ref' 'MenuItemBase' -> 'T.Text' -> 'IO' ()
--
-- setLabelWithLabeltype :: 'Ref' 'MenuItemBase' -> 'Labeltype' -> 'T.Text' -> 'IO' ()
--
-- setLabelcolor :: 'Ref' 'MenuItemBase' -> 'Color' -> 'IO' ()
--
-- setLabelfont :: 'Ref' 'MenuItemBase' -> 'Font' -> 'IO' ()
--
-- setLabelsize :: 'Ref' 'MenuItemBase' -> 'FontSize' -> 'IO' ()
--
-- setLabeltype :: 'Ref' 'MenuItemBase' -> 'Labeltype' -> 'IO' ()
--
-- setShortcut :: 'Ref' 'MenuItemBase' -> 'ShortcutKeySequence' -> 'IO' ()
--
-- setonly :: 'Ref' 'MenuItemBase' -> 'IO' ()
--
-- showWidget :: 'Ref' 'MenuItemBase' -> 'IO' ()
--
-- submenu :: 'Ref' 'MenuItemBase' -> 'IO' ('Bool')
--
-- testShortcut:: ('Parent' a 'MenuItemBase') => 'Ref' 'MenuItemBase' -> 'IO' ('Maybe' ('Ref' a))
--
-- visible :: 'Ref' 'MenuItemBase' -> 'IO' ('Bool')
-- @
