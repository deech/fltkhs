{-# LANGUAGE CPP, EmptyDataDecls, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.SysMenuBar
    (
     sysMenuBarNew
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
{# fun Fl_Sys_Menu_Bar_New_WithLabel as sysMenuBarNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `String'} -> `Ptr ()' id #}
sysMenuBarNew :: Rectangle -> Maybe String -> IO (Ref SysMenuBar)
sysMenuBarNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> sysMenuBarNew' x_pos y_pos width height >>=
                             toRef
        Just l -> sysMenuBarNewWithLabel' x_pos y_pos width height l >>=
                               toRef
{# fun Fl_Sys_Menu_Bar_Destroy as sysMenuBarDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Destroy ()) SysMenuBar orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
    sysMenuBarDestroy' winPtr
    return nullPtr
{#fun Fl_Sys_Menu_Bar_handle as sysMenuBarHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ ( Event -> IO Int)) => Op (Handle ()) SysMenuBar orig impl where
  runOp _ _ menu_bar event = withRef menu_bar (\p -> sysMenuBarHandle' p (fromIntegral . fromEnum $ event))
{# fun unsafe Fl_Sys_Menu_Bar_remove as remove' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int  ->  IO ())) => Op (Remove ()) SysMenuBar orig impl where
  runOp _ _ menu_ index' = withRef menu_ $ \menu_Ptr -> remove' menu_Ptr index'
{# fun unsafe Fl_Sys_Menu_Bar_replace as replace' { id `Ptr ()',`Int', unsafeToCString `String' } -> `()' #}
instance (impl ~ (Int -> String ->  IO ())) => Op (Replace ()) SysMenuBar orig impl where
  runOp _ _ menu_ index' name = withRef menu_ $ \menu_Ptr -> replace' menu_Ptr index' name
{# fun unsafe Fl_Sys_Menu_Bar_clear as clear' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Clear ()) SysMenuBar orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> clear' menu_Ptr
{# fun unsafe Fl_Sys_Menu_Bar_clear_submenu as clearSubmenu' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Int ->  IO (Int))) => Op (ClearSubmenu ()) SysMenuBar orig impl where
  runOp _ _ menu_ index' = withRef menu_ $ \menu_Ptr -> clearSubmenu' menu_Ptr index'
{# fun unsafe Fl_Sys_Menu_Bar_shortcut as shortcut' { id `Ptr ()',`Int',id `CInt' } -> `()' #}
instance (impl ~ (Int -> ShortcutKeySequence ->  IO ())) => Op (SetShortcut ()) SysMenuBar orig impl where
  runOp _ _ menu_ index' (ShortcutKeySequence modifiers char) =
    withRef menu_ $ \menu_Ptr ->
        shortcut' menu_Ptr index' (keySequenceToCInt modifiers char)
{# fun unsafe Fl_Sys_Menu_Bar_set_mode as setMode' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (Int -> Int ->  IO ())) => Op (SetMode ()) SysMenuBar orig impl where
  runOp _ _ menu_ i fl = withRef menu_ $ \menu_Ptr -> setMode' menu_Ptr i fl
{# fun unsafe Fl_Sys_Menu_Bar_mode as mode' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Int ->  IO (Int))) => Op (GetMode ()) SysMenuBar orig impl where
  runOp _ _ menu_ i = withRef menu_ $ \menu_Ptr -> mode' menu_Ptr i
{# fun unsafe Fl_Sys_Menu_Bar_global as global' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Global ()) SysMenuBar orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> global' menu_Ptr
{# fun unsafe Fl_Sys_Menu_Bar_menu as menu' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Ref MenuItem))) => Op (GetMenu ()) SysMenuBar orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> menu' menu_Ptr >>= toRef
{# fun unsafe Fl_Sys_Menu_Bar_menu_with_m as menuWithM' { id `Ptr ()',id `Ptr ( Ptr () )',`Int' } -> `()' #}
instance (impl ~ ([Ref MenuItem] -> IO ())) => Op (SetMenu ()) SysMenuBar orig impl where
  runOp _ _ menu_ items =
    withRef menu_ $ \menu_Ptr ->
        withRefs items $ \menu_itemsPtr ->
            menuWithM' menu_Ptr menu_itemsPtr (length items)

-- $functions
-- @
--
-- clear :: 'Ref' 'SysMenuBar' -> 'IO' ()
--
-- clearSubmenu :: 'Ref' 'SysMenuBar' -> 'Int' -> 'IO' 'Int'
--
-- destroy :: 'Ref' 'SysMenuBar' -> 'IO' ()
--
-- getMenu :: 'Ref' 'SysMenuBar' -> 'IO' ('Ref' 'MenuItem')
--
-- getMode :: 'Ref' 'SysMenuBar' -> 'Int' -> 'IO' 'Int'
--
-- global :: 'Ref' 'SysMenuBar' -> 'IO' ()
--
-- handle :: 'Ref' 'SysMenuBar' -> 'Event' -> 'IO' 'Int'
--
-- remove :: 'Ref' 'SysMenuBar' -> 'Int' -> 'IO' ()
--
-- replace :: 'Ref' 'SysMenuBar' -> 'Int' -> 'String' -> 'IO' ()
--
-- setMenu :: 'Ref' 'SysMenuBar' -> ['Ref' 'MenuItem'] -> 'IO' ()
--
-- setMode :: 'Ref' 'SysMenuBar' -> 'Int' -> 'Int' -> 'IO' ()
--
-- setShortcut :: 'Ref' 'SysMenuBar' -> 'Int' -> 'ShortcutKeySequence' -> 'IO' ()
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.MenuPrim"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.SysMenuBar"
-- @