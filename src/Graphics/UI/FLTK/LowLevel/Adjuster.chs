{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Adjuster
    (
     -- * Constructor
     adjusterNew,
     adjusterCustom,
     -- * Hierarchy
     --
     -- $hierarchy

     -- *  Functions
     --
     -- $functions
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_AdjusterC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Widget

{# fun Fl_OverriddenAdjuster_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenAdjuster_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
adjusterCustom ::
       Rectangle                         -- ^ The bounds of this Adjuster
    -> Maybe T.Text                      -- ^ The Adjuster label
    -> Maybe (Ref Adjuster -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs Adjuster)      -- ^ Optional custom widget functions
    -> IO (Ref Adjuster)
adjusterCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'


{# fun Fl_Adjuster_New as adjusterNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Adjuster_New_WithLabel as adjusterNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text'} -> `Ptr ()' id #}
adjusterNew :: Rectangle -> Maybe T.Text -> IO (Ref Adjuster)
adjusterNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> adjusterNew' x_pos y_pos width height >>=
                             toRef
        Just l -> adjusterNewWithLabel' x_pos y_pos width height l >>=
                               toRef

{# fun Fl_Adjuster_Destroy as adjusterDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) Adjuster orig impl where
  runOp _ _ adjuster = swapRef adjuster $ \adjusterPtr -> do
    adjusterDestroy' adjusterPtr
    return nullPtr

{# fun Fl_Adjuster_soft as soft' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetSoft ()) Adjuster orig impl where
  runOp _ _ adjuster = withRef adjuster $ \adjusterPtr -> soft' adjusterPtr

{# fun Fl_Adjuster_set_soft as setSoft' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetSoft ()) Adjuster orig impl where
  runOp _ _ adjuster soft = withRef adjuster $ \adjusterPtr -> setSoft' adjusterPtr soft

{# fun Fl_Adjuster_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Adjuster orig impl where
  runOp _ _ adjuster = withRef adjuster $ \adjusterPtr -> draw'' adjusterPtr
{# fun Fl_Adjuster_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) Adjuster orig impl where
  runOp _ _ adjuster = withRef adjuster $ \adjusterPtr -> drawSuper' adjusterPtr
{#fun Fl_Adjuster_handle as adjusterHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Adjuster orig impl where
  runOp _ _ adjuster event = withRef adjuster (\p -> adjusterHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Adjuster_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) Adjuster orig impl where
  runOp _ _ adjuster event = withRef adjuster $ \adjusterPtr -> handleSuper' adjusterPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Adjuster_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Adjuster orig impl where
  runOp _ _ adjuster rectangle = withRef adjuster $ \adjusterPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' adjusterPtr x_pos y_pos w_pos h_pos
{# fun Fl_Adjuster_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) Adjuster orig impl where
  runOp _ _ adjuster rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef adjuster $ \adjusterPtr -> resizeSuper' adjusterPtr x_pos y_pos width height
{# fun Fl_Adjuster_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Adjuster orig impl where
  runOp _ _ adjuster = withRef adjuster $ \adjusterPtr -> hide' adjusterPtr
{# fun Fl_Adjuster_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) Adjuster orig impl where
  runOp _ _ adjuster = withRef adjuster $ \adjusterPtr -> hideSuper' adjusterPtr
{# fun Fl_Adjuster_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Adjuster orig impl where
  runOp _ _ adjuster = withRef adjuster $ \adjusterPtr -> show' adjusterPtr
{# fun Fl_Adjuster_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) Adjuster orig impl where
  runOp _ _ adjuster = withRef adjuster $ \adjusterPtr -> showSuper' adjusterPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Valuator"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Adjuster"
-- @


-- $functions
-- @
-- destroy :: 'Ref' 'Adjuster' -> 'IO' ()
--
-- draw :: 'Ref' 'Adjuster' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'Adjuster' -> 'IO' ()
--
-- getSoft :: 'Ref' 'Adjuster' -> 'IO' ('Int')
--
-- handle :: 'Ref' 'Adjuster' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'Adjuster' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Adjuster' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'Adjuster' -> 'IO' ()
--
-- resize :: 'Ref' 'Adjuster' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'Adjuster' -> 'Rectangle' -> 'IO' ()
--
-- setSoft :: 'Ref' 'Adjuster' -> 'Int' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Adjuster' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'Adjuster' -> 'IO' ()
-- @
