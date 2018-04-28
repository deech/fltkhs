{-# LANGUAGE OverloadedStrings, CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.MenuItem
  (
   menuItemNew,
   addMenuItem,
   MenuItemName(..),
   MenuItemPointer(..),
   MenuItemReference(..),
   MenuItemLocator(..)
   -- * Hierarchy
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
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T

data MenuItemPointer = forall a. (Parent a MenuItem) => MenuItemPointer (Ref a)
newtype MenuItemName = MenuItemName T.Text
data MenuItemReference = MenuItemByIndex AtIndex | MenuItemByPointer MenuItemPointer
data MenuItemLocator = MenuItemPointerLocator MenuItemPointer | MenuItemNameLocator MenuItemName

{# fun Fl_Menu_Item_New as new' { } -> `Ptr ()' id #}
menuItemNew :: IO (Ref MenuItem)
menuItemNew = new' >>= toRef

{# fun Fl_Menu_Item_Destroy as destroy' { id `Ptr ()' } -> `()' id #}
instance (impl ~ IO ()) => Op (Destroy ()) MenuItem orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> destroy' menu_itemPtr

{# fun Fl_Menu_Item_next_with_step as nextWithStep' { id `Ptr ()',`Int' } -> `Ptr ()' id #}
instance (Parent a MenuItem, impl ~ (Int -> IO (Maybe (Ref a)))) => Op (NextWithStep ()) MenuItem orig impl where
  runOp _ _ menu_item step =
    withRef menu_item $ \menu_itemPtr -> nextWithStep' menu_itemPtr step >>= toMaybeRef

{# fun Fl_Menu_Item_next as next' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~  IO (Maybe (Ref MenuItem))) => Op (Next ()) MenuItem orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> next' menu_itemPtr >>= toMaybeRef

{# fun Fl_Menu_Item_first as first' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~  IO (Maybe (Ref MenuItem))) => Op (GetFirst ()) MenuItem orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> first' menu_itemPtr >>=toMaybeRef

{# fun Fl_Menu_Item_label as label' { id `Ptr ()' } -> `T.Text' unsafeFromCString #}
instance (impl ~  IO T.Text) => Op (GetLabel ()) MenuItem orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> label' menu_itemPtr

{# fun Fl_Menu_Item_set_label as setLabel' { id `Ptr ()', unsafeToCString `T.Text' } -> `()' #}
instance (impl ~ (T.Text ->  IO ())) => Op (SetLabel ()) MenuItem orig impl where
  runOp _ _ menu_item a = withRef menu_item $ \menu_itemPtr -> setLabel' menu_itemPtr a

{# fun Fl_Menu_Item_set_label_with_labeltype as setLabelWithLabeltype' { id `Ptr ()',cFromEnum `Labeltype', unsafeToCString `T.Text' } -> `()' #}
instance (impl ~ (Labeltype -> T.Text ->  IO ())) => Op (SetLabelWithLabeltype ()) MenuItem orig impl where
  runOp _ _ menu_item labeltype b = withRef menu_item $ \menu_itemPtr -> setLabelWithLabeltype' menu_itemPtr labeltype b

{# fun Fl_Menu_Item_labeltype as labeltype' { id `Ptr ()' } -> `Labeltype' cToEnum #}
instance (impl ~  IO (Labeltype)) => Op (GetLabeltype ()) MenuItem orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> labeltype' menu_itemPtr

{# fun Fl_Menu_Item_set_labeltype as setLabeltype' { id `Ptr ()',cFromEnum `Labeltype' } -> `()' #}
instance (impl ~ (Labeltype ->  IO ())) => Op (SetLabeltype ()) MenuItem orig impl where
  runOp _ _ menu_item a = withRef menu_item $ \menu_itemPtr -> setLabeltype' menu_itemPtr a

{# fun Fl_Menu_Item_labelcolor as labelcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~  IO (Color)) => Op (GetLabelcolor ()) MenuItem orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> labelcolor' menu_itemPtr

{# fun Fl_Menu_Item_set_labelcolor as setLabelcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetLabelcolor ()) MenuItem orig impl where
  runOp _ _ menu_item a = withRef menu_item $ \menu_itemPtr -> setLabelcolor' menu_itemPtr a

{# fun Fl_Menu_Item_labelfont as labelfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~  IO (Font)) => Op (GetLabelfont ()) MenuItem orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> labelfont' menu_itemPtr

{# fun Fl_Menu_Item_set_labelfont as setLabelfont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
instance (impl ~ (Font ->  IO ())) => Op (SetLabelfont ()) MenuItem orig impl where
  runOp _ _ menu_item a = withRef menu_item $ \menu_itemPtr -> setLabelfont' menu_itemPtr a

{# fun Fl_Menu_Item_labelsize as labelsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~  IO (FontSize)) => Op (GetLabelsize ()) MenuItem orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> labelsize' menu_itemPtr >>= return . FontSize

{# fun Fl_Menu_Item_set_labelsize as setLabelsize' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ())) => Op (SetLabelsize ()) MenuItem  orig impl where
  runOp _ _ menu_item (FontSize pix) = withRef menu_item $ \menu_itemPtr -> setLabelsize' menu_itemPtr pix

{# fun Fl_Menu_Item_set_callback as setCallback' { id `Ptr ()', id `FunPtr CallbackWithUserDataPrim'} -> `()' #}
instance (impl ~ ((Ref orig -> IO ()) -> IO ()) ) => Op (SetCallback ()) MenuItem orig impl where
  runOp _ _ menu_item c = withRef menu_item $ \menu_itemPtr -> do
                                    ptr <- toCallbackPrim c
                                    setCallback' menu_itemPtr (castFunPtr ptr)

{# fun Fl_Menu_Item_shortcut as shortcut' { id `Ptr ()' } -> `CInt' #}
instance (impl ~  IO (Maybe ShortcutKeySequence)) => Op (GetShortcut ()) MenuItem orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> shortcut' menu_itemPtr >>= return . cIntToKeySequence

{# fun Fl_Menu_Item_set_shortcut as setShortcut' { id `Ptr ()',id `CInt' } -> `()' #}
instance (impl ~ (ShortcutKeySequence ->  IO ())) => Op (SetShortcut ()) MenuItem orig impl where
  runOp _ _ input (ShortcutKeySequence modifiers char) =
    withRef input $ \inputPtr -> setShortcut' inputPtr (keySequenceToCInt modifiers char)

{# fun Fl_Menu_Item_submenu as submenu' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~  IO (Bool)) => Op (Submenu ()) MenuItem orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> submenu' menu_itemPtr

{# fun Fl_Menu_Item_checkbox as checkbox' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~  IO (Bool)) => Op (Checkbox ()) MenuItem orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> checkbox' menu_itemPtr

{# fun Fl_Menu_Item_radio as radio' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~  IO (Bool)) => Op (Radio ()) MenuItem orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> radio' menu_itemPtr

{# fun Fl_Menu_Item_value as value' { id `Ptr ()' } -> `Int' #}
instance (impl ~  IO (Int)) => Op (GetValue ()) MenuItem orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> value' menu_itemPtr

{# fun Fl_Menu_Item_set as set' { id `Ptr ()' } -> `()' #}
instance (impl ~  IO ()) => Op (Set ()) MenuItem orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> set' menu_itemPtr

{# fun Fl_Menu_Item_clear as clear' { id `Ptr ()' } -> `()' #}
instance (impl ~  IO ()) => Op (Clear ()) MenuItem orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> clear' menu_itemPtr

{# fun Fl_Menu_Item_setonly as setonly' { id `Ptr ()' } -> `()' #}
instance (impl ~  IO ()) => Op (Setonly ()) MenuItem orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> setonly' menu_itemPtr

{# fun Fl_Menu_Item_visible as visible' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~  IO (Bool)) => Op (Visible ()) MenuItem orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> visible' menu_itemPtr

{# fun Fl_Menu_Item_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~  IO ()) => Op (ShowWidget ()) MenuItem orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> show' menu_itemPtr

{# fun Fl_Menu_Item_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~  IO ()) => Op (Hide ()) MenuItem orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> hide' menu_itemPtr

{# fun Fl_Menu_Item_active as active' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~  IO (Bool)) => Op (Active ()) MenuItem orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> active' menu_itemPtr

{# fun Fl_Menu_Item_activate as activate' { id `Ptr ()' } -> `()' #}
instance (impl ~  IO ()) => Op (Activate ()) MenuItem orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> activate' menu_itemPtr

{# fun Fl_Menu_Item_deactivate as deactivate' { id `Ptr ()' } -> `()' #}
instance (impl ~  IO ()) => Op (Deactivate ()) MenuItem orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> deactivate' menu_itemPtr

{# fun Fl_Menu_Item_activevisible as activevisible' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~  IO (Bool)) => Op (Activevisible ()) MenuItem orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> activevisible' menu_itemPtr

{# fun Fl_Menu_Item_measure as measure' { id `Ptr ()',alloca- `Int' peekIntConv*,id `Ptr ()' } -> `Int' #}
instance (Parent a MenuPrim, impl ~ (Ref a ->  IO (Size))) => Op (Measure ()) MenuItem orig impl where
  runOp _ _ menu_item menu' = withRef menu_item $ \menu_itemPtr -> withRef menu' $ \menuPtr -> measure' menu_itemPtr menuPtr >>= \(h', w') -> return (Size (Width w') (Height h'))

{# fun Fl_Menu_Item_draw_with_t as drawWithT' { id `Ptr ()',`Int',`Int',`Int',`Int',id `Ptr ()',cFromBool `Bool' } -> `()' #}
instance (Parent a MenuPrim, impl ~ (Rectangle -> Ref a -> Bool ->  IO ())) => Op (DrawWithT ()) MenuItem orig impl where
  runOp _ _ menu_item rectangle menu' selected =
    let (x_pos', y_pos', width', height') = fromRectangle rectangle in
    withRef menu_item $ \menu_itemPtr -> withRef menu' $ \menuPtr -> drawWithT' menu_itemPtr x_pos' y_pos' width' height' menuPtr selected

{# fun Fl_Menu_Item_draw as draw' { id `Ptr ()',`Int',`Int',`Int',`Int',id `Ptr ()' } -> `()' #}
instance (Parent a MenuPrim, impl ~ (Rectangle -> Ref a ->  IO ())) => Op (Draw ()) MenuItem orig impl where
  runOp _ _ menu_item rectangle menu' =
    let (x_pos', y_pos', width', height') = fromRectangle rectangle in
    withRef menu_item $ \menu_itemPtr ->
    withRef menu' $ \menuPtr -> draw' menu_itemPtr x_pos' y_pos' width' height' menuPtr

{# fun Fl_Menu_Item_flags as flags' { id `Ptr ()' } -> `Int' #}
instance (impl ~  IO (Maybe MenuItemFlags)) => Op (GetFlags ()) MenuItem orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> flags' menu_itemPtr >>= return . intToMenuItemFlags

{# fun Fl_Menu_Item_set_flags as setFlags' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (MenuItemFlags ->  IO ())) => Op (SetFlags ()) MenuItem orig impl where
  runOp _ _ menu_item flags = withRef menu_item $ \menu_itemPtr -> setFlags' menu_itemPtr (menuItemFlagsToInt flags)

{# fun Fl_Menu_Item_text as text' { id `Ptr ()' } -> `T.Text' unsafeFromCString #}
instance (impl ~ ( IO T.Text)) => Op (GetText ()) MenuItem orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> text' menu_itemPtr

{# fun Fl_Menu_Item_pulldown_with_args as pulldownWithArgs' { id `Ptr ()',`Int',`Int',`Int',`Int',id `Ptr ()', id `Ptr ()', id `Ptr ()', fromBool `Bool'} -> `Ptr ()' id #}
instance (Parent a MenuPrim, Parent b MenuItem, Parent c MenuItem, impl ~ (Rectangle -> Maybe (Ref a) -> Maybe (Ref b) -> Maybe (Ref c) -> Maybe Bool -> IO (Maybe (Ref MenuItem)))) => Op (Pulldown ()) MenuItem orig impl where
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
instance (Parent a MenuItem, Parent b MenuPrim, Parent c MenuItem, impl ~ (Position -> Maybe T.Text -> Maybe (Ref a) -> Maybe (Ref b) -> IO (Maybe (Ref c)))) => Op (Popup ()) MenuItem orig impl where
  runOp _ _ menu_item (Position (X x_pos) (Y y_pos)) title picked' template_menu =
    withRef menu_item $ \menu_itemPtr ->
    withMaybeRef picked' $ \pickedPtr ->
    withMaybeRef template_menu $ \template_menuPtr ->
    maybeNew copyTextToCString title >>= \titlePtr ->
    popupWithArgs' menu_itemPtr x_pos y_pos titlePtr pickedPtr template_menuPtr >>= toMaybeRef

{# fun Fl_Menu_Item_test_shortcut as testShortcut' { id `Ptr ()' } -> `Ptr ()' id #}
instance (Parent a MenuItem, impl ~ ( IO (Maybe (Ref a)))) => Op (TestShortcut ()) MenuItem orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> testShortcut' menu_itemPtr >>= toMaybeRef

{# fun Fl_Menu_Item_find_shortcut_with_ip_require_alt as findShortcutWithIpRequireAlt' { id `Ptr ()',id `Ptr CInt',`Bool' } -> `Ptr ()' id #}
instance (Parent a MenuItem, impl ~ (Maybe AtIndex -> Bool -> IO (Maybe (Ref a)))) => Op (FindShortcut ()) MenuItem orig impl where
  runOp _ _ menu_item index' require_alt =
    withRef menu_item $ \menu_itemPtr ->
        maybeNew (new . fromIntegral) (fmap (\(AtIndex i) -> i) index') >>= \index_Ptr ->
            findShortcutWithIpRequireAlt' menu_itemPtr index_Ptr require_alt >>= toMaybeRef

{# fun Fl_Menu_Item_do_callback as doCallback' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (impl ~ (Ref Widget  ->  IO ())) => Op (DoCallback ()) MenuItem orig impl where
  runOp _ _ menu_item o = withRef menu_item $ \menu_itemPtr -> withRef o $ \oPtr -> doCallback' menu_itemPtr oPtr

addMenuItem ::
  (Parent menuItem MenuItem) =>
  Either (Ref MenuPrim) (Ref MenuItem) ->
  T.Text ->
  Maybe Shortcut ->
  Maybe (Ref menuItem -> IO ()) ->
  MenuItemFlags ->
  (Ptr () -> T.Text -> CInt -> FunPtr CallbackWithUserDataPrim -> Int -> IO Int) ->
  (Ptr () -> T.Text -> T.Text -> FunPtr CallbackWithUserDataPrim -> Int -> IO Int) ->
  IO (AtIndex)
addMenuItem refMenuOrMenuItem name shortcut cb flags addWithFlags addWithShortcutnameFlags =
     either
       (\menu -> withRef menu (go "Menu_.add: Shortcut format string cannot be empty" ))
       (\menuItem -> withRef menuItem (go "MenuItem.add: Shortcut format string cannot be empty"))
       refMenuOrMenuItem
    where
      go :: String -> Ptr () -> IO AtIndex
      go errorMsg menu_Ptr = do
        let combinedFlags = menuItemFlagsToInt flags
        ptr <- maybe (return (castPtrToFunPtr nullPtr)) toCallbackPrim cb
        idx' <- case shortcut of
                 Just s' -> case s' of
                   KeySequence (ShortcutKeySequence modifiers char) ->
                     addWithFlags
                      menu_Ptr
                      name
                      (keySequenceToCInt modifiers char)
                      (castFunPtr ptr)
                      combinedFlags
                   KeyFormat format' ->
                     if (not $ T.null format') then
                       addWithShortcutnameFlags
                       menu_Ptr
                       name
                       format'
                       (castFunPtr ptr)
                       combinedFlags
                     else error errorMsg
                 Nothing ->
                     addWithFlags
                      menu_Ptr
                      name
                      0
                      (castFunPtr ptr)
                      combinedFlags
        return (AtIndex idx')

{# fun Fl_Menu_Item_insert_with_flags as insertWithFlags' { id `Ptr ()',`Int', unsafeToCString `T.Text',id `CInt',id `FunPtr CallbackWithUserDataPrim',`Int'} -> `Int' #}
{# fun Fl_Menu_Item_add_with_flags as addWithFlags' { id `Ptr ()', unsafeToCString `T.Text',id `CInt',id `FunPtr CallbackWithUserDataPrim',`Int'} -> `Int' #}
{# fun Fl_Menu_Item_add_with_shortcutname_flags as addWithShortcutnameFlags' { id `Ptr ()', unsafeToCString `T.Text', unsafeToCString `T.Text',id `FunPtr CallbackWithUserDataPrim',`Int' } -> `Int' #}
instance (Parent a MenuItem, impl ~ (T.Text -> Maybe Shortcut -> Maybe (Ref a -> IO ()) -> MenuItemFlags -> IO (AtIndex))) => Op (Add ()) MenuItem orig impl where
  runOp _ _ menu_item name shortcut cb flags =
    addMenuItem (Right menu_item) name shortcut cb flags addWithFlags' addWithShortcutnameFlags'

instance (Parent a MenuItem, impl ~ (AtIndex -> T.Text -> Maybe ShortcutKeySequence -> (Ref a -> IO ()) -> MenuItemFlags -> IO (AtIndex))) => Op (Insert ()) MenuItem orig impl where
  runOp _ _ menu_item (AtIndex index') name ks cb flags =
    withRef menu_item $ \menu_itemPtr ->
      let combinedFlags = menuItemFlagsToInt flags
          shortcutCode = maybe 0 (\(ShortcutKeySequence modifiers char) -> keySequenceToCInt modifiers char ) ks
      in do
        ptr <- toCallbackPrim cb
        idx' <- insertWithFlags'
                 menu_itemPtr
                 index'
                 name
                 shortcutCode
                 (castFunPtr ptr)
                 combinedFlags
        return (AtIndex idx')

{# fun Fl_Menu_Item_size as size' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetSize ()) MenuItem orig impl where
  runOp _ _ menu_item = withRef menu_item $ \menu_itemPtr -> size' menu_itemPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.MenuItem"
-- @
-- $functions
-- @
-- activate :: 'Ref' 'MenuItem' -> 'IO' ()
--
-- active :: 'Ref' 'MenuItem' -> 'IO' ('Bool')
--
-- activevisible :: 'Ref' 'MenuItem' -> 'IO' ('Bool')
--
-- add:: ('Parent' a 'MenuItem') => 'Ref' 'MenuItem' -> 'T.Text' -> 'Maybe' 'Shortcut' -> 'Maybe' ('Ref' a -> 'IO' ()) -> 'MenuItemFlags' -> 'IO' ('AtIndex')
--
-- checkbox :: 'Ref' 'MenuItem' -> 'IO' ('Bool')
--
-- clear :: 'Ref' 'MenuItem' -> 'IO' ()
--
-- deactivate :: 'Ref' 'MenuItem' -> 'IO' ()
--
-- destroy :: 'Ref' 'MenuItem' -> 'IO' ()
--
-- doCallback :: 'Ref' 'MenuItem' -> 'Ref' 'Widget' -> 'IO' ()
--
-- draw:: ('Parent' a 'MenuPrim') => 'Ref' 'MenuItem' -> 'Rectangle' -> 'Ref' a -> 'IO' ()
--
-- drawWithT:: ('Parent' a 'MenuPrim') => 'Ref' 'MenuItem' -> 'Rectangle' -> 'Ref' a -> 'Bool' -> 'IO' ()
--
-- findShortcut:: ('Parent' a 'MenuItem') => 'Ref' 'MenuItem' -> 'Maybe' 'AtIndex' -> 'Bool' -> 'IO' ('Maybe' ('Ref' a))
--
-- getFirst :: 'Ref' 'MenuItem' -> 'IO' ('Maybe' ('Ref' 'MenuItem'))
--
-- getFlags :: 'Ref' 'MenuItem' -> 'IO' ('Maybe' 'MenuItemFlags')
--
-- getLabel :: 'Ref' 'MenuItem' -> 'IO' 'T.Text'
--
-- getLabelcolor :: 'Ref' 'MenuItem' -> 'IO' ('Color')
--
-- getLabelfont :: 'Ref' 'MenuItem' -> 'IO' ('Font')
--
-- getLabelsize :: 'Ref' 'MenuItem' -> 'IO' ('FontSize')
--
-- getLabeltype :: 'Ref' 'MenuItem' -> 'IO' ('Labeltype')
--
-- getShortcut :: 'Ref' 'MenuItem' -> 'IO' ('Maybe' 'ShortcutKeySequence')
--
-- getSize :: 'Ref' 'MenuItem' -> 'IO' ('Int')
--
-- getText :: 'Ref' 'MenuItem' -> 'IO' 'T.Text'
--
-- getValue :: 'Ref' 'MenuItem' -> 'IO' ('Int')
--
-- hide :: 'Ref' 'MenuItem' -> 'IO' ()
--
-- insert:: ('Parent' a 'MenuItem') => 'Ref' 'MenuItem' -> 'AtIndex' -> 'T.Text' -> 'Maybe' 'ShortcutKeySequence' -> ('Ref' a -> 'IO' ()) -> 'MenuItemFlags' -> 'IO' ('AtIndex')
--
-- measure:: ('Parent' a 'MenuPrim') => 'Ref' 'MenuItem' -> 'Ref' a -> 'IO' ('Size')
--
-- next :: 'Ref' 'MenuItem' -> 'IO' ('Maybe' ('Ref' 'MenuItem'))
--
-- nextWithStep:: ('Parent' a 'MenuItem') => 'Ref' 'MenuItem' -> 'Int' -> 'IO' ('Maybe' ('Ref' a))
--
-- popup:: ('Parent' a 'MenuItem', 'Parent' b 'MenuPrim', 'Parent' c 'MenuItem') => 'Ref' 'MenuItem' -> 'Position' -> 'Maybe' 'T.Text' -> 'Maybe' ('Ref' a) -> 'Maybe' ('Ref' b) -> 'IO' ('Maybe' ('Ref' c))
--
-- pulldown:: ('Parent' a 'MenuPrim', 'Parent' b 'MenuItem', 'Parent' c 'MenuItem') => 'Ref' 'MenuItem' -> 'Rectangle' -> 'Maybe' ('Ref' a) -> 'Maybe' ('Ref' b) -> 'Maybe' ('Ref' c) -> 'Maybe' 'Bool' -> 'IO' ('Maybe' ('Ref' 'MenuItem'))
--
-- radio :: 'Ref' 'MenuItem' -> 'IO' ('Bool')
--
-- set :: 'Ref' 'MenuItem' -> 'IO' ()
--
-- setCallback :: 'Ref' 'MenuItem' -> ('Ref' orig -> 'IO' ()) -> 'IO' ()
--
-- setFlags :: 'Ref' 'MenuItem' -> 'MenuItemFlags' -> 'IO' ()
--
-- setLabel :: 'Ref' 'MenuItem' -> 'T.Text' -> 'IO' ()
--
-- setLabelWithLabeltype :: 'Ref' 'MenuItem' -> 'Labeltype' -> 'T.Text' -> 'IO' ()
--
-- setLabelcolor :: 'Ref' 'MenuItem' -> 'Color' -> 'IO' ()
--
-- setLabelfont :: 'Ref' 'MenuItem' -> 'Font' -> 'IO' ()
--
-- setLabelsize :: 'Ref' 'MenuItem' -> 'FontSize' -> 'IO' ()
--
-- setLabeltype :: 'Ref' 'MenuItem' -> 'Labeltype' -> 'IO' ()
--
-- setShortcut :: 'Ref' 'MenuItem' -> 'ShortcutKeySequence' -> 'IO' ()
--
-- setonly :: 'Ref' 'MenuItem' -> 'IO' ()
--
-- showWidget :: 'Ref' 'MenuItem' -> 'IO' ()
--
-- submenu :: 'Ref' 'MenuItem' -> 'IO' ('Bool')
--
-- testShortcut:: ('Parent' a 'MenuItem') => 'Ref' 'MenuItem' -> 'IO' ('Maybe' ('Ref' a))
--
-- visible :: 'Ref' 'MenuItem' -> 'IO' ('Bool')
-- Available in FLTK 1.3.4 only:
--
-- @
