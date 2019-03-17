{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Output
    (
     FlOutputType(..),
     -- * Constructor
     outputNew,
     outputCustom
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Input
     --
     -- $Input
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Input_C.h"
#include "Fl_OutputC.h"
#include "Fl_Multiline_OutputC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Widget
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations

#c
enum FlOutputType {
  FlNormalOutput = FL_NORMAL_OUTPUT,
  FlMultilineOutput = FL_MULTILINE_OUTPUT
};
#endc
{# fun Fl_OverriddenOutput_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenOutput_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
outputCustom ::
       Rectangle                         -- ^ The bounds of this Output
    -> Maybe T.Text                      -- ^ The Output label
    -> Maybe (Ref Output -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs Output)      -- ^ Optional custom widget functions
    -> IO (Ref Output)
outputCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'


{#enum FlOutputType {}#}
{# fun Fl_Multiline_Output_New_WithLabel as multilineOutputNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `FunPtr DestroyCallbacksPrim'} -> `Ptr ()' id #}
outputNew :: Rectangle -> Maybe T.Text -> Maybe FlOutputType -> IO (Ref Output)
outputNew rectangle l' flOutputType =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
        construct = case flOutputType of
                      Just FlNormalOutput -> outputCustom rectangle l' Nothing Nothing
                      Nothing -> outputCustom rectangle l' Nothing Nothing
                      Just FlMultilineOutput -> do
                        destroyFptr <- toDestroyCallbacksPrim defaultDestroyCallbacks
                        lPtr <- maybe (return nullPtr) copyTextToCString l'
                        multilineOutputNewWithLabel' x_pos y_pos width height lPtr destroyFptr >>= toRef
    in do
     ref <- construct
     setFlag ref WidgetFlagCopiedLabel
     setFlag ref WidgetFlagCopiedTooltip
     return ref

{# fun Fl_Widget_set_type as setType' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ (FlOutputType ->  IO ())) => Op (SetType ()) Output orig impl where
  runOp _ _ widget t = withRef widget $ \widgetPtr -> setType' widgetPtr (fromInteger $ toInteger $ fromEnum t)
{# fun Fl_Output_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Output orig impl where
  runOp _ _ output = withRef output $ \outputPtr -> draw'' outputPtr
{# fun Fl_Output_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) Output orig impl where
  runOp _ _ output = withRef output $ \outputPtr -> drawSuper' outputPtr
{#fun Fl_Output_handle as outputHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Output orig impl where
  runOp _ _ output event = withRef output (\p -> outputHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Output_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) Output orig impl where
  runOp _ _ output event = withRef output $ \outputPtr -> handleSuper' outputPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Output_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Output orig impl where
  runOp _ _ output rectangle = withRef output $ \outputPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' outputPtr x_pos y_pos w_pos h_pos
{# fun Fl_Output_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) Output orig impl where
  runOp _ _ output rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef output $ \outputPtr -> resizeSuper' outputPtr x_pos y_pos width height
{# fun Fl_Output_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Output orig impl where
  runOp _ _ output = withRef output $ \outputPtr -> hide' outputPtr
{# fun Fl_Output_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) Output orig impl where
  runOp _ _ output = withRef output $ \outputPtr -> hideSuper' outputPtr
{# fun Fl_Output_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Output orig impl where
  runOp _ _ output = withRef output $ \outputPtr -> show' outputPtr
{# fun Fl_Output_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) Output orig impl where
  runOp _ _ output = withRef output $ \outputPtr -> showSuper' outputPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Input"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Output"
-- @

-- $Input
-- @
-- draw :: 'Ref' 'Output' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'Output' -> 'IO' ()
--
-- handle :: 'Ref' 'Output' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'Output' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Output' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'Output' -> 'IO' ()
--
-- resize :: 'Ref' 'Output' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'Output' -> 'Rectangle' -> 'IO' ()
--
-- setType :: 'Ref' 'Output' -> 'FlOutputType' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Output' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'Output' -> 'IO' ()
-- @
