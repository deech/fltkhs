{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables  #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Choice
    (
     -- * Constructor
     choiceNew
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Choice
     --
     -- $Choicefunctions
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_ChoiceC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.MenuItem
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Choice_New as choiceNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Choice_New_WithLabel as choiceNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `String'} -> `Ptr ()' id #}
choiceNew :: Rectangle -> Maybe String -> IO (Ref Choice)
choiceNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> choiceNew' x_pos y_pos width height >>=
                             toRef
        Just l -> choiceNewWithLabel' x_pos y_pos width height l >>=
                               toRef
{# fun Fl_Choice_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) Choice orig impl where
  runOp _ _ menu_ = swapRef menu_ $
                          \menu_Ptr ->
                             widgetDestroy' menu_Ptr >>
                             return nullPtr
{# fun Fl_Choice_value as value' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (MenuItemIndex))) => Op (GetValue ()) Choice orig impl where
  runOp _ _ menu_ = withRef menu_ $ \menu_Ptr -> value' menu_Ptr >>= return . MenuItemIndex
{# fun Fl_Choice_set_value_with_item as valueWithItem' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
{# fun Fl_Choice_set_value_with_index as valueWithIndex' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (MenuItemReference -> IO (Int))) => Op (SetValue ()) Choice orig impl where
  runOp _ _ menu_ menu_item_reference =
    withRef menu_ $ \menu_Ptr ->
        case menu_item_reference of
          (MenuItemByIndex (MenuItemIndex index')) -> valueWithIndex' menu_Ptr index'
          (MenuItemByPointer (MenuItemPointer menu_item)) ->
              withRef menu_item $ \menu_itemPtr ->
                  valueWithItem' menu_Ptr menu_itemPtr
{#fun Fl_Choice_handle as menu_Handle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO Int)) => Op (Handle ()) Choice orig impl where
  runOp _ _ menu_ event = withRef menu_ (\p -> menu_Handle' p (fromIntegral . fromEnum $ event))

-- $Choicefunctions
--
-- @
-- destroy :: 'Ref' 'Choice' -> 'IO' ()
--
-- getValue :: 'Ref' 'Choice' -> 'IO' ('MenuItemIndex')
--
-- handle :: 'Ref' 'Choice' -> 'Event' -> 'IO' 'Int'
--
-- setValue :: 'Ref' 'Choice' -> 'MenuItemReference' -> 'IO' ('Int')
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.MenuPrim"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Choice"
-- @