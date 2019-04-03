{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.Counter
    (
     -- * Constructor
     counterNew,
     counterCustom,
     CounterType(..)
   , drawCounterBase
   , handleCounterBase
   , resizeCounterBase
   , hideCounterBase
   , showWidgetCounterBase
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Functions
     --
     -- $functions
     --
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_CounterC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Base.Widget

#c
enum CounterType {
  NormalCounterType = FL_NORMAL_COUNTERC,
  SimpleCounterType = FL_SIMPLE_COUNTERC
};
#endc
{#enum CounterType {} deriving (Show, Eq) #}

{# fun Fl_OverriddenCounter_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenCounter_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
counterCustom ::
       Rectangle                         -- ^ The bounds of this Counter
    -> Maybe T.Text                      -- ^ The Counter label
    -> Maybe (Ref Counter -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs Counter)      -- ^ Optional custom widget functions
    -> IO (Ref Counter)
counterCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'


{# fun Fl_Counter_New as counterNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Counter_New_WithLabel as counterNewWithLabel' { `Int',`Int',`Int',`Int', `CString'} -> `Ptr ()' id #}
counterNew :: Rectangle -> Maybe T.Text -> IO (Ref Counter)
counterNew rectangle l'=
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Counter_Destroy as counterDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) CounterBase orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
    counterDestroy' winPtr
    return nullPtr

{# fun Fl_Counter_lstep as lstep' { id `Ptr ()',`Double' } -> `()' #}
instance (impl ~ (Double ->  IO ())) => Op (SetLstep ()) CounterBase orig impl where
  runOp _ _ counter lstep = withRef counter $ \counterPtr -> lstep' counterPtr lstep
{# fun Fl_Counter_set_textfont as setTextfont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
instance (impl ~ (Font ->  IO ())) => Op (SetTextfont ()) CounterBase orig impl where
  runOp _ _ counter text = withRef counter $ \counterPtr -> setTextfont' counterPtr text
{# fun Fl_Counter_textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ ( IO (Font))) => Op (GetTextfont ()) CounterBase orig impl where
  runOp _ _ counter = withRef counter $ \counterPtr -> textfont' counterPtr
{# fun Fl_Counter_set_textsize as setTextsize' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ())) => Op (SetTextsize ()) CounterBase orig impl where
  runOp _ _ counter (FontSize text) = withRef counter $ \counterPtr -> setTextsize' counterPtr text
{# fun Fl_Counter_textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ ( IO (FontSize))) => Op (GetTextsize ()) CounterBase orig impl where
  runOp _ _ counter = withRef counter $ \counterPtr -> textsize' counterPtr >>= return . FontSize
{# fun Fl_Counter_set_textcolor as setTextcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetTextcolor ()) CounterBase orig impl where
  runOp _ _ counter text = withRef counter $ \counterPtr -> setTextcolor' counterPtr text
{# fun Fl_Counter_textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetTextcolor ()) CounterBase orig impl where
  runOp _ _ counter = withRef counter $ \counterPtr -> textcolor' counterPtr
{# fun Fl_Widget_set_type as setType' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ (CounterType ->  IO ())) => Op (SetType ()) CounterBase orig impl where
  runOp _ _ widget t = withRef widget $ \widgetPtr -> setType' widgetPtr (fromInteger $ toInteger $ fromEnum t)
{# fun Fl_Widget_type as type' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ IO (CounterType)) => Op (GetType_ ()) CounterBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> type' widgetPtr >>= return . toEnum . fromInteger . toInteger
{# fun Fl_Counter_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawCounterBase ::  Ref CounterBase -> IO ()
drawCounterBase adjuster = withRef adjuster $ \adjusterPtr -> drawSuper' adjusterPtr
{# fun Fl_Counter_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleCounterBase :: Ref CounterBase -> Event ->  IO (Either UnknownEvent ())
handleCounterBase adjuster event = withRef adjuster $ \adjusterPtr -> handleSuper' adjusterPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Counter_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeCounterBase :: Ref CounterBase -> Rectangle -> IO ()
resizeCounterBase adjuster rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef adjuster $ \adjusterPtr -> resizeSuper' adjusterPtr x_pos y_pos width height
{# fun Fl_Counter_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideCounterBase ::  Ref CounterBase -> IO ()
hideCounterBase adjuster = withRef adjuster $ \adjusterPtr -> hideSuper' adjusterPtr
{# fun Fl_Counter_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetCounterBase ::  Ref CounterBase -> IO ()
showWidgetCounterBase adjuster = withRef adjuster $ \adjusterPtr -> showSuper' adjusterPtr

{# fun Fl_Counter_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) CounterBase orig impl where
  runOp _ _ counter = withRef counter $ \counterPtr -> draw'' counterPtr
{#fun Fl_Counter_handle as counterHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) CounterBase orig impl where
  runOp _ _ counter event = withRef counter (\p -> counterHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Counter_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) CounterBase orig impl where
  runOp _ _ counter rectangle = withRef counter $ \counterPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' counterPtr x_pos y_pos w_pos h_pos
{# fun Fl_Counter_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) CounterBase orig impl where
  runOp _ _ counter = withRef counter $ \counterPtr -> hide' counterPtr
{# fun Fl_Counter_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) CounterBase orig impl where
  runOp _ _ counter = withRef counter $ \counterPtr -> show' counterPtr


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Valuator"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Counter"
-- @

-- $functions
-- @
-- destroy :: 'Ref' 'CounterBase' -> 'IO' ()
--
-- draw :: 'Ref' 'CounterBase' -> 'IO' ()
--
-- getTextcolor :: 'Ref' 'CounterBase' -> 'IO' ('Color')
--
-- getTextfont :: 'Ref' 'CounterBase' -> 'IO' ('Font')
--
-- getTextsize :: 'Ref' 'CounterBase' -> 'IO' ('FontSize')
--
-- getType_ :: 'Ref' 'CounterBase' -> 'IO' ('CounterType')
--
-- handle :: 'Ref' 'CounterBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'CounterBase' -> 'IO' ()
--
-- resize :: 'Ref' 'CounterBase' -> 'Rectangle' -> 'IO' ()
--
-- setLstep :: 'Ref' 'CounterBase' -> 'Double' -> 'IO' ()
--
-- setTextcolor :: 'Ref' 'CounterBase' -> 'Color' -> 'IO' ()
--
-- setTextfont :: 'Ref' 'CounterBase' -> 'Font' -> 'IO' ()
--
-- setTextsize :: 'Ref' 'CounterBase' -> 'FontSize' -> 'IO' ()
--
-- setType :: 'Ref' 'CounterBase' -> 'CounterType' -> 'IO' ()
--
-- showWidget :: 'Ref' 'CounterBase' -> 'IO' ()
-- @
