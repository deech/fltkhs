{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.FileBrowser
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
#include "Fl_File_BrowserC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_File_Browser_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) FileBrowser orig impl where
  runOp _ _ fileBrowser = withRef fileBrowser $ \fileBrowserPtr -> draw'' fileBrowserPtr
{#fun Fl_File_Browser_handle as fileBrowserHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) FileBrowser orig impl where
  runOp _ _ fileBrowser event = withRef fileBrowser (\p -> fileBrowserHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_File_Browser_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) FileBrowser orig impl where
  runOp _ _ fileBrowser = withRef fileBrowser $ \fileBrowserPtr -> hide' fileBrowserPtr
{# fun Fl_File_Browser_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) FileBrowser orig impl where
  runOp _ _ fileBrowser = withRef fileBrowser $ \fileBrowserPtr -> show' fileBrowserPtr
{# fun Fl_File_Browser_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) FileBrowser orig impl where
  runOp _ _ fileBrowser rectangle = withRef fileBrowser $ \fileBrowserPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' fileBrowserPtr x_pos y_pos w_pos h_pos

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Browser"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.FileBrowser"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.FileBrowser"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'FileBrowser' -> 'IO' ()
--
-- handle :: 'Ref' 'FileBrowser' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'FileBrowser' -> 'IO' ()
--
-- resize :: 'Ref' 'FileBrowser' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'FileBrowser' -> 'IO' ()
-- @
