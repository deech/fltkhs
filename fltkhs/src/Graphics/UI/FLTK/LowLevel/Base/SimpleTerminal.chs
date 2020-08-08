{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
module Graphics.UI.FLTK.LowLevel.Base.SimpleTerminal
       (
         simpleTerminalNew,
         simpleTerminalCustom
  , drawSimpleTerminalBase
  , handleSimpleTerminalBase
  , resizeSimpleTerminalBase
  , hideSimpleTerminalBase
  , showWidgetSimpleTerminalBase
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
import Graphics.UI.FLTK.LowLevel.Base.Widget
import Graphics.UI.FLTK.LowLevel.Base.TextDisplay
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
instance (impl ~ (Bool ->  IO ())) => Op (SetStayAtBottom ()) SimpleTerminalBase orig impl where
   runOp _ _ simple_terminal b = withRef simple_terminal $ \simple_terminalPtr -> setStayAtBottom' simple_terminalPtr b
{# fun Fl_Simple_Terminal_get_stay_at_bottom as getStayAtBottom' { id `Ptr ()'} -> `Bool' cToBool#}
instance (impl ~ (IO Bool)) => Op (GetStayAtBottom ()) SimpleTerminalBase orig impl where
   runOp _ _ simple_terminal = withRef simple_terminal $ \simple_terminalPtr -> getStayAtBottom' simple_terminalPtr
{# fun Fl_Simple_Terminal_set_ansi as setAnsi' { id `Ptr ()', cFromBool `Bool' } -> `()' #}
instance (impl ~ (Bool ->  IO ())) => Op (SetAnsi ()) SimpleTerminalBase orig impl where
   runOp _ _ simple_terminal b = withRef simple_terminal $ \simple_terminalPtr -> setAnsi' simple_terminalPtr b
{# fun Fl_Simple_Terminal_get_ansi as getAnsi' { id `Ptr ()'} -> `Bool' cToBool#}
instance (impl ~ (IO Bool)) => Op (GetAnsi ()) SimpleTerminalBase orig impl where
   runOp _ _ simple_terminal = withRef simple_terminal $ \simple_terminalPtr -> getAnsi' simple_terminalPtr
{# fun Fl_Simple_Terminal_set_history_lines as setHistoryLines' { id `Ptr ()', `Int' } -> `()' #}
instance (impl ~ (Lines ->  IO ())) => Op (SetHistoryLines ()) SimpleTerminalBase orig impl where
   runOp _ _ simple_terminal (Lines b) = withRef simple_terminal $ \simple_terminalPtr -> setHistoryLines' simple_terminalPtr b
{# fun Fl_Simple_Terminal_get_history_lines as getHistoryLines' { id `Ptr ()'} -> `Int' #}
instance (impl ~ (IO Lines)) => Op (GetHistoryLines ()) SimpleTerminalBase orig impl where
   runOp _ _ simple_terminal = withRef simple_terminal $ \simple_terminalPtr -> getHistoryLines' simple_terminalPtr >>= return . Lines
{# fun Fl_Simple_Terminal_set_normal_style_index as setNormalStyleIndex' { id `Ptr ()', `Int' } -> `()' #}
instance (impl ~ (AtIndex ->  IO ())) => Op (SetNormalStyleIndex ()) SimpleTerminalBase orig impl where
   runOp _ _ simple_terminal (AtIndex b) = withRef simple_terminal $ \simple_terminalPtr -> setNormalStyleIndex' simple_terminalPtr b
{# fun Fl_Simple_Terminal_get_normal_style_index as getNormalStyleIndex' { id `Ptr ()'} -> `Int' #}
instance (impl ~ (IO AtIndex)) => Op (GetNormalStyleIndex ()) SimpleTerminalBase orig impl where
   runOp _ _ simple_terminal = withRef simple_terminal $ \simple_terminalPtr -> getNormalStyleIndex' simple_terminalPtr >>= return . AtIndex
{# fun Fl_Simple_Terminal_set_current_style_index as setCurrentStyleIndex' { id `Ptr ()', `Int' } -> `()' #}
instance (impl ~ (AtIndex ->  IO ())) => Op (SetCurrentStyleIndex ()) SimpleTerminalBase orig impl where
   runOp _ _ simple_terminal (AtIndex b) = withRef simple_terminal $ \simple_terminalPtr -> setCurrentStyleIndex' simple_terminalPtr b
{# fun Fl_Simple_Terminal_get_current_style_index as getCurrentStyleIndex' { id `Ptr ()'} -> `Int' #}
instance (impl ~ (IO AtIndex)) => Op (GetCurrentStyleIndex ()) SimpleTerminalBase orig impl where
   runOp _ _ simple_terminal = withRef simple_terminal $ \simple_terminalPtr -> getCurrentStyleIndex' simple_terminalPtr >>= return . AtIndex
{# fun Fl_Simple_Terminal_set_text as setText' { id `Ptr ()',`CString' } -> `()' #}
instance (impl ~ (T.Text ->  IO ())) => Op (SetText ()) SimpleTerminalBase orig impl where
   runOp _ _ simple_terminal val = withRef simple_terminal $ \simple_terminalPtr -> copyTextToCString val >>= setText' simple_terminalPtr
{# fun Fl_Simple_Terminal_get_text as getText' { id `Ptr ()' } -> `CString' #}
instance (impl ~ ( IO T.Text)) => Op (GetText ()) SimpleTerminalBase orig impl where
   runOp _ _ simple_terminal = withRef simple_terminal $ \simple_terminalPtr -> getText' simple_terminalPtr >>= cStringToText
{# fun Fl_Simple_Terminal_clear as clear'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Clear ()) SimpleTerminalBase orig impl where
  runOp _ _ simpleTerminal = withRef simpleTerminal $ \simpleTerminalPtr -> clear'' simpleTerminalPtr
{# fun Fl_Simple_Terminal_remove_lines as removeLines' { id `Ptr ()', `Int', `Int' } -> `()' #}
instance (impl ~ (LineNumber -> LineNumber -> IO ())) => Op (RemoveLines ()) SimpleTerminalBase orig impl where
   runOp _ _ simple_terminal (LineNumber start) (LineNumber count) = withRef simple_terminal $ \simple_terminalPtr -> removeLines' simple_terminalPtr start count
{# fun Fl_Simple_Terminal_set_style_table as setStyleTable' { id `Ptr ()',id `Ptr ()',`Int',  `Int'} -> `()' #}
instance (impl ~ ([StyleTableEntry] -> Maybe Int -> IO ())) => Op (SetStyleTable ()) SimpleTerminalBase orig impl where
   runOp _ _ simple_terminal styleTable normal_style_index =
     withRef simple_terminal $ \simple_terminalPtr -> do
       stesPtr <- mkStyleTableEntriesPtr simple_terminal styleTable
       setStyleTable'
         simple_terminalPtr
         (castPtr (Unsafe.unsafeForeignPtrToPtr stesPtr))
         (length styleTable)
         (maybe 0 id normal_style_index)
{# fun Fl_Simple_Terminal_get_style_table_size as getStyleTableSize' { id `Ptr ()'} -> `Int' fromIntegral #}
instance (impl ~ (IO Int)) => Op (GetStyleTableSize ()) SimpleTerminalBase orig impl where
   runOp _ _ simple_terminal = withRef simple_terminal $ \simple_terminalPtr -> getStyleTableSize' simple_terminalPtr
{# fun Fl_Simple_Terminal_get_style_table as getStyleTable' { id `Ptr ()'} -> `Ptr ()' #}
instance (impl ~ (IO (Maybe [StyleTableEntry]))) => Op (GetStyleTable ()) SimpleTerminalBase orig impl where
   runOp _ _ simple_terminal =
     withRef simple_terminal $ \simple_terminalPtr -> do
       size <- getStyleTableSize simple_terminal
       ptr <- getStyleTable' simple_terminalPtr
       toStyleTableEntries size ptr

{# fun Fl_Simple_Terminal_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawSimpleTerminalBase ::  Ref SimpleTerminalBase -> IO ()
drawSimpleTerminalBase simpleTerminal = withRef simpleTerminal $ \simpleTerminalPtr -> drawSuper' simpleTerminalPtr
{# fun Fl_Simple_Terminal_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleSimpleTerminalBase :: Ref SimpleTerminalBase -> Event ->  IO (Either UnknownEvent ())
handleSimpleTerminalBase simpleTerminal event = withRef simpleTerminal $ \simpleTerminalPtr -> handleSuper' simpleTerminalPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Simple_Terminal_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeSimpleTerminalBase :: Ref SimpleTerminalBase -> Rectangle -> IO ()
resizeSimpleTerminalBase simpleTerminal rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef simpleTerminal $ \simpleTerminalPtr -> resizeSuper' simpleTerminalPtr x_pos y_pos width height
{# fun Fl_Simple_Terminal_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideSimpleTerminalBase ::  Ref SimpleTerminalBase -> IO ()
hideSimpleTerminalBase simpleTerminal = withRef simpleTerminal $ \simpleTerminalPtr -> hideSuper' simpleTerminalPtr
{# fun Fl_Simple_Terminal_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetSimpleTerminalBase ::  Ref SimpleTerminalBase -> IO ()
showWidgetSimpleTerminalBase simpleTerminal = withRef simpleTerminal $ \simpleTerminalPtr -> showSuper' simpleTerminalPtr

{# fun Fl_Simple_Terminal_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) SimpleTerminalBase orig impl where
  runOp _ _ simpleTerminal = withRef simpleTerminal $ \simpleTerminalPtr -> draw'' simpleTerminalPtr
{#fun Fl_Simple_Terminal_handle as simpleTerminalHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) SimpleTerminalBase orig impl where
  runOp _ _ simpleTerminal event = withRef simpleTerminal (\p -> simpleTerminalHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Simple_Terminal_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) SimpleTerminalBase orig impl where
  runOp _ _ simpleTerminal rectangle = withRef simpleTerminal $ \simpleTerminalPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' simpleTerminalPtr x_pos y_pos w_pos h_pos
{# fun Fl_Simple_Terminal_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) SimpleTerminalBase orig impl where
  runOp _ _ simpleTerminal = withRef simpleTerminal $ \simpleTerminalPtr -> hide' simpleTerminalPtr
{# fun Fl_Simple_Terminal_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) SimpleTerminalBase orig impl where
  runOp _ _ simpleTerminal = withRef simpleTerminal $ \simpleTerminalPtr -> show' simpleTerminalPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.TextDisplay"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.SimpleTerminal"
-- @

-- $functions
-- @
-- clear :: 'Ref' 'SimpleTerminalBase' -> 'IO' ()
--
-- draw :: 'Ref' 'SimpleTerminalBase' -> 'IO' ()
--
-- getAnsi :: 'Ref' 'SimpleTerminalBase' -> 'IO' 'Bool'
--
-- getCurrentStyleIndex :: 'Ref' 'SimpleTerminalBase' -> 'IO' 'AtIndex'
--
-- getHistoryLines :: 'Ref' 'SimpleTerminalBase' -> 'IO' 'Lines'
--
-- getNormalStyleIndex :: 'Ref' 'SimpleTerminalBase' -> 'IO' 'AtIndex'
--
-- getStayAtBottom :: 'Ref' 'SimpleTerminalBase' -> 'IO' 'Bool'
--
-- getStyleTable :: 'Ref' 'SimpleTerminalBase' -> 'IO' ('Maybe' ['StyleTableEntry')]
--
-- getStyleTableSize :: 'Ref' 'SimpleTerminalBase' -> 'IO' 'Int'
--
-- getText :: 'Ref' 'SimpleTerminalBase' -> 'IO' 'T.Text'
--
-- handle :: 'Ref' 'SimpleTerminalBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'SimpleTerminalBase' -> 'IO' ()
--
-- removeLines :: 'Ref' 'SimpleTerminalBase' -> 'LineNumber' -> 'LineNumber' -> 'IO' ()
--
-- resize :: 'Ref' 'SimpleTerminalBase' -> 'Rectangle' -> 'IO' ()
--
-- setAnsi :: 'Ref' 'SimpleTerminalBase' -> 'Bool' -> 'IO' ()
--
-- setCurrentStyleIndex :: 'Ref' 'SimpleTerminalBase' -> 'AtIndex' -> 'IO' ()
--
-- setHistoryLines :: 'Ref' 'SimpleTerminalBase' -> 'Lines' -> 'IO' ()
--
-- setNormalStyleIndex :: 'Ref' 'SimpleTerminalBase' -> 'AtIndex' -> 'IO' ()
--
-- setStayAtBottom :: 'Ref' 'SimpleTerminalBase' -> 'Bool' -> 'IO' ()
--
-- setStyleTable :: 'Ref' 'SimpleTerminalBase' -> ['StyleTableEntry'] -> 'Maybe' 'Int' -> 'IO' ()
--
-- setText :: 'Ref' 'SimpleTerminalBase' -> 'T.Text' -> 'IO' ()
--
-- showWidget :: 'Ref' 'SimpleTerminalBase' -> 'IO' ()
-- @
