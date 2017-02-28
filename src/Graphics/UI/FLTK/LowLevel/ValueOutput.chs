{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.ValueOutput
    (
     -- * Constructor
     valueOutputNew,
     valueOutputCustom
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
#include "Fl_Value_OutputC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Widget
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
{# fun Fl_OverriddenValue_Output_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenValue_Output_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
valueOutputCustom ::
       Rectangle                         -- ^ The bounds of this ValueOutput
    -> Maybe T.Text                      -- ^ The ValueOutput label
    -> Maybe (Ref ValueOutput -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs ValueOutput)      -- ^ Optional custom widget functions
    -> IO (Ref ValueOutput)
valueOutputCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'


{# fun Fl_Value_Output_New as valueOutputNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Value_Output_New_WithLabel as valueOutputNewWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `T.Text'} -> `Ptr ()' id #}
valueOutputNew :: Rectangle -> Maybe T.Text -> IO (Ref ValueOutput)
valueOutputNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> valueOutputNew' x_pos y_pos width height >>=
                             toRef
        Just l -> valueOutputNewWithLabel' x_pos y_pos width height l >>=
                               toRef

{# fun Fl_Value_Output_Destroy as valueOutputDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ IO ()) => Op (Destroy ()) ValueOutput orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
    valueOutputDestroy' winPtr
    return nullPtr

{# fun Fl_Value_Output_soft as soft' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ ( IO (Bool))) => Op (GetSoft ()) ValueOutput orig impl where
  runOp _ _ value_input = withRef value_input $ \value_inputPtr -> soft' value_inputPtr
{# fun Fl_Value_Output_set_soft as setSoft' { id `Ptr ()',cFromBool `Bool' } -> `()' #}
instance (impl ~ (Bool->  IO ())) => Op (SetSoft ()) ValueOutput orig impl where
  runOp _ _ value_input s = withRef value_input $ \value_inputPtr -> setSoft' value_inputPtr s
{# fun Fl_Value_Output_textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ ( IO (Font))) => Op (GetTextfont ()) ValueOutput orig impl where
  runOp _ _ value_input = withRef value_input $ \value_inputPtr -> textfont' value_inputPtr
{# fun Fl_Value_Output_set_textfont as setTextfont' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Font ->  IO ())) => Op (SetTextfont ()) ValueOutput orig impl where
  runOp _ _ value_input (Font v) = withRef value_input $ \value_inputPtr -> setTextfont' value_inputPtr v
{# fun Fl_Value_Output_textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ ( IO (FontSize))) => Op (GetTextsize ()) ValueOutput orig impl where
  runOp _ _ value_input = withRef value_input $ \value_inputPtr -> textsize' value_inputPtr >>= return . FontSize
{# fun Fl_Value_Output_set_textsize as setTextsize' { id `Ptr ()',id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ())) => Op (SetTextsize ()) ValueOutput orig impl where
  runOp _ _ value_input (FontSize v) = withRef value_input $ \value_inputPtr -> setTextsize' value_inputPtr v
{# fun Fl_Value_Output_textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetTextcolor ()) ValueOutput orig impl where
  runOp _ _ value_input = withRef value_input $ \value_inputPtr -> textcolor' value_inputPtr
{# fun Fl_Value_Output_set_textcolor as setTextcolor' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetTextcolor ()) ValueOutput orig impl where
  runOp _ _ value_input (Color v) = withRef value_input $ \value_inputPtr -> setTextcolor' value_inputPtr (fromIntegral v)
{# fun Fl_Value_Output_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) ValueOutput orig impl where
  runOp _ _ valueOutput = withRef valueOutput $ \valueOutputPtr -> draw'' valueOutputPtr
{# fun Fl_Value_Output_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) ValueOutput orig impl where
  runOp _ _ valueOutput = withRef valueOutput $ \valueOutputPtr -> drawSuper' valueOutputPtr
{#fun Fl_Value_Output_handle as valueOutputHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) ValueOutput orig impl where
  runOp _ _ valueOutput event = withRef valueOutput (\p -> valueOutputHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Value_Output_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) ValueOutput orig impl where
  runOp _ _ valueOutput event = withRef valueOutput $ \valueOutputPtr -> handleSuper' valueOutputPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Value_Output_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) ValueOutput orig impl where
  runOp _ _ valueOutput rectangle = withRef valueOutput $ \valueOutputPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' valueOutputPtr x_pos y_pos w_pos h_pos
{# fun Fl_Value_Output_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) ValueOutput orig impl where
  runOp _ _ valueOutput rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef valueOutput $ \valueOutputPtr -> resizeSuper' valueOutputPtr x_pos y_pos width height
{# fun Fl_Value_Output_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) ValueOutput orig impl where
  runOp _ _ valueOutput = withRef valueOutput $ \valueOutputPtr -> hide' valueOutputPtr
{# fun Fl_Value_Output_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) ValueOutput orig impl where
  runOp _ _ valueOutput = withRef valueOutput $ \valueOutputPtr -> hideSuper' valueOutputPtr
{# fun Fl_Value_Output_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) ValueOutput orig impl where
  runOp _ _ valueOutput = withRef valueOutput $ \valueOutputPtr -> show' valueOutputPtr
{# fun Fl_Value_Output_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) ValueOutput orig impl where
  runOp _ _ valueOutput = withRef valueOutput $ \valueOutputPtr -> showSuper' valueOutputPtr

-- $functions
-- @
-- destroy :: 'Ref' 'ValueOutput' -> 'IO' ()
--
-- draw :: 'Ref' 'ValueOutput' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'ValueOutput' -> 'IO' ()
--
-- getSoft :: 'Ref' 'ValueOutput' -> 'IO' ('Bool')
--
-- getTextcolor :: 'Ref' 'ValueOutput' -> 'IO' ('Color')
--
-- getTextfont :: 'Ref' 'ValueOutput' -> 'IO' ('Font')
--
-- getTextsize :: 'Ref' 'ValueOutput' -> 'IO' ('FontSize')
--
-- handle :: 'Ref' 'ValueOutput' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'ValueOutput' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'ValueOutput' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'ValueOutput' -> 'IO' ()
--
-- resize :: 'Ref' 'ValueOutput' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'ValueOutput' -> 'Rectangle' -> 'IO' ()
--
-- setSoft :: 'Ref' 'ValueOutput' -> 'Bool'>- 'IO' ()
--
-- setTextcolor :: 'Ref' 'ValueOutput' -> 'Color' -> 'IO' ()
--
-- setTextfont :: 'Ref' 'ValueOutput' -> 'Font' -> 'IO' ()
--
-- setTextsize :: 'Ref' 'ValueOutput' -> 'FontSize' -> 'IO' ()
--
-- showWidget :: 'Ref' 'ValueOutput' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'ValueOutput' -> 'IO' ()
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Valuator"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.ValueOutput"
-- @
