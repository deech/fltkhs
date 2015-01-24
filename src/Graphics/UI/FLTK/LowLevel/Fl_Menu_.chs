{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Menu_
    (
     menu_New
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Menu_C.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Widget
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Fl_Menu_Item

{# fun Fl_Menu__New as widgetNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Menu__New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_OverriddenMenu__New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int',`String', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenMenu__New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
menu_New :: Rectangle -> Maybe String -> Maybe (CustomWidgetFuncs MenuPrim) -> IO (Ref MenuPrim)
menu_New rectangle l' funcs' =
  widgetMaker
    rectangle
    l'
    funcs'
    widgetNew'
    widgetNewWithLabel'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Menu__Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) MenuPrim orig impl where
  runOp _ _ menu_ = swapRef menu_ $
                          \menu_Ptr ->
                             widgetDestroy' menu_Ptr >>
                             return nullPtr
{# fun Fl_Menu__handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Int ->  IO (Int))) => Op (HandleSuper ()) MenuPrim orig impl where
  runOp _ _ menu_ event = withRef menu_ $ \menu_Ptr -> handleSuper' menu_Ptr event
{#fun Fl_Menu__handle as menu_Handle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO Int)) => Op (Handle ()) MenuPrim orig impl where
  runOp _ _ menu_ event = withRef menu_ (\p -> menu_Handle' p (fromIntegral . fromEnum $ event))
{# fun Fl_Menu__resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) MenuPrim orig impl where
  runOp _ _ menu_ rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef menu_ $ \menu_Ptr -> resizeSuper' menu_Ptr x_pos y_pos width height
{# fun Fl_Menu__resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) MenuPrim orig impl where
  runOp _ _ menu_ rectangle = withRef menu_ $ \menu_Ptr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' menu_Ptr x_pos y_pos w_pos h_pos
{# fun Fl_Menu__hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) MenuPrim orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> hideSuper' menu_Ptr
{# fun Fl_Menu__hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Hide ()) MenuPrim orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> hide' menu_Ptr
{# fun Fl_Menu__show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) MenuPrim orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> showSuper' menu_Ptr
{# fun Fl_Menu__show as menu_Show' {id `Ptr ()'} -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (ShowWidget ()) MenuPrim orig impl where
  runOp _ _ menu_ = withRef menu_ $ (\p -> menu_Show' p)

{# fun unsafe Fl_Menu__item_pathname_with_finditem as itemPathnameWithFinditem' { id `Ptr ()',id `Ptr CChar',`Int',id `Ptr ()' } -> `Int' #}
{# fun unsafe Fl_Menu__item_pathname as itemPathname' { id `Ptr ()',id `Ptr CChar',`Int' } -> `Int' #}
instance (Parent a MenuItem, impl ~ ( Maybe (Ref a) -> IO (Maybe String))) => Op (ItemPathname ()) MenuPrim orig impl where
  runOp _ _ menu_ menu_item =
    withRef menu_ $
    \ menu_Ref ->
     allocaBytes oneKb
     (\ptr -> do
         retVal' <- case menu_item of
               Just menu_item' ->
                 withRef menu_item' $ \ menu_item'Ref -> do
                   itemPathnameWithFinditem' menu_Ref (castPtr ptr) oneKb menu_item'Ref
               Nothing -> itemPathname' menu_Ref (castPtr ptr) oneKb
         if (retVal' == -1)
           then return Nothing
           else (peekCString (castPtr ptr) >>= return . Just)
     )

{# fun unsafe Fl_Menu__picked as picked' { id `Ptr ()',id `Ptr ()' } -> `Ptr ()' id #}
instance (Parent a MenuItem, Parent b MenuItem, impl ~ (Ref a -> IO (Ref b))) => Op (Picked ()) MenuPrim orig impl where
  runOp _ _ menu_ item = withRef menu_ $ \menu_Ptr -> withRef item $ \itemPtr -> picked' menu_Ptr itemPtr >>= toRef
{# fun unsafe Fl_Menu__find_index_with_name as findIndexWithName' { id `Ptr ()',`String' } -> `Int' #}
{# fun unsafe Fl_Menu__find_index_with_item as findIndexWithItem' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
instance (impl ~ (MenuItemLocator -> IO (Maybe Int))) => Op (FindIndex ()) MenuPrim orig impl where
  runOp _ _ menu_ menu_item_referene =
    withRef menu_ $ \menu_Ptr ->
        case menu_item_referene of
          MenuItemNameLocator (MenuItemName name) -> findIndexWithName' menu_Ptr name >>= \r -> if (r == -1) then (return Nothing) else (return $ Just r)
          MenuItemPointerLocator (MenuItemPointer menu_item) ->
              withRef menu_item $ \menu_itemPtr -> findIndexWithItem' menu_Ptr menu_itemPtr >>= \r -> if (r == -1) then (return Nothing) else (return $ Just r)
{# fun unsafe Fl_Menu__test_shortcut as testShortcut' { id `Ptr ()' } -> `Ptr ()' id #}
instance (Parent a MenuItem, impl ~ ( IO (Ref a))) => Op (TestShortcut ()) MenuPrim orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> testShortcut' menu_Ptr >>= toRef
{# fun unsafe Fl_Menu__global as global' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Global ()) MenuPrim orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> global' menu_Ptr
{# fun unsafe Fl_Menu__menu as menu' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Ref MenuItem))) => Op (GetMenu ()) MenuPrim orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> menu' menu_Ptr >>= toRef
{# fun unsafe Fl_Menu__menu_with_m as menuWithM' { id `Ptr ()',id `Ptr ( Ptr () )',`Int' } -> `()' #}
instance (Parent a MenuItem, impl ~ ([Ref a] -> IO ())) => Op (SetMenu ()) MenuPrim orig impl where
  runOp _ _ menu_ items =
    withRef menu_ $ \menu_Ptr ->
        withRefs items $ \menu_itemsPtr ->
            menuWithM' menu_Ptr menu_itemsPtr (length items)
{# fun unsafe Fl_Menu__copy as copy' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a MenuItem, impl ~ (Ref a->  IO ())) => Op (Copy ()) MenuPrim orig impl where
  runOp _ _ menu_ m = withRef menu_ $ \menu_Ptr -> withRef m $ \mPtr -> copy' menu_Ptr mPtr

{# fun Fl_Menu__insert_with_flags as insertWithFlags' { id `Ptr ()',`Int',`String',id `CInt',id `FunPtr CallbackWithUserDataPrim',`Int'} -> `Int' #}
{# fun Fl_Menu__insert_with_shortcutname_flags as insertWithShortcutnameFlags' { id `Ptr ()',`Int',`String',`String',id `FunPtr CallbackWithUserDataPrim',`Int' } -> `Int' #}
instance (Parent a MenuPrim, impl ~ ( Int -> String -> Maybe Shortcut -> (Ref a -> IO ()) -> [MenuProps] -> IO (Int))) => Op (Insert ()) MenuPrim orig impl where
  runOp _ _ menu_ index' name shortcut cb flags =
    withRef menu_ $ \menu_Ptr -> do
      let combinedFlags = foldl1WithDefault 0 (.|.) (map fromEnum flags)
      ptr <- toCallbackPrim cb
      case shortcut of
        Just s' -> case s' of
          KeySequence ks ->
            insertWithFlags'
             menu_Ptr
             index'
             name
             (keySequenceToCInt ks)
             (castFunPtr ptr)
             combinedFlags
          KeyFormat format' ->
            if (not $ null format') then
              insertWithShortcutnameFlags'
                menu_Ptr
                index'
                name
                format'
                (castFunPtr ptr)
                combinedFlags
            else error "Fl_Menu_.menu_insert: shortcut format string cannot be empty"
        Nothing ->
          insertWithFlags'
            menu_Ptr
            index'
            name
            0
            (castFunPtr ptr)
            combinedFlags
{# fun Fl_Menu__add_with_name as add' { id `Ptr ()',`String'} -> `()' #}
instance (impl ~ (String -> IO ())) => Op (AddName ()) MenuPrim orig impl where
  runOp _ _ menu_ name' = withRef menu_ $ \menu_Ptr -> add' menu_Ptr name'
{# fun Fl_Menu__add_with_flags as addWithFlags' { id `Ptr ()',`String',id `CInt',id `FunPtr CallbackWithUserDataPrim',`Int' } -> `Int' #}
{# fun Fl_Menu__add_with_shortcutname_flags as addWithShortcutnameFlags' { id `Ptr ()',`String',`String',id `FunPtr CallbackWithUserDataPrim',`Int' } -> `Int' #}
instance (Parent a MenuPrim, impl ~ ( String -> Maybe Shortcut -> (Ref a-> IO ()) -> [MenuProps] -> IO (Int))) => Op (Add ()) MenuPrim orig (impl) where
  runOp _ _ menu_ name shortcut cb flags =
    withRef menu_ $ \menu_Ptr -> do
      let combinedFlags = foldl1WithDefault 0 (.|.) (map fromEnum flags)
      ptr <- toCallbackPrim cb
      case shortcut of
        Just s' -> case s' of
          KeySequence ks ->
            addWithFlags'
             menu_Ptr
             name
             (keySequenceToCInt ks)
             (castFunPtr ptr)
             combinedFlags
          KeyFormat format' ->
            if (not $ null format') then
              addWithShortcutnameFlags'
              menu_Ptr
              name
              format'
              (castFunPtr ptr)
              combinedFlags
            else error "Fl_Menu_.menu_add: Shortcut format string cannot be empty"
        Nothing ->
            addWithFlags'
             menu_Ptr
             name
             0
             (castFunPtr ptr)
             combinedFlags
{# fun unsafe Fl_Menu__size as size' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetSize ()) MenuPrim orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> size' menu_Ptr
{# fun unsafe Fl_Menu__set_size as setSize' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (Int -> Int ->  IO ())) => Op (SetSize ()) MenuPrim orig impl where
  runOp _ _ menu_ w h = withRef menu_ $ \menu_Ptr -> setSize' menu_Ptr w h
{# fun unsafe Fl_Menu__clear as clear' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Clear ()) MenuPrim orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> clear' menu_Ptr
{# fun unsafe Fl_Menu__clear_submenu as clearSubmenu' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Int ->  IO (Either OutOfRange ()))) => Op (ClearSubmenu ()) MenuPrim orig impl where
  runOp _ _ menu_ index' = withRef menu_ $ \menu_Ptr -> clearSubmenu' menu_Ptr index' >>= \ret' -> if ret' == -1 then return (Left OutOfRange) else return (Right ())
{# fun unsafe Fl_Menu__replace as replace' { id `Ptr ()',`Int',`String' } -> `()' #}
instance (impl ~ (Int -> String ->  IO ())) => Op (Replace ()) MenuPrim orig impl where
  runOp _ _ menu_ index' name = withRef menu_ $ \menu_Ptr -> replace' menu_Ptr index' name
{# fun unsafe Fl_Menu__remove as remove' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int  ->  IO ())) => Op (Remove ()) MenuPrim orig impl where
  runOp _ _ menu_ index' = withRef menu_ $ \menu_Ptr -> remove' menu_Ptr index'
{# fun unsafe Fl_Menu__shortcut as shortcut' { id `Ptr ()',`Int',id `CInt' } -> `()' #}
instance (impl ~ (Int -> ShortcutKeySequence ->  IO ())) => Op (SetShortcut ()) MenuPrim orig impl where
  runOp _ _ menu_ index' ks =
    withRef menu_ $ \menu_Ptr ->
        shortcut' menu_Ptr index' (keySequenceToCInt ks)
{# fun unsafe Fl_Menu__set_mode as setMode' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (Int -> Int ->  IO ())) => Op (SetMode ()) MenuPrim orig impl where
  runOp _ _ menu_ i fl = withRef menu_ $ \menu_Ptr -> setMode' menu_Ptr i fl
{# fun unsafe Fl_Menu__mode as mode' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Int ->  IO (Int))) => Op (GetMode ()) MenuPrim orig impl where
  runOp _ _ menu_ i = withRef menu_ $ \menu_Ptr -> mode' menu_Ptr i
{# fun unsafe Fl_Menu__mvalue as mvalue' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ (IO (Ref MenuItem))) => Op (Mvalue ()) MenuPrim orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> mvalue' menu_Ptr >>= toRef
{# fun unsafe Fl_Menu__value as value' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetValue ()) MenuPrim orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> value' menu_Ptr
{# fun unsafe Fl_Menu__value_with_item as valueWithItem' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
{# fun unsafe Fl_Menu__value_with_index as valueWithIndex' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (MenuItemReference -> IO (Int))) => Op (SetValue ()) MenuPrim orig impl where
  runOp _ _ menu_ menu_item_reference =
    withRef menu_ $ \menu_Ptr ->
        case menu_item_reference of
          (MenuItemByIndex (MenuItemIndex index')) -> valueWithIndex' menu_Ptr index'
          (MenuItemByPointer (MenuItemPointer menu_item)) ->
              withRef menu_item $ \menu_itemPtr ->
                  valueWithItem' menu_Ptr menu_itemPtr
{# fun unsafe Fl_Menu__text as text' { id `Ptr ()' } -> `String' #}
instance (impl ~ ( IO (String))) => Op (GetText ()) MenuPrim orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> text' menu_Ptr
{# fun unsafe Fl_Menu__text_with_index as textWithIndex' { id `Ptr ()',`Int' } -> `String' #}
instance (impl ~ (Int ->  IO (String))) => Op (GetTextWithIndex ()) MenuPrim orig impl where
  runOp _ _ menu_ i = withRef menu_ $ \menu_Ptr -> textWithIndex' menu_Ptr i
{# fun unsafe Fl_Menu__textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ ( IO (Font))) => Op (GetTextfont ()) MenuPrim orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> textfont' menu_Ptr
{# fun unsafe Fl_Menu__set_textfont as setTextfont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
instance (impl ~ (Font ->  IO ())) => Op (SetTextfont ()) MenuPrim orig impl where
  runOp _ _ menu_ c = withRef menu_ $ \menu_Ptr -> setTextfont' menu_Ptr c
{# fun unsafe Fl_Menu__textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ ( IO (FontSize))) => Op (GetTextsize ()) MenuPrim orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> textsize' menu_Ptr >>= return . FontSize
{# fun unsafe Fl_Menu__set_textsize as setTextsize' { id `Ptr ()',id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ())) => Op (SetTextsize ()) MenuPrim orig impl where
  runOp _ _ menu_ (FontSize c) = withRef menu_ $ \menu_Ptr -> setTextsize' menu_Ptr c
{# fun unsafe Fl_Menu__textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetTextcolor ()) MenuPrim orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> textcolor' menu_Ptr
{# fun unsafe Fl_Menu__set_textcolor as setTextcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetTextcolor ()) MenuPrim orig impl where
  runOp _ _ menu_ c = withRef menu_ $ \menu_Ptr -> setTextcolor' menu_Ptr c
{# fun unsafe Fl_Menu__down_box as downBox' { id `Ptr ()' } -> `Boxtype' cToEnum #}
instance (impl ~ ( IO (Boxtype))) => Op (GetDownBox ()) MenuPrim orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> downBox' menu_Ptr
{# fun unsafe Fl_Menu__set_down_box as setDownBox' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' #}
instance (impl ~ (Boxtype ->  IO ())) => Op (SetDownBox ()) MenuPrim orig impl where
  runOp _ _ menu_ b = withRef menu_ $ \menu_Ptr -> setDownBox' menu_Ptr b
{# fun unsafe Fl_Menu__down_color as downColor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetDownColor ()) MenuPrim orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> downColor' menu_Ptr
{# fun unsafe Fl_Menu__set_down_color as setDownColor' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetDownColor ()) MenuPrim orig impl where
  runOp _ _ menu_ c = withRef menu_ $ \menu_Ptr -> setDownColor' menu_Ptr c
