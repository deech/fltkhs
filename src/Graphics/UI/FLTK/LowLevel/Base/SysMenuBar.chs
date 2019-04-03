{-# LANGUAGE CPP, EmptyDataDecls, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.SysMenuBar
    (
     sysMenuBarNew,
     sysMenuBarCustom
  , drawSysMenuBarBase
  , handleSysMenuBarBase
  , resizeSysMenuBarBase
  , hideSysMenuBarBase
  , showWidgetSysMenuBarBase
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
import Graphics.UI.FLTK.LowLevel.Base.Widget
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Base.MenuItem
import Graphics.UI.FLTK.LowLevel.Base.MenuPrim

{# fun Fl_OverriddenSys_Menu_Bar_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
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
{# fun Fl_Sys_Menu_Bar_New_WithLabel as sysMenuBarNewWithLabel' { `Int',`Int',`Int',`Int', `CString'} -> `Ptr ()' id #}
sysMenuBarNew :: Rectangle -> Maybe T.Text -> IO (Ref SysMenuBar)
sysMenuBarNew rectangle l'=
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'
{# fun Fl_Sys_Menu_Bar_Destroy as sysMenuBarDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Destroy ()) SysMenuBarBase orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
    sysMenuBarDestroy' winPtr
    return nullPtr
{# fun Fl_Sys_Menu_Bar_remove as remove' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int  ->  IO ())) => Op (Remove ()) SysMenuBarBase orig impl where
  runOp _ _ menu_ index' = withRef menu_ $ \menu_Ptr -> remove' menu_Ptr index'
{# fun Fl_Sys_Menu_Bar_replace as replace' { id `Ptr ()',`Int', `CString' } -> `()' #}
instance (impl ~ (AtIndex -> T.Text ->  IO ())) => Op (Replace ()) SysMenuBarBase orig impl where
  runOp _ _ menu_ (AtIndex index') name = withRef menu_ $ \menu_Ptr -> copyTextToCString name >>= replace' menu_Ptr index'
{# fun Fl_Sys_Menu_Bar_clear as clear' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Clear ()) SysMenuBarBase orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> clear' menu_Ptr
{# fun Fl_Sys_Menu_Bar_clear_submenu as clearSubmenu' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (AtIndex ->  IO (Either OutOfRangeOrNotSubmenu ()))) => Op (ClearSubmenu ()) SysMenuBarBase orig impl where
  runOp _ _ menu_ (AtIndex index') = withRef menu_ $ \menu_Ptr -> clearSubmenu' menu_Ptr index' >>= return . successOrOutOfRangeOrNotSubmenu
{# fun Fl_Sys_Menu_Bar_shortcut as shortcut' { id `Ptr ()',`Int',id `CInt' } -> `()' #}
instance (impl ~ (AtIndex -> ShortcutKeySequence ->  IO ())) => Op (SetShortcut ()) SysMenuBarBase orig impl where
  runOp _ _ menu_ (AtIndex index') (ShortcutKeySequence modifiers char) =
    withRef menu_ $ \menu_Ptr ->
        shortcut' menu_Ptr index' (keySequenceToCInt modifiers char)
{# fun Fl_Sys_Menu_Bar_set_mode as setMode' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (AtIndex -> MenuItemFlags ->  IO ())) => Op (SetMode ()) SysMenuBarBase orig impl where
  runOp _ _ menu_ (AtIndex i) fl = withRef menu_ $ \menu_Ptr -> setMode' menu_Ptr i (menuItemFlagsToInt fl)
{# fun Fl_Sys_Menu_Bar_mode as mode' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (AtIndex ->  IO (Maybe MenuItemFlags))) => Op (GetMode ()) SysMenuBarBase orig impl where
  runOp _ _ menu_ (AtIndex i) = withRef menu_ $ \menu_Ptr -> mode' menu_Ptr i >>= return . intToMenuItemFlags
{# fun Fl_Sys_Menu_Bar_global as global' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Global ()) SysMenuBarBase orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> global' menu_Ptr
{# fun Fl_Sys_Menu_Bar_menu_with_m as menuWithM' { id `Ptr ()',id `Ptr ( Ptr () )',`Int' } -> `()' #}
instance (impl ~ ([Ref MenuItem] -> IO ())) => Op (SetMenu ()) SysMenuBarBase orig impl where
  runOp _ _ menu_ items =
    withRef menu_ $ \menu_Ptr ->
        withRefs items $ \menu_itemsPtr ->
            menuWithM' menu_Ptr menu_itemsPtr (length items)

{# fun Fl_Sys_Menu_Bar_add_with_name as add' { id `Ptr ()',`CString'} -> `()' #}
instance (impl ~ (T.Text -> IO ())) => Op (AddName ()) SysMenuBarBase orig impl where
  runOp _ _ menu_ name' = withRef menu_ $ \menu_Ptr -> copyTextToCString name' >>= add' menu_Ptr

{# fun Fl_Sys_Menu_Bar_add_with_flags as addWithFlags' { id `Ptr ()',`CString',id `CInt',id `FunPtr CallbackWithUserDataPrim',`Int' } -> `Int' #}
{# fun Fl_Sys_Menu_Bar_add_with_shortcutname_flags as addWithShortcutnameFlags' { id `Ptr ()', `CString', `CString',id `FunPtr CallbackWithUserDataPrim',`Int' } -> `Int' #}
instance (Parent a MenuItemBase, impl ~ ( T.Text -> Maybe Shortcut -> Maybe (Ref a-> IO ()) -> MenuItemFlags -> IO (AtIndex))) => Op (Add ()) SysMenuBarBase orig (impl) where
  runOp _ _ menu_ name shortcut cb flags =
    addMenuItem (Left (safeCast menu_)) name shortcut cb flags addWithFlags' addWithShortcutnameFlags'

{# fun Fl_Sys_Menu_Bar_insert_with_flags as insertWithFlags' { id `Ptr ()',`Int',`CString',id `CInt',id `FunPtr CallbackWithUserDataPrim',`Int'} -> `Int' #}
{# fun Fl_Sys_Menu_Bar_insert_with_shortcutname_flags as insertWithShortcutnameFlags' { id `Ptr ()',`Int',`CString', `CString',id `FunPtr CallbackWithUserDataPrim',`Int' } -> `Int' #}
instance (Parent a MenuPrimBase, impl ~ ( AtIndex -> T.Text -> Maybe Shortcut -> (Ref a -> IO ()) -> MenuItemFlags -> IO (AtIndex))) => Op (Insert ()) SysMenuBarBase orig impl where
  runOp _ _ menu_ (AtIndex index') name shortcut cb flags = insertMenuItem (safeCast menu_) index' name shortcut cb flags insertWithFlags' insertWithShortcutnameFlags'

{# fun Fl_Sys_Menu_Bar_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawSysMenuBarBase ::  Ref SysMenuBarBase -> IO ()
drawSysMenuBarBase sysMenuBar = withRef sysMenuBar $ \sysMenuBarPtr -> drawSuper' sysMenuBarPtr
{# fun Fl_Sys_Menu_Bar_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleSysMenuBarBase :: Ref SysMenuBarBase -> Event ->  IO (Either UnknownEvent ())
handleSysMenuBarBase sysMenuBar event = withRef sysMenuBar $ \sysMenuBarPtr -> handleSuper' sysMenuBarPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Sys_Menu_Bar_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeSysMenuBarBase :: Ref SysMenuBarBase -> Rectangle -> IO ()
resizeSysMenuBarBase sysMenuBar rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef sysMenuBar $ \sysMenuBarPtr -> resizeSuper' sysMenuBarPtr x_pos y_pos width height
{# fun Fl_Sys_Menu_Bar_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideSysMenuBarBase ::  Ref SysMenuBarBase -> IO ()
hideSysMenuBarBase sysMenuBar = withRef sysMenuBar $ \sysMenuBarPtr -> hideSuper' sysMenuBarPtr
{# fun Fl_Sys_Menu_Bar_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetSysMenuBarBase ::  Ref SysMenuBarBase -> IO ()
showWidgetSysMenuBarBase sysMenuBar = withRef sysMenuBar $ \sysMenuBarPtr -> showSuper' sysMenuBarPtr


{# fun Fl_Sys_Menu_Bar_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) SysMenuBarBase orig impl where
  runOp _ _ sysMenuBar = withRef sysMenuBar $ \sysMenuBarPtr -> draw'' sysMenuBarPtr
{#fun Fl_Sys_Menu_Bar_handle as sysMenuBarHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) SysMenuBarBase orig impl where
  runOp _ _ sysMenuBar event = withRef sysMenuBar (\p -> sysMenuBarHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Sys_Menu_Bar_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) SysMenuBarBase orig impl where
  runOp _ _ sysMenuBar rectangle = withRef sysMenuBar $ \sysMenuBarPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' sysMenuBarPtr x_pos y_pos w_pos h_pos
{# fun Fl_Sys_Menu_Bar_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) SysMenuBarBase orig impl where
  runOp _ _ sysMenuBar = withRef sysMenuBar $ \sysMenuBarPtr -> hide' sysMenuBarPtr
{# fun Fl_Sys_Menu_Bar_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) SysMenuBarBase orig impl where
  runOp _ _ sysMenuBar = withRef sysMenuBar $ \sysMenuBarPtr -> show' sysMenuBarPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.MenuPrim"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.MenuBar"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.SysMenuBar"
-- @

-- $functions
-- @
-- add:: ('Parent' a 'MenuItemBase') => 'Ref' 'SysMenuBarBase' -> 'T.Text' -> 'Maybe' 'Shortcut' -> 'Maybe' ('Ref' a-> 'IO' ()) -> 'MenuItemFlags' -> 'IO' ('AtIndex')
--
-- addName :: 'Ref' 'SysMenuBarBase' -> 'T.Text' -> 'IO' ()
--
-- clear :: 'Ref' 'SysMenuBarBase' -> 'IO' ()
--
-- clearSubmenu :: 'Ref' 'SysMenuBarBase' -> 'AtIndex' -> 'IO' ('Either' 'OutOfRangeOrNotSubmenu' ())
--
-- destroy :: 'Ref' 'SysMenuBarBase' -> 'IO' ()
--
-- draw :: 'Ref' 'SysMenuBarBase' -> 'IO' ()
--
-- getMode :: 'Ref' 'SysMenuBarBase' -> 'AtIndex' -> 'IO' ('Maybe' 'MenuItemFlags')
--
-- global :: 'Ref' 'SysMenuBarBase' -> 'IO' ()
--
-- handle :: 'Ref' 'SysMenuBarBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'SysMenuBarBase' -> 'IO' ()
--
-- insert:: ('Parent' a 'MenuPrimBase') => 'Ref' 'SysMenuBarBase' -> 'AtIndex' -> 'T.Text' -> 'Maybe' 'Shortcut' -> ('Ref' a -> 'IO' ()) -> 'MenuItemFlags' -> 'IO' ('AtIndex')
--
-- remove :: 'Ref' 'SysMenuBarBase' -> 'Int' -> 'IO' ()
--
-- replace :: 'Ref' 'SysMenuBarBase' -> 'AtIndex' -> 'T.Text' -> 'IO' ()
--
-- resize :: 'Ref' 'SysMenuBarBase' -> 'Rectangle' -> 'IO' ()
--
-- setMenu :: 'Ref' 'SysMenuBarBase' -> ['Ref' 'MenuItem'] -> 'IO' ()
--
-- setMode :: 'Ref' 'SysMenuBarBase' -> 'AtIndex' -> 'MenuItemFlags' -> 'IO' ()
--
-- setShortcut :: 'Ref' 'SysMenuBarBase' -> 'AtIndex' -> 'ShortcutKeySequence' -> 'IO' ()
--
-- showWidget :: 'Ref' 'SysMenuBarBase' -> 'IO' ()
-- @
