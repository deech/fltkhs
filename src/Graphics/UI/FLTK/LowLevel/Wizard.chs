{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Wizard
    (
     wizardNew
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
#include "Fl_WizardC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch

{# fun Fl_Wizard_New as wizardNew' {  `Int',`Int', `Int', `Int'} -> `Ptr ()' id #}
{# fun Fl_Wizard_New_WithLabel as wizardNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `String'} -> `Ptr ()' id #}
wizardNew :: Rectangle -> Maybe String -> IO (Ref Wizard)
wizardNew rectangle label' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case label' of
        (Just l') -> wizardNewWithLabel' x_pos y_pos width height l' >>= toRef
        Nothing -> wizardNew' x_pos y_pos width height >>= toRef

{# fun Fl_Wizard_Destroy as wizardDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) Wizard orig impl where
  runOp _ _ wizard = swapRef wizard $ \wizardPtr -> do
    wizardDestroy' wizardPtr
    return nullPtr
{# fun Fl_Wizard_next as wizardNext' { id `Ptr ()' } -> `()' #}
instance (impl ~ (IO ())) => Op (Next ()) Wizard orig impl where
  runOp _ _ wizard = withRef wizard $ \wizardPtr -> wizardNext' wizardPtr
{# fun Fl_Wizard_prev as wizardPrev' { id `Ptr ()' } -> `()' #}
instance (impl ~ (IO ())) => Op (Prev ()) Wizard orig impl where
  runOp _ _ wizard = withRef wizard $ \wizardPtr -> wizardPrev' wizardPtr
{# fun Fl_Wizard_set_value as wizardSetValue' { id `Ptr ()', id `Ptr ()' } -> `()' #}
instance (Parent a Widget, impl ~ ( Maybe ( Ref a ) -> IO ())) => Op (SetValue ()) Wizard orig impl where
  runOp _ _ wizard widget =
    withRef wizard $ \wizardPtr ->
      withMaybeRef widget $ \widgetPtr ->
        wizardSetValue' wizardPtr widgetPtr
{# fun Fl_Wizard_value as wizardValue' {id `Ptr ()'} -> `Ptr ()' id #}
instance (impl ~ (IO (Maybe (Ref Widget)))) => Op (GetValue ()) Wizard orig impl where
  runOp _ _ wizard =
    withRef wizard $ \wizardPtr -> wizardValue' wizardPtr >>= toMaybeRef

-- $functions
-- @
--
-- destroy :: 'Ref' 'Wizard' -> 'IO' ()
--
-- getValue :: 'Ref' 'Wizard' -> 'IO' ('Maybe' ('Ref' 'Widget'))
--
-- next :: 'Ref' 'Wizard' -> 'IO' ()
--
-- prev :: 'Ref' 'Wizard' -> 'IO' ()
--
-- setValue:: ('Parent' a 'Widget') => 'Ref' 'Wizard' -> 'Maybe' ( 'Ref' a ) -> 'IO' ()
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Wizard"
-- @
