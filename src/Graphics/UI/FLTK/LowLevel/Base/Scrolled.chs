{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.Scrolled
    (
     -- * Constructor
     scrolledNew,
     scrolledCustom
  , drawScrolledBase
  , handleScrolledBase
  , resizeScrolledBase
  , hideScrolledBase
  , showWidgetScrolledBase
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
#include "Fl_ScrollC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Base.Widget
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
{# fun Fl_OverriddenScroll_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenScroll_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
scrolledCustom ::
       Rectangle                         -- ^ The bounds of this Scrolled
    -> Maybe T.Text                      -- ^ The Scrolled label
    -> Maybe (Ref Scrolled -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs Scrolled)      -- ^ Optional custom widget functions
    -> IO (Ref Scrolled)
scrolledCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'


{# fun Fl_Scroll_New as scrollNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Scroll_New_WithLabel as scrollNewWithLabel' { `Int',`Int',`Int',`Int', `CString'} -> `Ptr ()' id #}
scrolledNew :: Rectangle -> Maybe T.Text -> IO (Ref Scrolled)
scrolledNew rectangle l'=
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'
{# fun Fl_Scroll_set_scrollbar_size as setScrollbarSize' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetScrollbarSize ()) ScrolledBase orig impl where
   runOp _ _ widget size = withRef widget $ \widgetPtr -> setScrollbarSize' widgetPtr size
{# fun Fl_Scroll_get_scrollbar_size as getScrollbarSize' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetScrollbarSize ()) ScrolledBase orig impl where
   runOp _ _ widget = withRef widget $ \widgetPtr -> getScrollbarSize' widgetPtr
{# fun Fl_Scroll_clear as clear' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Clear ()) ScrolledBase orig impl where
   runOp _ _ widget = withRef widget $ \widgetPtr -> clear' widgetPtr
{# fun Fl_Scroll_scroll_to as scrollTo' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (Position ->  IO ())) => Op (ScrollTo ()) ScrolledBase orig impl where
   runOp _ _ widget (Position (X x_pos') (Y y_pos')) = withRef widget $ \widgetPtr -> scrollTo' widgetPtr x_pos' y_pos'
{# fun Fl_Scroll_yposition as yposition' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (Yposition ()) ScrolledBase orig impl where
   runOp _ _ widget = withRef widget $ \widgetPtr -> yposition' widgetPtr
{# fun Fl_Scroll_xposition as xposition' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (Xposition ()) ScrolledBase orig impl where
   runOp _ _ widget = withRef widget $ \widgetPtr -> xposition' widgetPtr
{# fun Fl_Scroll_type as type' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ ( IO (ScrollbarMode))) => Op (GetType_ ()) ScrolledBase orig impl where
   runOp _ _ widget = withRef widget $ \widgetPtr -> type' widgetPtr >>= return . cToEnum
{# fun Fl_Scroll_set_type as setType' { id `Ptr ()',`Word8' } -> `()' #}
instance (impl ~ (ScrollbarMode ->  IO ())) => Op (SetType ()) ScrolledBase orig impl where
   runOp _ _ widget t = withRef widget $ \widgetPtr -> setType' widgetPtr (cFromEnum t)

{# fun Fl_Scroll_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawScrolledBase ::  Ref ScrolledBase -> IO ()
drawScrolledBase scrolled = withRef scrolled $ \scrolledPtr -> drawSuper' scrolledPtr
{# fun Fl_Scroll_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleScrolledBase :: Ref ScrolledBase -> Event ->  IO (Either UnknownEvent ())
handleScrolledBase scrolled event = withRef scrolled $ \scrolledPtr -> handleSuper' scrolledPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Scroll_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeScrolledBase :: Ref ScrolledBase -> Rectangle -> IO ()
resizeScrolledBase scrolled rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef scrolled $ \scrolledPtr -> resizeSuper' scrolledPtr x_pos y_pos width height
{# fun Fl_Scroll_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideScrolledBase ::  Ref ScrolledBase -> IO ()
hideScrolledBase scrolled = withRef scrolled $ \scrolledPtr -> hideSuper' scrolledPtr
{# fun Fl_Scroll_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetScrolledBase ::  Ref ScrolledBase -> IO ()
showWidgetScrolledBase scrolled = withRef scrolled $ \scrolledPtr -> showSuper' scrolledPtr

{# fun Fl_Scroll_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) ScrolledBase orig impl where
  runOp _ _ scrolled = withRef scrolled $ \scrolledPtr -> draw'' scrolledPtr
{#fun Fl_Scroll_handle as scrolledHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) ScrolledBase orig impl where
  runOp _ _ scrolled event = withRef scrolled (\p -> scrolledHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Scroll_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) ScrolledBase orig impl where
  runOp _ _ scrolled rectangle = withRef scrolled $ \scrolledPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' scrolledPtr x_pos y_pos w_pos h_pos
{# fun Fl_Scroll_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) ScrolledBase orig impl where
  runOp _ _ scrolled = withRef scrolled $ \scrolledPtr -> hide' scrolledPtr
{# fun Fl_Scroll_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) ScrolledBase orig impl where
  runOp _ _ scrolled = withRef scrolled $ \scrolledPtr -> show' scrolledPtr


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Scrolled"
-- @

-- $functions
-- @
-- clear :: 'Ref' 'ScrolledBase' -> 'IO' ()
--
-- draw :: 'Ref' 'ScrolledBase' -> 'IO' ()
--
-- getScrollbarSize :: 'Ref' 'ScrolledBase' -> 'IO' ('Int')
--
-- getType_ :: 'Ref' 'ScrolledBase' -> 'IO' ('ScrollbarMode')
--
-- handle :: 'Ref' 'ScrolledBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'ScrolledBase' -> 'IO' ()
--
-- resize :: 'Ref' 'ScrolledBase' -> 'Rectangle' -> 'IO' ()
--
-- scrollTo :: 'Ref' 'ScrolledBase' -> 'Position' -> 'IO' ()
--
-- setScrollbarSize :: 'Ref' 'ScrolledBase' -> 'Int' -> 'IO' ()
--
-- setType :: 'Ref' 'ScrolledBase' -> 'ScrollbarMode' -> 'IO' ()
--
-- showWidget :: 'Ref' 'ScrolledBase' -> 'IO' ()
--
-- xposition :: 'Ref' 'ScrolledBase' -> 'IO' ('Int')
--
-- yposition :: 'Ref' 'ScrolledBase' -> 'IO' ('Int')
-- @
