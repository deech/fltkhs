{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.ValueInput
    (
     -- * Constructor
     valueInputNew,
     valueInputCustom
  , drawValueInputBase
  , handleValueInputBase
  , resizeValueInputBase
  , hideValueInputBase
  , showWidgetValueInputBase
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
#include "Fl_Value_InputC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Base.Widget
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
{# fun Fl_OverriddenValue_Input_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenValue_Input_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
valueInputCustom ::
       Rectangle                         -- ^ The bounds of this ValueInput
    -> Maybe T.Text                      -- ^ The ValueInput label
    -> Maybe (Ref ValueInput -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs ValueInput)      -- ^ Optional custom widget functions
    -> IO (Ref ValueInput)
valueInputCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Value_Input_New as valueInputNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Value_Input_New_WithLabel as valueInputNewWithLabel' { `Int',`Int',`Int',`Int',`CString'} -> `Ptr ()' id #}
valueInputNew :: Rectangle -> Maybe T.Text -> IO (Ref ValueInput)
valueInputNew rectangle l'=
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Value_Input_Destroy as valueInputDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) ValueInputBase orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
    valueInputDestroy' winPtr
    return nullPtr
{# fun Fl_Value_Input_soft as soft' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ ( IO (Bool))) => Op (GetSoft ()) ValueInputBase orig impl where
  runOp _ _ value_input = withRef value_input $ \value_inputPtr -> soft' value_inputPtr
{# fun Fl_Value_Input_set_soft as setSoft' { id `Ptr ()',cFromBool `Bool' } -> `()' #}
instance (impl ~ (Bool->  IO ())) => Op (SetSoft ()) ValueInputBase orig impl where
  runOp _ _ value_input s = withRef value_input $ \value_inputPtr -> setSoft' value_inputPtr s
{# fun Fl_Value_Input_shortcut as shortcut' { id `Ptr ()' } -> `CInt' #}
instance (impl ~ ( IO (Maybe ShortcutKeySequence))) => Op (GetShortcut ()) ValueInputBase orig impl where
  runOp _ _ value_input = withRef value_input $ \value_inputPtr -> shortcut' value_inputPtr >>= return . cIntToKeySequence
{# fun Fl_Value_Input_set_shortcut as setShortcut' { id `Ptr ()',id `CInt' } -> `()' #}
instance (impl ~ (ShortcutKeySequence ->  IO ())) => Op (SetShortcut ()) ValueInputBase orig impl where
  runOp _ _ input (ShortcutKeySequence modifiers char) =
    withRef input $ \inputPtr -> setShortcut' inputPtr (keySequenceToCInt modifiers char)
{# fun Fl_Value_Input_textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ ( IO (Font))) => Op (GetTextfont ()) ValueInputBase orig impl where
  runOp _ _ value_input = withRef value_input $ \value_inputPtr -> textfont' value_inputPtr
{# fun Fl_Value_Input_set_textfont as setTextfont' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Font ->  IO ())) => Op (SetTextfont ()) ValueInputBase orig impl where
  runOp _ _ value_input (Font v) = withRef value_input $ \value_inputPtr -> setTextfont' value_inputPtr v
{# fun Fl_Value_Input_textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ ( IO (FontSize))) => Op (GetTextsize ()) ValueInputBase orig impl where
  runOp _ _ value_input = withRef value_input $ \value_inputPtr -> textsize' value_inputPtr >>= return . FontSize
{# fun Fl_Value_Input_set_textsize as setTextsize' { id `Ptr ()',id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ())) => Op (SetTextsize ()) ValueInputBase orig impl where
  runOp _ _ value_input (FontSize v) = withRef value_input $ \value_inputPtr -> setTextsize' value_inputPtr v
{# fun Fl_Value_Input_textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetTextcolor ()) ValueInputBase orig impl where
  runOp _ _ value_input = withRef value_input $ \value_inputPtr -> textcolor' value_inputPtr
{# fun Fl_Value_Input_set_textcolor as setTextcolor' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetTextcolor ()) ValueInputBase orig impl where
  runOp _ _ value_input (Color v) = withRef value_input $ \value_inputPtr -> setTextcolor' value_inputPtr (fromIntegral v)


{# fun Fl_Value_Input_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawValueInputBase ::  Ref ValueInputBase -> IO ()
drawValueInputBase valueInput = withRef valueInput $ \valueInputPtr -> drawSuper' valueInputPtr
{# fun Fl_Value_Input_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleValueInputBase :: Ref ValueInputBase -> Event ->  IO (Either UnknownEvent ())
handleValueInputBase valueInput event = withRef valueInput $ \valueInputPtr -> handleSuper' valueInputPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Value_Input_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeValueInputBase :: Ref ValueInputBase -> Rectangle -> IO ()
resizeValueInputBase valueInput rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef valueInput $ \valueInputPtr -> resizeSuper' valueInputPtr x_pos y_pos width height
{# fun Fl_Value_Input_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideValueInputBase ::  Ref ValueInputBase -> IO ()
hideValueInputBase valueInput = withRef valueInput $ \valueInputPtr -> hideSuper' valueInputPtr
{# fun Fl_Value_Input_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetValueInputBase ::  Ref ValueInputBase -> IO ()
showWidgetValueInputBase valueInput = withRef valueInput $ \valueInputPtr -> showSuper' valueInputPtr

{# fun Fl_Value_Input_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) ValueInputBase orig impl where
  runOp _ _ valueInput = withRef valueInput $ \valueInputPtr -> draw'' valueInputPtr
{#fun Fl_Value_Input_handle as valueInputHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) ValueInputBase orig impl where
  runOp _ _ valueInput event = withRef valueInput (\p -> valueInputHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Value_Input_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) ValueInputBase orig impl where
  runOp _ _ valueInput = withRef valueInput $ \valueInputPtr -> hide' valueInputPtr
{# fun Fl_Value_Input_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) ValueInputBase orig impl where
  runOp _ _ valueInput = withRef valueInput $ \valueInputPtr -> show' valueInputPtr
{# fun Fl_Value_Input_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) ValueInputBase orig impl where
  runOp _ _ valueInput rectangle = withRef valueInput $ \valueInputPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' valueInputPtr x_pos y_pos w_pos h_pos

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Valuator"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.ValueInput"
-- @

-- $functions
-- @
-- destroy :: 'Ref' 'ValueInputBase' -> 'IO' ()
--
-- draw :: 'Ref' 'ValueInputBase' -> 'IO' ()
--
-- getShortcut :: 'Ref' 'ValueInputBase' -> 'IO' ('Maybe' 'ShortcutKeySequence')
--
-- getSoft :: 'Ref' 'ValueInputBase' -> 'IO' ('Bool')
--
-- getTextcolor :: 'Ref' 'ValueInputBase' -> 'IO' ('Color')
--
-- getTextfont :: 'Ref' 'ValueInputBase' -> 'IO' ('Font')
--
-- getTextsize :: 'Ref' 'ValueInputBase' -> 'IO' ('FontSize')
--
-- handle :: 'Ref' 'ValueInputBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'ValueInputBase' -> 'IO' ()
--
-- resize :: 'Ref' 'ValueInputBase' -> 'Rectangle' -> 'IO' ()
--
-- setShortcut :: 'Ref' 'ValueInputBase' -> 'ShortcutKeySequence' -> 'IO' ()
--
-- setSoft :: 'Ref' 'ValueInputBase' -> 'Bool'>- 'IO' ()
--
-- setTextcolor :: 'Ref' 'ValueInputBase' -> 'Color' -> 'IO' ()
--
-- setTextfont :: 'Ref' 'ValueInputBase' -> 'Font' -> 'IO' ()
--
-- setTextsize :: 'Ref' 'ValueInputBase' -> 'FontSize' -> 'IO' ()
--
-- showWidget :: 'Ref' 'ValueInputBase' -> 'IO' ()
-- @
