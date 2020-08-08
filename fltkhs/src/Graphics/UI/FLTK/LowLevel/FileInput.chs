{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.FileInput
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
#include "Fl_File_InputC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_File_Input_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) FileInput orig impl where
  runOp _ _ fileInput = withRef fileInput $ \fileInputPtr -> draw'' fileInputPtr
{#fun Fl_File_Input_handle as fileInputHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) FileInput orig impl where
  runOp _ _ fileInput event = withRef fileInput (\p -> fileInputHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_File_Input_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) FileInput orig impl where
  runOp _ _ fileInput = withRef fileInput $ \fileInputPtr -> hide' fileInputPtr
{# fun Fl_File_Input_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) FileInput orig impl where
  runOp _ _ fileInput = withRef fileInput $ \fileInputPtr -> show' fileInputPtr
{# fun Fl_File_Input_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) FileInput orig impl where
  runOp _ _ fileInput rectangle = withRef fileInput $ \fileInputPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' fileInputPtr x_pos y_pos w_pos h_pos

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Input"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.FileInput"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.FileInput"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'FileInput' -> 'IO' ()
--
-- handle :: 'Ref' 'FileInput' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'FileInput' -> 'IO' ()
--
-- resize :: 'Ref' 'FileInput' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'FileInput' -> 'IO' ()
-- @
