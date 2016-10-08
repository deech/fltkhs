{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Scrolled
    (
     -- * Constructor
     scrolledNew,
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
#include "Fl_ScrollC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations

{# fun Fl_Scroll_New as scrollNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Scroll_New_WithLabel as scrollNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text'} -> `Ptr ()' id #}
scrolledNew :: Rectangle -> Maybe T.Text -> IO (Ref Scrolled)
scrolledNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> scrollNew' x_pos y_pos width height >>=
                             toRef
        Just l -> scrollNewWithLabel' x_pos y_pos width height l >>=
                               toRef
{# fun Fl_Scroll_set_scrollbar_size as setScrollbarSize' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetScrollbarSize ()) Scrolled orig impl where
   runOp _ _ widget size = withRef widget $ \widgetPtr -> setScrollbarSize' widgetPtr size
{# fun Fl_Scroll_get_scrollbar_size as getScrollbarSize' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetScrollbarSize ()) Scrolled orig impl where
   runOp _ _ widget = withRef widget $ \widgetPtr -> getScrollbarSize' widgetPtr
{# fun Fl_Scroll_clear as clear' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Clear ()) Scrolled orig impl where
   runOp _ _ widget = withRef widget $ \widgetPtr -> clear' widgetPtr
{# fun Fl_Scroll_scroll_to as scrollTo' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (Position ->  IO ())) => Op (ScrollTo ()) Scrolled orig impl where
   runOp _ _ widget (Position (X x_pos') (Y y_pos')) = withRef widget $ \widgetPtr -> scrollTo' widgetPtr x_pos' y_pos'
{# fun Fl_Scroll_yposition as yposition' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (Yposition ()) Scrolled orig impl where
   runOp _ _ widget = withRef widget $ \widgetPtr -> yposition' widgetPtr
{# fun Fl_Scroll_xposition as xposition' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (Xposition ()) Scrolled orig impl where
   runOp _ _ widget = withRef widget $ \widgetPtr -> xposition' widgetPtr
{# fun Fl_Scroll_type as type' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ ( IO (ScrollbarMode))) => Op (GetType_ ()) Scrolled orig impl where
   runOp _ _ widget = withRef widget $ \widgetPtr -> type' widgetPtr >>= return . cToEnum
{# fun Fl_Scroll_set_type as setType' { id `Ptr ()',`Word8' } -> `()' #}
instance (impl ~ (ScrollbarMode ->  IO ())) => Op (SetType ()) Scrolled orig impl where
   runOp _ _ widget t = withRef widget $ \widgetPtr -> setType' widgetPtr (cFromEnum t)
{# fun Fl_Scroll_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
instance (impl ~ (Rectangle ->  IO ())) => Op (Resize ()) Scrolled orig impl where
   runOp _ _ widget rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in withRef widget $ \scrollPtr -> resize' scrollPtr x_pos' y_pos' width' height'
{# fun Fl_Scroll_handle as handle' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Int))) => Op (Handle ()) Scrolled orig impl where
   runOp _ _ widget event = withRef widget $ \scrollPtr -> handle' scrollPtr (fromIntegral (fromEnum event))

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Scrolled"
-- @


-- $functions
-- @
-- clear :: 'Ref' 'Scrolled' -> 'IO' ()
--
-- getScrollbarSize :: 'Ref' 'Scrolled' -> 'IO' 'Int'
--
-- getType :: 'Ref' 'Scrolled' -> 'IO' 'ScrollbarMode'
--
-- handle :: 'Ref' 'Scrolled' -> 'Int' -> 'IO' 'Int'
--
-- resize :: 'Ref' 'Scrolled' -> 'Rectangle' -> 'IO' ()
--
-- scrollTo :: 'Ref' 'Scrolled' -> 'Position' -> 'IO' ()
--
-- setScrollbarSize :: 'Ref' 'Scrolled' -> 'Int' -> 'IO' ()
--
-- setType :: 'Ref' 'Scrolled' -> 'ScrollbarMode' -> 'IO' ()
--
-- xposition :: 'Ref' 'Scrolled' -> 'IO' 'Int'
--
-- yposition :: 'Ref' 'Scrolled' -> 'IO' 'Int'
-- @
