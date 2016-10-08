{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.MenuButton
    (
     -- * Constructor
     menuButtonNew,
     MenuButtonType(..)
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
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Hierarchy

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

{# fun Fl_Menu_Button_New as menuButtonNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Menu_Button_New_WithLabel as menuButtonNewWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `T.Text'} -> `Ptr ()' id #}
menuButtonNew :: Rectangle -> Maybe T.Text -> IO (Ref MenuButton)
menuButtonNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> menuButtonNew' x_pos y_pos width height >>=
                             toRef
        Just l -> menuButtonNewWithLabel' x_pos y_pos width height l >>=
                               toRef

{# fun Fl_Menu_Button_Destroy as menuButtonDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Destroy ()) MenuButton orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
    menuButtonDestroy' winPtr
    return nullPtr
{#fun Fl_Menu_Button_handle as menuButtonHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO Int)) => Op (Handle ()) MenuButton orig impl where
  runOp _ _ menu_bar event = withRef menu_bar (\p -> menuButtonHandle' p (fromIntegral . fromEnum $ event))
{#fun Fl_Menu_Button_popup as menuButtonPopup' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref MenuItem)))) => Op (Popup ()) MenuButton orig impl where
  runOp _ _ menu_bar = withRef menu_bar (\p -> menuButtonPopup' p >>= toMaybeRef)

-- $functions
-- @
--
-- destroy :: 'Ref' 'MenuButton' -> 'IO' ()
--
-- handle :: 'Ref' 'MenuButton' -> 'Event' -> 'IO' 'Int'
--
-- popup :: 'Ref' 'MenuButton' -> 'IO' ('Maybe' ('Ref' 'MenuItem'))
--
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
