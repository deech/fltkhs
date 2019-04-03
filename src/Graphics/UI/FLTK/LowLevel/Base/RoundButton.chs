{-# LANGUAGE CPP, EmptyDataDecls, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.RoundButton
    (
     roundButtonNew,
     roundButtonCustom
  , drawRoundButtonBase
  , handleRoundButtonBase
  , resizeRoundButtonBase
  , hideRoundButtonBase
  , showWidgetRoundButtonBase
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
#include "Fl_Round_ButtonC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Base.Widget
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
{# fun Fl_OverriddenRound_Button_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenRound_Button_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
roundButtonCustom ::
       Rectangle                         -- ^ The bounds of this RoundButton
    -> Maybe T.Text                      -- ^ The RoundButton label
    -> Maybe (Ref RoundButton -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs RoundButton)      -- ^ Optional custom widget functions
    -> IO (Ref RoundButton)
roundButtonCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'
{# fun Fl_Round_Button_New as widgetNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Round_Button_New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString'} -> `Ptr ()' id #}
roundButtonNew :: Rectangle -> Maybe T.Text -> IO (Ref RoundButton)
roundButtonNew rectangle l' =
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Round_Button_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ IO ()) => Op (Destroy ()) RoundButtonBase orig impl where
  runOp _ _ button = swapRef button $
                    \buttonPtr ->
                     widgetDestroy' buttonPtr >>
                     return nullPtr
{# fun Fl_Round_Button_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawRoundButtonBase ::  Ref RoundButtonBase -> IO ()
drawRoundButtonBase roundButton = withRef roundButton $ \roundButtonPtr -> drawSuper' roundButtonPtr
{# fun Fl_Round_Button_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleRoundButtonBase :: Ref RoundButtonBase -> Event ->  IO (Either UnknownEvent ())
handleRoundButtonBase roundButton event = withRef roundButton $ \roundButtonPtr -> handleSuper' roundButtonPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Round_Button_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeRoundButtonBase :: Ref RoundButtonBase -> Rectangle -> IO ()
resizeRoundButtonBase roundButton rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef roundButton $ \roundButtonPtr -> resizeSuper' roundButtonPtr x_pos y_pos width height
{# fun Fl_Round_Button_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideRoundButtonBase ::  Ref RoundButtonBase -> IO ()
hideRoundButtonBase roundButton = withRef roundButton $ \roundButtonPtr -> hideSuper' roundButtonPtr
{# fun Fl_Round_Button_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetRoundButtonBase ::  Ref RoundButtonBase -> IO ()
showWidgetRoundButtonBase roundButton = withRef roundButton $ \roundButtonPtr -> showSuper' roundButtonPtr

{# fun Fl_DerivedRound_Button_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) RoundButtonBase orig impl where
  runOp _ _ roundButton = withRef roundButton $ \roundButtonPtr -> draw'' roundButtonPtr
{#fun Fl_DerivedRound_Button_handle as roundButtonHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) RoundButtonBase orig impl where
  runOp _ _ roundButton event = withRef roundButton (\p -> roundButtonHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_DerivedRound_Button_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) RoundButtonBase orig impl where
  runOp _ _ roundButton rectangle = withRef roundButton $ \roundButtonPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' roundButtonPtr x_pos y_pos w_pos h_pos
{# fun Fl_DerivedRound_Button_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) RoundButtonBase orig impl where
  runOp _ _ roundButton = withRef roundButton $ \roundButtonPtr -> show' roundButtonPtr
{# fun Fl_DerivedRound_Button_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) RoundButtonBase orig impl where
  runOp _ _ roundButton = withRef roundButton $ \roundButtonPtr -> hide' roundButtonPtr


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Button"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.RoundButton"
-- @

-- $functions
-- @
-- destroy :: 'Ref' 'RoundButtonBase' -> 'IO' ()
--
-- draw :: 'Ref' 'RoundButtonBase' -> 'IO' ()
--
-- handle :: 'Ref' 'RoundButtonBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'RoundButtonBase' -> 'IO' ()
--
-- resize :: 'Ref' 'RoundButtonBase' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'RoundButtonBase' -> 'IO' ()
-- @
