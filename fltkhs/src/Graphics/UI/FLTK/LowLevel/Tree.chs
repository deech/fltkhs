{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Tree
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
#include "Fl_TreeC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Tree_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> draw'' treePtr
{#fun Fl_Tree_handle as treeHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Tree orig impl where
  runOp _ _ tree event = withRef tree (\p -> treeHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Tree_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> show' treePtr
{# fun Fl_Tree_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Tree orig impl where
  runOp _ _ tree = withRef tree $ \treePtr -> hide' treePtr
{# fun Fl_Tree_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Tree orig impl where
  runOp _ _ tree rectangle = withRef tree $ \treePtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' treePtr x_pos y_pos w_pos h_pos

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Tree"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Tree"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'Tree' -> 'IO' ()
--
-- handle :: 'Ref' 'Tree' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Tree' -> 'IO' ()
--
-- resize :: 'Ref' 'Tree' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Tree' -> 'IO' ()
-- @
