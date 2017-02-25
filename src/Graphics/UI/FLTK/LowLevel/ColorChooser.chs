{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.ColorChooser
    (
     -- * Constructor
     colorChooserNew,
     rgb2Hsv,
     hsv2Rgb,
     flcColorChooser
     -- * Hierarchy
     --
     -- $hierarchy

     -- *  Functions
     --
     -- $functions
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Color_ChooserC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)

import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Data.List

{# fun Fl_Color_Chooser_New as colorchooserNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Color_Chooser_New_WithLabel as colorchooserNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text'} -> `Ptr ()' id #}
colorChooserNew :: Rectangle -> Maybe T.Text -> IO (Ref ColorChooser)
colorChooserNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> colorchooserNew' x_pos y_pos width height >>=
                             toRef
        Just l -> colorchooserNewWithLabel' x_pos y_pos width height l >>=
                               toRef

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

{# fun Fl_Color_Chooser_hsv2rgb as hsv2rgb' {`Double',`Double',`Double', id `Ptr CDouble', id `Ptr CDouble',id `Ptr CDouble' } -> `()' #}
hsv2Rgb :: (Between0And6, Between0And1, Between0And1) ->  IO (Maybe (Between0And1, Between0And1, Between0And1))
hsv2Rgb (Between0And6 h'', Between0And1 s'', Between0And1 v'') =
  alloca $ \rPtr ->
  alloca $ \gPtr ->
  alloca $ \bPtr -> do
    hsv2rgb' h'' s'' v'' rPtr gPtr bPtr
    let (nullPtrs, nonNullPtrs) = partition ((==) nullPtr) [rPtr, gPtr, bPtr]
    if (not (null nullPtrs))
     then mapM_ free nonNullPtrs >> return Nothing
     else do
       r'' <- peek rPtr
       g'' <- peek gPtr
       b'' <- peek bPtr
       return (Just (Between0And1 (realToFrac r''),Between0And1 (realToFrac g''),Between0And1 (realToFrac b'')))

{# fun Fl_Color_Chooser_rgb2hsv as rgb2hsv' {`Double',`Double',`Double', id `Ptr CDouble', id `Ptr CDouble',id `Ptr CDouble' } -> `()' #}
rgb2Hsv :: (Between0And1, Between0And1, Between0And1) ->  IO (Maybe (Between0And6, Between0And1, Between0And1))
rgb2Hsv (Between0And1 h'', Between0And1 s'', Between0And1 v'') =
  alloca $ \hPtr ->
  alloca $ \sPtr ->
  alloca $ \vPtr -> do
    rgb2hsv' h'' s'' v'' hPtr sPtr vPtr
    let (nullPtrs, nonNullPtrs) = partition ((==) nullPtr) [hPtr, sPtr, vPtr]
    if (not (null nullPtrs))
     then mapM_ free nonNullPtrs >> return Nothing
     else do
       h''' <- peek hPtr
       s''' <- peek sPtr
       v''' <- peek vPtr
       return (Just (Between0And6 (realToFrac h'''),Between0And1 (realToFrac s'''),Between0And1 (realToFrac v''')))

{# fun flc_color_chooser_with_m as flc_color_chooser_with_m' {unsafeToCString `T.Text' , id `Ptr CDouble', id `Ptr CDouble', id `Ptr CDouble', `Int' } -> `Int' #}
{# fun flc_color_chooser_with_uchar_m as flc_color_chooser_with_uchar_m' {unsafeToCString `T.Text' , id `Ptr CUChar', id `Ptr CUChar', id `Ptr CUChar', `Int' } -> `Int' #}
flcColorChooser :: T.Text ->
                   ColorChooserRGB ->
                   Maybe ColorChooserMode ->
                   IO (Maybe ColorChooserRGB)
flcColorChooser name (Decimals (Between0And1 r'', Between0And1 g'', Between0And1 b'')) mode =
  alloca $ \r''Ptr ->
  alloca $ \g''Ptr ->
  alloca $ \b''Ptr -> do
    poke r''Ptr $ realToFrac r''
    poke g''Ptr $ realToFrac g''
    poke b''Ptr $ realToFrac b''
    ret <- flc_color_chooser_with_m' name r''Ptr g''Ptr b''Ptr (maybe (-1) fromEnum mode)
    if (ret == 0)
     then return Nothing
     else do
      newR <- peek r''Ptr
      newG <- peek g''Ptr
      newB <- peek b''Ptr
      return (Just (Decimals
                     (Between0And1 (realToFrac newR),
                      Between0And1 (realToFrac newG),
                      Between0And1 (realToFrac newB))))
flcColorChooser name (Words (r,g,b)) mode =
  alloca $ \r''Ptr ->
  alloca $ \g''Ptr ->
  alloca $ \b''Ptr -> do
    poke r''Ptr (fromIntegral r)
    poke g''Ptr (fromIntegral g)
    poke b''Ptr (fromIntegral b)
    ret <- flc_color_chooser_with_uchar_m' name r''Ptr g''Ptr b''Ptr (maybe (-1) fromEnum mode)
    if (ret == 0)
     then return Nothing
     else do
      newR <- peek r''Ptr
      newG <- peek g''Ptr
      newB <- peek b''Ptr
      return (Just (Words ((fromIntegral newR), (fromIntegral newG), (fromIntegral newB))))

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.ColorChooser"
-- @

-- $functions
-- @
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
-- setHsv :: 'Ref' 'ColorChooser' -> ('Between0And6', 'Between0And1', 'Between0And1') -> 'IO' ('Either' 'NoChange' ())
--
-- setMode :: 'Ref' 'ColorChooser' -> 'ColorChooserMode' -> 'IO' ()
--
-- setRgb :: 'Ref' 'ColorChooser' -> ('Between0And1', 'Between0And1', 'Between0And1') -> 'IO' ('Either' 'NoChange' ())
-- @
--
