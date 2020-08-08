{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables  #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.Choice
    (
     -- * Constructor
     choiceNew,
     choiceCustom
   , drawChoiceBase
   , handleChoiceBase
   , resizeChoiceBase
   , hideChoiceBase
   , showWidgetChoiceBase
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Choice
     --
     -- $functions
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_ChoiceC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Base.MenuItem
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Base.Widget

{# fun Fl_OverriddenChoice_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenChoice_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
choiceCustom ::
       Rectangle                         -- ^ The bounds of this Choice
    -> Maybe T.Text                      -- ^ The Choice label
    -> Maybe (Ref Choice -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs Choice)      -- ^ Optional custom widget functions
    -> IO (Ref Choice)
choiceCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'


{# fun Fl_Choice_New as choiceNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Choice_New_WithLabel as choiceNewWithLabel' { `Int',`Int',`Int',`Int', `CString'} -> `Ptr ()' id #}
choiceNew :: Rectangle -> Maybe T.Text -> IO (Ref Choice)
choiceNew rectangle l'=
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'
{# fun Fl_Choice_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) ChoiceBase orig impl where
  runOp _ _ menu_ = swapRef menu_ $
                          \menu_Ptr ->
                             widgetDestroy' menu_Ptr >>
                             return nullPtr
{# fun Fl_Choice_value as value' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (AtIndex))) => Op (GetValue ()) ChoiceBase orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> value' menu_Ptr >>= return . AtIndex
{# fun Fl_Choice_set_value_with_item as valueWithItem' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
{# fun Fl_Choice_set_value_with_index as valueWithIndex' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (MenuItemReference -> IO (Either NoChange ()))) => Op (SetValue ()) ChoiceBase orig impl where
  runOp _ _ menu_ menu_item_reference =
    withRef menu_ $ \menu_Ptr ->
        case menu_item_reference of
          (MenuItemByIndex (AtIndex index')) -> valueWithIndex' menu_Ptr index' >>= return . successOrNoChange
          (MenuItemByPointer (MenuItemPointer menu_item)) ->
              withRef menu_item $ \menu_itemPtr ->
                  valueWithItem' menu_Ptr menu_itemPtr >>= return . successOrNoChange

{# fun Fl_Choice_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawChoiceBase ::  Ref ChoiceBase -> IO ()
drawChoiceBase choice = withRef choice $ \choicePtr -> drawSuper' choicePtr
{# fun Fl_Choice_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleChoiceBase :: Ref ChoiceBase -> Event ->  IO (Either UnknownEvent ())
handleChoiceBase choice event = withRef choice $ \choicePtr -> handleSuper' choicePtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Choice_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeChoiceBase :: Ref ChoiceBase -> Rectangle -> IO ()
resizeChoiceBase choice rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef choice $ \choicePtr -> resizeSuper' choicePtr x_pos y_pos width height
{# fun Fl_Choice_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideChoiceBase ::  Ref ChoiceBase -> IO ()
hideChoiceBase choice = withRef choice $ \choicePtr -> hideSuper' choicePtr
{# fun Fl_Choice_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetChoiceBase ::  Ref ChoiceBase -> IO ()
showWidgetChoiceBase choice = withRef choice $ \choicePtr -> showSuper' choicePtr


{#fun Fl_Choice_handle as choiceHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) ChoiceBase orig impl where
  runOp _ _ choice event = withRef choice (\p -> choiceHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Choice_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) ChoiceBase orig impl where
  runOp _ _ choice = withRef choice $ \choicePtr -> draw'' choicePtr
{# fun Fl_Choice_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) ChoiceBase orig impl where
  runOp _ _ choice rectangle = withRef choice $ \choicePtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' choicePtr x_pos y_pos w_pos h_pos
{# fun Fl_Choice_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) ChoiceBase orig impl where
  runOp _ _ choice = withRef choice $ \choicePtr -> hide' choicePtr
{# fun Fl_Choice_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) ChoiceBase orig impl where
  runOp _ _ choice = withRef choice $ \choicePtr -> show' choicePtr


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.MenuPrim"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Choice"
-- @

-- $functions
-- @
-- destroy :: 'Ref' 'ChoiceBase' -> 'IO' ()
--
-- draw :: 'Ref' 'ChoiceBase' -> 'IO' ()
--
-- getValue :: 'Ref' 'ChoiceBase' -> 'IO' ('AtIndex')
--
-- handle :: 'Ref' 'ChoiceBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'ChoiceBase' -> 'IO' ()
--
-- resize :: 'Ref' 'ChoiceBase' -> 'Rectangle' -> 'IO' ()
--
-- setValue :: 'Ref' 'ChoiceBase' -> 'MenuItemReference' -> 'IO' ('Either' 'NoChange' ())
--
-- showWidget :: 'Ref' 'ChoiceBase' -> 'IO' ()
-- @
