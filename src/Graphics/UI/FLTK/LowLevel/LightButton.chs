{-# LANGUAGE CPP, EmptyDataDecls, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.LightButton
    (
     lightButtonNew,
     lightButtonCustom
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
#include "Fl_Light_ButtonC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Widget
{# fun Fl_OverriddenLight_Button_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenLight_Button_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
lightButtonCustom ::
       Rectangle                         -- ^ The bounds of this LightButton
    -> Maybe T.Text                      -- ^ The LightButton label
    -> Maybe (Ref LightButton -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs LightButton)      -- ^ Optional custom widget functions
    -> IO (Ref LightButton)
lightButtonCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Light_Button_New as widgetNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Light_Button_New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text'} -> `Ptr ()' id #}
lightButtonNew :: Rectangle -> Maybe T.Text -> IO (Ref LightButton)
lightButtonNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> widgetNew' x_pos y_pos width height >>= toRef
        Just l -> widgetNewWithLabel' x_pos y_pos width height l >>= toRef

{# fun Fl_Light_Button_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) LightButton orig impl where
  runOp _ _ button = swapRef button $
                    \buttonPtr ->
                     widgetDestroy' buttonPtr >>
                     return nullPtr
{# fun Fl_Light_Button_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) LightButton orig impl where
  runOp _ _ lightButton = withRef lightButton $ \lightButtonPtr -> draw'' lightButtonPtr
{# fun Fl_Light_Button_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) LightButton orig impl where
  runOp _ _ lightButton = withRef lightButton $ \lightButtonPtr -> drawSuper' lightButtonPtr
{#fun Fl_Light_Button_handle as lightButtonHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) LightButton orig impl where
  runOp _ _ lightButton event = withRef lightButton (\p -> lightButtonHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Light_Button_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) LightButton orig impl where
  runOp _ _ lightButton event = withRef lightButton $ \lightButtonPtr -> handleSuper' lightButtonPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Light_Button_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) LightButton orig impl where
  runOp _ _ lightButton rectangle = withRef lightButton $ \lightButtonPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' lightButtonPtr x_pos y_pos w_pos h_pos
{# fun Fl_Light_Button_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) LightButton orig impl where
  runOp _ _ lightButton rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef lightButton $ \lightButtonPtr -> resizeSuper' lightButtonPtr x_pos y_pos width height
{# fun Fl_Light_Button_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) LightButton orig impl where
  runOp _ _ lightButton = withRef lightButton $ \lightButtonPtr -> hide' lightButtonPtr
{# fun Fl_Light_Button_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) LightButton orig impl where
  runOp _ _ lightButton = withRef lightButton $ \lightButtonPtr -> hideSuper' lightButtonPtr
{# fun Fl_Light_Button_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) LightButton orig impl where
  runOp _ _ lightButton = withRef lightButton $ \lightButtonPtr -> show' lightButtonPtr
{# fun Fl_Light_Button_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) LightButton orig impl where
  runOp _ _ lightButton = withRef lightButton $ \lightButtonPtr -> showSuper' lightButtonPtr

-- $functions
-- @
-- destroy :: 'Ref' 'LightButton' -> 'IO' ()
--
-- draw :: 'Ref' 'LightButton' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'LightButton' -> 'IO' ()
--
-- handle :: 'Ref' 'LightButton' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'LightButton' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'LightButton' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'LightButton' -> 'IO' ()
--
-- resize :: 'Ref' 'LightButton' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'LightButton' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'LightButton' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'LightButton' -> 'IO' ()
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Button"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.LightButton"
-- @
