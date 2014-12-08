{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Menu_
    (
     Menu_Funcs(..),
     defaultMenu_Funcs,
     -- * Constructor
     menu_New,
     menu_Destroy,
     -- * Fl_Widget specific
     menu_Handle,
     menu_Parent,
     menu_SetParent,
     menu_Type_,
     menu_SetType,
     menu_HandleSuper,
     menu_AsWindowSuper,
     menu_AsWindow,
     menu_X,
     menu_Y,
     menu_W,
     menu_H,
     menu_SetAlign,
     menu_Align,
     menu_Box,
     menu_SetBox,
     menu_Color,
     menu_SetColor,
     menu_SetColorWithBgSel,
     menu_SelectionColor,
     menu_SetSelectionColor,
     menu_Label,
     menu_CopyLabel,
     menu_SetLabel,
     menu_Labeltype,
     menu_SetLabeltype,
     menu_Labelcolor,
     menu_SetLabelcolor,
     menu_Labelfont,
     menu_SetLabelfont,
     menu_Labelsize,
     menu_SetLabelsize,
     menu_Image,
     menu_SetImage,
     menu_Deimage,
     menu_SetDeimage,
     menu_Tooltip,
     menu_CopyTooltip,
     menu_SetTooltip,
     menu_When,
     menu_SetWhen,
     menu_Visible,
     menu_VisibleR,
     menu_ShowSuper,
     menu_Show,
     menu_HideSuper,
     menu_Hide,
     menu_SetVisible,
     menu_ClearVisible,
     menu_Active,
     menu_ActiveR,
     menu_Activate,
     menu_Deactivate,
     menu_Output,
     menu_SetOutput,
     menu_ClearOutput,
     menu_Takesevents,
     menu_SetChanged,
     menu_ClearChanged,
     menu_TakeFocus,
     menu_SetVisibleFocus,
     menu_ClearVisibleFocus,
     menu_ModifyVisibleFocus,
     menu_VisibleFocus,
     menu_Contains,
     menu_Inside,
     menu_Redraw,
     menu_RedrawLabel,
     menu_Damage,
     menu_ClearDamageWithBitmask,
     menu_ClearDamage,
     menu_DamageWithText,
     menu_DamageInsideWidget,
     menu_MeasureLabel,
     menu_Window,
     menu_TopWindow,
     menu_TopWindowOffset,
     menu_AsGroupSuper,
     menu_AsGroup,
     menu_AsGlWindowSuper,
     menu_AsGlWindow,
     menu_ResizeSuper,
     menu_Resize,
     menu_SetCallback,
     menu_DrawLabel,
     menu_Value,
     menu_SetValue,
     menu_Clear,
     menu_SetShortcut,
     menu_DownBox,
     menu_SetDownBox,
     menu_DownColor,
     menu_SetDownColor,
     menu_DrawBox,
     menu_DrawBoxWithBoxtype,
     menu_DrawBackdrop,
     menu_DrawFocus,
     menu_ItemPathnameWithFinditem,
     menu_ItemPathname,
     menu_Picked,
     menu_Find,
     menu_TestShortcut,
     menu_Global,
     menu_Menu,
     menu_setMenu,
     menu_Copy,
     menu_Insert,
     menu_Add,
     menu_Size,
     menu_SetSize,
     menu_ClearSubmenu,
     menu_Replace,
     menu_Remove,
     menu_SetMode,
     menu_Mode,
     menu_Mvalue,
     menu_Text,
     menu_TextWithIndex,
     menu_Textfont,
     menu_SetTextfont,
     menu_Textsize,
     menu_SetTextsize,
     menu_Textcolor,
     menu_SetTextcolor
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
data Menu_Funcs a =
    Menu_Funcs
    {
     menu_DrawOverride       :: Maybe (MenuPrim a -> IO ())
    ,menu_HandleOverride     :: Maybe (MenuPrim a -> Event -> IO Int)
    ,menu_ResizeOverride     :: Maybe (MenuPrim a -> Rectangle -> IO ())
    ,menu_ShowOverride       :: Maybe (MenuPrim a -> IO ())
    ,menu_HideOverride       :: Maybe (MenuPrim a -> IO ())
    ,menu_AsWindowOverride   :: Maybe (MenuPrim a -> IO (Window ()))
    ,menu_AsGlWindowOverride :: Maybe (MenuPrim a -> IO (GlWindow ()))
    ,menu_AsGroupOverride    :: Maybe (MenuPrim a -> IO (Group ()))
    }

menu_FunctionStruct :: (Menu_Funcs a) -> IO (Ptr ())
menu_FunctionStruct funcs = do
      p <- mallocBytes {#sizeof fl_Menu__Virtual_Funcs #}
      toCallbackPrim `orNullFunPtr` (menu_DrawOverride funcs) >>=
                             {#set fl_Menu__Virtual_Funcs->draw#} p
      toEventHandlerPrim `orNullFunPtr` (menu_HandleOverride funcs) >>=
                             {#set fl_Menu__Virtual_Funcs->handle#} p
      toRectangleFPrim `orNullFunPtr` (menu_ResizeOverride funcs) >>=
                             {#set fl_Menu__Virtual_Funcs->resize#} p
      toCallbackPrim `orNullFunPtr` (menu_ShowOverride funcs) >>=
                             {#set fl_Menu__Virtual_Funcs->show#} p
      toCallbackPrim `orNullFunPtr` (menu_HideOverride funcs) >>=
                             {#set fl_Menu__Virtual_Funcs->hide#} p
      toGetWindowFPrim `orNullFunPtr` (menu_AsWindowOverride funcs) >>=
                             {#set fl_Menu__Virtual_Funcs->as_window#} p
      toGetGlWindowFPrim `orNullFunPtr` (menu_AsGlWindowOverride funcs) >>=
                             {#set fl_Menu__Virtual_Funcs->as_gl_window#} p
      toGetGroupFPrim `orNullFunPtr` (menu_AsGroupOverride funcs) >>=
                             {#set fl_Menu__Virtual_Funcs->as_group#} p
      return p
defaultMenu_Funcs :: Menu_Funcs a
defaultMenu_Funcs = Menu_Funcs Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing

{# fun Fl_Menu__New as widgetNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Menu__New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_OverriddenMenu__New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int',`String', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenMenu__New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
menu_New :: Rectangle -> Maybe String -> Maybe (Menu_Funcs a) -> IO (MenuPrim ())
menu_New rectangle l' funcs' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case (l', funcs') of
        (Nothing,Nothing) -> widgetNew' x_pos y_pos width height >>=
                             toObject
        ((Just l), Nothing) -> widgetNewWithLabel' x_pos y_pos width height l >>=
                               toObject
        ((Just l), (Just fs)) -> do
                               ptr <- menu_FunctionStruct fs
                               overriddenWidgetNewWithLabel' x_pos y_pos width height l (castPtr ptr) >>=
                                                             toObject
        (Nothing, (Just fs)) -> do
                               ptr <- menu_FunctionStruct fs
                               overriddenWidgetNew' x_pos y_pos width height (castPtr ptr) >>=
                                                    toObject

{# fun Fl_Menu__Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
menu_Destroy :: MenuPrim a -> IO ()
menu_Destroy menu_ = swapObject menu_ $
                          \menu_Ptr ->
                             widgetDestroy' menu_Ptr >>
                             return nullPtr
{# fun Fl_Menu__handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
menu_HandleSuper :: MenuPrim a  -> Int ->  IO (Int)
menu_HandleSuper menu_ event = withObject menu_ $ \menu_Ptr -> handleSuper' menu_Ptr event
{#fun Fl_Menu__handle as menu_Handle'
      { id `Ptr ()', id `CInt' } -> `Int' #}
menu_Handle :: MenuPrim a -> Event -> IO Int
menu_Handle menu_ event = withObject menu_ (\p -> menu_Handle' p (fromIntegral . fromEnum $ event))
{# fun Fl_Menu__as_group_super as asGroupSuper' { id `Ptr ()' } -> `Group ()' unsafeToObject #}
menu_AsGroupSuper :: MenuPrim a  ->  IO (Group ())
menu_AsGroupSuper menu_ = withObject menu_ $ \menu_Ptr -> asGroupSuper' menu_Ptr
{# fun Fl_Menu__as_group as asGroup' { id `Ptr ()' } -> `Group ()' unsafeToObject #}
menu_AsGroup :: MenuPrim a  ->  IO (Group ())
menu_AsGroup menu_ = withObject menu_ $ \menu_Ptr -> asGroup' menu_Ptr
menu_AsGlWindowSuper :: MenuPrim a  ->  IO (GlWindow ())
menu_AsGlWindowSuper = widgetAsGlWindowSuper
{# fun Fl_Menu__as_gl_window as asGlWindow' { id `Ptr ()' } -> `GlWindow ()' unsafeToObject #}
menu_AsGlWindow :: MenuPrim a  ->  IO (GlWindow())
menu_AsGlWindow menu_ = withObject menu_ $ \menu_Ptr -> asGlWindow' menu_Ptr
{# fun Fl_Menu__as_window_super as asWindowSuper' { id `Ptr ()' } -> `Window ()' unsafeToObject #}
menu_AsWindowSuper :: Window a  ->  IO (Window ())
menu_AsWindowSuper window = withObject window $ \windowPtr -> asWindowSuper' windowPtr
{# fun Fl_Menu__as_window as asWindow' { id `Ptr ()' } -> `Window ()' unsafeToObject #}
menu_AsWindow :: MenuPrim a  ->  IO (Window())
menu_AsWindow menu_ = withObject menu_ $ \menu_Ptr -> asWindow' menu_Ptr
{# fun Fl_Menu__resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
menu_ResizeSuper :: MenuPrim a  -> Rectangle -> IO (())
menu_ResizeSuper menu_ rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withObject menu_ $ \menu_Ptr -> resizeSuper' menu_Ptr x_pos y_pos width height
{# fun Fl_Menu__resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
menu_Resize :: MenuPrim a  -> Rectangle -> IO (())
menu_Resize menu_ rectangle = withObject menu_ $ \menu_Ptr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' menu_Ptr x_pos y_pos w_pos h_pos
{# fun Fl_Menu__hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
menu_HideSuper :: MenuPrim a  ->  IO (())
menu_HideSuper menu_ = withObject menu_ $ \menu_Ptr -> hideSuper' menu_Ptr
{# fun Fl_Menu__hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
menu_Hide :: MenuPrim a  ->  IO (())
menu_Hide menu_ = withObject menu_ $ \menu_Ptr -> hide' menu_Ptr
{# fun Fl_Menu__show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
menu_ShowSuper :: MenuPrim a  ->  IO (())
menu_ShowSuper menu_ = withObject menu_ $ \menu_Ptr -> showSuper' menu_Ptr
{# fun Fl_Menu__show as menu_Show' {id `Ptr ()'} -> `()' supressWarningAboutRes #}
menu_Show :: MenuPrim a -> IO ()
menu_Show menu_ = withObject menu_ $ (\p -> menu_Show' p)

menu_DrawBox :: MenuPrim a -> IO ()
menu_DrawBox = widgetDrawBox
menu_DrawBoxWithBoxtype :: MenuPrim a -> Boxtype -> Color -> Maybe Rectangle -> IO ()
menu_DrawBoxWithBoxtype = widgetDrawBoxWithBoxtype
menu_DrawBackdrop :: MenuPrim a -> IO ()
menu_DrawBackdrop = widgetDrawBackdrop
menu_DrawFocus :: MenuPrim a -> Maybe (Boxtype, Rectangle) -> IO ()
menu_DrawFocus = widgetDrawFocus
menu_SetCallback :: MenuPrim a -> (MenuPrim b -> IO ()) -> IO (())
menu_SetCallback = widgetSetCallback
menu_Parent :: MenuPrim a -> IO (Group ())
menu_Parent = widgetParent
menu_SetParent :: MenuPrim a -> Group b -> IO ()
menu_SetParent = widgetSetParent
menu_Type_ :: MenuPrim a  ->  IO (Word8)
menu_Type_ = widgetType_
menu_SetType :: MenuPrim a  -> Word8 ->  IO (())
menu_SetType = widgetSetType
menu_DrawLabel :: MenuPrim a  -> Maybe (Rectangle,AlignType)->  IO (())
menu_DrawLabel = widgetDrawLabel
menu_X :: MenuPrim a  ->  IO (Int)
menu_X = widgetX
menu_Y :: MenuPrim a  ->  IO (Int)
menu_Y = widgetY
menu_W :: MenuPrim a  ->  IO (Int)
menu_W = widgetW
menu_H :: MenuPrim a  ->  IO (Int)
menu_H = widgetH
menu_SetAlign :: MenuPrim a  -> AlignType ->  IO (())
menu_SetAlign = widgetSetAlign
menu_Align :: MenuPrim a  ->  IO (AlignType)
menu_Align = widgetAlign
menu_Box :: MenuPrim a  ->  IO (Boxtype)
menu_Box = widgetBox
menu_SetBox :: MenuPrim a  -> Boxtype ->  IO (())
menu_SetBox = widgetSetBox
menu_Color :: MenuPrim a  ->  IO (Color)
menu_Color = widgetColor
menu_SetColor :: MenuPrim a  -> Color ->  IO (())
menu_SetColor = widgetSetColor
menu_SetColorWithBgSel :: MenuPrim a  -> Color -> Color ->  IO (())
menu_SetColorWithBgSel = widgetSetColorWithBgSel
menu_SelectionColor :: MenuPrim a  ->  IO (Color)
menu_SelectionColor = widgetSelectionColor
menu_SetSelectionColor :: MenuPrim a  -> Color ->  IO (())
menu_SetSelectionColor = widgetSetSelectionColor
menu_Label :: MenuPrim a  ->  IO (String)
menu_Label = widgetLabel
menu_CopyLabel :: MenuPrim a  -> String ->  IO (())
menu_CopyLabel = widgetCopyLabel
menu_SetLabel :: MenuPrim a  -> String ->  IO (())
menu_SetLabel = widgetSetLabel
menu_Labeltype :: MenuPrim a  ->  IO (Labeltype)
menu_Labeltype = widgetLabeltype
menu_SetLabeltype :: MenuPrim a  -> Labeltype ->  IO (())
menu_SetLabeltype = widgetSetLabeltype
menu_Labelcolor :: MenuPrim a  ->  IO (Color)
menu_Labelcolor = widgetLabelcolor
menu_SetLabelcolor :: MenuPrim a  -> Color ->  IO (())
menu_SetLabelcolor = widgetSetLabelcolor
menu_Labelfont :: MenuPrim a  ->  IO (Font)
menu_Labelfont = widgetLabelfont
menu_SetLabelfont :: MenuPrim a  -> Font ->  IO (())
menu_SetLabelfont = widgetSetLabelfont
menu_Labelsize :: MenuPrim a  ->  IO (FontSize)
menu_Labelsize = widgetLabelsize
menu_SetLabelsize :: MenuPrim a  -> FontSize ->  IO (())
menu_SetLabelsize = widgetSetLabelsize
menu_Image :: MenuPrim a  ->  IO (Image ())
menu_Image = widgetImage
menu_SetImage :: MenuPrim a  -> Image b ->  IO (())
menu_SetImage = widgetSetImage
menu_Deimage :: MenuPrim a  ->  IO (Image ())
menu_Deimage = widgetDeimage
menu_SetDeimage :: MenuPrim a  -> Image b ->  IO (())
menu_SetDeimage = widgetSetDeimage
menu_Tooltip :: MenuPrim a  ->  IO (String)
menu_Tooltip = widgetTooltip
menu_CopyTooltip :: MenuPrim a  -> String ->  IO (())
menu_CopyTooltip = widgetCopyTooltip
menu_SetTooltip :: MenuPrim a  -> String ->  IO (())
menu_SetTooltip = widgetSetTooltip
menu_When :: MenuPrim a  ->  IO (When)
menu_When = widgetWhen
menu_SetWhen :: MenuPrim a  -> Word8 ->  IO (())
menu_SetWhen = widgetSetWhen
menu_Visible :: MenuPrim a  ->  IO (Int)
menu_Visible = widgetVisible
menu_VisibleR :: MenuPrim a  ->  IO (Int)
menu_VisibleR = widgetVisibleR
menu_SetVisible :: MenuPrim a  ->  IO (())
menu_SetVisible = widgetSetVisible
menu_ClearVisible :: MenuPrim a  ->  IO (())
menu_ClearVisible = widgetClearVisible
menu_Active :: MenuPrim a  ->  IO (Int)
menu_Active = widgetActive
menu_ActiveR :: MenuPrim a  ->  IO (Int)
menu_ActiveR = widgetActiveR
menu_Activate :: MenuPrim a  ->  IO (())
menu_Activate = widgetActivate
menu_Deactivate :: MenuPrim a  ->  IO (())
menu_Deactivate = widgetDeactivate
menu_Output :: MenuPrim a  ->  IO (Int)
menu_Output = widgetOutput
menu_SetOutput :: MenuPrim a  ->  IO (())
menu_SetOutput = widgetSetOutput
menu_ClearOutput :: MenuPrim a  ->  IO (())
menu_ClearOutput = widgetClearOutput
menu_Takesevents :: MenuPrim a  ->  IO (Int)
menu_Takesevents = widgetTakesevents
menu_SetChanged :: MenuPrim a  ->  IO (())
menu_SetChanged = widgetSetChanged
menu_ClearChanged :: MenuPrim a  ->  IO (())
menu_ClearChanged = widgetClearChanged
menu_TakeFocus :: MenuPrim a  ->  IO (Int)
menu_TakeFocus = widgetTakeFocus
menu_SetVisibleFocus :: MenuPrim a  ->  IO (())
menu_SetVisibleFocus = widgetSetVisibleFocus
menu_ClearVisibleFocus :: MenuPrim a  ->  IO (())
menu_ClearVisibleFocus = widgetClearVisibleFocus
menu_ModifyVisibleFocus :: MenuPrim a  -> Int ->  IO (())
menu_ModifyVisibleFocus = widgetModifyVisibleFocus
menu_VisibleFocus :: MenuPrim a  ->  IO (Int)
menu_VisibleFocus = widgetVisibleFocus
menu_Contains :: MenuPrim a  -> Widget b  ->  IO (Int)
menu_Contains = widgetContains
menu_Inside :: MenuPrim a  -> Widget b  ->  IO (Int)
menu_Inside = widgetInside
menu_Redraw :: MenuPrim a  ->  IO (())
menu_Redraw = widgetRedraw
menu_RedrawLabel :: MenuPrim a  ->  IO (())
menu_RedrawLabel = widgetRedrawLabel
menu_Damage :: MenuPrim a  ->  IO (Word8)
menu_Damage = widgetDamage
menu_ClearDamageWithBitmask :: MenuPrim a  -> Word8 ->  IO (())
menu_ClearDamageWithBitmask = widgetClearDamageWithBitmask
menu_ClearDamage :: MenuPrim a  ->  IO (())
menu_ClearDamage = widgetClearDamage
menu_DamageWithText :: MenuPrim a  -> Word8 ->  IO (())
menu_DamageWithText = widgetDamageWithText
menu_DamageInsideWidget :: MenuPrim a  -> Word8 -> Rectangle ->  IO (())
menu_DamageInsideWidget = widgetDamageInsideWidget
menu_MeasureLabel :: MenuPrim a  -> IO (Size)
menu_MeasureLabel = widgetMeasureLabel
menu_Window :: MenuPrim a  ->  IO (Window ())
menu_Window = widgetWindow
menu_TopWindow :: MenuPrim a  ->  IO (Window ())
menu_TopWindow = widgetTopWindow
menu_TopWindowOffset :: MenuPrim a -> IO (Position)
menu_TopWindowOffset = widgetTopWindowOffset
{# fun unsafe Fl_Menu__item_pathname_with_finditem as itemPathnameWithFinditem' { id `Ptr ()',`String',`Int',id `Ptr ()' } -> `Int' #}
menu_ItemPathnameWithFinditem :: MenuPrim a  -> String -> Int -> MenuItem b  ->  IO (Int)
menu_ItemPathnameWithFinditem menu_ name namelen finditem = withObject menu_ $ \menu_Ptr -> withObject finditem $ \finditemPtr -> itemPathnameWithFinditem' menu_Ptr name namelen finditemPtr
{# fun unsafe Fl_Menu__item_pathname as itemPathname' { id `Ptr ()',`String',`Int' } -> `Int' #}
menu_ItemPathname :: MenuPrim a  -> String -> Int ->  IO (Int)
menu_ItemPathname menu_ name namelen = withObject menu_ $ \menu_Ptr -> itemPathname' menu_Ptr name namelen
{# fun unsafe Fl_Menu__picked as picked' { id `Ptr ()',id `Ptr ()' } -> `Ptr ()' id #}
menu_Picked :: MenuPrim a  -> MenuItem b ->  IO (MenuItem b)
menu_Picked menu_ item = withObject menu_ $ \menu_Ptr -> withObject item $ \itemPtr -> picked' menu_Ptr itemPtr >>= toObject
{# fun unsafe Fl_Menu__find_index_with_name as findIndexWithName' { id `Ptr ()',`String' } -> `Int' #}
{# fun unsafe Fl_Menu__find_index_with_item as findIndexWithItem' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
menu_Find :: MenuPrim a -> MenuItemLocator b -> IO (Int)
menu_Find menu_ menu_item_referene =
    withObject menu_ $ \menu_Ptr ->
        case menu_item_referene of
          MenuItemNameLocator (MenuItemName name) -> findIndexWithName' menu_Ptr name
          MenuItemPointerLocator (MenuItemPointer menu_item) ->
              withObject menu_item $ \menu_itemPtr -> findIndexWithItem' menu_Ptr menu_itemPtr
{# fun unsafe Fl_Menu__test_shortcut as testShortcut' { id `Ptr ()' } -> `Ptr ()' id #}
menu_TestShortcut :: MenuPrim a  ->  IO (MenuItem b)
menu_TestShortcut menu_ = withObject menu_ $ \menu_Ptr -> testShortcut' menu_Ptr >>= toObject
{# fun unsafe Fl_Menu__global as global' { id `Ptr ()' } -> `()' #}
menu_Global :: MenuPrim a  ->  IO ()
menu_Global menu_ = withObject menu_ $ \menu_Ptr -> global' menu_Ptr
{# fun unsafe Fl_Menu__menu as menu' { id `Ptr ()' } -> `Ptr ()' id #}
menu_Menu :: MenuPrim a  ->  IO (MenuPrim a)
menu_Menu menu_ = withObject menu_ $ \menu_Ptr -> menu' menu_Ptr >>= toObject
{# fun unsafe Fl_Menu__menu_with_m as menuWithM' { id `Ptr ()',id `Ptr ( Ptr () )',`Int' } -> `()' #}
menu_setMenu :: MenuPrim a -> [MenuItem b] -> IO ()
menu_setMenu menu_ items =
    withObject menu_ $ \menu_Ptr ->
        withObjects items $ \menu_itemsPtr ->
            menuWithM' menu_Ptr menu_itemsPtr (length items)
{# fun unsafe Fl_Menu__copy as copy' { id `Ptr ()',id `Ptr ()' } -> `()' #}
menu_Copy :: MenuPrim a  -> MenuItem b  ->  IO ()
menu_Copy menu_ m = withObject menu_ $ \menu_Ptr -> withObject m $ \mPtr -> copy' menu_Ptr mPtr

{# fun Fl_Menu__insert_with_flags as insertWithFlags' { id `Ptr ()',`Int',`String',id `CInt',id `FunPtr CallbackWithUserDataPrim',`Int'} -> `Int' #}
{# fun Fl_Menu__insert_with_shortcutname_flags as insertWithShortcutnameFlags' { id `Ptr ()',`Int',`String',`String',id `FunPtr CallbackWithUserDataPrim',`Int' } -> `Int' #}
menu_Insert :: MenuPrim a -> Int -> String -> Maybe Shortcut -> (MenuPrim a -> IO ()) -> [MenuProps] -> IO (Int)
menu_Insert menu_ index name shortcut cb flags =
  withObject menu_ $ \menu_Ptr -> do
    let combinedFlags = foldl1WithDefault 0 (.|.) (map fromEnum flags)
    ptr <- toWidgetCallbackPrim cb
    case shortcut of
      Just s' -> case s' of
        KeySequence ks ->
          insertWithFlags'
           menu_Ptr
           index
           name
           (keySequenceToCInt ks)
           (castFunPtr ptr)
           combinedFlags
        KeyFormat format ->
          if (not $ null format) then
            insertWithShortcutnameFlags'
              menu_Ptr
              index
              name
              format
              (castFunPtr ptr)
              combinedFlags
          else error "Fl_Menu_.menu_insert: shortcut format string cannot be empty"
      Nothing -> 
        insertWithFlags'
          menu_Ptr
          index
          name
          0
          (castFunPtr ptr)
          combinedFlags
{# fun Fl_Menu__add_with_flags as addWithFlags' { id `Ptr ()',`String',id `CInt',id `FunPtr CallbackWithUserDataPrim',`Int' } -> `Int' #}
{# fun Fl_Menu__add_with_shortcutname_flags as addWithShortcutnameFlags' { id `Ptr ()',`String',`String',id `FunPtr CallbackWithUserDataPrim',`Int' } -> `Int' #}
menu_Add :: MenuItem a -> String -> Maybe Shortcut -> (MenuPrim b -> IO ()) -> [MenuProps] -> IO (Int)
menu_Add menu_ name shortcut cb flags =
  withObject menu_ $ \menu_Ptr -> do
    let combinedFlags = foldl1WithDefault 0 (.|.) (map fromEnum flags)
    ptr <- toWidgetCallbackPrim cb
    case shortcut of
      Just s' -> case s' of
        KeySequence ks ->
          addWithFlags'
           menu_Ptr
           name
           (keySequenceToCInt ks)
           (castFunPtr ptr)
           combinedFlags
        KeyFormat format ->
          if (not $ null format) then
            addWithShortcutnameFlags'
            menu_Ptr
            name
            format
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
menu_Size :: MenuPrim a  ->  IO (Int)
menu_Size menu_ = withObject menu_ $ \menu_Ptr -> size' menu_Ptr
{# fun unsafe Fl_Menu__set_size as setSize' { id `Ptr ()',`Int',`Int' } -> `()' #}
menu_SetSize :: MenuPrim a  -> Int -> Int ->  IO ()
menu_SetSize menu_ w h = withObject menu_ $ \menu_Ptr -> setSize' menu_Ptr w h
{# fun unsafe Fl_Menu__clear as clear' { id `Ptr ()' } -> `()' #}
menu_Clear :: MenuPrim a  ->  IO ()
menu_Clear menu_ = withObject menu_ $ \menu_Ptr -> clear' menu_Ptr
{# fun unsafe Fl_Menu__clear_submenu as clearSubmenu' { id `Ptr ()',`Int' } -> `Int' #}
menu_ClearSubmenu :: MenuPrim a  -> Int ->  IO (Int)
menu_ClearSubmenu menu_ index = withObject menu_ $ \menu_Ptr -> clearSubmenu' menu_Ptr index
{# fun unsafe Fl_Menu__replace as replace' { id `Ptr ()',`Int',`String' } -> `()' #}
menu_Replace :: MenuPrim a  -> Int -> String ->  IO ()
menu_Replace menu_ index name = withObject menu_ $ \menu_Ptr -> replace' menu_Ptr index name
{# fun unsafe Fl_Menu__remove as remove' { id `Ptr ()',`Int' } -> `()' #}
menu_Remove :: MenuPrim a  -> Int  ->  IO ()
menu_Remove menu_ index = withObject menu_ $ \menu_Ptr -> remove' menu_Ptr index
{# fun unsafe Fl_Menu__shortcut as shortcut' { id `Ptr ()',`Int',id `CInt' } -> `()' #}
menu_SetShortcut :: MenuPrim a  -> Int -> ShortcutKeySequence ->  IO ()
menu_SetShortcut menu_ index ks =
    withObject menu_ $ \menu_Ptr ->
        shortcut' menu_Ptr index (keySequenceToCInt ks)
{# fun unsafe Fl_Menu__set_mode as setMode' { id `Ptr ()',`Int',`Int' } -> `()' #}
menu_SetMode :: MenuPrim a  -> Int -> Int ->  IO ()
menu_SetMode menu_ i fl = withObject menu_ $ \menu_Ptr -> setMode' menu_Ptr i fl
{# fun unsafe Fl_Menu__mode as mode' { id `Ptr ()',`Int' } -> `Int' #}
menu_Mode :: MenuPrim a  -> Int ->  IO (Int)
menu_Mode menu_ i = withObject menu_ $ \menu_Ptr -> mode' menu_Ptr i
{# fun unsafe Fl_Menu__mvalue as mvalue' { id `Ptr ()' } -> `Ptr ()' id #}
menu_Mvalue :: MenuPrim a  -> IO (MenuItem b)
menu_Mvalue menu_ = withObject menu_ $ \menu_Ptr -> mvalue' menu_Ptr >>= toObject
{# fun unsafe Fl_Menu__value as value' { id `Ptr ()' } -> `Int' #}
menu_Value :: MenuPrim a  ->  IO (Int)
menu_Value menu_ = withObject menu_ $ \menu_Ptr -> value' menu_Ptr
{# fun unsafe Fl_Menu__value_with_item as valueWithItem' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
{# fun unsafe Fl_Menu__value_with_index as valueWithIndex' { id `Ptr ()',`Int' } -> `Int' #}
menu_SetValue :: MenuPrim a -> MenuItemReference b -> IO (Int)
menu_SetValue menu_ menu_item_reference =
    withObject menu_ $ \menu_Ptr ->
        case menu_item_reference of
          (MenuItemIndexReference (MenuItemIndex index)) -> valueWithIndex' menu_Ptr index
          (MenuItemPointerReference (MenuItemPointer menu_item)) ->
              withObject menu_item $ \menu_itemPtr ->
                  valueWithItem' menu_Ptr menu_itemPtr
{# fun unsafe Fl_Menu__text as text' { id `Ptr ()' } -> `String' #}
menu_Text :: MenuPrim a  ->  IO (String)
menu_Text menu_ = withObject menu_ $ \menu_Ptr -> text' menu_Ptr
{# fun unsafe Fl_Menu__text_with_index as textWithIndex' { id `Ptr ()',`Int' } -> `String' #}
menu_TextWithIndex :: MenuPrim a  -> Int ->  IO (String)
menu_TextWithIndex menu_ i = withObject menu_ $ \menu_Ptr -> textWithIndex' menu_Ptr i
{# fun unsafe Fl_Menu__textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
menu_Textfont :: MenuPrim a  ->  IO (Font)
menu_Textfont menu_ = withObject menu_ $ \menu_Ptr -> textfont' menu_Ptr
{# fun unsafe Fl_Menu__set_textfont as setTextfont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
menu_SetTextfont :: MenuPrim a  -> Font ->  IO ()
menu_SetTextfont menu_ c = withObject menu_ $ \menu_Ptr -> setTextfont' menu_Ptr c
{# fun unsafe Fl_Menu__textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
menu_Textsize :: MenuPrim a  ->  IO (FontSize)
menu_Textsize menu_ = withObject menu_ $ \menu_Ptr -> textsize' menu_Ptr >>= return . FontSize
{# fun unsafe Fl_Menu__set_textsize as setTextsize' { id `Ptr ()',id `CInt' } -> `()' #}
menu_SetTextsize :: MenuPrim a  -> FontSize ->  IO ()
menu_SetTextsize menu_ (FontSize c) = withObject menu_ $ \menu_Ptr -> setTextsize' menu_Ptr c
{# fun unsafe Fl_Menu__textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
menu_Textcolor :: MenuPrim a  ->  IO (Color)
menu_Textcolor menu_ = withObject menu_ $ \menu_Ptr -> textcolor' menu_Ptr
{# fun unsafe Fl_Menu__set_textcolor as setTextcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
menu_SetTextcolor :: MenuPrim a  -> Color ->  IO ()
menu_SetTextcolor menu_ c = withObject menu_ $ \menu_Ptr -> setTextcolor' menu_Ptr c
{# fun unsafe Fl_Menu__down_box as downBox' { id `Ptr ()' } -> `Boxtype' cToEnum #}
menu_DownBox :: MenuPrim a  ->  IO (Boxtype)
menu_DownBox menu_ = withObject menu_ $ \menu_Ptr -> downBox' menu_Ptr
{# fun unsafe Fl_Menu__set_down_box as setDownBox' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' #}
menu_SetDownBox :: MenuPrim a  -> Boxtype ->  IO ()
menu_SetDownBox menu_ b = withObject menu_ $ \menu_Ptr -> setDownBox' menu_Ptr b
{# fun unsafe Fl_Menu__down_color as downColor' { id `Ptr ()' } -> `Color' cToColor #}
menu_DownColor :: MenuPrim a  ->  IO (Color)
menu_DownColor menu_ = withObject menu_ $ \menu_Ptr -> downColor' menu_Ptr
{# fun unsafe Fl_Menu__set_down_color as setDownColor' { id `Ptr ()',`Int' } -> `()' #}
menu_SetDownColor :: MenuPrim a  -> Int ->  IO ()
menu_SetDownColor menu_ c = withObject menu_ $ \menu_Ptr -> setDownColor' menu_Ptr c
