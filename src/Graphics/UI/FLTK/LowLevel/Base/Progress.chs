{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.Progress
    (
     -- * Constructor
     progressNew,
     progressCustom
  , drawProgressBase
  , handleProgressBase
  , resizeProgressBase
  , hideProgressBase
  , showWidgetProgressBase
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
#include "Fl_ProgressC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)

import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Base.Widget

{# fun Fl_OverriddenProgress_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenProgress_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
progressCustom ::
       Rectangle                         -- ^ The bounds of this Progress
    -> Maybe T.Text                      -- ^ The Progress label
    -> Maybe (Ref Progress -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs Progress)      -- ^ Optional custom widget functions
    -> IO (Ref Progress)
progressCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'


{# fun Fl_Progress_New as progressNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Progress_New_WithLabel as progressNewWithLabel' { `Int',`Int',`Int',`Int', `CString'} -> `Ptr ()' id #}
progressNew :: Rectangle -> Maybe T.Text -> IO (Ref Progress)
progressNew rectangle l'=
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Progress_Destroy as progressDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Destroy ()) ProgressBase orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
    progressDestroy' winPtr
    return nullPtr
{# fun Fl_Progress_set_maximum as setMaximum' { id `Ptr ()',`Float' } -> `()' #}
instance (impl ~ (Float ->  IO ())) => Op (SetMaximum ()) ProgressBase orig impl where
  runOp _ _ progress v = withRef progress $ \progressPtr -> setMaximum' progressPtr v
{# fun Fl_Progress_maximum as maximum' { id `Ptr ()' } -> `Float' #}
instance (impl ~ ( IO (Float))) => Op (GetMaximum ()) ProgressBase orig impl where
  runOp _ _ progress = withRef progress $ \progressPtr -> maximum' progressPtr
{# fun Fl_Progress_set_minimum as setMinimum' { id `Ptr ()',`Float' } -> `()' #}
instance (impl ~ (Float ->  IO ())) => Op (SetMinimum ()) ProgressBase orig impl where
  runOp _ _ progress v = withRef progress $ \progressPtr -> setMinimum' progressPtr v
{# fun Fl_Progress_minimum as minimum' { id `Ptr ()' } -> `Float' #}
instance (impl ~ ( IO (Float))) => Op (GetMinimum ()) ProgressBase orig impl where
  runOp _ _ progress = withRef progress $ \progressPtr -> minimum' progressPtr
{# fun Fl_Progress_set_value as setValue' { id `Ptr ()',`Float' } -> `()' #}
instance (impl ~ (Float ->  IO ())) => Op (SetValue ()) ProgressBase orig impl where
  runOp _ _ progress v = withRef progress $ \progressPtr -> setValue' progressPtr v
{# fun Fl_Progress_value as value' { id `Ptr ()' } -> `Float' #}
instance (impl ~ ( IO (Float))) => Op (GetValue ()) ProgressBase orig impl where
  runOp _ _ progress = withRef progress $ \progressPtr -> value' progressPtr

{# fun Fl_Progress_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawProgressBase ::  Ref ProgressBase -> IO ()
drawProgressBase progress = withRef progress $ \progressPtr -> drawSuper' progressPtr
{# fun Fl_Progress_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleProgressBase :: Ref ProgressBase -> Event ->  IO (Either UnknownEvent ())
handleProgressBase progress event = withRef progress $ \progressPtr -> handleSuper' progressPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Progress_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeProgressBase :: Ref ProgressBase -> Rectangle -> IO ()
resizeProgressBase progress rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef progress $ \progressPtr -> resizeSuper' progressPtr x_pos y_pos width height
{# fun Fl_Progress_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideProgressBase ::  Ref ProgressBase -> IO ()
hideProgressBase progress = withRef progress $ \progressPtr -> hideSuper' progressPtr
{# fun Fl_Progress_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetProgressBase ::  Ref ProgressBase -> IO ()
showWidgetProgressBase progress = withRef progress $ \progressPtr -> showSuper' progressPtr

{# fun Fl_Progress_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) ProgressBase orig impl where
  runOp _ _ progress = withRef progress $ \progressPtr -> draw'' progressPtr
{#fun Fl_Progress_handle as progressHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) ProgressBase orig impl where
  runOp _ _ progress event = withRef progress (\p -> progressHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Progress_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) ProgressBase orig impl where
  runOp _ _ progress rectangle = withRef progress $ \progressPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' progressPtr x_pos y_pos w_pos h_pos
{# fun Fl_Progress_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) ProgressBase orig impl where
  runOp _ _ progress = withRef progress $ \progressPtr -> hide' progressPtr
{# fun Fl_Progress_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) ProgressBase orig impl where
  runOp _ _ progress = withRef progress $ \progressPtr -> show' progressPtr


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Progress"
-- @

-- $functions
-- @
-- destroy :: 'Ref' 'ProgressBase' -> 'IO' ()
--
-- draw :: 'Ref' 'ProgressBase' -> 'IO' ()
--
-- getMaximum :: 'Ref' 'ProgressBase' -> 'IO' ('Float')
--
-- getMinimum :: 'Ref' 'ProgressBase' -> 'IO' ('Float')
--
-- getValue :: 'Ref' 'ProgressBase' -> 'IO' ('Float')
--
-- handle :: 'Ref' 'ProgressBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'ProgressBase' -> 'IO' ()
--
-- resize :: 'Ref' 'ProgressBase' -> 'Rectangle' -> 'IO' ()
--
-- setMaximum :: 'Ref' 'ProgressBase' -> 'Float' -> 'IO' ()
--
-- setMinimum :: 'Ref' 'ProgressBase' -> 'Float' -> 'IO' ()
--
-- setValue :: 'Ref' 'ProgressBase' -> 'Float' -> 'IO' ()
--
-- showWidget :: 'Ref' 'ProgressBase' -> 'IO' ()
-- @
