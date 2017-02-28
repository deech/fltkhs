{-# LANGUAGE CPP, EmptyDataDecls, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.ReturnButton
    (
     returnButtonNew,
     returnButtonCustom
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
#include "Fl_Return_ButtonC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)

import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Widget

{# fun Fl_OverriddenReturn_Button_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenReturn_Button_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
returnButtonCustom ::
       Rectangle                         -- ^ The bounds of this ReturnButton
    -> Maybe T.Text                      -- ^ The ReturnButton label
    -> Maybe (Ref ReturnButton -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs ReturnButton)      -- ^ Optional custom widget functions
    -> IO (Ref ReturnButton)
returnButtonCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Return_Button_New as widgetNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Return_Button_New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text'} -> `Ptr ()' id #}
returnButtonNew :: Rectangle -> Maybe T.Text -> IO (Ref ReturnButton)
returnButtonNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> widgetNew' x_pos y_pos width height >>= toRef
        Just l -> widgetNewWithLabel' x_pos y_pos width height l >>= toRef

{# fun Fl_Return_Button_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~  IO ()) => Op (Destroy ()) ReturnButton orig impl where
  runOp _ _ button = swapRef button $
                    \buttonPtr ->
                     widgetDestroy' buttonPtr >>
                     return nullPtr

{# fun Fl_Return_Button_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) ReturnButton orig impl where
  runOp _ _ returnButton = withRef returnButton $ \returnButtonPtr -> draw'' returnButtonPtr
{# fun Fl_Return_Button_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) ReturnButton orig impl where
  runOp _ _ returnButton = withRef returnButton $ \returnButtonPtr -> drawSuper' returnButtonPtr
{#fun Fl_Return_Button_handle as returnButtonHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) ReturnButton orig impl where
  runOp _ _ returnButton event = withRef returnButton (\p -> returnButtonHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Return_Button_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) ReturnButton orig impl where
  runOp _ _ returnButton event = withRef returnButton $ \returnButtonPtr -> handleSuper' returnButtonPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Return_Button_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) ReturnButton orig impl where
  runOp _ _ returnButton rectangle = withRef returnButton $ \returnButtonPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' returnButtonPtr x_pos y_pos w_pos h_pos
{# fun Fl_Return_Button_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) ReturnButton orig impl where
  runOp _ _ returnButton rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef returnButton $ \returnButtonPtr -> resizeSuper' returnButtonPtr x_pos y_pos width height
{# fun Fl_Return_Button_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) ReturnButton orig impl where
  runOp _ _ returnButton = withRef returnButton $ \returnButtonPtr -> hide' returnButtonPtr
{# fun Fl_Return_Button_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) ReturnButton orig impl where
  runOp _ _ returnButton = withRef returnButton $ \returnButtonPtr -> hideSuper' returnButtonPtr
{# fun Fl_Return_Button_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) ReturnButton orig impl where
  runOp _ _ returnButton = withRef returnButton $ \returnButtonPtr -> show' returnButtonPtr
{# fun Fl_Return_Button_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) ReturnButton orig impl where
  runOp _ _ returnButton = withRef returnButton $ \returnButtonPtr -> showSuper' returnButtonPtr

-- $functions
-- @
--
-- destroy :: 'Ref' 'ReturnButton' -> 'IO' ()
--
-- handle :: 'Ref' 'ReturnButton' -> ('Event' -> 'IO' ('Either' 'UnknownEvent' ()))
--
-- @


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Button"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.ReturnButton"
-- @
