{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Progress
    (
     -- * Constructor
     progressNew,
     progressCustom
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
#include "Fl_ProgressC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)

import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Widget

{# fun Fl_OverriddenProgress_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenProgress_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
progressCustom ::
       Rectangle                         -- ^ The bounds of this Progress
    -> Maybe T.Text                      -- ^ The Progress label
    -> Maybe (Ref Progress -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs Progress)      -- ^ Optional custom widget functions
    -> IO (Ref Progress)
progressCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'


{# fun Fl_Progress_New as progressNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Progress_New_WithLabel as progressNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text'} -> `Ptr ()' id #}
progressNew :: Rectangle -> Maybe T.Text -> IO (Ref Progress)
progressNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> progressNew' x_pos y_pos width height >>=
                             toRef
        Just l -> progressNewWithLabel' x_pos y_pos width height l >>=
                               toRef

{# fun Fl_Progress_Destroy as progressDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Destroy ()) Progress orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
    progressDestroy' winPtr
    return nullPtr
{# fun Fl_Progress_set_maximum as setMaximum' { id `Ptr ()',`Float' } -> `()' #}
instance (impl ~ (Float ->  IO ())) => Op (SetMaximum ()) Progress orig impl where
  runOp _ _ progress v = withRef progress $ \progressPtr -> setMaximum' progressPtr v
{# fun Fl_Progress_maximum as maximum' { id `Ptr ()' } -> `Float' #}
instance (impl ~ ( IO (Float))) => Op (GetMaximum ()) Progress orig impl where
  runOp _ _ progress = withRef progress $ \progressPtr -> maximum' progressPtr
{# fun Fl_Progress_set_minimum as setMinimum' { id `Ptr ()',`Float' } -> `()' #}
instance (impl ~ (Float ->  IO ())) => Op (SetMinimum ()) Progress orig impl where
  runOp _ _ progress v = withRef progress $ \progressPtr -> setMinimum' progressPtr v
{# fun Fl_Progress_minimum as minimum' { id `Ptr ()' } -> `Float' #}
instance (impl ~ ( IO (Float))) => Op (GetMinimum ()) Progress orig impl where
  runOp _ _ progress = withRef progress $ \progressPtr -> minimum' progressPtr
{# fun Fl_Progress_set_value as setValue' { id `Ptr ()',`Float' } -> `()' #}
instance (impl ~ (Float ->  IO ())) => Op (SetValue ()) Progress orig impl where
  runOp _ _ progress v = withRef progress $ \progressPtr -> setValue' progressPtr v
{# fun Fl_Progress_value as value' { id `Ptr ()' } -> `Float' #}
instance (impl ~ ( IO (Float))) => Op (GetValue ()) Progress orig impl where
  runOp _ _ progress = withRef progress $ \progressPtr -> value' progressPtr
{# fun Fl_Progress_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Progress orig impl where
  runOp _ _ progress = withRef progress $ \progressPtr -> draw'' progressPtr
{# fun Fl_Progress_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) Progress orig impl where
  runOp _ _ progress = withRef progress $ \progressPtr -> drawSuper' progressPtr
{#fun Fl_Progress_handle as progressHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Progress orig impl where
  runOp _ _ progress event = withRef progress (\p -> progressHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Progress_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) Progress orig impl where
  runOp _ _ progress event = withRef progress $ \progressPtr -> handleSuper' progressPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Progress_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Progress orig impl where
  runOp _ _ progress rectangle = withRef progress $ \progressPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' progressPtr x_pos y_pos w_pos h_pos
{# fun Fl_Progress_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) Progress orig impl where
  runOp _ _ progress rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef progress $ \progressPtr -> resizeSuper' progressPtr x_pos y_pos width height
{# fun Fl_Progress_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Progress orig impl where
  runOp _ _ progress = withRef progress $ \progressPtr -> hide' progressPtr
{# fun Fl_Progress_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) Progress orig impl where
  runOp _ _ progress = withRef progress $ \progressPtr -> hideSuper' progressPtr
{# fun Fl_Progress_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Progress orig impl where
  runOp _ _ progress = withRef progress $ \progressPtr -> show' progressPtr
{# fun Fl_Progress_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) Progress orig impl where
  runOp _ _ progress = withRef progress $ \progressPtr -> showSuper' progressPtr

-- $functions
-- @
--
-- destroy :: 'Ref' 'Progress' -> 'IO' ()
--
-- draw :: 'Ref' 'Progress' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'Progress' -> 'IO' ()
--
-- getMaximum :: 'Ref' 'Progress' -> 'IO' ('Float')
--
-- getMinimum :: 'Ref' 'Progress' -> 'IO' ('Float')
--
-- getValue :: 'Ref' 'Progress' -> 'IO' ('Float')
--
-- handle :: 'Ref' 'Progress' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'Progress' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Progress' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'Progress' -> 'IO' ()
--
-- resize :: 'Ref' 'Progress' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'Progress' -> 'Rectangle' -> 'IO' ()
--
-- setMaximum :: 'Ref' 'Progress' -> 'Float' -> 'IO' ()
--
-- setMinimum :: 'Ref' 'Progress' -> 'Float' -> 'IO' ()
--
-- setValue :: 'Ref' 'Progress' -> 'Float' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Progress' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'Progress' -> 'IO' ()
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Progress"
-- @
