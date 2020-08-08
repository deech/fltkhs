{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.ColorChooser
    (
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Widget Functions
     --
     -- $functions
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Color_ChooserC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Color_Chooser_mode as mode' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (ColorChooserMode))) => Op (GetMode ()) ColorChooser orig impl where
  runOp _ _ color_chooser = withRef color_chooser $ \color_chooserPtr -> mode' color_chooserPtr >>= return . toEnum
{# fun Fl_Color_Chooser_set_mode as setMode' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (ColorChooserMode ->  IO ())) => Op (SetMode ()) ColorChooser orig impl where
  runOp _ _ color_chooser mode = withRef color_chooser $ \color_chooserPtr -> setMode' color_chooserPtr (fromEnum mode)
{# fun Fl_Color_Chooser_hue as hue' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Either OutOfRange Between0And6))) => Op (GetHue ()) ColorChooser orig impl where
  runOp _ _ color_chooser = withRef color_chooser $ \color_chooserPtr -> do
    h'' <- hue' color_chooserPtr
    if ((h'' < 0.0) || (h'' >= 6.0))
     then return (Left OutOfRange)
     else return (Right (Between0And6 h''))
{# fun Fl_Color_Chooser_saturation as saturation' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Either OutOfRange Between0And1))) => Op (GetSaturation ()) ColorChooser orig impl where
  runOp _ _ color_chooser = withRef color_chooser $ \color_chooserPtr -> do
    s'' <- saturation' color_chooserPtr
    if ((s'' < 0.0) || (s'' > 1.0))
     then return (Left OutOfRange)
     else return (Right (Between0And1 s''))
{# fun Fl_Color_Chooser_value as value' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Either OutOfRange Between0And1))) => Op (GetValue ()) ColorChooser orig impl where
  runOp _ _ color_chooser = withRef color_chooser $ \color_chooserPtr -> do
    v'' <- value' color_chooserPtr
    if ((v'' < 0.0) || (v'' > 1.0))
     then return (Left OutOfRange)
     else return (Right (Between0And1 v''))
{# fun Fl_Color_Chooser_r as r' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Either OutOfRange Between0And1))) => Op (GetR ()) ColorChooser orig impl where
  runOp _ _ color_chooser = withRef color_chooser $ \color_chooserPtr -> do
    r'' <- r' color_chooserPtr
    if ((r'' < 0.0) || (r'' > 1.0))
     then return (Left OutOfRange)
     else return (Right (Between0And1 r''))
{# fun Fl_Color_Chooser_g as g' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Either OutOfRange Between0And1))) => Op (GetG ()) ColorChooser orig impl where
  runOp _ _ color_chooser = withRef color_chooser $ \color_chooserPtr -> do
    g'' <- g' color_chooserPtr
    if ((g'' < 0.0) || (g'' > 1.0))
     then return (Left OutOfRange)
     else return (Right (Between0And1 g''))
{# fun Fl_Color_Chooser_b as b' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Either OutOfRange Between0And1))) => Op (GetB ()) ColorChooser orig impl where
  runOp _ _ color_chooser = withRef color_chooser $ \color_chooserPtr -> do
    b'' <- b' color_chooserPtr
    if ((b'' < 0.0) || (b'' > 1.0))
     then return (Left OutOfRange)
     else return (Right (Between0And1 b''))
{# fun Fl_Color_Chooser_hsv as hsv' { id `Ptr ()',`Double', `Double', `Double'} -> `Int' #}
instance (impl ~ ((Between0And6, Between0And1, Between0And1) ->  IO (Either NoChange ()))) => Op (SetHsv ()) ColorChooser orig impl where
  runOp _ _ color_chooser (Between0And6 h'', Between0And1 s'', Between0And1 v'') =
    withRef color_chooser $ \color_chooserPtr -> do
      ret <- hsv' color_chooserPtr h'' s'' v''
      if (ret == 0) then return (Left NoChange) else return (Right ())
{# fun Fl_Color_Chooser_rgb as rgb' { id `Ptr ()',`Double', `Double', `Double'} -> `Int' #}
instance (impl ~ ((Between0And1, Between0And1, Between0And1) ->  IO (Either NoChange ()))) => Op (SetRgb ()) ColorChooser orig impl where
  runOp _ _ color_chooser (Between0And1 r'', Between0And1 g'', Between0And1 b'') =
    withRef color_chooser $ \color_chooserPtr -> do
      ret <- rgb' color_chooserPtr r'' g'' b''
      if (ret == 0) then return (Left NoChange) else return (Right ())
{# fun Fl_Color_Chooser_draw as draw' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) ColorChooser orig impl where
  runOp _ _ colorChooser = withRef colorChooser $ \colorChooserPtr -> draw' colorChooserPtr
{#fun Fl_Color_Chooser_handle as colorChooserHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) ColorChooser orig impl where
  runOp _ _ colorChooser event = withRef colorChooser (\p -> colorChooserHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Color_Chooser_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) ColorChooser orig impl where
  runOp _ _ colorChooser = withRef colorChooser $ \colorChooserPtr -> hide' colorChooserPtr
{# fun Fl_Color_Chooser_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) ColorChooser orig impl where
  runOp _ _ colorChooser = withRef colorChooser $ \colorChooserPtr -> show' colorChooserPtr
{# fun Fl_Color_Chooser_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) ColorChooser orig impl where
  runOp _ _ colorChooser rectangle = withRef colorChooser $ \colorChooserPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' colorChooserPtr x_pos y_pos w_pos h_pos

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.ColorChooser"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.ColorChooser"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'ColorChooser' -> 'IO' ()
--
-- getB :: 'Ref' 'ColorChooser' -> 'IO' ('Either' 'OutOfRange' 'Between0And1')
--
-- getG :: 'Ref' 'ColorChooser' -> 'IO' ('Either' 'OutOfRange' 'Between0And1')
--
-- getHue :: 'Ref' 'ColorChooser' -> 'IO' ('Either' 'OutOfRange' 'Between0And6')
--
-- getMode :: 'Ref' 'ColorChooser' -> 'IO' ('ColorChooserMode')
--
-- getR :: 'Ref' 'ColorChooser' -> 'IO' ('Either' 'OutOfRange' 'Between0And1')
--
-- getSaturation :: 'Ref' 'ColorChooser' -> 'IO' ('Either' 'OutOfRange' 'Between0And1')
--
-- getValue :: 'Ref' 'ColorChooser' -> 'IO' ('Either' 'OutOfRange' 'Between0And1')
--
-- handle :: 'Ref' 'ColorChooser' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'ColorChooser' -> 'IO' ()
--
-- resize :: 'Ref' 'ColorChooser' -> 'Rectangle' -> 'IO' ()
--
-- setHsv :: 'Ref' 'ColorChooser' -> ('Between0And6', 'Between0And1', 'Between0And1') -> 'IO' ('Either' 'NoChange' ())
--
-- setMode :: 'Ref' 'ColorChooser' -> 'ColorChooserMode' -> 'IO' ()
--
-- setRgb :: 'Ref' 'ColorChooser' -> ('Between0And1', 'Between0And1', 'Between0And1') -> 'IO' ('Either' 'NoChange' ())
--
-- showWidget :: 'Ref' 'ColorChooser' -> 'IO' ()
-- @
