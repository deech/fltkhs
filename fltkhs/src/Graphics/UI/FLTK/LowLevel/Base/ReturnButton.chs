{-# LANGUAGE CPP, EmptyDataDecls, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.ReturnButton
    (
     returnButtonNew,
     returnButtonCustom
  , drawReturnButtonBase
  , handleReturnButtonBase
  , resizeReturnButtonBase
  , hideReturnButtonBase
  , showWidgetReturnButtonBase
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
import Graphics.UI.FLTK.LowLevel.Base.Widget

{# fun Fl_OverriddenReturn_Button_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
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
{# fun Fl_Return_Button_New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString'} -> `Ptr ()' id #}
returnButtonNew :: Rectangle -> Maybe T.Text -> IO (Ref ReturnButton)
returnButtonNew rectangle l' =
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Return_Button_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~  IO ()) => Op (Destroy ()) ReturnButtonBase orig impl where
  runOp _ _ button = swapRef button $
                    \buttonPtr ->
                     widgetDestroy' buttonPtr >>
                     return nullPtr

{# fun Fl_Return_Button_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawReturnButtonBase ::  Ref ReturnButtonBase -> IO ()
drawReturnButtonBase returnButton = withRef returnButton $ \returnButtonPtr -> drawSuper' returnButtonPtr
{# fun Fl_Return_Button_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleReturnButtonBase :: Ref ReturnButtonBase -> Event ->  IO (Either UnknownEvent ())
handleReturnButtonBase returnButton event = withRef returnButton $ \returnButtonPtr -> handleSuper' returnButtonPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Return_Button_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeReturnButtonBase :: Ref ReturnButtonBase -> Rectangle -> IO ()
resizeReturnButtonBase returnButton rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef returnButton $ \returnButtonPtr -> resizeSuper' returnButtonPtr x_pos y_pos width height
{# fun Fl_Return_Button_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideReturnButtonBase ::  Ref ReturnButtonBase -> IO ()
hideReturnButtonBase returnButton = withRef returnButton $ \returnButtonPtr -> hideSuper' returnButtonPtr
{# fun Fl_Return_Button_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetReturnButtonBase ::  Ref ReturnButtonBase -> IO ()
showWidgetReturnButtonBase returnButton = withRef returnButton $ \returnButtonPtr -> showSuper' returnButtonPtr

{# fun Fl_DerivedReturn_Button_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) ReturnButtonBase orig impl where
  runOp _ _ returnButton = withRef returnButton $ \returnButtonPtr -> draw'' returnButtonPtr
{#fun Fl_DerivedReturn_Button_handle as returnButtonHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) ReturnButtonBase orig impl where
  runOp _ _ returnButton event = withRef returnButton (\p -> returnButtonHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_DerivedReturn_Button_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) ReturnButtonBase orig impl where
  runOp _ _ returnButton rectangle = withRef returnButton $ \returnButtonPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' returnButtonPtr x_pos y_pos w_pos h_pos
{# fun Fl_DerivedReturn_Button_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) ReturnButtonBase orig impl where
  runOp _ _ returnButton = withRef returnButton $ \returnButtonPtr -> show' returnButtonPtr
{# fun Fl_DerivedReturn_Button_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) ReturnButtonBase orig impl where
  runOp _ _ returnButton = withRef returnButton $ \returnButtonPtr -> hide' returnButtonPtr


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Button"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.ReturnButton"
-- @

-- $functions
-- @
-- destroy :: 'Ref' 'ReturnButtonBase' -> 'IO' ()
--
-- draw :: 'Ref' 'ReturnButtonBase' -> 'IO' ()
--
-- handle :: 'Ref' 'ReturnButtonBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'ReturnButtonBase' -> 'IO' ()
--
-- resize :: 'Ref' 'ReturnButtonBase' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'ReturnButtonBase' -> 'IO' ()
-- @
