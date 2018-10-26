{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.DoubleWindow
  (
    doubleWindowNew,
    doubleWindowCustom
    -- * Hierarchy
    --
    -- $hierarchy

    -- * DoubleWindow functions
    --
    -- $DoubleWindowfunctions
  )
where
#include "Fl_C.h"
#include "Fl_Double_WindowC.h"
import Foreign
import Foreign.C
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Widget
import Graphics.UI.FLTK.LowLevel.Window

{# fun Fl_OverriddenDouble_Window_New as overriddenWindowNew' {`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenDouble_Window_NewXY as overriddenWindowNewXY' {`Int',`Int', `Int', `Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenDouble_Window_NewXY_WithLabel as overriddenWindowNewXYWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenDouble_Window_New_WithLabel as overriddenWindowNewWithLabel' { `Int',`Int', unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
doubleWindowCustom :: Size                              -- ^ Size of this window
                   -> Maybe Position                    -- ^ Optional position of this window
                   -> Maybe T.Text                      -- ^ Optional label
                   -> Maybe (Ref DoubleWindow -> IO ()) -- ^ Optional table drawing routine
                   -> CustomWidgetFuncs DoubleWindow    -- ^ Custom widget overrides
                   -> CustomWindowFuncs DoubleWindow    -- ^ Custom window overrides
                   -> IO (Ref DoubleWindow)
doubleWindowCustom size position title draw' customWidgetFuncs' customWindowFuncs' =
  windowMaker
    size
    position
    title
    draw'
    customWidgetFuncs'
    customWindowFuncs'
    overriddenWindowNew'
    overriddenWindowNewWithLabel'
    overriddenWindowNewXY'
    overriddenWindowNewXYWithLabel'

doubleWindowNew :: Size -> Maybe Position -> Maybe T.Text -> IO (Ref DoubleWindow)
doubleWindowNew size position title =
  windowMaker
    size
    position
    title
    Nothing
    (defaultCustomWidgetFuncs :: CustomWidgetFuncs DoubleWindow)
    (defaultCustomWindowFuncs :: CustomWindowFuncs DoubleWindow)
    overriddenWindowNew'
    overriddenWindowNewWithLabel'
    overriddenWindowNewXY'
    overriddenWindowNewXYWithLabel'

{# fun Fl_Double_Window_Destroy as windowDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) DoubleWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> windowDestroy' winPtr

{# fun Fl_Double_Window_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) DoubleWindow orig impl where
  runOp _ _ window = withRef window $ \windowPtr -> drawSuper' windowPtr

{# fun Fl_Double_Window_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) DoubleWindow orig impl where
  runOp _ _ window event = withRef window $ \windowPtr -> handleSuper' windowPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent

{# fun Fl_Double_Window_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) DoubleWindow orig impl where
  runOp _ _ window rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef window $ \windowPtr -> resizeSuper' windowPtr x_pos y_pos width height

{# fun Fl_Double_Window_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) DoubleWindow orig impl where
  runOp _ _ window = withRef window $ \windowPtr -> showSuper' windowPtr

{# fun Fl_Double_Window_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) DoubleWindow orig impl where
  runOp _ _ window = withRef window $ \windowPtr -> hideSuper' windowPtr

{# fun Fl_Double_Window_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Hide ()) DoubleWindow orig impl where
  runOp _ _ window = withRef window $ \windowPtr -> hide' windowPtr

{# fun Fl_Double_Window_flush_super as flushSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (FlushSuper ()) DoubleWindow orig impl where
  runOp _ _ window = withRef window $ \windowPtr -> flushSuper' windowPtr

{# fun Fl_Double_Window_show as windowShow' {id `Ptr ()'} -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (ShowWidget ()) DoubleWindow orig impl where
  runOp _ _ window = withRef window (\p -> windowShow' p)

{#fun Fl_Double_Window_handle as windowHandle'
      { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) DoubleWindow orig impl where
  runOp _ _ window event = withRef window (\p -> windowHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent

{# fun Fl_Double_Window_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) DoubleWindow orig impl where
  runOp _ _ window rectangle = withRef window $ \windowPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' windowPtr x_pos y_pos w_pos h_pos
-- $DoubleWindowfunctions
-- @
--
-- destroy :: 'Ref' 'DoubleWindow' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'DoubleWindow' -> 'IO' ()
--
-- flushSuper :: 'Ref' 'DoubleWindow' -> 'IO' ()
--
-- handle :: 'Ref' 'DoubleWindow' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'DoubleWindow' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'DoubleWindow' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'DoubleWindow' -> 'IO' ()
--
-- resize :: 'Ref' 'DoubleWindow' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'DoubleWindow' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'DoubleWindow' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'DoubleWindow' -> 'IO' ()
-- @


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Window"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.DoubleWindow"
-- @
