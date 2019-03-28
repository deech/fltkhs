{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.MenuPrim
    (
     menu_New,
     menu_Custom,
     insertMenuItem
   , handleMenuPrimBase
   , resizeMenuPrimBase
   , hideMenuPrimBase
   , showWidgetMenuPrimBase
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
#include "Fl_Menu_C.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)

import Graphics.UI.FLTK.LowLevel.Base.Widget
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Base.MenuItem
import qualified Data.ByteString.Char8 as C
import Control.Exception

{# fun Fl_Menu__New as widgetNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Menu__New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int',`CString'} -> `Ptr ()' id #}
{# fun Fl_OverriddenMenu__New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int',`CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenMenu__New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
menu_Custom :: Rectangle -> Maybe T.Text -> Maybe (CustomWidgetFuncs MenuPrim) -> IO (Ref MenuPrim)
menu_Custom rectangle l' funcs' =
  widgetMaker
    rectangle
    l'
    Nothing
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

menu_New :: Rectangle -> Maybe T.Text -> IO (Ref MenuPrim)
menu_New rectangle l' =
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'


{# fun Fl_Menu__Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) MenuPrimBase orig impl where
  runOp _ _ menu_ = swapRef menu_ $
                          \menu_Ptr ->
                             widgetDestroy' menu_Ptr >>
                             return nullPtr

{# fun Fl_Menu__handle as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleMenuPrimBase :: Ref MenuPrimBase -> Event ->  IO (Either UnknownEvent ())
handleMenuPrimBase menuPrim event = withRef menuPrim $ \menuPrimPtr -> handleSuper' menuPrimPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Menu__resize as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeMenuPrimBase :: Ref MenuPrimBase -> Rectangle -> IO ()
resizeMenuPrimBase menuPrim rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef menuPrim $ \menuPrimPtr -> resizeSuper' menuPrimPtr x_pos y_pos width height
{# fun Fl_Menu__hide as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideMenuPrimBase ::  Ref MenuPrimBase -> IO ()
hideMenuPrimBase menuPrim = withRef menuPrim $ \menuPrimPtr -> hideSuper' menuPrimPtr
{# fun Fl_Menu__show as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetMenuPrimBase ::  Ref MenuPrimBase -> IO ()
showWidgetMenuPrimBase menuPrim = withRef menuPrim $ \menuPrimPtr -> showSuper' menuPrimPtr

{#fun Fl_DerivedMenu__handle as menuPrimHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) MenuPrimBase orig impl where
  runOp _ _ menuPrim event = withRef menuPrim (\p -> menuPrimHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_DerivedMenu__show as show' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (ShowWidget ()) MenuPrimBase orig impl where
  runOp _ _ menuPrim = withRef menuPrim $ \menuPrimPtr -> show' menuPrimPtr
{# fun Fl_DerivedMenu__resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Rectangle -> IO ())) => Op (Resize ()) MenuPrimBase orig impl where
  runOp _ _ menuPrim rectangle = withRef menuPrim $ \menuPrimPtr -> do
    let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
    resize' menuPrimPtr x_pos y_pos w_pos h_pos
{# fun Fl_DerivedMenu__hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Hide ()) MenuPrimBase orig impl where
  runOp _ _ menuPrim = withRef menuPrim $ \menuPrimPtr -> hide' menuPrimPtr

{# fun Fl_Menu__item_pathname_with_finditem as itemPathnameWithFinditem' { id `Ptr ()',id `Ptr CChar',`Int',id `Ptr ()' } -> `Int' #}
{# fun Fl_Menu__item_pathname as itemPathname' { id `Ptr ()',id `Ptr CChar',`Int' } -> `Int' #}
instance (Parent a MenuItemBase, impl ~ (Ref a -> IO (Maybe T.Text))) => Op (ItemPathname ()) MenuPrimBase orig impl where
  runOp _ _ menu_ menu_item' =
    withRef menu_ $
    \ menu_Ref ->
     allocaBytes oneKb $ \ptr -> do
       retVal' <- withRef menu_item' $ \ menu_item'Ref -> itemPathnameWithFinditem' menu_Ref (castPtr ptr) oneKb menu_item'Ref
       if (retVal' == -1)
         then return Nothing
         else do
           b' <- cStringToText ptr
           return $ Just b'
instance (impl ~ (IO (Maybe String))) => Op (ItemPathnameRecent ()) MenuPrimBase orig impl where
  runOp _ _ menu_ =
    withRef menu_ $ \menu_Ptr ->
    allocaBytes oneKb $ \pathPtr -> do
      retVal' <- itemPathname' menu_Ptr (castPtr pathPtr) oneKb
      if (retVal' == -1)
        then return Nothing
        else do
          b' <- C.packCString (castPtr pathPtr)
          return $ Just (C.unpack b')

{# fun Fl_Menu__picked as picked' { id `Ptr ()',id `Ptr ()' } -> `Ptr ()' id #}
instance (Parent a MenuItemBase, Parent b MenuItemBase, impl ~ (Ref a -> IO (Maybe (Ref b)))) => Op (Picked ()) MenuPrimBase orig impl where
  runOp _ _ menu_ item = withRef menu_ $ \menu_Ptr -> withRef item $ \itemPtr -> picked' menu_Ptr itemPtr >>= toMaybeRef
{# fun Fl_Menu__find_index_with_name as findIndexWithName' { id `Ptr ()',`CString' } -> `Int' #}
{# fun Fl_Menu__find_index_with_item as findIndexWithItem' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
instance (impl ~ (MenuItemLocator -> IO (Maybe Int))) => Op (FindIndex ()) MenuPrimBase orig impl where
  runOp _ _ menu_ menu_item_referene =
    withRef menu_ $ \menu_Ptr ->
        case menu_item_referene of
          MenuItemNameLocator (MenuItemName name) -> withText name (\n -> findIndexWithName' menu_Ptr n >>= \r -> if (r == -1) then (return Nothing) else (return $ Just r))
          MenuItemPointerLocator (MenuItemPointer menu_item) ->
              withRef menu_item $ \menu_itemPtr -> findIndexWithItem' menu_Ptr menu_itemPtr >>= \r -> if (r == -1) then (return Nothing) else (return $ Just r)
{# fun Fl_Menu__test_shortcut as testShortcut' { id `Ptr ()' } -> `Ptr ()' id #}
instance (Parent a MenuItemBase, impl ~ ( IO (Maybe (Ref a)))) => Op (TestShortcut ()) MenuPrimBase orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> testShortcut' menu_Ptr >>= toMaybeRef
{# fun Fl_Menu__global as global' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Global ()) MenuPrimBase orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> global' menu_Ptr
{# fun Fl_Menu__get_menu_item_by_index as getMenuItemByIndex' { id `Ptr ()', id `CInt' } -> `Ptr ()' id #}
instance (impl ~ ( IO [(Maybe (Ref MenuItemBase))])) => Op (GetMenu ()) MenuPrimBase orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> do
    n <- getSize menu_
    if (n == 0)
     then return []
     else go menu_Ptr 0 (n-1) []
      where
        go _ _ 0 accum = return accum
        go ptr offset left accum = do
          ref <- getMenuItemByIndex' ptr offset >>= toMaybeRef
          go ptr
             (offset + 1)
             (left - 1)
             (accum ++ [ref])

{# fun Fl_Menu__menu_with_m as menuWithM' { id `Ptr ()',id `Ptr (Ptr ())',`Int' } -> `()' #}
instance (Parent a MenuItemBase, impl ~ ([Ref a] -> IO ())) => Op (SetMenu ()) MenuPrimBase orig impl where
  runOp _ _ menu_ items =
    withRef menu_ $ \menu_Ptr ->
        withRefs items $ \menu_itemsPtr ->
            menuWithM' menu_Ptr menu_itemsPtr (length items)
{# fun Fl_Menu__copy as copy' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a MenuItemBase, impl ~ (Ref a->  IO ())) => Op (Copy ()) MenuPrimBase orig impl where
  runOp _ _ menu_ m = withRef menu_ $ \menu_Ptr -> withRef m $ \mPtr -> copy' menu_Ptr mPtr

insertMenuItem ::
  (Parent a MenuPrimBase) =>
  Ref MenuPrimBase ->
  Int ->
  T.Text ->
  Maybe Shortcut ->
  (Ref a -> IO ()) ->
  MenuItemFlags ->
  (Ptr () -> Int -> CString -> CInt -> FunPtr CallbackWithUserDataPrim -> Int -> IO Int) ->
  (Ptr () -> Int -> CString -> CString -> FunPtr CallbackWithUserDataPrim -> Int -> IO Int) ->
  IO (AtIndex)
insertMenuItem menu_ index' name shortcut cb flags insertWithFlags'' insertWithShortcutnameFlags'' =
  withRef menu_ $ \menu_Ptr -> do
    let combinedFlags = menuItemFlagsToInt flags
    ptr <- toCallbackPrim cb
    idx' <- case shortcut of
              Just s' -> case s' of
                KeySequence (ShortcutKeySequence modifiers char) -> do
                  n <- copyTextToCString name
                  insertWithFlags''
                    menu_Ptr
                    index'
                    n
                    (keySequenceToCInt modifiers char)
                    (castFunPtr ptr)
                    combinedFlags
                KeyFormat format' -> do
                  f <- copyTextToCString format'
                  n <- copyTextToCString name
                  if (not $ T.null format') then
                    insertWithShortcutnameFlags''
                      menu_Ptr
                      index'
                      n
                      f
                      (castFunPtr ptr)
                      combinedFlags
                  else error "Fl_Menu_.menu_insert: shortcut format string cannot be empty"
              Nothing -> do
                n <- copyTextToCString name
                insertWithFlags''
                  menu_Ptr
                  index'
                  n
                  0
                  (castFunPtr ptr)
                  combinedFlags
    return (AtIndex idx')

{# fun Fl_Menu__insert_with_flags as insertWithFlags' { id `Ptr ()',`Int',`CString',id `CInt',id `FunPtr CallbackWithUserDataPrim',`Int'} -> `Int' #}
{# fun Fl_Menu__insert_with_shortcutname_flags as insertWithShortcutnameFlags' { id `Ptr ()',`Int',`CString', `CString',id `FunPtr CallbackWithUserDataPrim',`Int' } -> `Int' #}
instance (Parent a MenuPrimBase, impl ~ ( AtIndex -> T.Text -> Maybe Shortcut -> (Ref a -> IO ()) -> MenuItemFlags -> IO (AtIndex))) => Op (Insert ()) MenuPrimBase orig impl where
  runOp _ _ menu_ (AtIndex index') name shortcut cb flags =
    insertMenuItem menu_ index' name shortcut cb flags insertWithFlags' insertWithShortcutnameFlags'

{# fun Fl_Menu__add_with_name as add' { id `Ptr ()',`CString'} -> `()' #}
instance (impl ~ (T.Text -> IO ())) => Op (AddName ()) MenuPrimBase orig impl where
  runOp _ _ menu_ name' = withRef menu_ $ \menu_Ptr -> copyTextToCString name' >>= add' menu_Ptr
{# fun Fl_Menu__add_with_flags as addWithFlags' { id `Ptr ()',`CString',id `CInt',id `FunPtr CallbackWithUserDataPrim',`Int' } -> `Int' #}
{# fun Fl_Menu__add_with_shortcutname_flags as addWithShortcutnameFlags' { id `Ptr ()', `CString', `CString',id `FunPtr CallbackWithUserDataPrim',`Int' } -> `Int' #}
instance (Parent a MenuItemBase, impl ~ ( T.Text -> Maybe Shortcut -> Maybe (Ref a-> IO ()) -> MenuItemFlags -> IO (AtIndex))) => Op (Add ()) MenuPrimBase orig (impl) where
  runOp _ _ menu_ name shortcut cb flags =
    addMenuItem (Left menu_) name shortcut cb flags addWithFlags' addWithShortcutnameFlags'

instance (Parent a MenuItemBase, impl ~ ( T.Text -> Maybe Shortcut -> Maybe (Ref a-> IO ()) -> MenuItemFlags -> IO (Ref MenuItemBase))) => Op (AddAndGetMenuItem ()) MenuPrimBase orig (impl) where
  runOp _ _ menu_ name shortcut cb flags = do
    (AtIndex i) <- add menu_ name shortcut cb flags
    items <- getMenu menu_
    let mi = items !! i
    case mi of
      Just mi' -> return mi'
      Nothing -> throwIO (userError ("FLTK claims the menu item " ++ (T.unpack name) ++ " was added successfully at index " ++ (show i) ++ " , but no MenuItem at that index could be retrieved."))

{# fun Fl_Menu__size as size' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetSize ()) MenuPrimBase orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> size' menu_Ptr
{# fun Fl_Menu__set_size as setSize' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (Size ->  IO ())) => Op (SetSize ()) MenuPrimBase orig impl where
  runOp _ _ menu_ (Size (Width w) (Height h)) = withRef menu_ $ \menu_Ptr -> setSize' menu_Ptr w h
{# fun Fl_Menu__clear as clear' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Clear ()) MenuPrimBase orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> clear' menu_Ptr
{# fun Fl_Menu__clear_submenu as clearSubmenu' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (AtIndex ->  IO (Either OutOfRange ()))) => Op (ClearSubmenu ()) MenuPrimBase orig impl where
  runOp _ _ menu_ (AtIndex index') = withRef menu_ $ \menu_Ptr -> clearSubmenu' menu_Ptr index' >>= \ret' -> if ret' == -1 then return (Left OutOfRange) else return (Right ())
{# fun Fl_Menu__replace as replace' { id `Ptr ()',`Int', `CString' } -> `()' #}
instance (impl ~ (AtIndex -> T.Text ->  IO ())) => Op (Replace ()) MenuPrimBase orig impl where
  runOp _ _ menu_ (AtIndex index') name = withRef menu_ $ \menu_Ptr -> copyTextToCString name >>= replace' menu_Ptr index'
{# fun Fl_Menu__remove as remove' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (AtIndex ->  IO ())) => Op (Remove ()) MenuPrimBase orig impl where
  runOp _ _ menu_ (AtIndex index') = withRef menu_ $ \menu_Ptr -> remove' menu_Ptr index'
{# fun Fl_Menu__shortcut as shortcut' { id `Ptr ()',`Int',id `CInt' } -> `()' #}
instance (impl ~ (AtIndex -> ShortcutKeySequence ->  IO ())) => Op (SetShortcut ()) MenuPrimBase orig impl where
  runOp _ _ menu_ (AtIndex index') (ShortcutKeySequence modifiers char) =
    withRef menu_ $ \menu_Ptr ->
        shortcut' menu_Ptr index' (keySequenceToCInt modifiers char)
{# fun Fl_Menu__set_mode as setMode' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (AtIndex -> MenuItemFlags ->  IO ())) => Op (SetMode ()) MenuPrimBase orig impl where
  runOp _ _ menu_ (AtIndex i) fl = withRef menu_ $ \menu_Ptr -> setMode' menu_Ptr i (menuItemFlagsToInt fl)
{# fun Fl_Menu__mode as mode' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (AtIndex ->  IO (Maybe MenuItemFlags))) => Op (GetMode ()) MenuPrimBase orig impl where
  runOp _ _ menu_ (AtIndex i) = withRef menu_ $ \menu_Ptr -> mode' menu_Ptr i >>= return . intToMenuItemFlags
{# fun Fl_Menu__mvalue as mvalue' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ (IO (Maybe (Ref MenuItemBase)))) => Op (Mvalue ()) MenuPrimBase orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> mvalue' menu_Ptr >>= toMaybeRef
{# fun Fl_Menu__value as value' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Maybe AtIndex))) => Op (GetValue ()) MenuPrimBase orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> do
    res <- value' menu_Ptr
    return (if (res == -1) then Nothing else Just (AtIndex res))
{# fun Fl_Menu__value_with_item as valueWithItem' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
{# fun Fl_Menu__value_with_index as valueWithIndex' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (MenuItemReference -> IO (Either NoChange ()))) => Op (SetValue ()) MenuPrimBase orig impl where
  runOp _ _ menu_ menu_item_reference =
    withRef menu_ $ \menu_Ptr ->
        case menu_item_reference of
          (MenuItemByIndex (AtIndex index')) -> valueWithIndex' menu_Ptr index' >>= return . successOrNoChange
          (MenuItemByPointer (MenuItemPointer menu_item)) ->
              withRef menu_item $ \menu_itemPtr ->
                  valueWithItem' menu_Ptr menu_itemPtr >>= return . successOrNoChange
{# fun Fl_Menu__text as text' { id `Ptr ()' } -> `CString' #}
instance (impl ~ ( IO T.Text)) => Op (GetText ()) MenuPrimBase orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> text' menu_Ptr >>= cStringToText
{# fun Fl_Menu__text_with_index as textWithIndex' { id `Ptr ()',`Int' } -> `CString' #}
instance (impl ~ (AtIndex ->  IO T.Text)) => Op (GetTextWithIndex ()) MenuPrimBase orig impl where
  runOp _ _ menu_ (AtIndex i) = withRef menu_ $ \menu_Ptr -> textWithIndex' menu_Ptr i >>= cStringToText
{# fun Fl_Menu__textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ ( IO (Font))) => Op (GetTextfont ()) MenuPrimBase orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> textfont' menu_Ptr
{# fun Fl_Menu__set_textfont as setTextfont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
instance (impl ~ (Font ->  IO ())) => Op (SetTextfont ()) MenuPrimBase orig impl where
  runOp _ _ menu_ c = withRef menu_ $ \menu_Ptr -> setTextfont' menu_Ptr c
{# fun Fl_Menu__textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ ( IO (FontSize))) => Op (GetTextsize ()) MenuPrimBase orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> textsize' menu_Ptr >>= return . FontSize
{# fun Fl_Menu__set_textsize as setTextsize' { id `Ptr ()',id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ())) => Op (SetTextsize ()) MenuPrimBase orig impl where
  runOp _ _ menu_ (FontSize c) = withRef menu_ $ \menu_Ptr -> setTextsize' menu_Ptr c
{# fun Fl_Menu__textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetTextcolor ()) MenuPrimBase orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> textcolor' menu_Ptr
{# fun Fl_Menu__set_textcolor as setTextcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetTextcolor ()) MenuPrimBase orig impl where
  runOp _ _ menu_ c = withRef menu_ $ \menu_Ptr -> setTextcolor' menu_Ptr c
{# fun Fl_Menu__down_box as downBox' { id `Ptr ()' } -> `Boxtype' cToEnum #}
instance (impl ~ ( IO (Boxtype))) => Op (GetDownBox ()) MenuPrimBase orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> downBox' menu_Ptr
{# fun Fl_Menu__set_down_box as setDownBox' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' #}
instance (impl ~ (Boxtype ->  IO ())) => Op (SetDownBox ()) MenuPrimBase orig impl where
  runOp _ _ menu_ b = withRef menu_ $ \menu_Ptr -> setDownBox' menu_Ptr b
{# fun Fl_Menu__down_color as downColor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetDownColor ()) MenuPrimBase orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> downColor' menu_Ptr
{# fun Fl_Menu__set_down_color as setDownColor' { id `Ptr ()',`CUInt' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetDownColor ()) MenuPrimBase orig impl where
  runOp _ _ menu_ (Color c) = withRef menu_ $ \menu_Ptr -> setDownColor' menu_Ptr c
{# fun Fl_Menu__set_only as setonly' { id `Ptr ()', id `Ptr ()' } -> `()' #}
instance (Parent a MenuItemBase, impl ~ (Ref a -> IO ())) => Op (Setonly ()) MenuPrimBase orig impl where
  runOp _ _ menu_ item = withRef menu_ $ \menu_Ptr ->
                            withRef item $ \item_Ptr -> setonly' menu_Ptr item_Ptr


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.MenuPrim"
-- @

-- $functions
-- @
-- add:: ('Parent' a 'MenuItemBase') => 'Ref' 'MenuPrimBase' -> 'T.Text' -> 'Maybe' 'Shortcut' -> 'Maybe' ('Ref' a-> 'IO' ()) -> 'MenuItemFlags' -> 'IO' ('AtIndex')
--
-- addAndGetMenuItem:: ('Parent' a 'MenuItemBase') => 'Ref' 'MenuPrimBase' -> 'T.Text' -> 'Maybe' 'Shortcut' -> 'Maybe' ('Ref' a-> 'IO' ()) -> 'MenuItemFlags' -> 'IO' ('Ref' 'MenuItemBase')
--
-- addName :: 'Ref' 'MenuPrimBase' -> 'T.Text' -> 'IO' ()
--
-- clear :: 'Ref' 'MenuPrimBase' -> 'IO' ()
--
-- clearSubmenu :: 'Ref' 'MenuPrimBase' -> 'AtIndex' -> 'IO' ('Either' 'OutOfRange' ())
--
-- copy:: ('Parent' a 'MenuItemBase') => 'Ref' 'MenuPrimBase' -> 'Ref' a-> 'IO' ()
--
-- destroy :: 'Ref' 'MenuPrimBase' -> 'IO' ()
--
-- findIndex :: 'Ref' 'MenuPrimBase' -> 'MenuItemLocator' -> 'IO' ('Maybe' 'Int')
--
-- getDownBox :: 'Ref' 'MenuPrimBase' -> 'IO' ('Boxtype')
--
-- getDownColor :: 'Ref' 'MenuPrimBase' -> 'IO' ('Color')
--
-- getMenu :: 'Ref' 'MenuPrimBase' -> 'IO' [('Maybe' ('Ref' 'MenuItemBase']))
--
-- getMode :: 'Ref' 'MenuPrimBase' -> 'AtIndex' -> 'IO' ('Maybe' 'MenuItemFlags')
--
-- getSize :: 'Ref' 'MenuPrimBase' -> 'IO' ('Int')
--
-- getText :: 'Ref' 'MenuPrimBase' -> 'IO' 'T.Text'
--
-- getTextWithIndex :: 'Ref' 'MenuPrimBase' -> 'AtIndex' -> 'IO' 'T.Text'
--
-- getTextcolor :: 'Ref' 'MenuPrimBase' -> 'IO' ('Color')
--
-- getTextfont :: 'Ref' 'MenuPrimBase' -> 'IO' ('Font')
--
-- getTextsize :: 'Ref' 'MenuPrimBase' -> 'IO' ('FontSize')
--
-- getValue :: 'Ref' 'MenuPrimBase' -> 'IO' ('Maybe' 'AtIndex')
--
-- global :: 'Ref' 'MenuPrimBase' -> 'IO' ()
--
-- handle :: 'Ref' 'MenuPrimBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'MenuPrimBase' -> 'IO' ()
--
-- insert:: ('Parent' a 'MenuPrimBase') => 'Ref' 'MenuPrimBase' -> 'AtIndex' -> 'T.Text' -> 'Maybe' 'Shortcut' -> ('Ref' a -> 'IO' ()) -> 'MenuItemFlags' -> 'IO' ('AtIndex')
--
-- itemPathname:: ('Parent' a 'MenuItemBase') => 'Ref' 'MenuPrimBase' -> 'Ref' a -> 'IO' ('Maybe' 'T.Text')
--
-- itemPathnameRecent :: 'Ref' 'MenuPrimBase' -> 'IO' ('Maybe' 'String')
--
-- mvalue :: 'Ref' 'MenuPrimBase' -> 'IO' ('Maybe' ('Ref' 'MenuItemBase'))
--
-- picked:: ('Parent' a 'MenuItemBase', 'Parent' b 'MenuItemBase') => 'Ref' 'MenuPrimBase' -> 'Ref' a -> 'IO' ('Maybe' ('Ref' b))
--
-- remove :: 'Ref' 'MenuPrimBase' -> 'AtIndex' -> 'IO' ()
--
-- replace :: 'Ref' 'MenuPrimBase' -> 'AtIndex' -> 'T.Text' -> 'IO' ()
--
-- resize :: 'Ref' 'MenuPrimBase' -> 'Rectangle' -> 'IO' ()
--
-- setDownBox :: 'Ref' 'MenuPrimBase' -> 'Boxtype' -> 'IO' ()
--
-- setDownColor :: 'Ref' 'MenuPrimBase' -> 'Color' -> 'IO' ()
--
-- setMenu:: ('Parent' a 'MenuItemBase') => 'Ref' 'MenuPrimBase' -> ['Ref' a] -> 'IO' ()
--
-- setMode :: 'Ref' 'MenuPrimBase' -> 'AtIndex' -> 'MenuItemFlags' -> 'IO' ()
--
-- setShortcut :: 'Ref' 'MenuPrimBase' -> 'AtIndex' -> 'ShortcutKeySequence' -> 'IO' ()
--
-- setSize :: 'Ref' 'MenuPrimBase' -> 'Size' -> 'IO' ()
--
-- setTextcolor :: 'Ref' 'MenuPrimBase' -> 'Color' -> 'IO' ()
--
-- setTextfont :: 'Ref' 'MenuPrimBase' -> 'Font' -> 'IO' ()
--
-- setTextsize :: 'Ref' 'MenuPrimBase' -> 'FontSize' -> 'IO' ()
--
-- setValue :: 'Ref' 'MenuPrimBase' -> 'MenuItemReference' -> 'IO' ('Either' 'NoChange' ())
--
-- setonly:: ('Parent' a 'MenuItemBase') => 'Ref' 'MenuPrimBase' -> 'Ref' a -> 'IO' ()
--
-- showWidget :: 'Ref' 'MenuPrimBase' -> 'IO' ()
--
-- testShortcut:: ('Parent' a 'MenuItemBase') => 'Ref' 'MenuPrimBase' -> 'IO' ('Maybe' ('Ref' a))
-- @
