{-# LANGUAGE CPP, EmptyDataDecls, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.LightButton
    (
     lightButtonNew,
     lightButtonCustom
   , drawLightButtonBase
   , handleLightButtonBase
   , resizeLightButtonBase
   , hideLightButtonBase
   , showWidgetLightButtonBase
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
import Graphics.UI.FLTK.LowLevel.Base.Widget
{# fun Fl_OverriddenLight_Button_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
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
{# fun Fl_Light_Button_New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString'} -> `Ptr ()' id #}
lightButtonNew :: Rectangle -> Maybe T.Text -> IO (Ref LightButton)
lightButtonNew rectangle l' =
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Light_Button_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawLightButtonBase ::  Ref LightButtonBase -> IO ()
drawLightButtonBase lightButton = withRef lightButton $ \lightButtonPtr -> drawSuper' lightButtonPtr
{# fun Fl_Light_Button_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleLightButtonBase :: Ref LightButtonBase -> Event ->  IO (Either UnknownEvent ())
handleLightButtonBase lightButton event = withRef lightButton $ \lightButtonPtr -> handleSuper' lightButtonPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Light_Button_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeLightButtonBase :: Ref LightButtonBase -> Rectangle -> IO ()
resizeLightButtonBase lightButton rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef lightButton $ \lightButtonPtr -> resizeSuper' lightButtonPtr x_pos y_pos width height
{# fun Fl_Light_Button_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideLightButtonBase ::  Ref LightButtonBase -> IO ()
hideLightButtonBase lightButton = withRef lightButton $ \lightButtonPtr -> hideSuper' lightButtonPtr
{# fun Fl_Light_Button_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetLightButtonBase ::  Ref LightButtonBase -> IO ()
showWidgetLightButtonBase lightButton = withRef lightButton $ \lightButtonPtr -> showSuper' lightButtonPtr


{# fun Fl_Light_Button_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) LightButtonBase orig impl where
  runOp _ _ button = swapRef button $
                    \buttonPtr ->
                     widgetDestroy' buttonPtr >>
                     return nullPtr

{#fun Fl_DerivedLight_Button_handle as buttonHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ ((Event -> IO (Either UnknownEvent ())))) => Op (Handle ()) LightButtonBase orig impl where
  runOp _ _ button event = withRef button (\p -> buttonHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_DerivedLight_Button_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ ((Rectangle -> IO ()))) => Op (Resize ()) LightButtonBase orig impl where
  runOp _ _ button rectangle = withRef button $ \buttonPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' buttonPtr x_pos y_pos w_pos h_pos
{# fun Fl_DerivedLight_Button_show as buttonShow' {id `Ptr ()'} -> `()' supressWarningAboutRes #}
instance (impl ~ ((IO ()))) => Op (ShowWidget ()) LightButtonBase orig impl where
  runOp _ _ button = withRef button $ (\p -> buttonShow' p)
{# fun Fl_DerivedLight_Button_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (( IO ()))) => Op (Hide ()) LightButtonBase orig impl where
  runOp _ _ button = withRef button $ \buttonPtr -> hide' buttonPtr

{# fun Fl_Light_Button_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) LightButtonBase orig impl where
  runOp _ _ lightButton = withRef lightButton $ \lightButtonPtr -> draw'' lightButtonPtr


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Button"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.LightButton"
-- @

-- $functions
-- @
-- destroy :: 'Ref' 'LightButtonBase' -> 'IO' ()
--
-- draw :: 'Ref' 'LightButtonBase' -> 'IO' ()
--
-- handle :: 'Ref' 'LightButtonBase' -> ('Event' -> 'IO' ('Either' 'UnknownEvent' ()))
--
-- hide :: 'Ref' 'LightButtonBase' -> ( 'IO' ())
--
-- resize :: 'Ref' 'LightButtonBase' -> ('Rectangle' -> 'IO' ())
--
-- showWidget :: 'Ref' 'LightButtonBase' -> ('IO' ())
-- @
