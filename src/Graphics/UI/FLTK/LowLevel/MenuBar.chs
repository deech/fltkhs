{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.MenuBar
    (
     menuBarNew,
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
#include "Fl_Menu_BarC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.MenuItem

{# fun Fl_Menu_Bar_New as widgetNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Menu_Bar_New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `T.Text'} -> `Ptr ()' id #}
menuBarNew :: Rectangle -> Maybe T.Text -> IO (Ref MenuBar)
menuBarNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> widgetNew' x_pos y_pos width height >>=
                             toRef
        Just l -> widgetNewWithLabel' x_pos y_pos width height l >>=
                             toRef

{# fun Fl_Menu_Bar_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) MenuBar orig impl where
  runOp _ _ menuBar = swapRef menuBar $
                          \menuBarPtr ->
                             widgetDestroy' menuBarPtr >>
                             return nullPtr
{#fun Fl_Menu_Bar_handle as menuBarHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO Int)) => Op (Handle ()) MenuBar orig impl where
  runOp _ _ menuBar event = withRef menuBar (\p -> menuBarHandle' p (fromIntegral . fromEnum $ event))


-- $functions
--
-- @
--
-- destroy :: 'Ref' 'MenuBar' -> 'IO' ()
--
-- handle :: 'Ref' 'MenuBar' -> 'Event' -> 'IO' 'Int'
--
-- @

-- $hierarchy
--
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.MenuPrim"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.MenuBar"
--
-- @
