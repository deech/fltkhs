{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Input
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
#include "Fl_Secret_InputC.h"
#include "Fl_InputC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Base.Input

{#fun Fl_Input_handle as inputHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
{#fun Fl_Secret_Input_handle as secretInputHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Input orig impl where
  runOp _ _ input event =
    withRef
      input
      (\p -> do
          t <- getInputType input
          case t of
           FlSecretInput -> secretInputHandle' p (fromIntegral . fromEnum $ event)
           _             -> inputHandle' p (fromIntegral . fromEnum $ event)
      )
    >>= return . successOrUnknownEvent


{# fun Fl_Input_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Input orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> draw'' inputPtr
{# fun Fl_Input_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Input orig impl where
  runOp _ _ input rectangle = withRef input $ \inputPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' inputPtr x_pos y_pos w_pos h_pos
{# fun Fl_Input_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Input orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> hide' inputPtr
{# fun Fl_Input_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Input orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> show' inputPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Input"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Input"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'Input' -> 'IO' ()
--
-- handle :: 'Ref' 'Input' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Input' -> 'IO' ()
--
-- resize :: 'Ref' 'Input' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Input' -> 'IO' ()
-- @
