{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.MenuButton
    (
     -- * Constructor
     menuButtonNew,
     MenuButtonType(..),
     menuButtonCustom
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
#include "Fl_Menu_ButtonC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Widget

#c
enum MenuButtonType {
  NormalMenuButton = NORMAL,
  Popup1MenuButton = POPUP1,
  Popup2MenuButton = POPUP2,
  Popup12MenuButton = POPUP12,
  Popup3MenuButton = POPUP3,
  Popup13MenuButton = POPUP13,
  Popup123MenuButton = POPUP123,
};
#endc
{#enum MenuButtonType {} deriving (Show, Eq) #}
{# fun Fl_OverriddenMenu_Button_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenMenu_Button_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
menuButtonCustom ::
       Rectangle                         -- ^ The bounds of this MenuButton
    -> Maybe T.Text                      -- ^ The MenuButton label
    -> Maybe (Ref MenuButton -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs MenuButton)      -- ^ Optional custom widget functions
    -> IO (Ref MenuButton)
menuButtonCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'


{# fun Fl_Menu_Button_New as menuButtonNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Menu_Button_New_WithLabel as menuButtonNewWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `T.Text'} -> `Ptr ()' id #}
menuButtonNew :: Rectangle -> Maybe T.Text -> IO (Ref MenuButton)
menuButtonNew rectangle l'=
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Menu_Button_Destroy as menuButtonDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Destroy ()) MenuButton orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
    menuButtonDestroy' winPtr
    return nullPtr
{#fun Fl_Menu_Button_popup as menuButtonPopup' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref MenuItem)))) => Op (Popup ()) MenuButton orig impl where
  runOp _ _ menu_bar = withRef menu_bar (\p -> menuButtonPopup' p >>= toMaybeRef)

{# fun Fl_Menu_Button_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) MenuButton orig impl where
  runOp _ _ menuButton = withRef menuButton $ \menuButtonPtr -> draw'' menuButtonPtr
{# fun Fl_Menu_Button_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) MenuButton orig impl where
  runOp _ _ menuButton = withRef menuButton $ \menuButtonPtr -> drawSuper' menuButtonPtr
{#fun Fl_Menu_Button_handle as menuButtonHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) MenuButton orig impl where
  runOp _ _ menuButton event = withRef menuButton (\p -> menuButtonHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Menu_Button_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) MenuButton orig impl where
  runOp _ _ menuButton event = withRef menuButton $ \menuButtonPtr -> handleSuper' menuButtonPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Menu_Button_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) MenuButton orig impl where
  runOp _ _ menuButton rectangle = withRef menuButton $ \menuButtonPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' menuButtonPtr x_pos y_pos w_pos h_pos
{# fun Fl_Menu_Button_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) MenuButton orig impl where
  runOp _ _ menuButton rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef menuButton $ \menuButtonPtr -> resizeSuper' menuButtonPtr x_pos y_pos width height
{# fun Fl_Menu_Button_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) MenuButton orig impl where
  runOp _ _ menuButton = withRef menuButton $ \menuButtonPtr -> hide' menuButtonPtr
{# fun Fl_Menu_Button_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) MenuButton orig impl where
  runOp _ _ menuButton = withRef menuButton $ \menuButtonPtr -> hideSuper' menuButtonPtr
{# fun Fl_Menu_Button_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) MenuButton orig impl where
  runOp _ _ menuButton = withRef menuButton $ \menuButtonPtr -> show' menuButtonPtr
{# fun Fl_Menu_Button_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) MenuButton orig impl where
  runOp _ _ menuButton = withRef menuButton $ \menuButtonPtr -> showSuper' menuButtonPtr

-- $functions
-- @
-- destroy :: 'Ref' 'MenuButton' -> 'IO' ()
--
-- draw :: 'Ref' 'MenuButton' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'MenuButton' -> 'IO' ()
--
-- handle :: 'Ref' 'MenuButton' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'MenuButton' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'MenuButton' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'MenuButton' -> 'IO' ()
--
-- popup :: 'Ref' 'MenuButton' -> 'IO' ('Maybe' ('Ref' 'MenuItem'))
--
-- resize :: 'Ref' 'MenuButton' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'MenuButton' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'MenuButton' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'MenuButton' -> 'IO' ()
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.MenuPrim"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.MenuButton"
-- @
