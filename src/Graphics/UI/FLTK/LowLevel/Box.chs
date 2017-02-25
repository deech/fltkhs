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

import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Widget

{# fun Fl_Box_New as boxNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Box_New_WithLabel as boxNewWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `T.Text'} -> `Ptr ()' id #}
{# fun Fl_OverriddenBox_New_WithLabel as overriddenBoxNewWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenBox_New as overriddenBoxNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_Box_New_WithBoxtype as boxNewWithBoxtype' {cFromEnum `Boxtype',  `Int',`Int',`Int',`Int',unsafeToCString `T.Text'} -> `Ptr ()' id #}
{# fun Fl_OverriddenBox_New_WithBoxtype as overriddenBoxNewWithBoxtype' {cFromEnum `Boxtype',  `Int',`Int',`Int',`Int',unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}

boxCustom :: Rectangle                     -- ^ The bounds of this box
          -> Maybe T.Text                  -- ^ Optional label
          -> Maybe (Ref Box -> IO ())      -- ^ Optional custom box drawing function
          -> Maybe (CustomWidgetFuncs Box) -- ^ Optional widget overrides
          -> IO (Ref Box)
boxCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenBoxNew'
    overriddenBoxNewWithLabel'

boxCustomWithBoxtype :: Boxtype -> Rectangle -> T.Text -> Maybe (Ref Box -> IO ()) -> Maybe (CustomWidgetFuncs Box) -> IO (Ref Box)
boxCustomWithBoxtype boxtype' rectangle' l' draw' funcs' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle'
    in case funcs' of
        Just fs -> do
          ptr <- customWidgetFunctionStruct draw' fs
          overriddenBoxNewWithBoxtype' boxtype' x_pos y_pos width height l' (castPtr ptr) >>= toRef
        Nothing ->
          boxNewWithBoxtype' boxtype' x_pos y_pos width height l' >>= toRef


boxNew :: Rectangle -> Maybe T.Text -> IO (Ref Box)
boxNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> boxNew' x_pos y_pos width height >>=
                             toRef
        Just l -> boxNewWithLabel' x_pos y_pos width height l >>=
                             toRef

boxNewWithBoxtype :: Boxtype -> Rectangle -> T.Text -> IO (Ref Box)
boxNewWithBoxtype boxtype' rectangle' l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle'
    in
    boxNewWithBoxtype' boxtype' x_pos y_pos width height l' >>=
                             toRef

{#fun Fl_Box_handle as boxHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Box orig impl where
  runOp _ _ box event = withRef box (\p -> boxHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent


-- $functions
-- @
-- handle :: 'Ref' 'Box' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Box"
-- @
