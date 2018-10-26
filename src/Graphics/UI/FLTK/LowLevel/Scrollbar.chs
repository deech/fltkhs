{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Scrollbar
    (
     -- * Constructor
     scrollbarNew,
     scrollbarCustom
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
#include "Fl_ScrollbarC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Widget
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T

{# fun Fl_OverriddenScrollbar_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenScrollbar_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
scrollbarCustom ::
       Rectangle                         -- ^ The bounds of this Scrollbar
    -> Maybe T.Text                      -- ^ The Scrollbar label
    -> Maybe (Ref Scrollbar -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs Scrollbar)      -- ^ Optional custom widget functions
    -> IO (Ref Scrollbar)
scrollbarCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'


{# fun Fl_Scrollbar_New as scrollbarNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Scrollbar_New_WithLabel as scrollbarNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text'} -> `Ptr ()' id #}
scrollbarNew :: Rectangle -> Maybe T.Text -> IO (Ref Scrollbar)
scrollbarNew rectangle l'=
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Scrollbar_Destroy as scrollbarDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) Scrollbar orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
    scrollbarDestroy' winPtr
    return nullPtr

{# fun Fl_Scrollbar_scrollvalue as scrollvalue' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `Int' #}
instance (impl ~ (Y -> Lines -> LineNumber -> Lines ->  IO (Int))) => Op (Scrollvalue ()) Scrollbar orig impl where
  runOp _ _ slider (Y pos) (Lines size) (LineNumber first) (Lines total) = withRef slider $ \sliderPtr -> scrollvalue' sliderPtr pos size first total

{# fun Fl_Scrollbar_set_linesize as setLinesize' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (LineSize ->  IO ())) => Op (SetLinesize ()) Scrollbar orig impl where
  runOp _ _ slider (LineSize i) = withRef slider $ \sliderPtr -> setLinesize' sliderPtr i

{# fun Fl_Scrollbar_linesize as linesize' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO LineSize)) => Op (GetLinesize ()) Scrollbar orig impl where
  runOp _ _ slider = withRef slider $ \sliderPtr -> linesize' sliderPtr >>= return . LineSize

{# fun Fl_Widget_set_type as setType' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ (ScrollbarType ->  IO ())) => Op (SetType ()) Scrollbar orig impl where
  runOp _ _ widget t = withRef widget $ \widgetPtr -> setType' widgetPtr (fromInteger $ toInteger $ fromEnum t)
{# fun Fl_Widget_type as type' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ IO (ScrollbarType)) => Op (GetType_ ()) Scrollbar orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> type' widgetPtr >>= return . toEnum . fromInteger . toInteger

{# fun Fl_Scrollbar_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Scrollbar orig impl where
  runOp _ _ scrollbar = withRef scrollbar $ \scrollbarPtr -> draw'' scrollbarPtr
{# fun Fl_Scrollbar_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) Scrollbar orig impl where
  runOp _ _ scrollbar = withRef scrollbar $ \scrollbarPtr -> drawSuper' scrollbarPtr
{#fun Fl_Scrollbar_handle as scrollbarHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Scrollbar orig impl where
  runOp _ _ scrollbar event = withRef scrollbar (\p -> scrollbarHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Scrollbar_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) Scrollbar orig impl where
  runOp _ _ scrollbar event = withRef scrollbar $ \scrollbarPtr -> handleSuper' scrollbarPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Scrollbar_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Scrollbar orig impl where
  runOp _ _ scrollbar rectangle = withRef scrollbar $ \scrollbarPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' scrollbarPtr x_pos y_pos w_pos h_pos
{# fun Fl_Scrollbar_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) Scrollbar orig impl where
  runOp _ _ scrollbar rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef scrollbar $ \scrollbarPtr -> resizeSuper' scrollbarPtr x_pos y_pos width height
{# fun Fl_Scrollbar_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Scrollbar orig impl where
  runOp _ _ scrollbar = withRef scrollbar $ \scrollbarPtr -> hide' scrollbarPtr
{# fun Fl_Scrollbar_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) Scrollbar orig impl where
  runOp _ _ scrollbar = withRef scrollbar $ \scrollbarPtr -> hideSuper' scrollbarPtr
{# fun Fl_Scrollbar_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Scrollbar orig impl where
  runOp _ _ scrollbar = withRef scrollbar $ \scrollbarPtr -> show' scrollbarPtr
{# fun Fl_Scrollbar_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) Scrollbar orig impl where
  runOp _ _ scrollbar = withRef scrollbar $ \scrollbarPtr -> showSuper' scrollbarPtr

-- $functions
-- @
-- destroy :: 'Ref' 'Scrollbar' -> 'IO' ()
--
-- draw :: 'Ref' 'Scrollbar' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'Scrollbar' -> 'IO' ()
--
-- getLinesize :: 'Ref' 'Scrollbar' -> 'IO' 'LineSize'
--
-- getType_ :: 'Ref' 'Scrollbar' -> 'IO' ('ScrollbarType')
--
-- handle :: 'Ref' 'Scrollbar' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'Scrollbar' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Scrollbar' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'Scrollbar' -> 'IO' ()
--
-- resize :: 'Ref' 'Scrollbar' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'Scrollbar' -> 'Rectangle' -> 'IO' ()
--
-- scrollvalue :: 'Ref' 'Scrollbar' -> 'Y' -> 'Lines' -> 'LineNumber' -> 'Lines' -> 'IO' ('Int')
--
-- setLinesize :: 'Ref' 'Scrollbar' -> 'LineSize' -> 'IO' ()
--
-- setType :: 'Ref' 'Scrollbar' -> 'ScrollbarType' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Scrollbar' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'Scrollbar' -> 'IO' ()
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Valuator"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Slider"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Scrollbar"
-- @
