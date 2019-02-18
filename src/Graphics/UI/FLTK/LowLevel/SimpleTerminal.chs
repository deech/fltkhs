{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
module Graphics.UI.FLTK.LowLevel.SimpleTerminal
       (
         simpleTerminalNew,
         simpleTerminalCustom
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
#include "Fl_Simple_TerminalC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Widget
import Graphics.UI.FLTK.LowLevel.TextDisplay
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import qualified Foreign.ForeignPtr.Unsafe as Unsafe

{# fun Fl_Simple_Terminal_New as simpleTerminalNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Simple_Terminal_New_WithLabel as simpleTerminalNewWithLabel' { `Int',`Int',`Int',`Int',`CString'} -> `Ptr ()' id #}
simpleTerminalNew :: Rectangle -> Maybe T.Text -> IO (Ref SimpleTerminal)
simpleTerminalNew rectangle l' =
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_OverriddenSimple_Terminal_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenSimple_Terminal_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
simpleTerminalCustom ::
       Rectangle                           -- ^ The bounds of this SimpleTerminal
    -> Maybe T.Text                        -- ^ The SimpleTerminal label
    -> Maybe (Ref SimpleTerminal -> IO ()) -- ^ Optional custom drawing function
    -> IO (Ref SimpleTerminal)
simpleTerminalCustom rectangle l' draw' =
  widgetMaker
    rectangle
    l'
    draw'
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Simple_Terminal_set_stay_at_bottom as setStayAtBottom' { id `Ptr ()', cFromBool `Bool' } -> `()' #}
instance (impl ~ (Bool ->  IO ())) => Op (SetStayAtBottom ()) SimpleTerminal orig impl where
   runOp _ _ simple_terminal b = withRef simple_terminal $ \simple_terminalPtr -> setStayAtBottom' simple_terminalPtr b
{# fun Fl_Simple_Terminal_get_stay_at_bottom as getStayAtBottom' { id `Ptr ()'} -> `Bool' cToBool#}
instance (impl ~ (IO Bool)) => Op (GetStayAtBottom ()) SimpleTerminal orig impl where
   runOp _ _ simple_terminal = withRef simple_terminal $ \simple_terminalPtr -> getStayAtBottom' simple_terminalPtr
{# fun Fl_Simple_Terminal_set_ansi as setAnsi' { id `Ptr ()', cFromBool `Bool' } -> `()' #}
instance (impl ~ (Bool ->  IO ())) => Op (SetAnsi ()) SimpleTerminal orig impl where
   runOp _ _ simple_terminal b = withRef simple_terminal $ \simple_terminalPtr -> setAnsi' simple_terminalPtr b
{# fun Fl_Simple_Terminal_get_ansi as getAnsi' { id `Ptr ()'} -> `Bool' cToBool#}
instance (impl ~ (IO Bool)) => Op (GetAnsi ()) SimpleTerminal orig impl where
   runOp _ _ simple_terminal = withRef simple_terminal $ \simple_terminalPtr -> getAnsi' simple_terminalPtr
{# fun Fl_Simple_Terminal_set_history_lines as setHistoryLines' { id `Ptr ()', `Int' } -> `()' #}
instance (impl ~ (Lines ->  IO ())) => Op (SetHistoryLines ()) SimpleTerminal orig impl where
   runOp _ _ simple_terminal (Lines b) = withRef simple_terminal $ \simple_terminalPtr -> setHistoryLines' simple_terminalPtr b
{# fun Fl_Simple_Terminal_get_history_lines as getHistoryLines' { id `Ptr ()'} -> `Int' #}
instance (impl ~ (IO Lines)) => Op (GetHistoryLines ()) SimpleTerminal orig impl where
   runOp _ _ simple_terminal = withRef simple_terminal $ \simple_terminalPtr -> getHistoryLines' simple_terminalPtr >>= return . Lines
{# fun Fl_Simple_Terminal_set_normal_style_index as setNormalStyleIndex' { id `Ptr ()', `Int' } -> `()' #}
instance (impl ~ (AtIndex ->  IO ())) => Op (SetNormalStyleIndex ()) SimpleTerminal orig impl where
   runOp _ _ simple_terminal (AtIndex b) = withRef simple_terminal $ \simple_terminalPtr -> setNormalStyleIndex' simple_terminalPtr b
{# fun Fl_Simple_Terminal_get_normal_style_index as getNormalStyleIndex' { id `Ptr ()'} -> `Int' #}
instance (impl ~ (IO AtIndex)) => Op (GetNormalStyleIndex ()) SimpleTerminal orig impl where
   runOp _ _ simple_terminal = withRef simple_terminal $ \simple_terminalPtr -> getNormalStyleIndex' simple_terminalPtr >>= return . AtIndex
{# fun Fl_Simple_Terminal_set_current_style_index as setCurrentStyleIndex' { id `Ptr ()', `Int' } -> `()' #}
instance (impl ~ (AtIndex ->  IO ())) => Op (SetCurrentStyleIndex ()) SimpleTerminal orig impl where
   runOp _ _ simple_terminal (AtIndex b) = withRef simple_terminal $ \simple_terminalPtr -> setCurrentStyleIndex' simple_terminalPtr b
{# fun Fl_Simple_Terminal_get_current_style_index as getCurrentStyleIndex' { id `Ptr ()'} -> `Int' #}
instance (impl ~ (IO AtIndex)) => Op (GetCurrentStyleIndex ()) SimpleTerminal orig impl where
   runOp _ _ simple_terminal = withRef simple_terminal $ \simple_terminalPtr -> getCurrentStyleIndex' simple_terminalPtr >>= return . AtIndex
{# fun Fl_Simple_Terminal_set_text as setText' { id `Ptr ()',`CString' } -> `()' #}
instance (impl ~ (T.Text ->  IO ())) => Op (SetText ()) SimpleTerminal orig impl where
   runOp _ _ simple_terminal val = withRef simple_terminal $ \simple_terminalPtr -> copyTextToCString val >>= setText' simple_terminalPtr
{# fun Fl_Simple_Terminal_get_text as getText' { id `Ptr ()' } -> `CString' #}
instance (impl ~ ( IO T.Text)) => Op (GetText ()) SimpleTerminal orig impl where
   runOp _ _ simple_terminal = withRef simple_terminal $ \simple_terminalPtr -> getText' simple_terminalPtr >>= cStringToText
{# fun Fl_Simple_Terminal_clear as clear'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Clear ()) SimpleTerminal orig impl where
  runOp _ _ simpleTerminal = withRef simpleTerminal $ \simpleTerminalPtr -> clear'' simpleTerminalPtr
{# fun Fl_Simple_Terminal_remove_lines as removeLines' { id `Ptr ()', `Int', `Int' } -> `()' #}
instance (impl ~ (LineNumber -> LineNumber -> IO ())) => Op (RemoveLines ()) SimpleTerminal orig impl where
   runOp _ _ simple_terminal (LineNumber start) (LineNumber count) = withRef simple_terminal $ \simple_terminalPtr -> removeLines' simple_terminalPtr start count
{# fun Fl_Simple_Terminal_set_style_table as setStyleTable' { id `Ptr ()',id `Ptr ()',`Int',  `Int'} -> `()' #}
instance (impl ~ ([StyleTableEntry] -> Maybe Int -> IO ())) => Op (SetStyleTable()) SimpleTerminal orig impl where
   runOp _ _ simple_terminal styleTable normal_style_index =
     withRef simple_terminal $ \simple_terminalPtr -> do
       stesPtr <- mkStyleTableEntriesPtr simple_terminal styleTable
       setStyleTable'
         simple_terminalPtr
         (castPtr (Unsafe.unsafeForeignPtrToPtr stesPtr))
         (length styleTable)
         (maybe 0 id normal_style_index)
{# fun Fl_Simple_Terminal_get_style_table_size as getStyleTableSize' { id `Ptr ()'} -> `Int' fromIntegral #}
instance (impl ~ (IO Int)) => Op (GetStyleTableSize ()) SimpleTerminal orig impl where
   runOp _ _ simple_terminal = withRef simple_terminal $ \simple_terminalPtr -> getStyleTableSize' simple_terminalPtr
{# fun Fl_Simple_Terminal_get_style_table as getStyleTable' { id `Ptr ()'} -> `Ptr ()' #}
instance (impl ~ (IO (Maybe [StyleTableEntry]))) => Op (GetStyleTable ()) SimpleTerminal orig impl where
   runOp _ _ simple_terminal =
     withRef simple_terminal $ \simple_terminalPtr -> do
       size <- getStyleTableSize simple_terminal
       ptr <- getStyleTable' simple_terminalPtr
       toStyleTableEntries size ptr

{# fun Fl_Simple_Terminal_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) SimpleTerminal orig impl where
  runOp _ _ textDisplay = withRef textDisplay $ \textDisplayPtr -> drawSuper' textDisplayPtr
{# fun Fl_Simple_Terminal_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) SimpleTerminal orig impl where
  runOp _ _ textDisplay event = withRef textDisplay $ \textDisplayPtr -> handleSuper' textDisplayPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Simple_Terminal_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) SimpleTerminal orig impl where
  runOp _ _ textDisplay rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef textDisplay $ \textDisplayPtr -> resizeSuper' textDisplayPtr x_pos y_pos width height
{# fun Fl_Simple_Terminal_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) SimpleTerminal orig impl where
  runOp _ _ textDisplay = withRef textDisplay $ \textDisplayPtr -> hideSuper' textDisplayPtr
{# fun Fl_Simple_Terminal_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) SimpleTerminal orig impl where
  runOp _ _ textDisplay = withRef textDisplay $ \textDisplayPtr -> showSuper' textDisplayPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.TextDisplay"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.SimpleTerminal"
-- @

-- $functions
-- @
-- clear :: 'Ref' 'SimpleTerminal' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'SimpleTerminal' -> 'IO' ()
--
-- getAnsi :: 'Ref' 'SimpleTerminal' -> 'IO' 'Bool'
--
-- getCurrentStyleIndex :: 'Ref' 'SimpleTerminal' -> 'IO' 'AtIndex'
--
-- getHistoryLines :: 'Ref' 'SimpleTerminal' -> 'IO' 'Lines'
--
-- getNormalStyleIndex :: 'Ref' 'SimpleTerminal' -> 'IO' 'AtIndex'
--
-- getStayAtBottom :: 'Ref' 'SimpleTerminal' -> 'IO' 'Bool'
--
-- getStyleTable :: 'Ref' 'SimpleTerminal' -> 'IO' ('Maybe' ['StyleTableEntry')]
--
-- getStyleTableSize :: 'Ref' 'SimpleTerminal' -> 'IO' 'Int'
--
-- getText :: 'Ref' 'SimpleTerminal' -> 'IO' 'T.Text'
--
-- handleSuper :: 'Ref' 'SimpleTerminal' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hideSuper :: 'Ref' 'SimpleTerminal' -> 'IO' ()
--
-- removeLines :: 'Ref' 'SimpleTerminal' -> 'LineNumber' -> 'LineNumber' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'SimpleTerminal' -> 'Rectangle' -> 'IO' ()
--
-- setAnsi :: 'Ref' 'SimpleTerminal' -> 'Bool' -> 'IO' ()
--
-- setCurrentStyleIndex :: 'Ref' 'SimpleTerminal' -> 'AtIndex' -> 'IO' ()
--
-- setHistoryLines :: 'Ref' 'SimpleTerminal' -> 'Lines' -> 'IO' ()
--
-- setNormalStyleIndex :: 'Ref' 'SimpleTerminal' -> 'AtIndex' -> 'IO' ()
--
-- setStayAtBottom :: 'Ref' 'SimpleTerminal' -> 'Bool' -> 'IO' ()
--
-- setText :: 'Ref' 'SimpleTerminal' -> 'T.Text' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'SimpleTerminal' -> 'IO' ()
-- @
