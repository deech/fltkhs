{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.MenuButton
    (
     -- * Constructor
     menuButtonNew,
     MenuButtonType(..),
     menuButtonCustom
   , drawMenuButtonBase
   , handleMenuButtonBase
   , resizeMenuButtonBase
   , hideMenuButtonBase
   , showWidgetMenuButtonBase
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
import Graphics.UI.FLTK.LowLevel.Base.Widget

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
{# fun Fl_OverriddenMenu_Button_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
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
{# fun Fl_Menu_Button_New_WithLabel as menuButtonNewWithLabel' { `Int',`Int',`Int',`Int',`CString'} -> `Ptr ()' id #}
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
instance (impl ~ ( IO ())) => Op (Destroy ()) MenuButtonBase orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
    menuButtonDestroy' winPtr
    return nullPtr
{#fun Fl_Menu_Button_popup as menuButtonPopup' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref MenuItem)))) => Op (Popup ()) MenuButtonBase orig impl where
  runOp _ _ menu_bar = withRef menu_bar (\p -> menuButtonPopup' p >>= toMaybeRef)

{# fun Fl_Menu_Button_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawMenuButtonBase ::  Ref MenuButtonBase -> IO ()
drawMenuButtonBase menuButton = withRef menuButton $ \menuButtonPtr -> drawSuper' menuButtonPtr
{# fun Fl_Menu_Button_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleMenuButtonBase :: Ref MenuButtonBase -> Event ->  IO (Either UnknownEvent ())
handleMenuButtonBase menuButton event = withRef menuButton $ \menuButtonPtr -> handleSuper' menuButtonPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Menu_Button_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeMenuButtonBase :: Ref MenuButtonBase -> Rectangle -> IO ()
resizeMenuButtonBase menuButton rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef menuButton $ \menuButtonPtr -> resizeSuper' menuButtonPtr x_pos y_pos width height
{# fun Fl_Menu_Button_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideMenuButtonBase ::  Ref MenuButtonBase -> IO ()
hideMenuButtonBase menuButton = withRef menuButton $ \menuButtonPtr -> hideSuper' menuButtonPtr
{# fun Fl_Menu_Button_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetMenuButtonBase ::  Ref MenuButtonBase -> IO ()
showWidgetMenuButtonBase menuButton = withRef menuButton $ \menuButtonPtr -> showSuper' menuButtonPtr

{# fun Fl_Menu_Button_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) MenuButtonBase orig impl where
  runOp _ _ menuButton = withRef menuButton $ \menuButtonPtr -> draw'' menuButtonPtr
{#fun Fl_Menu_Button_handle as menuButtonHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) MenuButtonBase orig impl where
  runOp _ _ menuButton event = withRef menuButton (\p -> menuButtonHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Menu_Button_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) MenuButtonBase orig impl where
  runOp _ _ menuButton rectangle = withRef menuButton $ \menuButtonPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' menuButtonPtr x_pos y_pos w_pos h_pos
{# fun Fl_Menu_Button_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) MenuButtonBase orig impl where
  runOp _ _ menuButton = withRef menuButton $ \menuButtonPtr -> hide' menuButtonPtr
{# fun Fl_Menu_Button_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) MenuButtonBase orig impl where
  runOp _ _ menuButton = withRef menuButton $ \menuButtonPtr -> show' menuButtonPtr


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.MenuPrim"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.MenuButton"
-- @

-- $functions
-- @
-- destroy :: 'Ref' 'MenuButtonBase' -> 'IO' ()
--
-- draw :: 'Ref' 'MenuButtonBase' -> 'IO' ()
--
-- handle :: 'Ref' 'MenuButtonBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'MenuButtonBase' -> 'IO' ()
--
-- popup :: 'Ref' 'MenuButtonBase' -> 'IO' ('Maybe' ('Ref' 'MenuItem'))
--
-- resize :: 'Ref' 'MenuButtonBase' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'MenuButtonBase' -> 'IO' ()
-- @
