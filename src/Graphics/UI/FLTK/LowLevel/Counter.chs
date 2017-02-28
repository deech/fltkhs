{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Counter
    (
     -- * Constructor
     counterNew,
     counterCustom,
     CounterType(..)
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Functions
     --
     -- $Counterfunctions
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
import Graphics.UI.FLTK.LowLevel.Widget

#c
enum CounterType {
  NormalCounterType = FL_NORMAL_COUNTERC,
  SimpleCounterType = FL_SIMPLE_COUNTERC
};
#endc
{#enum CounterType {} deriving (Show, Eq) #}

{# fun Fl_OverriddenCounter_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
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
{# fun Fl_Counter_New_WithLabel as counterNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text'} -> `Ptr ()' id #}
counterNew :: Rectangle -> Maybe T.Text -> IO (Ref Counter)
counterNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> counterNew' x_pos y_pos width height >>=
                             toRef
        Just l -> counterNewWithLabel' x_pos y_pos width height l >>=
                               toRef

{# fun Fl_Counter_Destroy as counterDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) Counter orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
    counterDestroy' winPtr
    return nullPtr

{# fun Fl_Counter_lstep as lstep' { id `Ptr ()',`Double' } -> `()' #}
instance (impl ~ (Double ->  IO ())) => Op (SetLstep ()) Counter orig impl where
  runOp _ _ counter lstep = withRef counter $ \counterPtr -> lstep' counterPtr lstep
{# fun Fl_Counter_set_textfont as setTextfont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
instance (impl ~ (Font ->  IO ())) => Op (SetTextfont ()) Counter orig impl where
  runOp _ _ counter text = withRef counter $ \counterPtr -> setTextfont' counterPtr text
{# fun Fl_Counter_textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ ( IO (Font))) => Op (GetTextfont ()) Counter orig impl where
  runOp _ _ counter = withRef counter $ \counterPtr -> textfont' counterPtr
{# fun Fl_Counter_set_textsize as setTextsize' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ())) => Op (SetTextsize ()) Counter orig impl where
  runOp _ _ counter (FontSize text) = withRef counter $ \counterPtr -> setTextsize' counterPtr text
{# fun Fl_Counter_textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ ( IO (FontSize))) => Op (GetTextsize ()) Counter orig impl where
  runOp _ _ counter = withRef counter $ \counterPtr -> textsize' counterPtr >>= return . FontSize
{# fun Fl_Counter_set_textcolor as setTextcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetTextcolor ()) Counter orig impl where
  runOp _ _ counter text = withRef counter $ \counterPtr -> setTextcolor' counterPtr text
{# fun Fl_Counter_textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetTextcolor ()) Counter orig impl where
  runOp _ _ counter = withRef counter $ \counterPtr -> textcolor' counterPtr
{# fun Fl_Widget_set_type as setType' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ (CounterType ->  IO ())) => Op (SetType ()) Counter orig impl where
  runOp _ _ widget t = withRef widget $ \widgetPtr -> setType' widgetPtr (fromInteger $ toInteger $ fromEnum t)
{# fun Fl_Widget_type as type' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ IO (CounterType)) => Op (GetType_ ()) Counter orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> type' widgetPtr >>= return . toEnum . fromInteger . toInteger
{# fun Fl_Counter_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Counter orig impl where
  runOp _ _ counter = withRef counter $ \counterPtr -> draw'' counterPtr
{# fun Fl_Counter_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) Counter orig impl where
  runOp _ _ counter = withRef counter $ \counterPtr -> drawSuper' counterPtr
{#fun Fl_Counter_handle as counterHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Counter orig impl where
  runOp _ _ counter event = withRef counter (\p -> counterHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Counter_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) Counter orig impl where
  runOp _ _ counter event = withRef counter $ \counterPtr -> handleSuper' counterPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Counter_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Counter orig impl where
  runOp _ _ counter rectangle = withRef counter $ \counterPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' counterPtr x_pos y_pos w_pos h_pos
{# fun Fl_Counter_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) Counter orig impl where
  runOp _ _ counter rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef counter $ \counterPtr -> resizeSuper' counterPtr x_pos y_pos width height
{# fun Fl_Counter_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Counter orig impl where
  runOp _ _ counter = withRef counter $ \counterPtr -> hide' counterPtr
{# fun Fl_Counter_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) Counter orig impl where
  runOp _ _ counter = withRef counter $ \counterPtr -> hideSuper' counterPtr
{# fun Fl_Counter_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Counter orig impl where
  runOp _ _ counter = withRef counter $ \counterPtr -> show' counterPtr
{# fun Fl_Counter_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) Counter orig impl where
  runOp _ _ counter = withRef counter $ \counterPtr -> showSuper' counterPtr

-- $Counterfunctions
--
-- @
-- destroy :: 'Ref' 'Counter' -> 'IO' ()
--
-- draw :: 'Ref' 'Counter' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'Counter' -> 'IO' ()
--
-- getTextcolor :: 'Ref' 'Counter' -> 'IO' ('Color')
--
-- getTextfont :: 'Ref' 'Counter' -> 'IO' ('Font')
--
-- getTextsize :: 'Ref' 'Counter' -> 'IO' ('FontSize')
--
-- getType_ :: 'Ref' 'Counter' -> 'IO' ('CounterType')
--
-- handle :: 'Ref' 'Counter' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'Counter' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Counter' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'Counter' -> 'IO' ()
--
-- resize :: 'Ref' 'Counter' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'Counter' -> 'Rectangle' -> 'IO' ()
--
-- setLstep :: 'Ref' 'Counter' -> 'Double' -> 'IO' ()
--
-- setTextcolor :: 'Ref' 'Counter' -> 'Color' -> 'IO' ()
--
-- setTextfont :: 'Ref' 'Counter' -> 'Font' -> 'IO' ()
--
-- setTextsize :: 'Ref' 'Counter' -> 'FontSize' -> 'IO' ()
--
-- setType :: 'Ref' 'Counter' -> 'CounterType' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Counter' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'Counter' -> 'IO' ()
--
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Valuator"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Counter"
-- @
