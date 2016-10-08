{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.ValueInput
    (
     -- * Constructor
     valueInputNew
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
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T

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
{#fun Fl_Value_Input_handle as valueInputHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO Int)) => Op (Handle ()) ValueInput orig impl where
  runOp _ _ valueInput event = withRef valueInput (\p -> valueInputHandle' p (fromIntegral . fromEnum $ event))
{# fun Fl_Value_Input_soft as soft' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ ( IO (Bool))) => Op (GetSoft ()) ValueInput orig impl where
  runOp _ _ value_input = withRef value_input $ \value_inputPtr -> soft' value_inputPtr
{# fun Fl_Value_Input_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
instance (impl ~ (Rectangle ->  IO ())) => Op (Resize ()) ValueInput orig impl where
  runOp _ _ value_input rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in withRef value_input $ \value_inputPtr -> resize' value_inputPtr x_pos' y_pos' width' height'
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

-- $functions
-- @
-- destroy :: 'Ref' 'ValueInput' -> 'IO' ()
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
-- handle :: 'Ref' 'ValueInput' -> 'Event' -> 'IO' 'Int'
--
-- resize :: 'Ref' 'ValueInput' -> 'Rectangle' -> 'IO' ()
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
