{-# LANGUAGE CPP, EmptyDataDecls, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.SysMenuBar
    (
     sysMenuBarNew,
     sysMenuBarCustom
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
import Graphics.UI.FLTK.LowLevel.Widget
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.MenuItem
import Graphics.UI.FLTK.LowLevel.MenuPrim

{# fun Fl_OverriddenSys_Menu_Bar_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenSys_Menu_Bar_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
sysMenuBarCustom ::
       Rectangle                         -- ^ The bounds of this SysMenuBar
    -> Maybe T.Text                      -- ^ The SysMenuBar label
    -> Maybe (Ref SysMenuBar -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs SysMenuBar)      -- ^ Optional custom widget functions
    -> IO (Ref SysMenuBar)
sysMenuBarCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'
{# fun Fl_Sys_Menu_Bar_New as sysMenuBarNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Sys_Menu_Bar_New_WithLabel as sysMenuBarNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text'} -> `Ptr ()' id #}
sysMenuBarNew :: Rectangle -> Maybe T.Text -> IO (Ref SysMenuBar)
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
{# fun Fl_Sys_Menu_Bar_remove as remove' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int  ->  IO ())) => Op (Remove ()) SysMenuBar orig impl where
  runOp _ _ menu_ index' = withRef menu_ $ \menu_Ptr -> remove' menu_Ptr index'
{# fun Fl_Sys_Menu_Bar_replace as replace' { id `Ptr ()',`Int', unsafeToCString `T.Text' } -> `()' #}
instance (impl ~ (Int -> T.Text ->  IO ())) => Op (Replace ()) SysMenuBar orig impl where
  runOp _ _ menu_ index' name = withRef menu_ $ \menu_Ptr -> replace' menu_Ptr index' name
{# fun Fl_Sys_Menu_Bar_clear as clear' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Clear ()) SysMenuBar orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> clear' menu_Ptr
{# fun Fl_Sys_Menu_Bar_clear_submenu as clearSubmenu' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Int ->  IO (Int))) => Op (ClearSubmenu ()) SysMenuBar orig impl where
  runOp _ _ menu_ index' = withRef menu_ $ \menu_Ptr -> clearSubmenu' menu_Ptr index'
{# fun Fl_Sys_Menu_Bar_shortcut as shortcut' { id `Ptr ()',`Int',id `CInt' } -> `()' #}
instance (impl ~ (Int -> ShortcutKeySequence ->  IO ())) => Op (SetShortcut ()) SysMenuBar orig impl where
  runOp _ _ menu_ index' (ShortcutKeySequence modifiers char) =
    withRef menu_ $ \menu_Ptr ->
        shortcut' menu_Ptr index' (keySequenceToCInt modifiers char)
{# fun Fl_Sys_Menu_Bar_set_mode as setMode' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (Int -> MenuItemFlags ->  IO ())) => Op (SetMode ()) SysMenuBar orig impl where
  runOp _ _ menu_ i fl = withRef menu_ $ \menu_Ptr -> setMode' menu_Ptr i (menuItemFlagsToInt fl)
{# fun Fl_Sys_Menu_Bar_mode as mode' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Int ->  IO (Maybe MenuItemFlags))) => Op (GetMode ()) SysMenuBar orig impl where
  runOp _ _ menu_ i = withRef menu_ $ \menu_Ptr -> mode' menu_Ptr i >>= return . intToMenuItemFlags
{# fun Fl_Sys_Menu_Bar_global as global' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Global ()) SysMenuBar orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> global' menu_Ptr
{# fun Fl_Sys_Menu_Bar_menu_with_m as menuWithM' { id `Ptr ()',id `Ptr ( Ptr () )',`Int' } -> `()' #}
instance (impl ~ ([Ref MenuItem] -> IO ())) => Op (SetMenu ()) SysMenuBar orig impl where
  runOp _ _ menu_ items =
    withRef menu_ $ \menu_Ptr ->
        withRefs items $ \menu_itemsPtr ->
            menuWithM' menu_Ptr menu_itemsPtr (length items)

{# fun Fl_Sys_Menu_Bar_add_with_name as add' { id `Ptr ()',unsafeToCString `T.Text'} -> `()' #}
instance (impl ~ (T.Text -> IO ())) => Op (AddName ()) SysMenuBar orig impl where
  runOp _ _ menu_ name' = withRef menu_ $ \menu_Ptr -> add' menu_Ptr name'

{# fun Fl_Sys_Menu_Bar_add_with_flags as addWithFlags' { id `Ptr ()',unsafeToCString `T.Text',id `CInt',id `FunPtr CallbackWithUserDataPrim',`Int' } -> `Int' #}
{# fun Fl_Sys_Menu_Bar_add_with_shortcutname_flags as addWithShortcutnameFlags' { id `Ptr ()', unsafeToCString `T.Text', unsafeToCString `T.Text',id `FunPtr CallbackWithUserDataPrim',`Int' } -> `Int' #}
instance (Parent a MenuItem, impl ~ ( T.Text -> Maybe Shortcut -> Maybe (Ref a-> IO ()) -> MenuItemFlags -> IO (MenuItemIndex))) => Op (Add ()) SysMenuBar orig (impl) where
  runOp _ _ menu_ name shortcut cb flags =
    addMenuItem (Left (safeCast menu_)) name shortcut cb flags addWithFlags' addWithShortcutnameFlags'

{# fun Fl_Sys_Menu_Bar_insert_with_flags as insertWithFlags' { id `Ptr ()',`Int',unsafeToCString `T.Text',id `CInt',id `FunPtr CallbackWithUserDataPrim',`Int'} -> `Int' #}
{# fun Fl_Sys_Menu_Bar_insert_with_shortcutname_flags as insertWithShortcutnameFlags' { id `Ptr ()',`Int',unsafeToCString `T.Text', unsafeToCString `T.Text',id `FunPtr CallbackWithUserDataPrim',`Int' } -> `Int' #}
instance (Parent a MenuPrim, impl ~ ( Int -> T.Text -> Maybe Shortcut -> (Ref a -> IO ()) -> MenuItemFlags -> IO (MenuItemIndex))) => Op (Insert ()) SysMenuBar orig impl where
  runOp _ _ menu_ index' name shortcut cb flags = insertMenuItem (safeCast menu_) index' name shortcut cb flags insertWithFlags' insertWithShortcutnameFlags'
{# fun Fl_Sys_Menu_Bar_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) SysMenuBar orig impl where
  runOp _ _ sysMenuBar = withRef sysMenuBar $ \sysMenuBarPtr -> draw'' sysMenuBarPtr
{# fun Fl_Sys_Menu_Bar_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) SysMenuBar orig impl where
  runOp _ _ sysMenuBar = withRef sysMenuBar $ \sysMenuBarPtr -> drawSuper' sysMenuBarPtr
{#fun Fl_Sys_Menu_Bar_handle as sysMenuBarHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) SysMenuBar orig impl where
  runOp _ _ sysMenuBar event = withRef sysMenuBar (\p -> sysMenuBarHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Sys_Menu_Bar_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) SysMenuBar orig impl where
  runOp _ _ sysMenuBar event = withRef sysMenuBar $ \sysMenuBarPtr -> handleSuper' sysMenuBarPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Sys_Menu_Bar_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) SysMenuBar orig impl where
  runOp _ _ sysMenuBar rectangle = withRef sysMenuBar $ \sysMenuBarPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' sysMenuBarPtr x_pos y_pos w_pos h_pos
{# fun Fl_Sys_Menu_Bar_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) SysMenuBar orig impl where
  runOp _ _ sysMenuBar rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef sysMenuBar $ \sysMenuBarPtr -> resizeSuper' sysMenuBarPtr x_pos y_pos width height
{# fun Fl_Sys_Menu_Bar_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) SysMenuBar orig impl where
  runOp _ _ sysMenuBar = withRef sysMenuBar $ \sysMenuBarPtr -> hide' sysMenuBarPtr
{# fun Fl_Sys_Menu_Bar_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) SysMenuBar orig impl where
  runOp _ _ sysMenuBar = withRef sysMenuBar $ \sysMenuBarPtr -> hideSuper' sysMenuBarPtr
{# fun Fl_Sys_Menu_Bar_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) SysMenuBar orig impl where
  runOp _ _ sysMenuBar = withRef sysMenuBar $ \sysMenuBarPtr -> show' sysMenuBarPtr
{# fun Fl_Sys_Menu_Bar_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) SysMenuBar orig impl where
  runOp _ _ sysMenuBar = withRef sysMenuBar $ \sysMenuBarPtr -> showSuper' sysMenuBarPtr

-- $functions
-- @
-- add:: ('Parent' a 'MenuItem') => 'Ref' 'SysMenuBar' -> 'T.Text' -> 'Maybe' 'Shortcut' -> 'Maybe' ('Ref' a-> 'IO' ()) -> 'MenuItemFlags' -> 'IO' ('MenuItemIndex')
--
-- addName :: 'Ref' 'SysMenuBar' -> 'T.Text' -> 'IO' ()
--
-- clear :: 'Ref' 'SysMenuBar' -> 'IO' ()
--
-- clearSubmenu :: 'Ref' 'SysMenuBar' -> 'Int' -> 'IO' ('Int')
--
-- destroy :: 'Ref' 'SysMenuBar' -> 'IO' ()
--
-- draw :: 'Ref' 'SysMenuBar' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'SysMenuBar' -> 'IO' ()
--
-- getMode :: 'Ref' 'SysMenuBar' -> 'Int' -> 'IO' ('Maybe' 'MenuItemFlags')
--
-- global :: 'Ref' 'SysMenuBar' -> 'IO' ()
--
-- handle :: 'Ref' 'SysMenuBar' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handle :: 'Ref' 'SysMenuBar' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'SysMenuBar' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'SysMenuBar' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'SysMenuBar' -> 'IO' ()
--
-- insert:: ('Parent' a 'MenuPrim') => 'Ref' 'SysMenuBar' -> 'Int' -> 'T.Text' -> 'Maybe' 'Shortcut' -> ('Ref' a -> 'IO' ()) -> 'MenuItemFlags' -> 'IO' ('MenuItemIndex')
--
-- remove :: 'Ref' 'SysMenuBar' -> 'Int' -> 'IO' ()
--
-- replace :: 'Ref' 'SysMenuBar' -> 'Int' -> 'T.Text' -> 'IO' ()
--
-- resize :: 'Ref' 'SysMenuBar' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'SysMenuBar' -> 'Rectangle' -> 'IO' ()
--
-- setMenu :: 'Ref' 'SysMenuBar' -> ['Ref' 'MenuItem'] -> 'IO' ()
--
-- setMode :: 'Ref' 'SysMenuBar' -> 'Int' -> 'MenuItemFlags' -> 'IO' ()
--
-- setShortcut :: 'Ref' 'SysMenuBar' -> 'Int' -> 'ShortcutKeySequence' -> 'IO' ()
--
-- showWidget :: 'Ref' 'SysMenuBar' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'SysMenuBar' -> 'IO' ()
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.MenuPrim"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.MenuBar"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.SysMenuBar"
--
-- @
