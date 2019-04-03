{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Button
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
#include "Fl_ButtonC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy


{#fun Fl_DerivedButton_handle as buttonHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ ((Event -> IO (Either UnknownEvent ())))) => Op (Handle ()) Button orig impl where
  runOp _ _ button event = withRef button (\p -> buttonHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_DerivedButton_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ ((Rectangle -> IO ()))) => Op (Resize ()) Button orig impl where
  runOp _ _ button rectangle = withRef button $ \buttonPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' buttonPtr x_pos y_pos w_pos h_pos
{# fun Fl_DerivedButton_show as buttonShow' {id `Ptr ()'} -> `()' supressWarningAboutRes #}
instance (impl ~ ((IO ()))) => Op (ShowWidget ()) Button orig impl where
  runOp _ _ button = withRef button $ (\p -> buttonShow' p)
{# fun Fl_DerivedButton_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (( IO ()))) => Op (Hide ()) Button orig impl where
  runOp _ _ button = withRef button $ \buttonPtr -> hide' buttonPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Button"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Button"
-- @

-- $functions
-- @
-- handle :: 'Ref' 'Button' -> ('Event' -> 'IO' ('Either' 'UnknownEvent' ()))
--
-- hide :: 'Ref' 'Button' -> ( 'IO' ())
--
-- resize :: 'Ref' 'Button' -> ('Rectangle' -> 'IO' ())
--
-- showWidget :: 'Ref' 'Button' -> ('IO' ())
-- @
