{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Wizard
    (
     wizardNew
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
{# fun Fl_Wizard_New_WithLabel as wizardNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
wizardNew :: Rectangle -> Maybe String -> IO (Ref Wizard)
wizardNew rectangle label' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case label' of
        (Just l') -> wizardNewWithLabel' x_pos y_pos width height l' >>= toRef
        Nothing -> wizardNew' x_pos y_pos width height >>= toRef

{# fun Fl_Wizard_Destroy as wizardDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Destroy ()) Wizard ( IO ()) where
  runOp _ wizard = swapRef wizard $ \wizardPtr -> do
    wizardDestroy' wizardPtr
    return nullPtr
{# fun unsafe Fl_Wizard_next as wizardNext' { id `Ptr ()' } -> `()' #}
instance Op (Next ()) Wizard ( IO ()) where
  runOp _ wizard = withRef wizard $ \wizardPtr -> wizardNext' wizardPtr
{# fun unsafe Fl_Wizard_prev as wizardPrev' { id `Ptr ()' } -> `()' #}
instance Op (Prev ()) Wizard ( IO ()) where
  runOp _ wizard = withRef wizard $ \wizardPtr -> wizardPrev' wizardPtr
{# fun unsafe Fl_Wizard_set_value as wizardSetValue' { id `Ptr ()', id `Ptr ()' } -> `()' #}
instance (Parent a Widget) => Op (SetValue ()) Wizard ( Ref a -> IO ()) where
  runOp _ wizard widget =
    withRef wizard $ \wizardPtr ->
      withRef widget $ \widgetPtr ->
        wizardSetValue' wizardPtr widgetPtr
{# fun unsafe Fl_Wizard_value as wizardValue' {id `Ptr ()'} -> `Ptr ()' id #}
instance Op (GetValue ()) Wizard ( IO (Ref Widget)) where
  runOp _ wizard =
    withRef wizard $ \wizardPtr -> wizardValue' wizardPtr >>= toRef
