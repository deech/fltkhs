{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.ColorChooser
    (
     -- * Constructor
     colorChooserNew,
     colorChooserCustom,
     rgb2Hsv,
     hsv2Rgb,
     flcColorChooser,
     CustomColorChooserFuncs(..)
    , getModeColorChooserBase
    , setModeColorChooserBase
    , getHueColorChooserBase
    , getSaturationColorChooserBase
    , getValueColorChooserBase
    , getRColorChooserBase
    , getGColorChooserBase
    , getBColorChooserBase
    , setHsvColorChooserBase
    , setRgbColorChooserBase
    , drawColorChooserBase
    , handleColorChooserBase
    , resizeColorChooserBase
    , hideColorChooserBase
    , showWidgetColorChooserBase
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
import Graphics.UI.FLTK.LowLevel.Base.Widget

import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Data.List
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Control.Applicative

data CustomColorChooserFuncs a =
  CustomColorChooserFuncs
  {
    getModeCustom :: Ref a -> IO ColorChooserMode
  , setModeCustom :: Ref a -> ColorChooserMode -> IO ()
  , hueCustom :: Ref a -> IO Between0And6
  , saturationCustom :: Ref a -> IO Between0And1
  , valueCustom :: Ref a -> IO Between0And1
  , rCustom :: Ref a -> IO Between0And1
  , gCustom :: Ref a -> IO Between0And1
  , bCustom :: Ref a -> IO Between0And1
  , hsvCustom :: Ref a -> (Between0And6,Between0And1,Between0And1) -> IO Int
  , rgbCustom :: Ref a -> (Between0And1,Between0And1,Between0And1) -> IO Int
  }

toGetBetween0And6Prim :: (Ref a -> IO Between0And6) -> IO (FunPtr GetDoublePrim)
toGetBetween0And6Prim f =
  mkGetDouble (\ptr -> do
                  pp <- wrapNonNull ptr "Null pointer: toGetBetween0And6Prim"
                  (Between0And6 res) <- f (castTo (wrapInRef pp))
                  return (realToFrac res))

toGetBetween0And1Prim :: (Ref a -> IO Between0And1) -> IO (FunPtr GetDoublePrim)
toGetBetween0And1Prim f =
  mkGetDouble (\ptr -> do
                  pp <- wrapNonNull ptr "Null pointer: toGetBetween0And1Prim"
                  (Between0And1 res) <- f (castTo (wrapInRef pp))
                  return (realToFrac res))

toGetModePrim :: (Ref a -> IO ColorChooserMode) -> IO (FunPtr GetIntPrim)
toGetModePrim f =
  mkGetInt (\ptr -> do
               pp <- wrapNonNull ptr "Null pointer: toGetModePrim"
               mode <- f (castTo (wrapInRef pp))
               return (fromIntegral (fromEnum mode)))

toSetModePrim :: (Ref a -> ColorChooserMode -> IO ()) -> IO (FunPtr SetIntPrim)
toSetModePrim f =
  mkSetInt (\ptr m -> do
               pp <- wrapNonNull ptr "Null pointer: toSetModePrim"
               f (castTo (wrapInRef pp)) (cToEnum (fromIntegral m)))

toHsvPrim :: (Ref a -> (Between0And6,Between0And1,Between0And1) -> IO Int)-> IO (FunPtr ColorSetPrim)
toHsvPrim f =
  mkColorSetPrim (\ptr (CDouble h) (CDouble s) (CDouble v) -> do
                     pp <- wrapNonNull ptr "Null pointer: toHsvPrim"
                     ret <- f (castTo (wrapInRef pp)) (Between0And6 h,Between0And1 s,Between0And1 v)
                     return (fromIntegral ret))

toRgbPrim :: (Ref a -> (Between0And1,Between0And1,Between0And1) -> IO Int) -> IO (FunPtr ColorSetPrim)
toRgbPrim f =
  mkColorSetPrim (\ptr (CDouble r) (CDouble g) (CDouble b) -> do
                     pp <- wrapNonNull ptr "Null pointer: toRgbPrim"
                     ret <- f (castTo (wrapInRef pp)) (Between0And1 r,Between0And1 g,Between0And1 b)
                     return (fromIntegral ret))

fillCustomColorChooserFunctionStruct :: forall a. (Parent a ColorChooserBase) => CustomColorChooserFuncs a -> IO (Ptr ())
fillCustomColorChooserFunctionStruct funcs = do
  structPtr <- mallocBytes {#sizeof fl_Color_Chooser_Virtual_Funcs #}
  toGetModePrim (getModeCustom funcs) >>= {#set fl_Color_Chooser_Virtual_Funcs->get_mode #} structPtr
  toSetModePrim (setModeCustom funcs) >>= {#set fl_Color_Chooser_Virtual_Funcs->set_mode #} structPtr
  toGetBetween0And6Prim (hueCustom funcs) >>= {#set fl_Color_Chooser_Virtual_Funcs->hue #} structPtr
  toGetBetween0And1Prim (saturationCustom funcs) >>= {#set fl_Color_Chooser_Virtual_Funcs->saturation #} structPtr
  toGetBetween0And1Prim (valueCustom funcs) >>= {#set fl_Color_Chooser_Virtual_Funcs->value #} structPtr
  toGetBetween0And1Prim (rCustom funcs) >>= {#set fl_Color_Chooser_Virtual_Funcs->r #} structPtr
  toGetBetween0And1Prim (gCustom funcs) >>= {#set fl_Color_Chooser_Virtual_Funcs->g #} structPtr
  toGetBetween0And1Prim (bCustom funcs) >>= {#set fl_Color_Chooser_Virtual_Funcs->b #} structPtr
  toHsvPrim (hsvCustom funcs) >>= {#set fl_Color_Chooser_Virtual_Funcs->hsv #} structPtr
  toRgbPrim (rgbCustom funcs) >>= {#set fl_Color_Chooser_Virtual_Funcs->rgb #} structPtr
  return structPtr

{# fun Fl_OverriddenColor_Chooser_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()', id `Ptr ()' } -> `Ptr ()' id #}
{# fun Fl_OverriddenColor_Chooser_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()', id `Ptr ()' } -> `Ptr ()' id #}
colorChooserCustom ::
       Rectangle                         -- ^ The bounds of this ColorChooser
    -> Maybe T.Text                      -- ^ The ColorChooser label
    -> Maybe (Ref ColorChooser -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomColorChooserFuncs ColorChooser)
    -> Maybe (CustomWidgetFuncs ColorChooser)      -- ^ Optional custom widget functions
    -> IO (Ref ColorChooser)
colorChooserCustom rectangle l' draw' colorChooserFuncs' funcs' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in do
    widgetFuncsPtr <- customWidgetFunctionStruct draw' (maybe defaultCustomWidgetFuncs id funcs')
    colorChooserFuncsPtr <- maybe (return nullPtr) fillCustomColorChooserFunctionStruct colorChooserFuncs'
    colorChooser <-
      maybe
        (overriddenWidgetNew' x_pos y_pos width height (castPtr widgetFuncsPtr) (castPtr colorChooserFuncsPtr))
        (\l -> copyTextToCString l >>= \l' -> overriddenWidgetNewWithLabel' x_pos y_pos width height l' (castPtr widgetFuncsPtr) (castPtr colorChooserFuncsPtr))
        l'
    ref <- toRef colorChooser
    setFlag ref WidgetFlagCopiedLabel
    setFlag ref WidgetFlagCopiedTooltip
    return ref

{# fun Fl_Color_Chooser_New as colorchooserNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Color_Chooser_New_WithLabel as colorchooserNewWithLabel' { `Int',`Int',`Int',`Int', `CString'} -> `Ptr ()' id #}
colorChooserNew :: Rectangle -> Maybe T.Text -> IO (Ref ColorChooser)
colorChooserNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> colorchooserNew' x_pos y_pos width height >>= toRef
        Just l -> do
          l' <- copyTextToCString l
          ref <- colorchooserNewWithLabel' x_pos y_pos width height l' >>= toRef
          setFlag ref WidgetFlagCopiedLabel
          setFlag ref WidgetFlagCopiedTooltip
          return ref

{# fun Fl_Color_Chooser_hsv2rgb as hsv2rgb' {`Double',`Double',`Double', id `Ptr CDouble', id `Ptr CDouble',id `Ptr CDouble' } -> `()' #}
hsv2Rgb :: (Between0And6, Between0And1, Between0And1) ->  IO (Maybe (Between0And1, Between0And1, Between0And1))
hsv2Rgb (Between0And6 h'', Between0And1 s'', Between0And1 v'') =
  alloca $ \rPtr ->
  alloca $ \gPtr ->
  alloca $ \bPtr -> do
    hsv2rgb' h'' s'' v'' rPtr gPtr bPtr
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

{# fun flc_color_chooser_with_m as flc_color_chooser_with_m' {`CString' , id `Ptr CDouble', id `Ptr CDouble', id `Ptr CDouble', `Int' } -> `Int' #}
{# fun flc_color_chooser_with_uchar_m as flc_color_chooser_with_uchar_m' {`CString' , id `Ptr CUChar', id `Ptr CUChar', id `Ptr CUChar', `Int' } -> `Int' #}
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
    ret <- copyTextToCString name >>= \n' -> flc_color_chooser_with_m' n' r''Ptr g''Ptr b''Ptr (maybe (-1) fromEnum mode)
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
    ret <- copyTextToCString name >>= \n' -> flc_color_chooser_with_uchar_m' n' r''Ptr g''Ptr b''Ptr (maybe (-1) fromEnum mode)
    if (ret == 0)
     then return Nothing
     else do
      newR <- peek r''Ptr
      newG <- peek g''Ptr
      newB <- peek b''Ptr
      return (Just (Words ((fromIntegral newR), (fromIntegral newG), (fromIntegral newB))))

{# fun Fl_Color_Chooser_mode_super as modeSuper' { id `Ptr ()' } -> `Int' #}
getModeColorChooserBase :: Ref ColorChooserBase ->  IO (ColorChooserMode)
getModeColorChooserBase color_chooser = withRef color_chooser $ \color_chooserPtr -> modeSuper' color_chooserPtr >>= return . toEnum

{# fun Fl_Color_Chooser_set_mode_super as setModeSuper' { id `Ptr ()',`Int' } -> `()' #}
setModeColorChooserBase :: Ref ColorChooserBase -> ColorChooserMode ->  IO ()
setModeColorChooserBase color_chooser mode = withRef color_chooser $ \color_chooserPtr -> setModeSuper' color_chooserPtr (fromEnum mode)

{# fun Fl_Color_Chooser_hue_super as hueSuper' { id `Ptr ()' } -> `Double' #}
getHueColorChooserBase :: Ref ColorChooserBase ->  IO (Either OutOfRange Between0And6)
getHueColorChooserBase color_chooser = withRef color_chooser $ \color_chooserPtr -> do
    h'' <- hueSuper' color_chooserPtr
    if ((h'' < 0.0) || (h'' >= 6.0))
     then return (Left OutOfRange)
     else return (Right (Between0And6 h''))
{# fun Fl_Color_Chooser_saturation_super as saturationSuper' { id `Ptr ()' } -> `Double' #}
getSaturationColorChooserBase :: Ref ColorChooserBase ->  IO (Either OutOfRange Between0And1)
getSaturationColorChooserBase color_chooser = withRef color_chooser $ \color_chooserPtr -> do
    s'' <- saturationSuper' color_chooserPtr
    if ((s'' < 0.0) || (s'' > 1.0))
     then return (Left OutOfRange)
     else return (Right (Between0And1 s''))

{# fun Fl_Color_Chooser_value_super as valueSuper' { id `Ptr ()' } -> `Double' #}
getValueColorChooserBase :: Ref ColorChooserBase ->  IO (Either OutOfRange Between0And1)
getValueColorChooserBase color_chooser = withRef color_chooser $ \color_chooserPtr -> do
    v'' <- valueSuper' color_chooserPtr
    if ((v'' < 0.0) || (v'' > 1.0))
     then return (Left OutOfRange)
     else return (Right (Between0And1 v''))

{# fun Fl_Color_Chooser_r_super as rSuper' { id `Ptr ()' } -> `Double' #}
getRColorChooserBase :: Ref ColorChooserBase ->  IO (Either OutOfRange Between0And1)
getRColorChooserBase color_chooser = withRef color_chooser $ \color_chooserPtr -> do
    r'' <- rSuper' color_chooserPtr
    if ((r'' < 0.0) || (r'' > 1.0))
     then return (Left OutOfRange)
     else return (Right (Between0And1 r''))

{# fun Fl_Color_Chooser_g_super as gSuper' { id `Ptr ()' } -> `Double' #}
getGColorChooserBase :: Ref ColorChooserBase ->  IO (Either OutOfRange Between0And1)
getGColorChooserBase color_chooser = withRef color_chooser $ \color_chooserPtr -> do
    g'' <- gSuper' color_chooserPtr
    if ((g'' < 0.0) || (g'' > 1.0))
     then return (Left OutOfRange)
     else return (Right (Between0And1 g''))

{# fun Fl_Color_Chooser_b_super as bSuper' { id `Ptr ()' } -> `Double' #}
getBColorChooserBase :: Ref ColorChooserBase ->  IO (Either OutOfRange Between0And1)
getBColorChooserBase color_chooser = withRef color_chooser $ \color_chooserPtr -> do
    b'' <- bSuper' color_chooserPtr
    if ((b'' < 0.0) || (b'' > 1.0))
     then return (Left OutOfRange)
     else return (Right (Between0And1 b''))

{# fun Fl_Color_Chooser_hsv_super as hsvSuper' { id `Ptr ()',`Double', `Double', `Double'} -> `Int' #}
setHsvColorChooserBase :: Ref ColorChooserBase -> (Between0And6, Between0And1, Between0And1) -> IO (Either NoChange ())
setHsvColorChooserBase color_chooser (Between0And6 h'', Between0And1 s'', Between0And1 v'') =
    withRef color_chooser $ \color_chooserPtr -> do
      ret <- hsvSuper' color_chooserPtr h'' s'' v''
      if (ret == 0) then return (Left NoChange) else return (Right ())

{# fun Fl_Color_Chooser_rgb_super as rgbSuper' { id `Ptr ()',`Double', `Double', `Double'} -> `Int' #}
setRgbColorChooserBase :: Ref ColorChooserBase -> (Between0And1, Between0And1, Between0And1) ->  IO (Either NoChange ())
setRgbColorChooserBase color_chooser (Between0And1 r'', Between0And1 g'', Between0And1 b'') =
    withRef color_chooser $ \color_chooserPtr -> do
      ret <- rgbSuper' color_chooserPtr r'' g'' b''
      if (ret == 0) then return (Left NoChange) else return (Right ())

{# fun Fl_Color_Chooser_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawColorChooserBase ::  Ref ColorChooserBase -> IO ()
drawColorChooserBase colorChoooser = withRef colorChoooser $ \colorChoooserPtr -> drawSuper' colorChoooserPtr
{# fun Fl_Color_Chooser_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleColorChooserBase :: Ref ColorChooserBase -> Event ->  IO (Either UnknownEvent ())
handleColorChooserBase colorChoooser event = withRef colorChoooser $ \colorChoooserPtr -> handleSuper' colorChoooserPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Color_Chooser_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeColorChooserBase :: Ref ColorChooserBase -> Rectangle -> IO ()
resizeColorChooserBase colorChoooser rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef colorChoooser $ \colorChoooserPtr -> resizeSuper' colorChoooserPtr x_pos y_pos width height
{# fun Fl_Color_Chooser_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideColorChooserBase ::  Ref ColorChooserBase -> IO ()
hideColorChooserBase colorChoooser = withRef colorChoooser $ \colorChoooserPtr -> hideSuper' colorChoooserPtr
{# fun Fl_Color_Chooser_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetColorChooserBase ::  Ref ColorChooserBase -> IO ()
showWidgetColorChooserBase colorChoooser = withRef colorChoooser $ \colorChoooserPtr -> showSuper' colorChoooserPtr

{# fun Fl_Color_Chooser_mode as mode' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (ColorChooserMode))) => Op (GetMode ()) ColorChooserBase orig impl where
  runOp _ _ color_chooser = withRef color_chooser $ \color_chooserPtr -> mode' color_chooserPtr >>= return . toEnum
{# fun Fl_Color_Chooser_set_mode as setMode' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (ColorChooserMode ->  IO ())) => Op (SetMode ()) ColorChooserBase orig impl where
  runOp _ _ color_chooser mode = withRef color_chooser $ \color_chooserPtr -> setMode' color_chooserPtr (fromEnum mode)
{# fun Fl_Color_Chooser_hue as hue' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Either OutOfRange Between0And6))) => Op (GetHue ()) ColorChooserBase orig impl where
  runOp _ _ color_chooser = withRef color_chooser $ \color_chooserPtr -> do
    h'' <- hue' color_chooserPtr
    if ((h'' < 0.0) || (h'' >= 6.0))
     then return (Left OutOfRange)
     else return (Right (Between0And6 h''))
{# fun Fl_Color_Chooser_saturation as saturation' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Either OutOfRange Between0And1))) => Op (GetSaturation ()) ColorChooserBase orig impl where
  runOp _ _ color_chooser = withRef color_chooser $ \color_chooserPtr -> do
    s'' <- saturation' color_chooserPtr
    if ((s'' < 0.0) || (s'' > 1.0))
     then return (Left OutOfRange)
     else return (Right (Between0And1 s''))
{# fun Fl_Color_Chooser_value as value' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Either OutOfRange Between0And1))) => Op (GetValue ()) ColorChooserBase orig impl where
  runOp _ _ color_chooser = withRef color_chooser $ \color_chooserPtr -> do
    v'' <- value' color_chooserPtr
    if ((v'' < 0.0) || (v'' > 1.0))
     then return (Left OutOfRange)
     else return (Right (Between0And1 v''))
{# fun Fl_Color_Chooser_r as r' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Either OutOfRange Between0And1))) => Op (GetR ()) ColorChooserBase orig impl where
  runOp _ _ color_chooser = withRef color_chooser $ \color_chooserPtr -> do
    r'' <- r' color_chooserPtr
    if ((r'' < 0.0) || (r'' > 1.0))
     then return (Left OutOfRange)
     else return (Right (Between0And1 r''))
{# fun Fl_Color_Chooser_g as g' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Either OutOfRange Between0And1))) => Op (GetG ()) ColorChooserBase orig impl where
  runOp _ _ color_chooser = withRef color_chooser $ \color_chooserPtr -> do
    g'' <- g' color_chooserPtr
    if ((g'' < 0.0) || (g'' > 1.0))
     then return (Left OutOfRange)
     else return (Right (Between0And1 g''))
{# fun Fl_Color_Chooser_b as b' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Either OutOfRange Between0And1))) => Op (GetB ()) ColorChooserBase orig impl where
  runOp _ _ color_chooser = withRef color_chooser $ \color_chooserPtr -> do
    b'' <- b' color_chooserPtr
    if ((b'' < 0.0) || (b'' > 1.0))
     then return (Left OutOfRange)
     else return (Right (Between0And1 b''))
{# fun Fl_Color_Chooser_hsv as hsv' { id `Ptr ()',`Double', `Double', `Double'} -> `Int' #}
instance (impl ~ ((Between0And6, Between0And1, Between0And1) ->  IO (Either NoChange ()))) => Op (SetHsv ()) ColorChooserBase orig impl where
  runOp _ _ color_chooser (Between0And6 h'', Between0And1 s'', Between0And1 v'') =
    withRef color_chooser $ \color_chooserPtr -> do
      ret <- hsv' color_chooserPtr h'' s'' v''
      if (ret == 0) then return (Left NoChange) else return (Right ())
{# fun Fl_Color_Chooser_rgb as rgb' { id `Ptr ()',`Double', `Double', `Double'} -> `Int' #}
instance (impl ~ ((Between0And1, Between0And1, Between0And1) ->  IO (Either NoChange ()))) => Op (SetRgb ()) ColorChooserBase orig impl where
  runOp _ _ color_chooser (Between0And1 r'', Between0And1 g'', Between0And1 b'') =
    withRef color_chooser $ \color_chooserPtr -> do
      ret <- rgb' color_chooserPtr r'' g'' b''
      if (ret == 0) then return (Left NoChange) else return (Right ())
{# fun Fl_Color_Chooser_draw as draw' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) ColorChooserBase orig impl where
  runOp _ _ colorChooser = withRef colorChooser $ \colorChooserPtr -> draw' colorChooserPtr
{#fun Fl_Color_Chooser_handle as colorChooserHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) ColorChooserBase orig impl where
  runOp _ _ colorChooser event = withRef colorChooser (\p -> colorChooserHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Color_Chooser_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) ColorChooserBase orig impl where
  runOp _ _ colorChooser = withRef colorChooser $ \colorChooserPtr -> hide' colorChooserPtr
{# fun Fl_Color_Chooser_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) ColorChooserBase orig impl where
  runOp _ _ colorChooser = withRef colorChooser $ \colorChooserPtr -> show' colorChooserPtr
{# fun Fl_Color_Chooser_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) ColorChooserBase orig impl where
  runOp _ _ colorChooser rectangle = withRef colorChooser $ \colorChooserPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' colorChooserPtr x_pos y_pos w_pos h_pos
instance (impl ~ (IO ( Either OutOfRange (Between0And1, Between0And1, Between0And1)))) => Op (GetRgb ()) ColorChooserBase orig impl where
  runOp _ _ color_chooser = do
    _r <- getR color_chooser
    _g <- getG color_chooser
    _b <- getB color_chooser
    return (do
      r <- _r
      g <- _g
      b <- _b
      return (r,g,b))

instance (impl ~ (IO ( Either OutOfRange (Between0And6, Between0And1, Between0And1)))) => Op (GetHsv ()) ColorChooserBase orig impl where
  runOp _ _ color_chooser = do
    _h <- getHue color_chooser
    _s <- getSaturation color_chooser
    _v <- getValue color_chooser
    return (do
      h <- _h
      s <- _s
      v <- _v
      return (h,s,v))


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.ColorChooser"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'ColorChooserBase' -> 'IO' ()
--
-- getB :: 'Ref' 'ColorChooserBase' -> 'IO' ('Either' 'OutOfRange' 'Between0And1')
--
-- getG :: 'Ref' 'ColorChooserBase' -> 'IO' ('Either' 'OutOfRange' 'Between0And1')
--
-- getHsv :: 'Ref' 'ColorChooserBase' -> 'IO' ( 'Either' 'OutOfRange' ('Between0And6', 'Between0And1', 'Between0And1'))
--
-- getHue :: 'Ref' 'ColorChooserBase' -> 'IO' ('Either' 'OutOfRange' 'Between0And6')
--
-- getMode :: 'Ref' 'ColorChooserBase' -> 'IO' ('ColorChooserMode')
--
-- getR :: 'Ref' 'ColorChooserBase' -> 'IO' ('Either' 'OutOfRange' 'Between0And1')
--
-- getRgb :: 'Ref' 'ColorChooserBase' -> 'IO' ( 'Either' 'OutOfRange' ('Between0And1', 'Between0And1', 'Between0And1'))
--
-- getSaturation :: 'Ref' 'ColorChooserBase' -> 'IO' ('Either' 'OutOfRange' 'Between0And1')
--
-- getValue :: 'Ref' 'ColorChooserBase' -> 'IO' ('Either' 'OutOfRange' 'Between0And1')
--
-- handle :: 'Ref' 'ColorChooserBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'ColorChooserBase' -> 'IO' ()
--
-- resize :: 'Ref' 'ColorChooserBase' -> 'Rectangle' -> 'IO' ()
--
-- setHsv :: 'Ref' 'ColorChooserBase' -> ('Between0And6', 'Between0And1', 'Between0And1') -> 'IO' ('Either' 'NoChange' ())
--
-- setMode :: 'Ref' 'ColorChooserBase' -> 'ColorChooserMode' -> 'IO' ()
--
-- setRgb :: 'Ref' 'ColorChooserBase' -> ('Between0And1', 'Between0And1', 'Between0And1') -> 'IO' ('Either' 'NoChange' ())
--
-- showWidget :: 'Ref' 'ColorChooserBase' -> 'IO' ()
-- @
