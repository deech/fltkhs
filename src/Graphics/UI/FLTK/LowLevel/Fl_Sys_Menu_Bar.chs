{-# LANGUAGE CPP, EmptyDataDecls, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Sys_Menu_Bar
    (
     sysMenuBarNew
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Sys_Menu_BarC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Sys_Menu_Bar_New as sysMenuBarNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Sys_Menu_Bar_New_WithLabel as sysMenuBarNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
sysMenuBarNew :: Rectangle -> Maybe String -> IO (Ref SysMenuBar)
sysMenuBarNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> sysMenuBarNew' x_pos y_pos width height >>=
                             toRef
        Just l -> sysMenuBarNewWithLabel' x_pos y_pos width height l >>=
                               toRef
{# fun Fl_Sys_Menu_Bar_Destroy as sysMenuBarDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Destroy ()) SysMenuBar (IO ()) where
  runOp _ win = swapRef win $ \winPtr -> do
    sysMenuBarDestroy' winPtr
    return nullPtr
{#fun Fl_Sys_Menu_Bar_handle as sysMenuBarHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance Op (Handle ()) SysMenuBar (Event -> IO Int) where
  runOp _ menu_bar event = withRef menu_bar (\p -> sysMenuBarHandle' p (fromIntegral . fromEnum $ event))
{# fun unsafe Fl_Sys_Menu_Bar_remove as remove' { id `Ptr ()',`Int' } -> `()' #}
instance Op (Remove ()) SysMenuBar ( Int  ->  IO ()) where
  runOp _ menu_ index' = withRef menu_ $ \menu_Ptr -> remove' menu_Ptr index'
{# fun unsafe Fl_Sys_Menu_Bar_replace as replace' { id `Ptr ()',`Int',`String' } -> `()' #}
instance Op (Replace ()) SysMenuBar ( Int -> String ->  IO ()) where
  runOp _ menu_ index' name = withRef menu_ $ \menu_Ptr -> replace' menu_Ptr index' name
{# fun unsafe Fl_Sys_Menu_Bar_clear as clear' { id `Ptr ()' } -> `()' #}
instance Op (Clear ()) SysMenuBar (  IO ()) where
  runOp _ menu_ = withRef menu_ $ \menu_Ptr -> clear' menu_Ptr
{# fun unsafe Fl_Sys_Menu_Bar_clear_submenu as clearSubmenu' { id `Ptr ()',`Int' } -> `Int' #}
instance Op (ClearSubmenu ()) SysMenuBar ( Int ->  IO (Int)) where
  runOp _ menu_ index' = withRef menu_ $ \menu_Ptr -> clearSubmenu' menu_Ptr index'
{# fun unsafe Fl_Sys_Menu_Bar_shortcut as shortcut' { id `Ptr ()',`Int',id `CInt' } -> `()' #}
instance Op (SetShortcut ()) SysMenuBar ( Int -> ShortcutKeySequence ->  IO ()) where
  runOp _ menu_ index' ks =
    withRef menu_ $ \menu_Ptr ->
        shortcut' menu_Ptr index' (keySequenceToCInt ks)
{# fun unsafe Fl_Sys_Menu_Bar_set_mode as setMode' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance Op (SetMode ()) SysMenuBar ( Int -> Int ->  IO ()) where
  runOp _ menu_ i fl = withRef menu_ $ \menu_Ptr -> setMode' menu_Ptr i fl
{# fun unsafe Fl_Sys_Menu_Bar_mode as mode' { id `Ptr ()',`Int' } -> `Int' #}
instance Op (GetMode ()) SysMenuBar ( Int ->  IO (Int)) where
  runOp _ menu_ i = withRef menu_ $ \menu_Ptr -> mode' menu_Ptr i
{# fun unsafe Fl_Sys_Menu_Bar_global as global' { id `Ptr ()' } -> `()' #}
instance Op (Global ()) SysMenuBar (  IO ()) where
  runOp _ menu_ = withRef menu_ $ \menu_Ptr -> global' menu_Ptr
{# fun unsafe Fl_Sys_Menu_Bar_menu as menu' { id `Ptr ()' } -> `Ptr ()' id #}
instance Op (GetMenu ()) SysMenuBar (  IO (Ref MenuItem)) where
  runOp _ menu_ = withRef menu_ $ \menu_Ptr -> menu' menu_Ptr >>= toRef
{# fun unsafe Fl_Sys_Menu_Bar_menu_with_m as menuWithM' { id `Ptr ()',id `Ptr ( Ptr () )',`Int' } -> `()' #}
instance Op (SetMenu ()) SysMenuBar ( [Ref MenuItem] -> IO ()) where
  runOp _ menu_ items =
    withRef menu_ $ \menu_Ptr ->
        withRefs items $ \menu_itemsPtr ->
            menuWithM' menu_Ptr menu_itemsPtr (length items)
