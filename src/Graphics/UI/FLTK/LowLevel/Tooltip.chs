{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Tooltip
  (
    tooltipHoverdelay,
    tooltipSetHoverdelay,
    tooltipEnabled,
    tooltipEnable,
    tooltipColor,
    tooltipCurrent,
    tooltipDelay,
    tooltipFont,
    tooltipMarginHeight,
    tooltipMarginWidth,
    tooltipSetColor,
    tooltipSetCurrent,
    tooltipSetDelay,
    tooltipSetFont,
    tooltipSetMarginHeight,
    tooltipSetMarginWidth,
    tooltipSetSize,
    tooltipSetTextcolor,
    tooltipSetWrapWidth,
    tooltipSize,
    tooltipTextcolor,
    tooltipWrapWidth
  )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_TooltipC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)

import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
{# fun Fl_Tooltip_delay as tooltipDelay {} -> `Double' cFloatConv #}
{# fun Fl_Tooltip_set_delay as tooltipSetDelay { cFloatConv `Double' } -> `()' #}
{# fun Fl_Tooltip_hoverdelay as tooltipHoverdelay {} -> `Double' cFloatConv #}
{# fun Fl_Tooltip_set_hoverdelay as tooltipSetHoverdelay { cFloatConv `Double' } -> `()' #}
{# fun Fl_Tooltip_enabled as tooltipEnabled {} -> `Bool' cToBool #}
{# fun Fl_Tooltip_enable_with_b as tooltipEnable { cFromBool `Bool' } -> `()' #}
{# fun Fl_Tooltip_current as tooltipCurrent' {} -> `Ptr ()' #}
tooltipCurrent :: IO (Maybe (Ref Widget))
tooltipCurrent = tooltipCurrent' >>= toMaybeRef
{# fun Fl_Tooltip_set_current as tooltipSetCurrent' {id `Ptr ()'} -> `()' #}
tooltipSetCurrent:: (Parent a WidgetBase) => Maybe (Ref a) -> IO ()
tooltipSetCurrent w =
  case w of
    Nothing -> tooltipSetCurrent' nullPtr
    Just ref -> withRef ref (\refPtr -> tooltipSetCurrent' refPtr)

{# fun Fl_Tooltip_font as tooltipFont {} -> `Font' cToFont #}
{# fun Fl_Tooltip_set_font as tooltipSetFont { cFromFont `Font' } -> `()' #}

{# fun Fl_Tooltip_size as tooltipSize' {} -> `CInt' #}
tooltipSize :: IO FontSize
tooltipSize = tooltipSize' >>= return . FontSize
{# fun Fl_Tooltip_set_size as tooltipSetSize' { `CInt' } -> `()' #}
tooltipSetSize :: FontSize -> IO ()
tooltipSetSize (FontSize fs) = tooltipSetSize' fs
{# fun Fl_Tooltip_color as tooltipColor' {} -> `CUInt' #}
tooltipColor :: IO Color
tooltipColor = tooltipColor' >>= return . Color
{# fun Fl_Tooltip_set_color as tooltipSetColor' { `CUInt' } -> `()' #}
tooltipSetColor :: Color -> IO ()
tooltipSetColor (Color fs) = tooltipSetColor' fs
{# fun Fl_Tooltip_textcolor as tooltipTextcolor' {} -> `CUInt' #}
tooltipTextcolor :: IO Color
tooltipTextcolor = tooltipTextcolor' >>= return . Color
{# fun Fl_Tooltip_set_textcolor as tooltipSetTextcolor' { `CUInt' } -> `()' #}
tooltipSetTextcolor :: Color -> IO ()
tooltipSetTextcolor (Color fs) = tooltipSetTextcolor' fs

{# fun Fl_Tooltip_margin_width as tooltipMarginwidth' {} -> `CInt' #}
tooltipMarginWidth :: IO Width
tooltipMarginWidth = tooltipMarginwidth' >>= return . Width . fromIntegral
{# fun Fl_Tooltip_set_margin_width as tooltipSetMarginwidth' { `CInt' } -> `()' #}
tooltipSetMarginWidth :: Width -> IO ()
tooltipSetMarginWidth (Width fs) = tooltipSetMarginwidth' (fromIntegral fs)

{# fun Fl_Tooltip_margin_height as tooltipMarginheight' {} -> `CInt' #}
tooltipMarginHeight :: IO Height
tooltipMarginHeight = tooltipMarginheight' >>= return . Height . fromIntegral
{# fun Fl_Tooltip_set_margin_height as tooltipSetMarginheight' { `CInt' } -> `()' #}
tooltipSetMarginHeight :: Height -> IO ()
tooltipSetMarginHeight (Height fs) = tooltipSetMarginheight' (fromIntegral fs)

{# fun Fl_Tooltip_wrap_width as tooltipWrapWidth' {} -> `CInt' #}
tooltipWrapWidth :: IO Width
tooltipWrapWidth = tooltipWrapWidth' >>= return . Width . fromIntegral
{# fun Fl_Tooltip_set_wrap_width as tooltipSetWrapWidth' { `CInt' } -> `()' #}
tooltipSetWrapWidth :: Width -> IO ()
tooltipSetWrapWidth (Width fs) = tooltipSetWrapWidth' (fromIntegral fs)
