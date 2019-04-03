{-# LANGUAGE CPP, EmptyDataDecls, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.CheckButton
    (
     checkButtonNew,
     checkButtonCustom
   , drawCheckButtonBase
   , handleCheckButtonBase
   , resizeCheckButtonBase
   , hideCheckButtonBase
   , showWidgetCheckButtonBase
     -- * Hierarchy
     --
     -- $hierarchy
     -- * CheckButton
     --
     -- $functions
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
import Graphics.UI.FLTK.LowLevel.Base.Widget

{# fun Fl_OverriddenCheck_Button_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
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
{# fun Fl_Check_Button_New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int',`CString'} -> `Ptr ()' id #}
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
instance (impl ~ ( IO ())) => Op (Destroy ()) CheckButtonBase orig impl where
  runOp _ _ button = swapRef button $
                    \buttonPtr ->
                     widgetDestroy' buttonPtr >>
                     return nullPtr
{# fun Fl_Check_Button_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) CheckButtonBase orig impl where
  runOp _ _ checkButton = withRef checkButton $ \checkButtonPtr -> draw'' checkButtonPtr

{#fun Fl_DerivedCheck_Button_handle as checkButtonHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) CheckButtonBase orig impl where
  runOp _ _ checkButton event = withRef checkButton (\p -> checkButtonHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_DerivedCheck_Button_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) CheckButtonBase orig impl where
  runOp _ _ checkButton rectangle = withRef checkButton $ \checkButtonPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' checkButtonPtr x_pos y_pos w_pos h_pos
{# fun Fl_DerivedCheck_Button_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) CheckButtonBase orig impl where
  runOp _ _ checkButton = withRef checkButton $ \checkButtonPtr -> hide' checkButtonPtr
{# fun Fl_DerivedCheck_Button_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) CheckButtonBase orig impl where
  runOp _ _ checkButton = withRef checkButton $ \checkButtonPtr -> show' checkButtonPtr


{# fun Fl_Check_Button_draw as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawCheckButtonBase ::  Ref CheckButtonBase -> IO ()
drawCheckButtonBase adjuster = withRef adjuster $ \adjusterPtr -> drawSuper' adjusterPtr
{# fun Fl_Check_Button_handle as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleCheckButtonBase :: Ref CheckButtonBase -> Event ->  IO (Either UnknownEvent ())
handleCheckButtonBase adjuster event = withRef adjuster $ \adjusterPtr -> handleSuper' adjusterPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Check_Button_resize as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeCheckButtonBase :: Ref CheckButtonBase -> Rectangle -> IO ()
resizeCheckButtonBase adjuster rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef adjuster $ \adjusterPtr -> resizeSuper' adjusterPtr x_pos y_pos width height
{# fun Fl_Check_Button_hide as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideCheckButtonBase ::  Ref CheckButtonBase -> IO ()
hideCheckButtonBase adjuster = withRef adjuster $ \adjusterPtr -> hideSuper' adjusterPtr
{# fun Fl_Check_Button_show as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetCheckButtonBase ::  Ref CheckButtonBase -> IO ()
showWidgetCheckButtonBase adjuster = withRef adjuster $ \adjusterPtr -> showSuper' adjusterPtr


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Button"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.LightButton"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.CheckButton"
-- @

-- $functions
-- @
-- destroy :: 'Ref' 'CheckButtonBase' -> 'IO' ()
--
-- draw :: 'Ref' 'CheckButtonBase' -> 'IO' ()
--
-- handle :: 'Ref' 'CheckButtonBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'CheckButtonBase' -> 'IO' ()
--
-- resize :: 'Ref' 'CheckButtonBase' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'CheckButtonBase' -> 'IO' ()
-- @
