{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Wizard
    (
     wizardNew,
     wizardCustom
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
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Widget
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
{# fun Fl_OverriddenWizard_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenWizard_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
wizardCustom ::
       Rectangle                         -- ^ The bounds of this Wizard
    -> Maybe T.Text                      -- ^ The Wizard label
    -> Maybe (Ref Wizard -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs Wizard)      -- ^ Optional custom widget functions
    -> IO (Ref Wizard)
wizardCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'


{# fun Fl_Wizard_New as wizardNew' {  `Int',`Int', `Int', `Int'} -> `Ptr ()' id #}
{# fun Fl_Wizard_New_WithLabel as wizardNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text'} -> `Ptr ()' id #}
wizardNew :: Rectangle -> Maybe T.Text -> IO (Ref Wizard)
wizardNew rectangle label' =
  widgetMaker
    rectangle
    label'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

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
{# fun Fl_Wizard_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Wizard orig impl where
  runOp _ _ wizard = withRef wizard $ \wizardPtr -> draw'' wizardPtr
{# fun Fl_Wizard_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) Wizard orig impl where
  runOp _ _ wizard = withRef wizard $ \wizardPtr -> drawSuper' wizardPtr
{#fun Fl_Wizard_handle as wizardHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Wizard orig impl where
  runOp _ _ wizard event = withRef wizard (\p -> wizardHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Wizard_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) Wizard orig impl where
  runOp _ _ wizard event = withRef wizard $ \wizardPtr -> handleSuper' wizardPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Wizard_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Wizard orig impl where
  runOp _ _ wizard rectangle = withRef wizard $ \wizardPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' wizardPtr x_pos y_pos w_pos h_pos
{# fun Fl_Wizard_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) Wizard orig impl where
  runOp _ _ wizard rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef wizard $ \wizardPtr -> resizeSuper' wizardPtr x_pos y_pos width height
{# fun Fl_Wizard_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Wizard orig impl where
  runOp _ _ wizard = withRef wizard $ \wizardPtr -> hide' wizardPtr
{# fun Fl_Wizard_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) Wizard orig impl where
  runOp _ _ wizard = withRef wizard $ \wizardPtr -> hideSuper' wizardPtr
{# fun Fl_Wizard_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Wizard orig impl where
  runOp _ _ wizard = withRef wizard $ \wizardPtr -> show' wizardPtr
{# fun Fl_Wizard_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) Wizard orig impl where
  runOp _ _ wizard = withRef wizard $ \wizardPtr -> showSuper' wizardPtr

-- $functions
-- @
-- destroy :: 'Ref' 'Wizard' -> 'IO' ()
--
-- draw :: 'Ref' 'Wizard' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'Wizard' -> 'IO' ()
--
-- getValue :: 'Ref' 'Wizard' -> 'IO' ('Maybe' ('Ref' 'Widget'))
--
-- handle :: 'Ref' 'Wizard' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'Wizard' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Wizard' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'Wizard' -> 'IO' ()
--
-- next :: 'Ref' 'Wizard' -> 'IO' ()
--
-- prev :: 'Ref' 'Wizard' -> 'IO' ()
--
-- resize :: 'Ref' 'Wizard' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'Wizard' -> 'Rectangle' -> 'IO' ()
--
-- setValue:: ('Parent' a 'Widget') => 'Ref' 'Wizard' -> 'Maybe' ( 'Ref' a ) -> 'IO' ()
--
-- showWidget :: 'Ref' 'Wizard' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'Wizard' -> 'IO' ()
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
