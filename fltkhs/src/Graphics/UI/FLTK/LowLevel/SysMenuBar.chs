{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.SysMenuBar
    (
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Widget Functions
     --
     -- $functions
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Sys_Menu_BarC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Sys_Menu_Bar_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) SysMenuBar orig impl where
  runOp _ _ sysMenuBar = withRef sysMenuBar $ \sysMenuBarPtr -> draw'' sysMenuBarPtr
{#fun Fl_Sys_Menu_Bar_handle as sysMenuBarHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) SysMenuBar orig impl where
  runOp _ _ sysMenuBar event = withRef sysMenuBar (\p -> sysMenuBarHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Sys_Menu_Bar_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) SysMenuBar orig impl where
  runOp _ _ sysMenuBar rectangle = withRef sysMenuBar $ \sysMenuBarPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' sysMenuBarPtr x_pos y_pos w_pos h_pos
{# fun Fl_Sys_Menu_Bar_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) SysMenuBar orig impl where
  runOp _ _ sysMenuBar = withRef sysMenuBar $ \sysMenuBarPtr -> hide' sysMenuBarPtr
{# fun Fl_Sys_Menu_Bar_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) SysMenuBar orig impl where
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
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.SysMenuBar"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'SysMenuBar' -> 'IO' ()
--
-- handle :: 'Ref' 'SysMenuBar' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'SysMenuBar' -> 'IO' ()
--
-- resize :: 'Ref' 'SysMenuBar' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'SysMenuBar' -> 'IO' ()
-- @
