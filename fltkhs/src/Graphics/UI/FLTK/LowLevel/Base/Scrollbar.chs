{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.Scrollbar
    (
     -- * Constructor
     scrollbarNew,
     scrollbarCustom
    , drawScrollbarBase
    , handleScrollbarBase
    , resizeScrollbarBase
    , hideScrollbarBase
    , showWidgetScrollbarBase
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
import Graphics.UI.FLTK.LowLevel.Base.Widget
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T

{# fun Fl_OverriddenScrollbar_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
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
{# fun Fl_Scrollbar_New_WithLabel as scrollbarNewWithLabel' { `Int',`Int',`Int',`Int', `CString'} -> `Ptr ()' id #}
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
instance (impl ~ (IO ())) => Op (Destroy ()) ScrollbarBase orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
    scrollbarDestroy' winPtr
    return nullPtr

{# fun Fl_Scrollbar_scrollvalue as scrollvalue' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `Int' #}
instance (impl ~ (Y -> Lines -> LineNumber -> Lines ->  IO (Int))) => Op (Scrollvalue ()) ScrollbarBase orig impl where
  runOp _ _ slider (Y pos) (Lines size) (LineNumber first) (Lines total) = withRef slider $ \sliderPtr -> scrollvalue' sliderPtr pos size first total

{# fun Fl_Scrollbar_set_linesize as setLinesize' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (LineSize ->  IO ())) => Op (SetLinesize ()) ScrollbarBase orig impl where
  runOp _ _ slider (LineSize i) = withRef slider $ \sliderPtr -> setLinesize' sliderPtr i

{# fun Fl_Scrollbar_linesize as linesize' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO LineSize)) => Op (GetLinesize ()) ScrollbarBase orig impl where
  runOp _ _ slider = withRef slider $ \sliderPtr -> linesize' sliderPtr >>= return . LineSize

{# fun Fl_Widget_set_type as setType' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ (ScrollbarType ->  IO ())) => Op (SetType ()) ScrollbarBase orig impl where
  runOp _ _ widget t = withRef widget $ \widgetPtr -> setType' widgetPtr (fromInteger $ toInteger $ fromEnum t)
{# fun Fl_Widget_type as type' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ IO (ScrollbarType)) => Op (GetType_ ()) ScrollbarBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> type' widgetPtr >>= return . toEnum . fromInteger . toInteger


{# fun Fl_Scrollbar_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawScrollbarBase ::  Ref ScrollbarBase -> IO ()
drawScrollbarBase scrolled = withRef scrolled $ \scrolledPtr -> drawSuper' scrolledPtr
{# fun Fl_Scrollbar_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleScrollbarBase :: Ref ScrollbarBase -> Event ->  IO (Either UnknownEvent ())
handleScrollbarBase scrolled event = withRef scrolled $ \scrolledPtr -> handleSuper' scrolledPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Scrollbar_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeScrollbarBase :: Ref ScrollbarBase -> Rectangle -> IO ()
resizeScrollbarBase scrolled rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef scrolled $ \scrolledPtr -> resizeSuper' scrolledPtr x_pos y_pos width height
{# fun Fl_Scrollbar_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideScrollbarBase ::  Ref ScrollbarBase -> IO ()
hideScrollbarBase scrolled = withRef scrolled $ \scrolledPtr -> hideSuper' scrolledPtr
{# fun Fl_Scrollbar_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetScrollbarBase ::  Ref ScrollbarBase -> IO ()
showWidgetScrollbarBase scrolled = withRef scrolled $ \scrolledPtr -> showSuper' scrolledPtr

{# fun Fl_Scrollbar_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) ScrollbarBase orig impl where
  runOp _ _ scrollbar = withRef scrollbar $ \scrollbarPtr -> draw'' scrollbarPtr
{# fun Fl_Scrollbar_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) ScrollbarBase orig impl where
  runOp _ _ scrollbar rectangle = withRef scrollbar $ \scrollbarPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' scrollbarPtr x_pos y_pos w_pos h_pos
{# fun Fl_Scrollbar_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) ScrollbarBase orig impl where
  runOp _ _ scrollbar = withRef scrollbar $ \scrollbarPtr -> hide' scrollbarPtr
{# fun Fl_Scrollbar_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) ScrollbarBase orig impl where
  runOp _ _ scrollbar = withRef scrollbar $ \scrollbarPtr -> show' scrollbarPtr


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Valuator"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Slider"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Scrollbar"
-- @

-- $functions
-- @
-- destroy :: 'Ref' 'ScrollbarBase' -> 'IO' ()
--
-- draw :: 'Ref' 'ScrollbarBase' -> 'IO' ()
--
-- getLinesize :: 'Ref' 'ScrollbarBase' -> 'IO' 'LineSize'
--
-- getType_ :: 'Ref' 'ScrollbarBase' -> 'IO' ('ScrollbarType')
--
-- hide :: 'Ref' 'ScrollbarBase' -> 'IO' ()
--
-- resize :: 'Ref' 'ScrollbarBase' -> 'Rectangle' -> 'IO' ()
--
-- scrollvalue :: 'Ref' 'ScrollbarBase' -> 'Y' -> 'Lines' -> 'LineNumber' -> 'Lines' -> 'IO' ('Int')
--
-- setLinesize :: 'Ref' 'ScrollbarBase' -> 'LineSize' -> 'IO' ()
--
-- setType :: 'Ref' 'ScrollbarBase' -> 'ScrollbarType' -> 'IO' ()
--
-- showWidget :: 'Ref' 'ScrollbarBase' -> 'IO' ()
-- @
