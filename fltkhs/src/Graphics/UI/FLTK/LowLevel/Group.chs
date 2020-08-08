{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Group
    (
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
#include "Fl_GroupC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{#fun Fl_DerivedGroup_handle as groupHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Group orig impl where
  runOp _ _ group event = withRef group (\p -> groupHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent

{# fun Fl_DerivedGroup_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Group orig impl where
  runOp _ _ group rectangle = withRef group $ \groupPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' groupPtr x_pos y_pos w_pos h_pos

{# fun Fl_DerivedGroup_Destroy as groupDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Destroy ()) Group orig impl where
  runOp _ _ group = withRef group $ \groupPtr -> groupDestroy' groupPtr


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Group"
-- @

-- $functions
-- @
-- destroy :: 'Ref' 'Group' -> 'IO' ()
--
-- handle :: 'Ref' 'Group' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- resize :: 'Ref' 'Group' -> 'Rectangle' -> 'IO' ()
-- @
