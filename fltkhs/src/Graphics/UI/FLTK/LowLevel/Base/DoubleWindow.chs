{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.DoubleWindow
  (
    doubleWindowNew,
    doubleWindowCustom
   , handleDoubleWindowBase
   , resizeDoubleWindowBase
   , hideDoubleWindowBase
   , showWidgetDoubleWindowBase
   , flushDoubleWindowBase
    -- * Hierarchy
    --
    -- $hierarchy

    -- * DoubleWindow functions
    --
    -- $functions
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
import Graphics.UI.FLTK.LowLevel.Base.Widget
import Graphics.UI.FLTK.LowLevel.Base.Window

{# fun Fl_OverriddenDouble_Window_New as overriddenWindowNew' {`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenDouble_Window_NewXY as overriddenWindowNewXY' {`Int',`Int', `Int', `Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenDouble_Window_NewXY_WithLabel as overriddenWindowNewXYWithLabel' { `Int',`Int',`Int',`Int',`CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenDouble_Window_New_WithLabel as overriddenWindowNewWithLabel' { `Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
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
instance (impl ~ (IO ())) => Op (Destroy ()) DoubleWindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> windowDestroy' winPtr

{# fun Fl_Double_Window_handle as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleDoubleWindowBase :: Ref DoubleWindowBase -> Event ->  IO (Either UnknownEvent ())
handleDoubleWindowBase adjuster event = withRef adjuster $ \adjusterPtr -> handleSuper' adjusterPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Double_Window_resize as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeDoubleWindowBase :: Ref DoubleWindowBase -> Rectangle -> IO ()
resizeDoubleWindowBase adjuster rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef adjuster $ \adjusterPtr -> resizeSuper' adjusterPtr x_pos y_pos width height
{# fun Fl_Double_Window_hide as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideDoubleWindowBase ::  Ref DoubleWindowBase -> IO ()
hideDoubleWindowBase adjuster = withRef adjuster $ \adjusterPtr -> hideSuper' adjusterPtr
{# fun Fl_Double_Window_show as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetDoubleWindowBase ::  Ref DoubleWindowBase -> IO ()
showWidgetDoubleWindowBase adjuster = withRef adjuster $ \adjusterPtr -> showSuper' adjusterPtr
{# fun Fl_Double_Window_flush as flushSuper' { id `Ptr ()' } -> `()' #}
flushDoubleWindowBase :: Ref DoubleWindowBase -> IO ()
flushDoubleWindowBase window = withRef window $ \windowPtr -> flush' windowPtr

{# fun Fl_DerivedDouble_Window_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Hide ()) DoubleWindowBase orig impl where
  runOp _ _ window = withRef window $ \windowPtr -> hide' windowPtr

{# fun Fl_DerivedDouble_Window_show as windowShow' {id `Ptr ()'} -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (ShowWidget ()) DoubleWindowBase orig impl where
  runOp _ _ window = withRef window (\p -> windowShow' p)

{#fun Fl_DerivedDouble_Window_handle as windowHandle'
      { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) DoubleWindowBase orig impl where
  runOp _ _ window event = withRef window (\p -> windowHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent

{# fun Fl_DerivedDouble_Window_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) DoubleWindowBase orig impl where
  runOp _ _ window rectangle = withRef window $ \windowPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' windowPtr x_pos y_pos w_pos h_pos

{# fun Fl_DerivedDouble_Window_flush as flush' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Flush ()) DoubleWindowBase orig impl where
  runOp _ _ window = withRef window $ \windowPtr -> flush' windowPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Window"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.DoubleWindow"
-- @

-- $functions
-- @
-- destroy :: 'Ref' 'DoubleWindowBase' -> 'IO' ()
--
-- flush :: 'Ref' 'DoubleWindowBase' -> 'IO' ()
--
-- handle :: 'Ref' 'DoubleWindowBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'DoubleWindowBase' -> 'IO' ()
--
-- resize :: 'Ref' 'DoubleWindowBase' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'DoubleWindowBase' -> 'IO' ()
-- @
