{-# LANGUAGE CPP, EmptyDataDecls, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.CheckButton
    (
     checkButtonNew,
     checkButtonCustom,
     -- * Hierarchy
     --
     -- $hierarchy
     -- * CheckButton
     --
     -- $CheckButtonfunctions
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Check_ButtonC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Widget

{# fun Fl_OverriddenCheck_Button_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenCheck_Button_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
checkButtonCustom ::
       Rectangle                         -- ^ The bounds of this CheckButton
    -> Maybe T.Text                      -- ^ The CheckButton label
    -> Maybe (Ref CheckButton -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs CheckButton)      -- ^ Optional custom widget functions
    -> IO (Ref CheckButton)
checkButtonCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'


{# fun Fl_Check_Button_New as widgetNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Check_Button_New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `T.Text'} -> `Ptr ()' id #}
checkButtonNew :: Rectangle -> Maybe T.Text -> IO (Ref CheckButton)
checkButtonNew rectangle l' =
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Check_Button_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Destroy ()) CheckButton orig impl where
  runOp _ _ button = swapRef button $
                    \buttonPtr ->
                     widgetDestroy' buttonPtr >>
                     return nullPtr
{# fun Fl_Check_Button_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) CheckButton orig impl where
  runOp _ _ checkButton = withRef checkButton $ \checkButtonPtr -> draw'' checkButtonPtr
{# fun Fl_Check_Button_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) CheckButton orig impl where
  runOp _ _ checkButton = withRef checkButton $ \checkButtonPtr -> drawSuper' checkButtonPtr
{#fun Fl_Check_Button_handle as checkButtonHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) CheckButton orig impl where
  runOp _ _ checkButton event = withRef checkButton (\p -> checkButtonHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Check_Button_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) CheckButton orig impl where
  runOp _ _ checkButton event = withRef checkButton $ \checkButtonPtr -> handleSuper' checkButtonPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Check_Button_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) CheckButton orig impl where
  runOp _ _ checkButton rectangle = withRef checkButton $ \checkButtonPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' checkButtonPtr x_pos y_pos w_pos h_pos
{# fun Fl_Check_Button_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) CheckButton orig impl where
  runOp _ _ checkButton rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef checkButton $ \checkButtonPtr -> resizeSuper' checkButtonPtr x_pos y_pos width height
{# fun Fl_Check_Button_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) CheckButton orig impl where
  runOp _ _ checkButton = withRef checkButton $ \checkButtonPtr -> hide' checkButtonPtr
{# fun Fl_Check_Button_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) CheckButton orig impl where
  runOp _ _ checkButton = withRef checkButton $ \checkButtonPtr -> hideSuper' checkButtonPtr
{# fun Fl_Check_Button_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) CheckButton orig impl where
  runOp _ _ checkButton = withRef checkButton $ \checkButtonPtr -> show' checkButtonPtr
{# fun Fl_Check_Button_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) CheckButton orig impl where
  runOp _ _ checkButton = withRef checkButton $ \checkButtonPtr -> showSuper' checkButtonPtr

-- $CheckButtonfunctions
--
-- @
-- destroy :: 'Ref' 'CheckButton' -> 'IO' ()
--
-- draw :: 'Ref' 'CheckButton' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'CheckButton' -> 'IO' ()
--
-- handle :: 'Ref' 'CheckButton' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'CheckButton' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'CheckButton' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'CheckButton' -> 'IO' ()
--
-- resize :: 'Ref' 'CheckButton' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'CheckButton' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'CheckButton' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'CheckButton' -> 'IO' ()
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Button"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.CheckButton"
-- @
