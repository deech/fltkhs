{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.ValueOutput
    (
     -- * Constructor
     valueOutputNew,
     valueOutputCustom
  , drawValueOutputBase
  , handleValueOutputBase
  , resizeValueOutputBase
  , hideValueOutputBase
  , showWidgetValueOutputBase
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
import Graphics.UI.FLTK.LowLevel.Base.Widget
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
{# fun Fl_OverriddenValue_Output_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
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
{# fun Fl_Value_Output_New_WithLabel as valueOutputNewWithLabel' { `Int',`Int',`Int',`Int',`CString'} -> `Ptr ()' id #}
valueOutputNew :: Rectangle -> Maybe T.Text -> IO (Ref ValueOutput)
valueOutputNew rectangle l'=
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Value_Output_Destroy as valueOutputDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ IO ()) => Op (Destroy ()) ValueOutputBase orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
    valueOutputDestroy' winPtr
    return nullPtr

{# fun Fl_Value_Output_soft as soft' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ ( IO (Bool))) => Op (GetSoft ()) ValueOutputBase orig impl where
  runOp _ _ value_input = withRef value_input $ \value_inputPtr -> soft' value_inputPtr
{# fun Fl_Value_Output_set_soft as setSoft' { id `Ptr ()',cFromBool `Bool' } -> `()' #}
instance (impl ~ (Bool->  IO ())) => Op (SetSoft ()) ValueOutputBase orig impl where
  runOp _ _ value_input s = withRef value_input $ \value_inputPtr -> setSoft' value_inputPtr s
{# fun Fl_Value_Output_textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ ( IO (Font))) => Op (GetTextfont ()) ValueOutputBase orig impl where
  runOp _ _ value_input = withRef value_input $ \value_inputPtr -> textfont' value_inputPtr
{# fun Fl_Value_Output_set_textfont as setTextfont' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Font ->  IO ())) => Op (SetTextfont ()) ValueOutputBase orig impl where
  runOp _ _ value_input (Font v) = withRef value_input $ \value_inputPtr -> setTextfont' value_inputPtr v
{# fun Fl_Value_Output_textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ ( IO (FontSize))) => Op (GetTextsize ()) ValueOutputBase orig impl where
  runOp _ _ value_input = withRef value_input $ \value_inputPtr -> textsize' value_inputPtr >>= return . FontSize
{# fun Fl_Value_Output_set_textsize as setTextsize' { id `Ptr ()',id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ())) => Op (SetTextsize ()) ValueOutputBase orig impl where
  runOp _ _ value_input (FontSize v) = withRef value_input $ \value_inputPtr -> setTextsize' value_inputPtr v
{# fun Fl_Value_Output_textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetTextcolor ()) ValueOutputBase orig impl where
  runOp _ _ value_input = withRef value_input $ \value_inputPtr -> textcolor' value_inputPtr
{# fun Fl_Value_Output_set_textcolor as setTextcolor' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetTextcolor ()) ValueOutputBase orig impl where
  runOp _ _ value_input (Color v) = withRef value_input $ \value_inputPtr -> setTextcolor' value_inputPtr (fromIntegral v)

{# fun Fl_Value_Output_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawValueOutputBase ::  Ref ValueOutputBase -> IO ()
drawValueOutputBase valueOutput = withRef valueOutput $ \valueOutputPtr -> drawSuper' valueOutputPtr
{# fun Fl_Value_Output_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleValueOutputBase :: Ref ValueOutputBase -> Event ->  IO (Either UnknownEvent ())
handleValueOutputBase valueOutput event = withRef valueOutput $ \valueOutputPtr -> handleSuper' valueOutputPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Value_Output_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeValueOutputBase :: Ref ValueOutputBase -> Rectangle -> IO ()
resizeValueOutputBase valueOutput rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef valueOutput $ \valueOutputPtr -> resizeSuper' valueOutputPtr x_pos y_pos width height
{# fun Fl_Value_Output_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideValueOutputBase ::  Ref ValueOutputBase -> IO ()
hideValueOutputBase valueOutput = withRef valueOutput $ \valueOutputPtr -> hideSuper' valueOutputPtr
{# fun Fl_Value_Output_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetValueOutputBase ::  Ref ValueOutputBase -> IO ()
showWidgetValueOutputBase valueOutput = withRef valueOutput $ \valueOutputPtr -> showSuper' valueOutputPtr


{# fun Fl_Value_Output_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) ValueOutputBase orig impl where
  runOp _ _ valueOutput = withRef valueOutput $ \valueOutputPtr -> draw'' valueOutputPtr
{#fun Fl_Value_Output_handle as valueOutputHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) ValueOutputBase orig impl where
  runOp _ _ valueOutput event = withRef valueOutput (\p -> valueOutputHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Value_Output_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) ValueOutputBase orig impl where
  runOp _ _ valueOutput rectangle = withRef valueOutput $ \valueOutputPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' valueOutputPtr x_pos y_pos w_pos h_pos
{# fun Fl_Value_Output_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) ValueOutputBase orig impl where
  runOp _ _ valueOutput = withRef valueOutput $ \valueOutputPtr -> hide' valueOutputPtr
{# fun Fl_Value_Output_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) ValueOutputBase orig impl where
  runOp _ _ valueOutput = withRef valueOutput $ \valueOutputPtr -> show' valueOutputPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Valuator"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.ValueOutput"
-- @

-- $functions
-- @
-- destroy :: 'Ref' 'ValueOutputBase' -> 'IO' ()
--
-- draw :: 'Ref' 'ValueOutputBase' -> 'IO' ()
--
-- getSoft :: 'Ref' 'ValueOutputBase' -> 'IO' ('Bool')
--
-- getTextcolor :: 'Ref' 'ValueOutputBase' -> 'IO' ('Color')
--
-- getTextfont :: 'Ref' 'ValueOutputBase' -> 'IO' ('Font')
--
-- getTextsize :: 'Ref' 'ValueOutputBase' -> 'IO' ('FontSize')
--
-- handle :: 'Ref' 'ValueOutputBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'ValueOutputBase' -> 'IO' ()
--
-- resize :: 'Ref' 'ValueOutputBase' -> 'Rectangle' -> 'IO' ()
--
-- setSoft :: 'Ref' 'ValueOutputBase' -> 'Bool'>- 'IO' ()
--
-- setTextcolor :: 'Ref' 'ValueOutputBase' -> 'Color' -> 'IO' ()
--
-- setTextfont :: 'Ref' 'ValueOutputBase' -> 'Font' -> 'IO' ()
--
-- setTextsize :: 'Ref' 'ValueOutputBase' -> 'FontSize' -> 'IO' ()
--
-- showWidget :: 'Ref' 'ValueOutputBase' -> 'IO' ()
-- @
