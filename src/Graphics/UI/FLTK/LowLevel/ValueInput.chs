{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.ValueInput
    (
     -- * Constructor
     valueInputNew,
     valueInputCustom
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
import Graphics.UI.FLTK.LowLevel.Widget
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
{# fun Fl_OverriddenValue_Input_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
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
{# fun Fl_Value_Input_New_WithLabel as valueInputNewWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `T.Text'} -> `Ptr ()' id #}
valueInputNew :: Rectangle -> Maybe T.Text -> IO (Ref ValueInput)
valueInputNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> valueInputNew' x_pos y_pos width height >>=
                             toRef
        Just l -> valueInputNewWithLabel' x_pos y_pos width height l >>=
                               toRef

{# fun Fl_Value_Input_Destroy as valueInputDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) ValueInput orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
    valueInputDestroy' winPtr
    return nullPtr
{# fun Fl_Value_Input_soft as soft' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ ( IO (Bool))) => Op (GetSoft ()) ValueInput orig impl where
  runOp _ _ value_input = withRef value_input $ \value_inputPtr -> soft' value_inputPtr
{# fun Fl_Value_Input_set_soft as setSoft' { id `Ptr ()',cFromBool `Bool' } -> `()' #}
instance (impl ~ (Bool->  IO ())) => Op (SetSoft ()) ValueInput orig impl where
  runOp _ _ value_input s = withRef value_input $ \value_inputPtr -> setSoft' value_inputPtr s
{# fun Fl_Value_Input_shortcut as shortcut' { id `Ptr ()' } -> `CInt' #}
instance (impl ~ ( IO (Maybe ShortcutKeySequence))) => Op (GetShortcut ()) ValueInput orig impl where
  runOp _ _ value_input = withRef value_input $ \value_inputPtr -> shortcut' value_inputPtr >>= return . cIntToKeySequence
{# fun Fl_Value_Input_set_shortcut as setShortcut' { id `Ptr ()',id `CInt' } -> `()' #}
instance (impl ~ (ShortcutKeySequence ->  IO ())) => Op (SetShortcut ()) ValueInput orig impl where
  runOp _ _ input (ShortcutKeySequence modifiers char) =
    withRef input $ \inputPtr -> setShortcut' inputPtr (keySequenceToCInt modifiers char)
{# fun Fl_Value_Input_textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ ( IO (Font))) => Op (GetTextfont ()) ValueInput orig impl where
  runOp _ _ value_input = withRef value_input $ \value_inputPtr -> textfont' value_inputPtr
{# fun Fl_Value_Input_set_textfont as setTextfont' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Font ->  IO ())) => Op (SetTextfont ()) ValueInput orig impl where
  runOp _ _ value_input (Font v) = withRef value_input $ \value_inputPtr -> setTextfont' value_inputPtr v
{# fun Fl_Value_Input_textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ ( IO (FontSize))) => Op (GetTextsize ()) ValueInput orig impl where
  runOp _ _ value_input = withRef value_input $ \value_inputPtr -> textsize' value_inputPtr >>= return . FontSize
{# fun Fl_Value_Input_set_textsize as setTextsize' { id `Ptr ()',id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ())) => Op (SetTextsize ()) ValueInput orig impl where
  runOp _ _ value_input (FontSize v) = withRef value_input $ \value_inputPtr -> setTextsize' value_inputPtr v
{# fun Fl_Value_Input_textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetTextcolor ()) ValueInput orig impl where
  runOp _ _ value_input = withRef value_input $ \value_inputPtr -> textcolor' value_inputPtr
{# fun Fl_Value_Input_set_textcolor as setTextcolor' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetTextcolor ()) ValueInput orig impl where
  runOp _ _ value_input (Color v) = withRef value_input $ \value_inputPtr -> setTextcolor' value_inputPtr (fromIntegral v)

{# fun Fl_Value_Input_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) ValueInput orig impl where
  runOp _ _ valueInput = withRef valueInput $ \valueInputPtr -> draw'' valueInputPtr
{# fun Fl_Value_Input_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) ValueInput orig impl where
  runOp _ _ valueInput = withRef valueInput $ \valueInputPtr -> drawSuper' valueInputPtr
{#fun Fl_Value_Input_handle as valueInputHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) ValueInput orig impl where
  runOp _ _ valueInput event = withRef valueInput (\p -> valueInputHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Value_Input_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) ValueInput orig impl where
  runOp _ _ valueInput event = withRef valueInput $ \valueInputPtr -> handleSuper' valueInputPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Value_Input_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) ValueInput orig impl where
  runOp _ _ valueInput rectangle = withRef valueInput $ \valueInputPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' valueInputPtr x_pos y_pos w_pos h_pos
{# fun Fl_Value_Input_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) ValueInput orig impl where
  runOp _ _ valueInput rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef valueInput $ \valueInputPtr -> resizeSuper' valueInputPtr x_pos y_pos width height
{# fun Fl_Value_Input_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) ValueInput orig impl where
  runOp _ _ valueInput = withRef valueInput $ \valueInputPtr -> hide' valueInputPtr
{# fun Fl_Value_Input_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) ValueInput orig impl where
  runOp _ _ valueInput = withRef valueInput $ \valueInputPtr -> hideSuper' valueInputPtr
{# fun Fl_Value_Input_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) ValueInput orig impl where
  runOp _ _ valueInput = withRef valueInput $ \valueInputPtr -> show' valueInputPtr
{# fun Fl_Value_Input_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) ValueInput orig impl where
  runOp _ _ valueInput = withRef valueInput $ \valueInputPtr -> showSuper' valueInputPtr

-- $functions
-- @
-- destroy :: 'Ref' 'ValueInput' -> 'IO' ()
--
-- draw :: 'Ref' 'ValueInput' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'ValueInput' -> 'IO' ()
--
-- getShortcut :: 'Ref' 'ValueInput' -> 'IO' ('Maybe' 'ShortcutKeySequence')
--
-- getSoft :: 'Ref' 'ValueInput' -> 'IO' ('Bool')
--
-- getTextcolor :: 'Ref' 'ValueInput' -> 'IO' ('Color')
--
-- getTextfont :: 'Ref' 'ValueInput' -> 'IO' ('Font')
--
-- getTextsize :: 'Ref' 'ValueInput' -> 'IO' ('FontSize')
--
-- handle :: 'Ref' 'ValueInput' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'ValueInput' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'ValueInput' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'ValueInput' -> 'IO' ()
--
-- resize :: 'Ref' 'ValueInput' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'ValueInput' -> 'Rectangle' -> 'IO' ()
--
-- setShortcut :: 'Ref' 'ValueInput' -> 'ShortcutKeySequence' -> 'IO' ()
--
-- setSoft :: 'Ref' 'ValueInput' -> 'Bool'>- 'IO' ()
--
-- setTextcolor :: 'Ref' 'ValueInput' -> 'Color' -> 'IO' ()
--
-- setTextfont :: 'Ref' 'ValueInput' -> 'Font' -> 'IO' ()
--
-- setTextsize :: 'Ref' 'ValueInput' -> 'FontSize' -> 'IO' ()
--
-- showWidget :: 'Ref' 'ValueInput' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'ValueInput' -> 'IO' ()

-- Available in FLTK 1.3.4 only:


-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Valuator"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.ValueInput"
-- @
