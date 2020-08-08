{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.SingleWindow
  (
    singleWindowNew,
    singleWindowCustom
  , handleSingleWindowBase
  , resizeSingleWindowBase
  , hideSingleWindowBase
  , showWidgetSingleWindowBase
    -- * Hierarchy
    --
    -- $hierarchy

    -- * Functions
    --
    -- $functions
  )
where
#include "Fl_C.h"
#include "Fl_Single_WindowC.h"
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

{# fun Fl_OverriddenSingle_Window_New as overriddenWindowNew' {`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenSingle_Window_NewXY as overriddenWindowNewXY' {`Int',`Int', `Int', `Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenSingle_Window_NewXY_WithLabel as overriddenWindowNewXYWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenSingle_Window_New_WithLabel as overriddenWindowNewWithLabel' { `Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
singleWindowCustom :: Size                                 -- ^ Size of this window
                   -> Maybe Position                       -- ^ Optional position of this window
                   -> Maybe T.Text                         -- ^ Optional label
                   -> Maybe (Ref SingleWindow -> IO ())    -- ^ Optional custom drawing function
                   -> CustomWidgetFuncs SingleWindow       -- ^ Custom widget overrides
                   -> CustomWindowFuncs SingleWindow       -- ^ Custom window overrides
                   -> IO (Ref SingleWindow)
singleWindowCustom size position title draw' customWidgetFuncs' customWindowFuncs' =
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

singleWindowNew :: Size -> Maybe Position -> Maybe T.Text -> IO (Ref SingleWindow)
singleWindowNew size position title =
  windowMaker
    size
    position
    title
    Nothing
    (defaultCustomWidgetFuncs :: CustomWidgetFuncs SingleWindow)
    (defaultCustomWindowFuncs :: CustomWindowFuncs SingleWindow)
    overriddenWindowNew'
    overriddenWindowNewWithLabel'
    overriddenWindowNewXY'
    overriddenWindowNewXYWithLabel'

{# fun Fl_Single_Window_Destroy as windowDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) SingleWindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> windowDestroy' winPtr

{# fun Fl_Single_Window_handle as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleSingleWindowBase :: Ref SingleWindowBase -> Event ->  IO (Either UnknownEvent ())
handleSingleWindowBase singleWindow event = withRef singleWindow $ \singleWindowPtr -> handleSuper' singleWindowPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Single_Window_resize as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeSingleWindowBase :: Ref SingleWindowBase -> Rectangle -> IO ()
resizeSingleWindowBase singleWindow rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef singleWindow $ \singleWindowPtr -> resizeSuper' singleWindowPtr x_pos y_pos width height
{# fun Fl_Single_Window_hide as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideSingleWindowBase ::  Ref SingleWindowBase -> IO ()
hideSingleWindowBase singleWindow = withRef singleWindow $ \singleWindowPtr -> hideSuper' singleWindowPtr
{# fun Fl_Single_Window_show as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetSingleWindowBase ::  Ref SingleWindowBase -> IO ()
showWidgetSingleWindowBase singleWindow = withRef singleWindow $ \singleWindowPtr -> showSuper' singleWindowPtr

{# fun Fl_DerivedSingle_Window_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Hide ()) SingleWindowBase orig impl where
  runOp _ _ window = withRef window $ \windowPtr -> hide' windowPtr

{# fun Fl_DerivedSingle_Window_show as windowShow' {id `Ptr ()'} -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (ShowWidget ()) SingleWindowBase orig impl where
  runOp _ _ window = withRef window (\p -> windowShow' p)

{#fun Fl_DerivedSingle_Window_handle as windowHandle'
      { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) SingleWindowBase orig impl where
  runOp _ _ window event = withRef window (\p -> windowHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent

{# fun Fl_DerivedSingle_Window_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) SingleWindowBase orig impl where
  runOp _ _ window rectangle = withRef window $ \windowPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' windowPtr x_pos y_pos w_pos h_pos

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
-- "Graphics.UI.FLTK.LowLevel.Base.SingleWindow"
-- @

-- $functions
-- @
-- destroy :: 'Ref' 'SingleWindowBase' -> 'IO' ()
--
-- handle :: 'Ref' 'SingleWindowBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'SingleWindowBase' -> 'IO' ()
--
-- resize :: 'Ref' 'SingleWindowBase' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'SingleWindowBase' -> 'IO' ()
-- @
