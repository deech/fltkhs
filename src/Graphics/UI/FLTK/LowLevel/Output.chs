{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Output
    (
     FlOutputType(..),
     -- * Constructor
     outputNew
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Input
     --
     -- $Input
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Input_C.h"
#include "Fl_OutputC.h"
#include "Fl_Multiline_OutputC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
#c
enum FlOutputType {
  FlNormalOutput = FL_NORMAL_OUTPUT,
  FlMultilineOutput = FL_MULTILINE_OUTPUT
};
#endc
{#enum FlOutputType {}#}
{# fun Fl_Output_New as outputNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Output_New_WithLabel as outputNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text'} -> `Ptr ()' id #}
{# fun Fl_Multiline_Output_New as multilineOutputNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Multiline_Output_New_WithLabel as multilineOutputNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text'} -> `Ptr ()' id #}
outputNew :: Rectangle -> Maybe T.Text -> Maybe FlOutputType -> IO (Ref Output)
outputNew rectangle l' flOutputType =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
        constructor = case flOutputType of
                       Just FlNormalOutput -> maybe outputNew' (\l -> (\x y w h -> outputNewWithLabel' x y w h l)) l'
                       Just FlMultilineOutput -> maybe multilineOutputNew' (\l -> (\x y w h -> multilineOutputNewWithLabel' x y w h l)) l'
                       Nothing -> outputNew'
    in
    constructor x_pos y_pos width height >>= toRef

{# fun Fl_Widget_set_type as setType' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ (FlOutputType ->  IO ())) => Op (SetType ()) Output orig impl where
  runOp _ _ widget t = withRef widget $ \widgetPtr -> setType' widgetPtr (fromInteger $ toInteger $ fromEnum t)

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Input"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Output"
-- @

-- $Input
-- @
-- setType :: 'Ref' 'Output' -> 'FlOutputType' -> 'IO' ()
-- @
