{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.MenuPrim
    (
     -- * Hierarchy
     --
     -- $hierarchy

     -- * MenuPrim Functions
     --
     -- $functions
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Menu_C.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{#fun Fl_DerivedMenu__handle as menuPrimHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) MenuPrim orig impl where
  runOp _ _ menuPrim event = withRef menuPrim (\p -> menuPrimHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent

{# fun Fl_DerivedMenu__show as show' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (ShowWidget ()) MenuPrim orig impl where
  runOp _ _ menuPrim = withRef menuPrim $ \menuPrimPtr -> show' menuPrimPtr

{# fun Fl_DerivedMenu__resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Rectangle -> IO ())) => Op (Resize ()) MenuPrim orig impl where
  runOp _ _ menuPrim rectangle = withRef menuPrim $ \menuPrimPtr -> do
    let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
    resize' menuPrimPtr x_pos y_pos w_pos h_pos

{# fun Fl_DerivedMenu__hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Hide ()) MenuPrim orig impl where
  runOp _ _ menuPrim = withRef menuPrim $ \menuPrimPtr -> hide' menuPrimPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.MenuPrim"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.MenuPrim"
-- @

-- $functions
-- @
-- handle :: 'Ref' 'MenuPrim' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'MenuPrim' -> 'IO' ()
--
-- resize :: 'Ref' 'MenuPrim' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'MenuPrim' -> 'IO' ()
-- @
