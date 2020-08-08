{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.Adjuster
    (
     -- * Constructor
     adjusterNew,
     adjusterCustom
   , drawAdjusterBase
   , handleAdjusterBase
   , resizeAdjusterBase
   , hideAdjusterBase
   , showWidgetAdjusterBase
     -- * Hierarchy
     --
     -- $hierarchy

     -- *  Functions
     --
     -- $functions
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_AdjusterC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Base.Widget

{# fun Fl_OverriddenAdjuster_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenAdjuster_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
adjusterCustom ::
       Rectangle                         -- ^ The bounds of this Adjuster
    -> Maybe T.Text                      -- ^ The Adjuster label
    -> Maybe (Ref Adjuster -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs Adjuster)      -- ^ Optional custom widget functions
    -> IO (Ref Adjuster)
adjusterCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'


{# fun Fl_Adjuster_New as adjusterNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Adjuster_New_WithLabel as adjusterNewWithLabel' { `Int',`Int',`Int',`Int', `CString'} -> `Ptr ()' id #}
adjusterNew :: Rectangle -> Maybe T.Text -> IO (Ref Adjuster)
adjusterNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in do
      r <- case l' of
            Nothing -> adjusterNew' x_pos y_pos width height >>= toRef
            Just l -> copyTextToCString l >>= \l' -> adjusterNewWithLabel' x_pos y_pos width height l' >>= toRef
      setFlag r WidgetFlagCopiedLabel
      setFlag r WidgetFlagCopiedTooltip
      return r

{# fun Fl_Adjuster_Destroy as adjusterDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) AdjusterBase orig impl where
  runOp _ _ adjuster = swapRef adjuster $ \adjusterPtr -> do
    adjusterDestroy' adjusterPtr
    return nullPtr

{# fun Fl_Adjuster_soft as soft' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ ( IO (Bool))) => Op (GetSoft ()) AdjusterBase orig impl where
  runOp _ _ adjuster = withRef adjuster $ \adjusterPtr -> soft' adjusterPtr

{# fun Fl_Adjuster_set_soft as setSoft' { id `Ptr ()',cFromBool `Bool' } -> `()' #}
instance (impl ~ (Bool->  IO ())) => Op (SetSoft ()) AdjusterBase orig impl where
  runOp _ _ adjuster soft = withRef adjuster $ \adjusterPtr -> setSoft' adjusterPtr soft

{# fun Fl_Adjuster_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawAdjusterBase ::  Ref AdjusterBase -> IO ()
drawAdjusterBase adjuster = withRef adjuster $ \adjusterPtr -> drawSuper' adjusterPtr
{# fun Fl_Adjuster_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleAdjusterBase :: Ref AdjusterBase -> Event ->  IO (Either UnknownEvent ())
handleAdjusterBase adjuster event = withRef adjuster $ \adjusterPtr -> handleSuper' adjusterPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Adjuster_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeAdjusterBase :: Ref AdjusterBase -> Rectangle -> IO ()
resizeAdjusterBase adjuster rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef adjuster $ \adjusterPtr -> resizeSuper' adjusterPtr x_pos y_pos width height
{# fun Fl_Adjuster_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideAdjusterBase ::  Ref AdjusterBase -> IO ()
hideAdjusterBase adjuster = withRef adjuster $ \adjusterPtr -> hideSuper' adjusterPtr
{# fun Fl_Adjuster_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetAdjusterBase ::  Ref AdjusterBase -> IO ()
showWidgetAdjusterBase adjuster = withRef adjuster $ \adjusterPtr -> showSuper' adjusterPtr

{# fun Fl_Adjuster_draw as draw' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Draw ()) AdjusterBase orig impl where
  runOp _ _ adjuster = withRef adjuster $ \adjusterPtr -> draw' adjusterPtr
{# fun Fl_Adjuster_handle as handle' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (Handle ()) AdjusterBase orig impl where
  runOp _ _ adjuster event = withRef adjuster $ \adjusterPtr -> handle' adjusterPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Adjuster_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) AdjusterBase orig impl where
  runOp _ _ adjuster rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef adjuster $ \adjusterPtr -> resizeSuper' adjusterPtr x_pos y_pos width height
{# fun Fl_Adjuster_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Hide ()) AdjusterBase orig impl where
  runOp _ _ adjuster = withRef adjuster $ \adjusterPtr -> hide' adjusterPtr
{# fun Fl_Adjuster_show as show' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidget ()) AdjusterBase orig impl where
  runOp _ _ adjuster = withRef adjuster $ \adjusterPtr -> show' adjusterPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Valuator"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Adjuster"
-- @

-- $functions
-- @
-- destroy :: 'Ref' 'AdjusterBase' -> 'IO' ()
--
-- draw :: 'Ref' 'AdjusterBase' -> 'IO' ()
--
-- getSoft :: 'Ref' 'AdjusterBase' -> 'IO' ('Bool')
--
-- handle :: 'Ref' 'AdjusterBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'AdjusterBase' -> 'IO' ()
--
-- resize :: 'Ref' 'AdjusterBase' -> 'Rectangle' -> 'IO' ()
--
-- setSoft :: 'Ref' 'AdjusterBase' -> 'Bool'>- 'IO' ()
--
-- showWidget :: 'Ref' 'AdjusterBase' -> 'IO' ()
-- @
