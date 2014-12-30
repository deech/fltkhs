{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Menu_Button
    (
     -- * Constructor
     menuButtonNew
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
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Menu_Button_New as menuButtonNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Menu_Button_New_WithLabel as menuButtonNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
menuButtonNew :: Rectangle -> Maybe String -> IO (Ref MenuButton)
menuButtonNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> menuButtonNew' x_pos y_pos width height >>=
                             toRef
        Just l -> menuButtonNewWithLabel' x_pos y_pos width height l >>=
                               toRef

{# fun Fl_Menu_Button_Destroy as menuButtonDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Destroy ()) MenuButton (IO ()) where
  runOp _ win = swapRef win $ \winPtr -> do
    menuButtonDestroy' winPtr
    return nullPtr
{#fun Fl_Menu_Button_handle as menuButtonHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance Op (Handle ()) MenuButton ( Event -> IO Int) where
  runOp _ menu_bar event = withRef menu_bar (\p -> menuButtonHandle' p (fromIntegral . fromEnum $ event))
{#fun Fl_Menu_Button_popup as menuButtonPopup' { id `Ptr ()' } -> `Ptr ()' id #}
instance Op (Popup ()) MenuButton (IO (Ref MenuItem)) where
  runOp _ menu_bar = withRef menu_bar (\p -> menuButtonPopup' p >>= toRef)
