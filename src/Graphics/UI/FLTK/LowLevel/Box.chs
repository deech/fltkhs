{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Box
    (
     -- * Constructor
     boxNew,
     boxNewWithBoxtype,
     boxCustom,
     boxCustomWithBoxtype
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
#include "Fl_BoxC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Widget

{# fun Fl_Box_New as boxNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Box_New_WithLabel as boxNewWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `String'} -> `Ptr ()' id #}
{# fun Fl_OverriddenBox_New_WithLabel as overriddenBoxNewWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `String', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenBox_New as overriddenBoxNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_Box_New_WithBoxtype as boxNewWithBoxtype' {cFromEnum `Boxtype',  `Int',`Int',`Int',`Int',unsafeToCString `String'} -> `Ptr ()' id #}
{# fun Fl_OverriddenBox_New_WithBoxtype as overriddenBoxNewWithBoxtype' {cFromEnum `Boxtype',  `Int',`Int',`Int',`Int',unsafeToCString `String', id `Ptr ()'} -> `Ptr ()' id #}
boxCustom :: Rectangle ->                       -- ^ The bounds of this box
             Maybe String ->                    -- ^ Optional label
             Maybe (Ref Box -> IO ()) ->        -- ^ Optional custom box drawing function
             Maybe (CustomWidgetFuncs Box) ->   -- ^ Optional widget overrides
             IO (Ref Box)
boxCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    boxNew'
    boxNewWithLabel'
    overriddenBoxNew'
    overriddenBoxNewWithLabel'

boxCustomWithBoxtype :: Boxtype -> Rectangle -> String -> Maybe (Ref Box -> IO ()) -> Maybe (CustomWidgetFuncs Box) -> IO (Ref Box)
boxCustomWithBoxtype boxtype' rectangle' l' draw' funcs' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle'
    in case funcs' of
        Just fs -> do
          ptr <- customWidgetFunctionStruct draw' fs
          overriddenBoxNewWithBoxtype' boxtype' x_pos y_pos width height l' (castPtr ptr) >>= toRef
        Nothing ->
          boxNewWithBoxtype' boxtype' x_pos y_pos width height l' >>= toRef


boxNew :: Rectangle -> Maybe String -> IO (Ref Box)
boxNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> boxNew' x_pos y_pos width height >>=
                             toRef
        Just l -> boxNewWithLabel' x_pos y_pos width height l >>=
                             toRef

boxNewWithBoxtype :: Boxtype -> Rectangle -> String -> IO (Ref Box)
boxNewWithBoxtype boxtype' rectangle' l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle'
    in
    boxNewWithBoxtype' boxtype' x_pos y_pos width height l' >>=
                             toRef

{#fun Fl_Box_handle as boxHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO Int)) => Op (Handle ()) Box orig impl where
  runOp _ _ box event = withRef box (\p -> boxHandle' p (fromIntegral . fromEnum $ event))


-- $functions
-- @
-- handle :: 'Ref' 'Box' -> 'Event' -> 'IO' 'Int'
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Box"
-- @
