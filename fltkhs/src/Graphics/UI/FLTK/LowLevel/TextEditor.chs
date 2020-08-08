{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.TextEditor
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
#include "Fl_Text_EditorC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Text_Editor_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) TextEditor orig impl where
  runOp _ _ textEditor = withRef textEditor $ \textEditorPtr -> draw'' textEditorPtr
{#fun Fl_Text_Editor_handle as textEditorHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) TextEditor orig impl where
  runOp _ _ textEditor event = withRef textEditor (\p -> textEditorHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Text_Editor_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) TextEditor orig impl where
  runOp _ _ textEditor = withRef textEditor $ \textEditorPtr -> show' textEditorPtr
{# fun Fl_Text_Editor_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) TextEditor orig impl where
  runOp _ _ textEditor = withRef textEditor $ \textEditorPtr -> hide' textEditorPtr
{# fun Fl_Text_Editor_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) TextEditor orig impl where
  runOp _ _ textEditor rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef textEditor $ \textEditorPtr -> resize' textEditorPtr x_pos y_pos width height

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.TextDisplay"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.TextEditor"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.TextEditor"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'TextEditor' -> 'IO' ()
--
-- handle :: 'Ref' 'TextEditor' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'TextEditor' -> 'IO' ()
--
-- resize :: 'Ref' 'TextEditor' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'TextEditor' -> 'IO' ()
-- @
