{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Menu_Item
  (
   menuItemNew,
   menuItemDestroy,
   menuItemNextWithStep,
   menuItemNext,
   menuItemFirst,
   menuItemLabel,
   menuItemSetLabel,
   menuItemSetLabelWithLabeltype,
   menuItemLabeltype,
   menuItemSetLabeltype,
   menuItemLabelcolor,
   menuItemSetLabelcolor,
   menuItemLabelfont,
   menuItemSetLabelfont,
   menuItemLabelsize,
   menuItemSetLabelsize,
   menuItemSetCallback,
   menuItemShortcut,
   menuItemSetShortcut,
   menuItemSubmenu,
   menuItemCheckbox,
   menuItemRadio,
   menuItemValue,
   menuItemSet,
   menuItemClear,
   menuItemSetonly,
   menuItemVisible,
   menuItemShow,
   menuItemHide,
   menuItemActive,
   menuItemActivate,
   menuItemDeactivate,
   menuItemActivevisible,
   menuItemMeasure,
   menuItemDrawWithT,
   menuItemDraw,
   menuItemFlags,
   menuItemSetFlags,
   menuItemText,
   menuItemPulldown,
   menuItemPopup,
   menuItemTestShortcut,
   menuItemFindShortcut,
   menuItemDoCallback,
   menuItemAdd,
   menuItemInsert,
   menuItemSize
  )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Menu_ItemC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils

{# fun unsafe Fl_Menu_Item_New as new' { } -> `Ptr ()' id #}
menuItemNew :: IO (MenuItem a)
menuItemNew = new' >>= toObject

{# fun unsafe Fl_Menu_Item_Destroy as destroy' { id `Ptr ()' } -> `()' id #}
menuItemDestroy :: MenuItem a -> IO ()
menuItemDestroy menu_item = withObject menu_item $ \menu_itemPtr -> destroy' menu_itemPtr

{# fun unsafe Fl_Menu_Item_next_with_step as nextWithStep' { id `Ptr ()',`Int' } -> `Ptr ()' id #}
menuItemNextWithStep :: MenuItem a  -> Int ->  IO (MenuItem a)
menuItemNextWithStep menu_item step =
  withObject menu_item $ \menu_itemPtr -> nextWithStep' menu_itemPtr step >>= toObject

{# fun unsafe Fl_Menu_Item_next as next' { id `Ptr ()' } -> `Ptr ()' id #}
menuItemNext :: MenuItem a  ->  IO (Ptr ())
menuItemNext menu_item = withObject menu_item $ \menu_itemPtr -> next' menu_itemPtr

{# fun unsafe Fl_Menu_Item_first as first' { id `Ptr ()' } -> `Ptr ()' id #}
menuItemFirst :: MenuItem a  ->  IO (Ptr ())
menuItemFirst menu_item = withObject menu_item $ \menu_itemPtr -> first' menu_itemPtr

{# fun unsafe Fl_Menu_Item_label as label' { id `Ptr ()' } -> `String' #}
menuItemLabel :: MenuItem a  ->  IO (String)
menuItemLabel menu_item = withObject menu_item $ \menu_itemPtr -> label' menu_itemPtr

{# fun unsafe Fl_Menu_Item_set_label as setLabel' { id `Ptr ()',`String' } -> `()' #}
menuItemSetLabel :: MenuItem a  -> String ->  IO ()
menuItemSetLabel menu_item a = withObject menu_item $ \menu_itemPtr -> setLabel' menu_itemPtr a

{# fun unsafe Fl_Menu_Item_set_label_with_labeltype as setLabelWithLabeltype' { id `Ptr ()',cFromEnum `Labeltype',`String' } -> `()' #}
menuItemSetLabelWithLabeltype :: MenuItem a  -> Labeltype -> String ->  IO ()
menuItemSetLabelWithLabeltype menu_item labeltype b = withObject menu_item $ \menu_itemPtr -> setLabelWithLabeltype' menu_itemPtr labeltype b

{# fun unsafe Fl_Menu_Item_labeltype as labeltype' { id `Ptr ()' } -> `Labeltype' cToEnum #}
menuItemLabeltype :: MenuItem a  ->  IO (Labeltype)
menuItemLabeltype menu_item = withObject menu_item $ \menu_itemPtr -> labeltype' menu_itemPtr

{# fun unsafe Fl_Menu_Item_set_labeltype as setLabeltype' { id `Ptr ()',cFromEnum `Labeltype' } -> `()' #}
menuItemSetLabeltype :: MenuItem a  -> Labeltype ->  IO ()
menuItemSetLabeltype menu_item a = withObject menu_item $ \menu_itemPtr -> setLabeltype' menu_itemPtr a

{# fun unsafe Fl_Menu_Item_labelcolor as labelcolor' { id `Ptr ()' } -> `Color' cToColor #}
menuItemLabelcolor :: MenuItem a  ->  IO (Color)
menuItemLabelcolor menu_item = withObject menu_item $ \menu_itemPtr -> labelcolor' menu_itemPtr

{# fun unsafe Fl_Menu_Item_set_labelcolor as setLabelcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
menuItemSetLabelcolor :: MenuItem a  -> Color ->  IO ()
menuItemSetLabelcolor menu_item a = withObject menu_item $ \menu_itemPtr -> setLabelcolor' menu_itemPtr a

{# fun unsafe Fl_Menu_Item_labelfont as labelfont' { id `Ptr ()' } -> `Font' cToFont #}
menuItemLabelfont :: MenuItem a  ->  IO (Font)
menuItemLabelfont menu_item = withObject menu_item $ \menu_itemPtr -> labelfont' menu_itemPtr

{# fun unsafe Fl_Menu_Item_set_labelfont as setLabelfont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
menuItemSetLabelfont :: MenuItem a  -> Font ->  IO ()
menuItemSetLabelfont menu_item a = withObject menu_item $ \menu_itemPtr -> setLabelfont' menu_itemPtr a

{# fun unsafe Fl_Menu_Item_labelsize as labelsize' { id `Ptr ()' } -> `CInt' id #}
menuItemLabelsize :: MenuItem a  ->  IO (FontSize)
menuItemLabelsize menu_item = withObject menu_item $ \menu_itemPtr -> labelsize' menu_itemPtr >>= return . FontSize

{# fun unsafe Fl_Menu_Item_set_labelsize as setLabelsize' { id `Ptr ()', id `CInt' } -> `()' #}
menuItemSetLabelsize :: MenuItem a  -> FontSize ->  IO ()
menuItemSetLabelsize menu_item (FontSize pix) = withObject menu_item $ \menu_itemPtr -> setLabelsize' menu_itemPtr pix

{# fun unsafe Fl_Menu_Item_set_callback as setCallback' { id `Ptr ()', id `FunPtr CallbackWithUserDataPrim'} -> `()' #}
menuItemSetCallback :: MenuItem a  -> (MenuItem b -> IO ()) ->  IO ()
menuItemSetCallback menu_item c = withObject menu_item $ \menu_itemPtr -> do
                                    ptr <- toWidgetCallbackPrim c
                                    setCallback' menu_itemPtr (castFunPtr ptr)

{# fun unsafe Fl_Menu_Item_shortcut as shortcut' { id `Ptr ()' } -> `Int' #}
menuItemShortcut :: MenuItem a  ->  IO (Int)
menuItemShortcut menu_item = withObject menu_item $ \menu_itemPtr -> shortcut' menu_itemPtr

{# fun unsafe Fl_Menu_Item_set_shortcut as setShortcut' { id `Ptr ()',`Int' } -> `()' #}
menuItemSetShortcut :: MenuItem a  -> Int ->  IO ()
menuItemSetShortcut menu_item s = withObject menu_item $ \menu_itemPtr -> setShortcut' menu_itemPtr s

{# fun unsafe Fl_Menu_Item_submenu as submenu' { id `Ptr ()' } -> `Int' #}
menuItemSubmenu :: MenuItem a  ->  IO (Int)
menuItemSubmenu menu_item = withObject menu_item $ \menu_itemPtr -> submenu' menu_itemPtr

{# fun unsafe Fl_Menu_Item_checkbox as checkbox' { id `Ptr ()' } -> `Int' #}
menuItemCheckbox :: MenuItem a  ->  IO (Int)
menuItemCheckbox menu_item = withObject menu_item $ \menu_itemPtr -> checkbox' menu_itemPtr

{# fun unsafe Fl_Menu_Item_radio as radio' { id `Ptr ()' } -> `Int' #}
menuItemRadio :: MenuItem a  ->  IO (Int)
menuItemRadio menu_item = withObject menu_item $ \menu_itemPtr -> radio' menu_itemPtr

{# fun unsafe Fl_Menu_Item_value as value' { id `Ptr ()' } -> `Int' #}
menuItemValue :: MenuItem a  ->  IO (Int)
menuItemValue menu_item = withObject menu_item $ \menu_itemPtr -> value' menu_itemPtr

{# fun unsafe Fl_Menu_Item_set as set' { id `Ptr ()' } -> `()' #}
menuItemSet :: MenuItem a  ->  IO ()
menuItemSet menu_item = withObject menu_item $ \menu_itemPtr -> set' menu_itemPtr

{# fun unsafe Fl_Menu_Item_clear as clear' { id `Ptr ()' } -> `()' #}
menuItemClear :: MenuItem a  ->  IO ()
menuItemClear menu_item = withObject menu_item $ \menu_itemPtr -> clear' menu_itemPtr

{# fun unsafe Fl_Menu_Item_setonly as setonly' { id `Ptr ()' } -> `()' #}
menuItemSetonly :: MenuItem a  ->  IO ()
menuItemSetonly menu_item = withObject menu_item $ \menu_itemPtr -> setonly' menu_itemPtr

{# fun unsafe Fl_Menu_Item_visible as visible' { id `Ptr ()' } -> `Int' #}
menuItemVisible :: MenuItem a  ->  IO (Int)
menuItemVisible menu_item = withObject menu_item $ \menu_itemPtr -> visible' menu_itemPtr

{# fun unsafe Fl_Menu_Item_show as show' { id `Ptr ()' } -> `()' #}
menuItemShow :: MenuItem a  ->  IO ()
menuItemShow menu_item = withObject menu_item $ \menu_itemPtr -> show' menu_itemPtr

{# fun unsafe Fl_Menu_Item_hide as hide' { id `Ptr ()' } -> `()' #}
menuItemHide :: MenuItem a  ->  IO ()
menuItemHide menu_item = withObject menu_item $ \menu_itemPtr -> hide' menu_itemPtr

{# fun unsafe Fl_Menu_Item_active as active' { id `Ptr ()' } -> `Int' #}
menuItemActive :: MenuItem a  ->  IO (Int)
menuItemActive menu_item = withObject menu_item $ \menu_itemPtr -> active' menu_itemPtr

{# fun unsafe Fl_Menu_Item_activate as activate' { id `Ptr ()' } -> `()' #}
menuItemActivate :: MenuItem a  ->  IO ()
menuItemActivate menu_item = withObject menu_item $ \menu_itemPtr -> activate' menu_itemPtr

{# fun unsafe Fl_Menu_Item_deactivate as deactivate' { id `Ptr ()' } -> `()' #}
menuItemDeactivate :: MenuItem a  ->  IO ()
menuItemDeactivate menu_item = withObject menu_item $ \menu_itemPtr -> deactivate' menu_itemPtr

{# fun unsafe Fl_Menu_Item_activevisible as activevisible' { id `Ptr ()' } -> `Int' #}
menuItemActivevisible :: MenuItem a  ->  IO (Int)
menuItemActivevisible menu_item = withObject menu_item $ \menu_itemPtr -> activevisible' menu_itemPtr

{# fun unsafe Fl_Menu_Item_measure as measure' { id `Ptr ()',alloca- `Int' peekIntConv*,id `Ptr ()' } -> `()' #}
menuItemMeasure :: MenuItem a -> MenuPrim a ->  IO (Int)
menuItemMeasure menu_item menu = withObject menu_item $ \menu_itemPtr -> withObject menu $ \menuPtr -> measure' menu_itemPtr menuPtr

{# fun unsafe Fl_Menu_Item_draw_with_t as drawWithT' { id `Ptr ()',`Int',`Int',`Int',`Int',id `Ptr ()',`Int' } -> `()' #}
menuItemDrawWithT :: MenuItem a  -> Rectangle -> MenuPrim a -> Int ->  IO ()
menuItemDrawWithT menu_item rectangle menu t =
    let (x_pos', y_pos', width', height') = fromRectangle rectangle in
    withObject menu_item $ \menu_itemPtr -> withObject menu $ \menuPtr -> drawWithT' menu_itemPtr x_pos' y_pos' width' height' menuPtr t

{# fun unsafe Fl_Menu_Item_draw as draw' { id `Ptr ()',`Int',`Int',`Int',`Int',id `Ptr ()' } -> `()' #}
menuItemDraw :: MenuItem a  -> Rectangle -> MenuPrim a ->  IO ()
menuItemDraw menu_item rectangle menu =
  let (x_pos', y_pos', width', height') = fromRectangle rectangle in
  withObject menu_item $ \menu_itemPtr ->
  withObject menu $ \menuPtr -> draw' menu_itemPtr x_pos' y_pos' width' height' menuPtr

{# fun unsafe Fl_Menu_Item_flags as flags' { id `Ptr ()' } -> `Int' #}
menuItemFlags :: MenuItem a  ->  IO (Int)
menuItemFlags menu_item = withObject menu_item $ \menu_itemPtr -> flags' menu_itemPtr

{# fun unsafe Fl_Menu_Item_set_flags as setFlags' { id `Ptr ()',`Int' } -> `()' #}
menuItemSetFlags :: MenuItem a  -> Int ->  IO ()
menuItemSetFlags menu_item flags = withObject menu_item $ \menu_itemPtr -> setFlags' menu_itemPtr flags

{# fun unsafe Fl_Menu_Item_text as text' { id `Ptr ()' } -> `String' #}
menuItemText :: MenuItem a  ->  IO (String)
menuItemText menu_item = withObject menu_item $ \menu_itemPtr -> text' menu_itemPtr

{# fun unsafe Fl_Menu_Item_pulldown_with_args as pulldownWithArgs' { id `Ptr ()',`Int',`Int',`Int',`Int',id `Ptr ()', id `Ptr ()', id `Ptr ()', fromBool `Bool'} -> `Ptr ()' id #}
menuItemPulldown :: MenuItem a -> Rectangle -> Maybe (MenuItem a) -> Maybe (MenuPrim b) -> Maybe (MenuItem c) -> Maybe Bool -> IO (MenuItem b)
menuItemPulldown menu_item rectangle picked template_menu title menu_barFlag =
  let (x_pos, y_pos, width, height) = fromRectangle rectangle
      menu_bar = maybe False id menu_barFlag
  in
   withObject menu_item $ \menu_itemPtr ->
   withMaybeObject picked $ \pickedPtr ->
   withMaybeObject template_menu $ \template_menuPtr ->
   withMaybeObject title $ \titlePtr ->
   pulldownWithArgs' menu_itemPtr x_pos y_pos width height pickedPtr template_menuPtr titlePtr menu_bar >>= toObject

{# fun unsafe Fl_Menu_Item_popup_with_args as popupWithArgs' { id `Ptr ()',`Int',`Int', id `Ptr CChar' , id `Ptr ()', id `Ptr ()'} -> `Ptr ()' id #}
menuItemPopup :: MenuItem a -> Position -> Maybe String -> Maybe (MenuItem a) -> Maybe (MenuPrim b) -> IO (MenuItem c)
menuItemPopup menu_item (Position (X x_pos) (Y y_pos)) title picked template_menu =
  withObject menu_item $ \menu_itemPtr ->
  withMaybeObject picked $ \pickedPtr ->
  withMaybeObject template_menu $ \template_menuPtr ->
  maybeNew newCString title >>= \titlePtr ->
  popupWithArgs' menu_itemPtr x_pos y_pos titlePtr pickedPtr template_menuPtr >>= toObject

{# fun unsafe Fl_Menu_Item_test_shortcut as testShortcut' { id `Ptr ()' } -> `Ptr ()' id #}
menuItemTestShortcut :: MenuItem a  ->  IO (MenuItem a)
menuItemTestShortcut menu_item = withObject menu_item $ \menu_itemPtr -> testShortcut' menu_itemPtr >>= toObject

{# fun unsafe Fl_Menu_Item_find_shortcut_with_ip_require_alt as findShortcutWithIpRequireAlt' { id `Ptr ()',id `Ptr CInt',`Bool' } -> `Ptr ()' id #}
menuItemFindShortcut :: MenuItem a -> Maybe Int -> Bool -> IO (MenuItem a)
menuItemFindShortcut menu_item index require_alt =
    withObject menu_item $ \menu_itemPtr ->
        maybeNew (new . fromIntegral) index >>= \index_Ptr ->
            findShortcutWithIpRequireAlt' menu_itemPtr index_Ptr require_alt >>= toObject

{# fun unsafe Fl_Menu_Item_do_callback as doCallback' { id `Ptr ()',id `Ptr ()' } -> `()' #}
menuItemDoCallback :: MenuItem a  -> Widget a  ->  IO ()
menuItemDoCallback menu_item o = withObject menu_item $ \menu_itemPtr -> withObject o $ \oPtr -> doCallback' menu_itemPtr oPtr

{# fun unsafe Fl_Menu_Item_insert_with_flags as insertWithFlags' { id `Ptr ()',`Int',`String',`Int',id `FunPtr CallbackWithUserDataPrim',`Int'} -> `Int' #}
{# fun unsafe Fl_Menu_Item_add_with_flags as addWithFlags' { id `Ptr ()',`String',`Int',id `FunPtr CallbackWithUserDataPrim',`Int'} -> `Int' #}
{# fun unsafe Fl_Menu_Item_add_with_shortcutname_flags as addWithShortcutnameFlags' { id `Ptr ()',`String',`String',id `FunPtr CallbackWithUserDataPrim',`Int' } -> `Int' #}
menuItemAdd :: MenuItem a -> String -> Shortcut -> (MenuItem b -> IO ()) -> [MenuProps] -> IO (Int)
menuItemAdd menu_item name shortcut cb flags =
  withObject menu_item $ \menu_itemPtr -> do
    let combinedFlags = foldl1WithDefault 0 (.|.) (map fromEnum flags)
    ptr <- toWidgetCallbackPrim cb
    case shortcut of
      KeySequence ks@(ShortcutKeySequence codes char) ->
        if (not $ null codes) then
          addWithFlags'
           menu_itemPtr
           name
           (keySequenceToCInt ks)
           (castFunPtr ptr)
           combinedFlags
        else error "Shortcut codes cannot be empty"
      KeyFormat format ->
        if (not $ null format) then
          addWithShortcutnameFlags'
           menu_itemPtr
           name
           format
           (castFunPtr ptr)
           combinedFlags
        else error "Shortcut format string cannot be empty"

menuItemInsert :: MenuItem a -> Int -> String -> ShortcutKeySequence -> (MenuItem b -> IO ()) -> [MenuProps] -> IO (Int)
menuItemInsert menu_item index name ks@(ShortcutKeySequence codes char) cb flags =
  withObject menu_item $ \menu_itemPtr ->
    if (not $ null codes) then do
      let combinedFlags = foldl1WithDefault 0 (.|.) (map fromEnum flags)
      ptr <- toWidgetCallbackPrim cb
      insertWithFlags'
        menu_itemPtr
        index
        name
        (keySequenceToCInt ks)
        (castFunPtr ptr)
        combinedFlags
      else error "Shortcut codes cannot be empty"

{# fun unsafe Fl_Menu_Item_size as size' { id `Ptr ()' } -> `Int' #}
menuItemSize :: MenuItem a  ->  IO (Int)
menuItemSize menu_item = withObject menu_item $ \menu_itemPtr -> size' menu_itemPtr
