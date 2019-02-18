{-# LANGUAGE CPP, FlexibleContexts #-}
module Graphics.UI.FLTK.LowLevel.Draw
       (
       LineStyle(..),
       CapStyle(..),
       JoinStyle(..),
       LineDrawStyle(..),
       flcSetColor,
       flcSetColorWithRgb,
       flcColor,
       flcPushClip,
       flcPushNoClip,
       flcPopClip,
       flcNotClipped,
       flcClipBox,
       flcRestoreClip,
       flcSetClipRegion,
       flcClipRegion,
       flcPoint,
       flcLineStyle,
       flcRect,
       flcRectWithColor,
       flcRectf,
       flcRectfWithColor,
       flcRectfWithRgb,
       flcLine,
       flcLineWith2Edges,
       flcLoop,
       flcLoopWith4Sides,
       flcPolygon,
       flcPolygonWith4Sides,
       flcXyline,
       flcXylineDownByY,
       flcXylineDownByYAcrossByX,
       flcYxline,
       flcYxlineAcrossByX,
       flcYxlineAcrossByXDownByY,
       flcArcByWidthHeight,
       flcPie,
       flcPushMatrix,
       flcPopMatrix,
       flcScaleWithY,
       flcScale,
       flcTranslate,
       flcRotate,
       flcMultMatrix,
       flcBeginPoints,
       flcBeginLine,
       flcBeginLoop,
       flcBeginPolygon,
       flcVertex,
       flcCurve,
       flcArcByRadius,
       flcCircle,
       flcEndPoints,
       flcEndLine,
       flcEndLoop,
       flcEndPolygon,
       flcBeginComplexPolygon,
       flcGap,
       flcEndComplexPolygon,
       flcTransformX,
       flcTransformY,
       flcTransformDx,
       flcTransformDy,
       flcTransformedVertex,
       flcSetFont,
       flcFont,
       flcSize,
       flcHeight,
       flcHeightOfFont,
       flcDescent,
       flcWidth,
       flcWidthOfChar,
       flcTextExtents,
       flcLatin1ToLocal,
       flcLocalToLatin1,
       flcMacRomanToLocal,
       flcLocalToMacRoman,
       flcDraw,
       flcDrawWithAngle,
       flcRtlDraw,
       flcMeasure,
       flcDrawInBoxWithImageReference,
       flcDrawInBox,
       flcFrame,
       flcFrame2,
       flcDrawBox,
       flcDrawImageBuf,
       flcDrawImageMonoBuf,
       flcCanDoAlphaBlending,
       flcReadImage,
       flcDrawPixmapWithColor,
       flcDrawPixmap,
       flcDrawPixmapWithCdataColor,
       flcDrawPixmapWithCdata,
       flcMeasurePixmap,
       flcMeasurePixmapWithCdata,
       flcShortcutLabel,
       flcOldShortcut,
       flcOverlayRect,
       flcOverlayClear,
       flcCursorWithFgBg,
       flcCursorWithFg,
       flcCursorWithBg,
       flcCursor,
       flcSetStatus,
       flcSetSpotWithWin,
       flcSetSpot,
       flcResetSpot,
       flcDrawSymbol,
       flcDrawShortcut,
       flcSetDrawShortcut,
       flcCreateOffscreen
     , flcBeginOffscreen
     , flcEndOffscreen
     , flcDeleteOffscreen
     , flcRescaleOffscreen
     , flcCopyOffscreen
    )
where
#include "Fl_C.h"
#include "Fl_DrawC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Data.ByteString
import Foreign.Marshal.Utils

#c
enum LineStyle {
  LineStyleSolid      = FL_SOLID,
  LineStyleDash       = FL_DASH,
  LineStyleDot        = FL_DOT,
  LineStyleDashDot    = FL_DASHDOT,
  LineStyleDashDotDot = FL_DASHDOTDOT,
};
enum CapStyle {
  CapStyleFlat    = FL_CAP_FLAT,
  CapStyleRound   = FL_CAP_ROUND,
  CapStyleSquare  = FL_CAP_SQUARE,
};
enum JoinStyle {
  JoinStyleMiter  = FL_JOIN_MITER,
  JoinStyleRound  = FL_JOIN_ROUND,
  JoinStyleBevel  = FL_JOIN_BEVEL
};
#endc
{#enum LineStyle {} deriving (Show, Eq, Ord) #}
{#enum CapStyle {} deriving (Show, Eq, Ord)  #}
{#enum JoinStyle {} deriving (Show, Eq, Ord) #}

data LineDrawStyle = LineDrawStyle (Maybe LineStyle) (Maybe CapStyle) (Maybe JoinStyle)

{# fun flc_set_color as flcSetColor' { cFromColor `Color' } -> `()' #}
flcSetColor :: Color ->  IO ()
flcSetColor c = flcSetColor' c

{# fun flc_set_color_with_rgb as flcSetColorWithRgb' { id `CUChar',id `CUChar',id `CUChar' } -> `()' #}
flcSetColorWithRgb :: RGB ->  IO ()
flcSetColorWithRgb (r', g' , b') = flcSetColorWithRgb' r' g' b'

{# fun flc_color as flcColor' {  } -> `Color' cToColor #}
flcColor ::  IO (Color)
flcColor  = flcColor'

{# fun flc_push_clip as flcPushClip' { `Int',`Int',`Int',`Int' } -> `()' #}
flcPushClip :: Rectangle ->  IO ()
flcPushClip rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcPushClip' x_pos' y_pos' width' height'

{# fun flc_push_no_clip as flcPushNoClip' {  } -> `()' #}
flcPushNoClip ::  IO ()
flcPushNoClip  = flcPushNoClip'

{# fun flc_pop_clip as flcPopClip' {  } -> `()' #}
flcPopClip ::  IO ()
flcPopClip  = flcPopClip'

{# fun flc_not_clipped as flcNotClipped' { `Int',`Int',`Int',`Int' } -> `Bool' cToBool #}
flcNotClipped :: Rectangle ->  IO (Bool)
flcNotClipped rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcNotClipped' x_pos' y_pos' width' height'

{# fun flc_clip_box as flcClipBox' { `Int',`Int',`Int',`Int',id `Ptr CInt',id `Ptr CInt',id `Ptr CInt',id `Ptr CInt' } -> `Int' #}
flcClipBox :: Rectangle ->  IO (Either UnknownError Rectangle)
flcClipBox rectangle  =
    let (x_pos', y_pos', width', height') = fromRectangle rectangle
    in
      (alloca (\_xPtr' ->
      (alloca (\_yPtr' ->
      (alloca (\_wPtr' ->
      (alloca (\_hPtr' -> do
         res <- flcClipBox' x_pos' y_pos' width' height' _xPtr' _yPtr' _wPtr' _hPtr'
         _x' <- peekIntConv _xPtr'
         _y' <- peekIntConv _yPtr'
         _w' <- peekIntConv _wPtr'
         _h' <- peekIntConv _hPtr'
         if (res == 0) then return (Left UnknownError)
         else return (Right (toRectangle (fromIntegral _x', fromIntegral _y', fromIntegral _w', fromIntegral _h')))))))))))

{# fun flc_restore_clip as flcRestoreClip' {  } -> `()' #}
flcRestoreClip ::  IO ()
flcRestoreClip  = flcRestoreClip'

{# fun flc_set_clip_region as flcSetClipRegion' { id `Ptr ()' } -> `()' #}
flcSetClipRegion :: Ref FlRegion ->  IO ()
flcSetClipRegion r = withRef r $ \rPtr -> flcSetClipRegion' rPtr

{# fun flc_clip_region as flcClipRegion' {  } -> `Ptr ()' id #}
flcClipRegion ::  IO (Maybe (Ref FlRegion))
flcClipRegion  = flcClipRegion' >>= toMaybeRef

{# fun flc_point as flcPoint' { `Int',`Int' } -> `()' #}
flcPoint :: Position ->  IO ()
flcPoint (Position (X x_pos') (Y y_pos')) = flcPoint' x_pos' y_pos'

{# fun flc_line_style_with_width_dashes as flcLineStyleWithWidthDashes' {`Int', `Int', id `Ptr CChar' } -> `()' #}
flcLineStyle :: LineDrawStyle -> Maybe Width -> Maybe T.Text -> IO ()
flcLineStyle style width' dashes' =
  let lineStyleMask = case style of { LineDrawStyle (Just s) _ _ -> fromEnum s; LineDrawStyle Nothing _ _ -> 0}
      capStyleMask = case style of { LineDrawStyle _ (Just s) _  -> fromEnum s; LineDrawStyle _ Nothing _ -> 0}
      joinStyleMask = case style of { LineDrawStyle _ _ (Just s) -> fromEnum s; LineDrawStyle _ _ Nothing -> 0}
      styleMask = lineStyleMask + capStyleMask + joinStyleMask
      _width = case width' of { Just (Width w) -> w ; _ -> 0 }
      cCall = flcLineStyleWithWidthDashes' styleMask _width
  in maybe (cCall nullPtr) (\t -> withText t cCall) dashes'

{# fun flc_rect as flcRect' { `Int',`Int',`Int',`Int' } -> `()' #}
flcRect :: Rectangle ->  IO ()
flcRect rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcRect' x_pos' y_pos' width' height'

{# fun flc_rect_with_color as flcRectWithColor' { `Int',`Int',`Int',`Int',cFromColor `Color' } -> `()' #}
flcRectWithColor :: Rectangle -> Color ->  IO ()
flcRectWithColor rectangle c = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcRectWithColor' x_pos' y_pos' width' height' c

{# fun flc_rectf as flcRectf' { `Int',`Int',`Int',`Int' } -> `()' #}
flcRectf :: Rectangle ->  IO ()
flcRectf rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcRectf' x_pos' y_pos' width' height'

{# fun flc_rectf_with_color as flcRectfWithColor' { `Int',`Int',`Int',`Int',cFromColor `Color' } -> `()' #}
flcRectfWithColor :: Rectangle -> Color ->  IO ()
flcRectfWithColor rectangle c = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcRectfWithColor' x_pos' y_pos' width' height' c

{# fun flc_rectf_with_rgb as flcRectfWithRgb' { `Int',`Int',`Int',`Int',id `CUChar',id `CUChar',id `CUChar' } -> `()' #}
flcRectfWithRgb :: Rectangle -> RGB ->  IO ()
flcRectfWithRgb rectangle (r', g' , b') = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcRectfWithRgb' x_pos' y_pos' width' height' r' g' b'

{# fun flc_line as flcLine' { `Int',`Int',`Int',`Int' } -> `()' #}
flcLine :: Position -> Position ->  IO ()
flcLine (Position (X x_pos') (Y y_pos'))(Position (X x_pos'') (Y y_pos''))  = flcLine' x_pos' y_pos' x_pos'' y_pos''

{# fun flc_line_with_x2_y2 as flcLineWithX2Y2' { `Int',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
flcLineWith2Edges :: Position -> Position -> Position -> IO ()
flcLineWith2Edges (Position (X x_pos') (Y y_pos')) (Position (X x1_pos') (Y y1_pos')) (Position (X x2_pos') (Y y2_pos')) =
  flcLineWithX2Y2' x_pos' y_pos' x1_pos' y1_pos' x2_pos' y2_pos'

{# fun flc_loop as flcLoop' { `Int',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
flcLoop :: Position -> Position -> Position ->  IO ()
flcLoop (Position (X x_pos') (Y y_pos')) (Position (X x1) (Y y1)) (Position (X x2) (Y y2)) =
   flcLoop' x_pos' y_pos' x1 y1 x2 y2

{# fun flc_loop_with_x3_y3 as flcLoopWithX3Y3' { `Int',`Int',`Int',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
flcLoopWith4Sides :: Position -> Position -> Position -> Position ->  IO ()
flcLoopWith4Sides (Position (X x_pos') (Y y_pos')) (Position (X x1) (Y y1)) (Position (X x2) (Y y2)) (Position (X x3) (Y y3)) =
  flcLoopWithX3Y3' x_pos' y_pos' x1 y1 x2 y2 x3 y3

{# fun flc_polygon as flcPolygon' { `Int',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
flcPolygon :: Position -> Position -> Position ->  IO ()
flcPolygon (Position (X x_pos') (Y y_pos')) (Position (X x1) (Y y1)) (Position (X x2) (Y y2)) =
  flcPolygon' x_pos' y_pos' x1 y1 x2 y2

{# fun flc_polygon_with_x3_y3 as flcPolygonWithX3Y3' { `Int',`Int',`Int',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
flcPolygonWith4Sides :: Position -> Position -> Position -> Position ->  IO ()
flcPolygonWith4Sides (Position (X x_pos') (Y y_pos')) (Position (X x1) (Y y1)) (Position (X x2) (Y y2)) (Position (X x3) (Y y3)) =
   flcPolygonWithX3Y3' x_pos' y_pos' x1 y1 x2 y2 x3 y3

{# fun flc_xyline as flcXyline' { `Int',`Int',`Int' } -> `()' #}
flcXyline :: Position -> X ->  IO ()
flcXyline (Position (X x_pos') (Y y_pos')) (X x1) = flcXyline' x_pos' y_pos' x1

{# fun flc_xyline_with_x2 as flcXylineWithX2' { `Int',`Int',`Int',`Int' } -> `()' #}
flcXylineDownByY :: Position -> X -> Y ->  IO ()
flcXylineDownByY (Position (X x_pos') (Y y_pos')) (X x1) (Y y2) = flcXylineWithX2' x_pos' y_pos' x1 y2

{# fun flc_xyline_with_y2_x3 as flcXylineWithY2X3' { `Int',`Int',`Int',`Int',`Int' } -> `()' #}
flcXylineDownByYAcrossByX :: Position -> X -> Y -> X ->  IO ()
flcXylineDownByYAcrossByX (Position (X x_pos') (Y y_pos')) (X x1) (Y y2) (X x3) = flcXylineWithY2X3' x_pos' y_pos' x1 y2 x3

{# fun flc_yxline_with_y1 as flcYxlineWithY1' { `Int',`Int',`Int' } -> `()' #}
flcYxline :: Position -> Y ->  IO ()
flcYxline (Position (X x_pos') (Y y_pos')) (Y y1) = flcYxlineWithY1' x_pos' y_pos' y1

{# fun flc_yxline_with_y2_x2 as flcYxlineWithY2X2' { `Int',`Int',`Int',`Int' } -> `()' #}
flcYxlineAcrossByX :: Position -> Y -> X ->  IO ()
flcYxlineAcrossByX (Position (X x_pos') (Y y_pos')) (Y y1) (X x2) = flcYxlineWithY2X2' x_pos' y_pos' y1 x2

{# fun flc_yxline_with_y2_x3 as flcYxlineWithY2X3' { `Int',`Int',`Int',`Int',`Int' } -> `()' #}
flcYxlineAcrossByXDownByY :: Position -> Y -> X -> Y ->  IO ()
flcYxlineAcrossByXDownByY (Position (X x_pos') (Y y_pos')) (Y y1) (X x2) (Y y3) = flcYxlineWithY2X3' x_pos' y_pos' y1 x2 y3

{# fun flc_arc_by_width_height as flcArcByWidthHeight' { `Int',`Int',`Int',`Int',`Double',`Double' } -> `()' #}
flcArcByWidthHeight :: Rectangle -> PreciseAngle -> PreciseAngle ->  IO ()
flcArcByWidthHeight rectangle (PreciseAngle a1) (PreciseAngle  a2) = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcArcByWidthHeight' x_pos' y_pos' width' height' a1 a2

{# fun flc_pie as flcPie' { `Int',`Int',`Int',`Int',`Double',`Double' } -> `()' #}
flcPie :: Rectangle -> PreciseAngle -> PreciseAngle ->  IO ()
flcPie rectangle (PreciseAngle a1) (PreciseAngle a2) = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcPie' x_pos' y_pos' width' height' a1 a2

{# fun flc_push_matrix as flcPushMatrix' {  } -> `()' #}
flcPushMatrix ::  IO ()
flcPushMatrix  = flcPushMatrix'

{# fun flc_pop_matrix as flcPopMatrix' {  } -> `()' #}
flcPopMatrix ::  IO ()
flcPopMatrix  = flcPopMatrix'

{# fun flc_scale_with_y as flcScaleWithY' { `Double',`Double' } -> `()' #}
flcScaleWithY :: ByXY ->  IO ()
flcScaleWithY (ByXY (ByX by_x') (ByY by_y')) = flcScaleWithY' by_x' by_y'

{# fun flc_scale as flcScale' { `Double' } -> `()' #}
flcScale :: ByX ->  IO ()
flcScale (ByX by_x') = flcScale' by_x'

{# fun flc_translate as flcTranslate' { `Double',`Double' } -> `()' #}
flcTranslate :: ByXY ->  IO ()
flcTranslate (ByXY (ByX by_x') (ByY by_y')) = flcTranslate' by_x' by_y'

{# fun flc_rotate as flcRotate' { `Double' } -> `()' #}
flcRotate :: PreciseAngle ->  IO ()
flcRotate (PreciseAngle d) = flcRotate' d

{# fun flc_mult_matrix as flcMultMatrix' { `Double',`Double',`Double',`Double',`Double',`Double' } -> `()' #}
flcMultMatrix :: Double -> Double -> Double -> Double -> ByXY ->  IO ()
flcMultMatrix a b c d (ByXY (ByX by_x') (ByY by_y')) = flcMultMatrix' a b c d by_x' by_y'

{# fun flc_begin_points as flcBeginPoints' {  } -> `()' #}
flcBeginPoints ::  IO ()
flcBeginPoints  = flcBeginPoints'

{# fun flc_begin_line as flcBeginLine' {  } -> `()' #}
flcBeginLine ::  IO ()
flcBeginLine  = flcBeginLine'

{# fun flc_begin_loop as flcBeginLoop' {  } -> `()' #}
flcBeginLoop ::  IO ()
flcBeginLoop  = flcBeginLoop'

{# fun flc_begin_polygon as flcBeginPolygon' {  } -> `()' #}
flcBeginPolygon ::  IO ()
flcBeginPolygon  = flcBeginPolygon'

{# fun flc_vertex as flcVertex' { `Double',`Double' } -> `()' #}
flcVertex :: PrecisePosition ->  IO ()
flcVertex (PrecisePosition (PreciseX x') (PreciseY y')) = flcVertex' x' y'

{# fun flc_curve as flcCurve' { `Double',`Double',`Double',`Double',`Double',`Double',`Double',`Double' } -> `()' #}
flcCurve :: PrecisePosition -> PrecisePosition -> PrecisePosition -> PrecisePosition ->  IO ()
flcCurve (PrecisePosition (PreciseX x0) (PreciseY  y0)) (PrecisePosition (PreciseX x1) (PreciseY  y1)) (PrecisePosition (PreciseX x2) (PreciseY  y2)) (PrecisePosition (PreciseX x3) (PreciseY  y3)) = flcCurve' x0 y0 x1 y1 x2 y2 x3 y3

{# fun flc_arc_by_radius as flcArcByRadius' { `Double',`Double',`Double',`Double',`Double' } -> `()' #}
flcArcByRadius :: PrecisePosition -> Double -> PreciseAngle -> PreciseAngle ->  IO ()
flcArcByRadius (PrecisePosition (PreciseX x') (PreciseY y')) r (PreciseAngle start') (PreciseAngle end') = flcArcByRadius' x' y' r start' end'

{# fun flc_circle as flcCircle' { `Double',`Double',`Double' } -> `()' #}
flcCircle :: PrecisePosition -> Double ->  IO ()
flcCircle (PrecisePosition (PreciseX x') (PreciseY y')) r = flcCircle' x' y' r

{# fun flc_end_points as flcEndPoints' {  } -> `()' #}
flcEndPoints ::  IO ()
flcEndPoints  = flcEndPoints'

{# fun flc_end_line as flcEndLine' {  } -> `()' #}
flcEndLine ::  IO ()
flcEndLine  = flcEndLine'

{# fun flc_end_loop as flcEndLoop' {  } -> `()' #}
flcEndLoop ::  IO ()
flcEndLoop  = flcEndLoop'

{# fun flc_end_polygon as flcEndPolygon' {  } -> `()' #}
flcEndPolygon ::  IO ()
flcEndPolygon  = flcEndPolygon'

{# fun flc_begin_complex_polygon as flcBeginComplexPolygon' {  } -> `()' #}
flcBeginComplexPolygon ::  IO ()
flcBeginComplexPolygon  = flcBeginComplexPolygon'

{# fun flc_gap as flcGap' {  } -> `()' #}
flcGap ::  IO ()
flcGap  = flcGap'

{# fun flc_end_complex_polygon as flcEndComplexPolygon' {  } -> `()' #}
flcEndComplexPolygon ::  IO ()
flcEndComplexPolygon  = flcEndComplexPolygon'

{# fun flc_transform_x as flcTransformX' { `Double',`Double' } -> `Double' #}
flcTransformX :: ByXY ->  IO (Double)
flcTransformX (ByXY (ByX by_x') (ByY by_y')) = flcTransformX' by_x' by_y'

{# fun flc_transform_y as flcTransformY' { `Double',`Double' } -> `Double' #}
flcTransformY :: ByXY ->  IO (Double)
flcTransformY (ByXY (ByX by_x') (ByY by_y')) = flcTransformY' by_x' by_y'

{# fun flc_transform_dx as flcTransformDx' { `Double',`Double' } -> `Double' #}
flcTransformDx :: ByXY ->  IO (Double)
flcTransformDx (ByXY (ByX by_x') (ByY by_y')) = flcTransformDx' by_x' by_y'

{# fun flc_transform_dy as flcTransformDy' { `Double',`Double' } -> `Double' #}
flcTransformDy :: ByXY ->  IO (Double)
flcTransformDy (ByXY (ByX by_x') (ByY by_y')) = flcTransformDy' by_x' by_y'

{# fun flc_transformed_vertex as flcTransformedVertex' { `Double',`Double' } -> `()' #}
flcTransformedVertex :: PrecisePosition ->  IO ()
flcTransformedVertex (PrecisePosition (PreciseX xf) (PreciseY yf)) = flcTransformedVertex' xf yf

{# fun flc_set_font as flcSetFont' { cFromFont `Font',id `CInt' } -> `()' #}
flcSetFont :: Font -> FontSize ->  IO ()
flcSetFont face (FontSize fsize) = flcSetFont' face fsize

{# fun flc_font as flcFont' {  } -> `Font' cToFont #}
flcFont ::  IO (Font)
flcFont  = flcFont'

{# fun flc_size as flcSize' {  } -> `CInt' id #}
flcSize ::  IO (FontSize)
flcSize  = flcSize' >>= return . FontSize

{# fun flc_height as flcHeight' {  } -> `Int' #}
flcHeight ::  IO (Height)
flcHeight  = flcHeight' >>=  return . Height

{# fun flc_set_height as flcSetHeight' { `Int',`CInt' } -> `Int' #}
flcHeightOfFont :: Font -> FontSize ->  IO (Height)
flcHeightOfFont (Font font') (FontSize size') = flcSetHeight' font' size' >>= return . Height

{# fun flc_descent as flcDescent' {  } -> `Int' #}
flcDescent ::  IO (Int)
flcDescent  = flcDescent'

{# fun flc_width as flcWidth' { `CString' } -> `Double' #}
flcWidth :: T.Text ->  IO (PreciseWidth)
flcWidth txt = withText txt ( \t -> flcWidth' t >>= return . PreciseWidth)

{# fun flc_width_with_c as flcWidthWithC' { `Int' } -> `Double' #}
flcWidthOfChar :: Int ->  IO (PreciseWidth)
flcWidthOfChar c = flcWidthWithC' c >>= return . PreciseWidth

{# fun flc_text_extents as flcTextExtents' { `CString',alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv* } -> `()' #}
flcTextExtents :: T.Text -> IO (Rectangle)
flcTextExtents s  = withText s flcTextExtents' >>= \(rectangle') -> return $ (toRectangle rectangle')

{# fun flc_latin1_to_local as flcLatin1ToLocal' { `CString' } -> `CString' #}
flcLatin1ToLocal :: T.Text ->  IO  T.Text
flcLatin1ToLocal t = withText t flcLatin1ToLocal' >>= cStringToText

{# fun flc_local_to_latin1 as flcLocalToLatin1' { `CString' } -> `CString' #}
flcLocalToLatin1 :: T.Text ->  IO  T.Text
flcLocalToLatin1 t = withText t flcLocalToLatin1' >>= cStringToText

{# fun flc_mac_roman_to_local as flcMacRomanToLocal' { `CString' } -> `CString'#}
flcMacRomanToLocal :: T.Text ->  IO  T.Text
flcMacRomanToLocal t = withText t flcMacRomanToLocal' >>= cStringToText

{# fun flc_local_to_mac_roman as flcLocalToMacRoman' { `CString' } -> `CString' #}
flcLocalToMacRoman :: T.Text ->  IO  T.Text
flcLocalToMacRoman t = withText t flcLocalToMacRoman' >>= cStringToText

{# fun flc_draw as flcDraw' { `CString',`Int',`Int' } -> `()' #}
flcDraw :: T.Text -> Position ->  IO ()
flcDraw str (Position (X x_pos') (Y y_pos')) = withText str (\s -> flcDraw' s x_pos' y_pos')

{# fun flc_draw_with_angle as flcDrawWithAngle' { `Int',`CString',`Int',`Int' } -> `()' #}
flcDrawWithAngle :: Int -> T.Text -> Position ->  IO ()
flcDrawWithAngle angle str (Position (X x_pos') (Y y_pos')) = withText str ( \s -> flcDrawWithAngle' angle s x_pos' y_pos')

{# fun flc_rtl_draw as flcRtlDraw' { `CString',`Int',`Int',`Int' } -> `()' #}
flcRtlDraw :: T.Text -> Int -> Position ->  IO ()
flcRtlDraw str n (Position (X x_pos') (Y y_pos')) = withText str (\s -> flcRtlDraw' s n x_pos' y_pos')

{# fun flc_measure_with_draw_symbols as flcMeasureWithDrawSymbols' { `CString', id `Ptr CInt', id `Ptr CInt', `CInt' } -> `()' #}
flcMeasure :: T.Text -> Maybe Width -> Bool -> IO (Size)
flcMeasure str word_wrap draw_symbols =
  alloca $ \widthPtr' ->
  alloca $ \heightPtr' ->
  let doit = do
       withText str (\s -> flcMeasureWithDrawSymbols' s widthPtr' heightPtr' (fromBool draw_symbols))
       w' <- peekIntConv widthPtr'
       h' <- peekIntConv heightPtr'
       return $ toSize (w',h')
  in do
    poke widthPtr' (maybe 0 (\(Width w) -> fromIntegral w) word_wrap)
    doit

{# fun flc_draw_with_img_draw_symbols as flcDrawWithImgDrawSymbols' { `CString',`Int',`Int',`Int',`Int',`Int', id `Ptr ()',`Bool' } -> `()' #}
{# fun flc_draw_with_callthis_img_draw_symbols as flcDrawWithCallthisImgDrawSymbols' { `CString',`Int',`Int',`Int',`Int',`Int', id `FunPtr DrawCallbackPrim', id `Ptr ()',`Bool' } -> `()' #}
flcDrawInBoxWithImageReference' ::  T.Text -> Rectangle -> Alignments -> Maybe DrawCallback -> Ptr () -> Maybe Bool -> IO ()
flcDrawInBoxWithImageReference' string' rectangle' align' draw_callback' image_ptr draw_flags' =
  let (x_pos', y_pos', width', height') = fromRectangle rectangle' in
  case draw_callback' of
  Nothing -> withText string' (\s -> flcDrawWithImgDrawSymbols' s x_pos' y_pos' width' height' (alignmentsToInt align') image_ptr (maybe False id draw_flags'))
  Just c' -> do
             fptr <- toDrawCallback c'
             withText string' (\s -> flcDrawWithCallthisImgDrawSymbols' s x_pos' y_pos' width' height' (alignmentsToInt align') fptr image_ptr (maybe False id draw_flags'))
flcDrawInBoxWithImageReference :: (Parent a Image) => T.Text -> Rectangle -> Alignments -> Maybe DrawCallback -> Ref a -> Maybe Bool -> IO ()
flcDrawInBoxWithImageReference string' rectangle' align' draw_callback' image' draw_flags'
  = withRef image' $ \imagePtr' -> flcDrawInBoxWithImageReference' string' rectangle' align' draw_callback' imagePtr' draw_flags'

flcDrawInBox :: T.Text -> Rectangle -> Alignments -> Maybe DrawCallback -> Maybe Bool -> IO ()
flcDrawInBox string' rectangle' align' draw_callback' draw_flags'
  = flcDrawInBoxWithImageReference' string' rectangle' align' draw_callback' (castPtr nullPtr) draw_flags'

{# fun flc_frame as flcFrame' { `CString',`Int',`Int',`Int',`Int' } -> `()' #}
flcFrame :: T.Text -> Rectangle ->  IO ()
flcFrame s rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in withText s ( \s' -> flcFrame' s' x_pos' y_pos' width' height')

{# fun flc_frame2 as flcFrame2' { `CString',`Int',`Int',`Int',`Int' } -> `()' #}
flcFrame2 :: T.Text -> Rectangle ->  IO ()
flcFrame2 s rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in withText s ( \s' -> flcFrame2' s' x_pos' y_pos' width' height')

{# fun flc_draw_box as flcDrawBox' { cFromEnum `Boxtype',`Int',`Int',`Int',`Int',cFromColor `Color' } -> `()' #}
flcDrawBox :: Boxtype -> Rectangle -> Color ->  IO ()
flcDrawBox boxtype rectangle color' = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcDrawBox' boxtype x_pos' y_pos' width' height' color'

{# fun flc_draw_image_buf_with_d_l as flcDrawImageBufWithDL' { id `Ptr CUChar',`Int',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
flcDrawImageBuf :: ByteString -> Rectangle -> Delta -> LineDelta -> IO ()
flcDrawImageBuf buf rectangle d l =
  let (x_pos', y_pos', width', height') = fromRectangle rectangle
  in useAsCString
       buf
       (\cs ->
         case (d,l) of
           (Just d', Nothing) -> flcDrawImageBufWithDL' (castPtr cs) x_pos' y_pos' width' height' d' 0
           (Nothing, Just l') -> flcDrawImageBufWithDL' (castPtr cs) x_pos' y_pos' width' height' 0 l'
           (Nothing, Nothing) -> flcDrawImageBufWithDL' (castPtr cs) x_pos' y_pos' width' height' 0 0
           (Just d', Just l') -> flcDrawImageBufWithDL' (castPtr cs) x_pos' y_pos' width' height' d' l')

{# fun flc_draw_image_mono_buf_with_d_l as flcDrawImageMonoBufWithDL' { id `Ptr CUChar',`Int',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
flcDrawImageMonoBuf :: ByteString -> Rectangle -> Delta -> LineDelta ->  IO ()
flcDrawImageMonoBuf buf rectangle d l =
  let (x_pos', y_pos', width', height') = fromRectangle rectangle
  in useAsCString
       buf
       (\cs ->
         case (d,l) of
           (Just d', Nothing) -> flcDrawImageMonoBufWithDL' (castPtr cs) x_pos' y_pos' width' height' d' 0
           (Nothing, Just l') -> flcDrawImageMonoBufWithDL' (castPtr cs) x_pos' y_pos' width' height' 0 l'
           (Nothing, Nothing) -> flcDrawImageMonoBufWithDL' (castPtr cs) x_pos' y_pos' width' height' 0 0
           (Just d', Just l') -> flcDrawImageMonoBufWithDL' (castPtr cs) x_pos' y_pos' width' height' d' l')

{# fun flc_can_do_alpha_blending as flcCanDoAlphaBlending' {  } -> `Bool' cToBool #}
flcCanDoAlphaBlending ::  IO (Bool)
flcCanDoAlphaBlending  = flcCanDoAlphaBlending'

{# fun flc_read_image_with_alpha as flcReadImageWithAlpha' { id `Ptr CUChar', `Int',`Int',`Int',`Int',`Bool' } -> `Ptr CUChar' id #}
flcReadImage :: Rectangle -> Bool -> IO (ByteString)
flcReadImage rectangle alpha =
  let (x_pos', y_pos', width', height') = fromRectangle rectangle
      buffer_size = width' * height' * (if alpha then 4 else 3)
  in
    do
      buffer <- flcReadImageWithAlpha' nullPtr x_pos' y_pos' width' height' alpha
      bs <- packCStringLen ((castPtr buffer), buffer_size)
      free buffer
      return bs

{# fun flc_draw_pixmap_with_color as flcDrawPixmapWithColor' { id `(Ptr (Ptr CChar))',`Int',`Int',cFromColor `Color' } -> `Int' #}
flcDrawPixmapWithColor :: PixmapHs -> Position -> Color ->  IO (Either UnknownError ())
flcDrawPixmapWithColor pixmap (Position (X x_pos') (Y y_pos')) color' =
    (withPixmap pixmap (\pptr -> flcDrawPixmapWithColor' pptr x_pos' y_pos' color'>>= return . successOrUnknownError ()))

{# fun flc_draw_pixmap as flcDrawPixmap' { id `(Ptr(Ptr CChar))',`Int',`Int' } -> `Int' #}
flcDrawPixmap :: PixmapHs -> Position ->  IO (Either UnknownError ())
flcDrawPixmap pixmap (Position (X x_pos') (Y y_pos')) =
    withPixmap pixmap $ \pptr -> flcDrawPixmap' pptr x_pos' y_pos' >>= return . successOrUnknownError ()

{# fun flc_draw_pixmap_with_cdata_color as flcDrawPixmapWithCdataColor' { id `(Ptr (Ptr CChar))',`Int',`Int',cFromColor `Color' } -> `Int' #}
flcDrawPixmapWithCdataColor :: PixmapHs -> Position -> Color ->  IO (Either UnknownError ())
flcDrawPixmapWithCdataColor pixmap (Position (X x_pos') (Y y_pos')) color' =
    withPixmap pixmap ( \pptr -> flcDrawPixmapWithCdataColor' pptr x_pos' y_pos' color' >>= return . successOrUnknownError ())

{# fun flc_draw_pixmap_with_cdata as flcDrawPixmapWithCdata' { id `(Ptr (Ptr CChar))',`Int',`Int' } -> `Int' #}
flcDrawPixmapWithCdata :: PixmapHs -> Position ->  IO (Either UnknownError ())
flcDrawPixmapWithCdata pixmap (Position (X x_pos') (Y y_pos')) =
    withPixmap pixmap $ \pptr -> flcDrawPixmapWithCdata' pptr x_pos' y_pos' >>= return . successOrUnknownError ()

{# fun flc_measure_pixmap as flcMeasurePixmap' { id `(Ptr (Ptr CChar))',id `Ptr CInt',id `Ptr CInt' } -> `Int' #}
flcMeasurePixmap :: PixmapHs ->  IO (Either UnknownError Size)
flcMeasurePixmap pixmap =
  withPixmap pixmap
    (\pptr ->
       alloca (\wPtr ->
       alloca (\hPtr -> do
         res <- flcMeasurePixmap' pptr wPtr hPtr
         if (res == 0) then return (Left UnknownError)
         else do
          w' <- peekIntConv wPtr
          h' <- peekIntConv hPtr
          return (Right (Size (Width (fromIntegral w')) (Height (fromIntegral h'))))
       ))
    )

{# fun flc_measure_pixmap_with_cdata as flcMeasurePixmapWithCdata' { id `(Ptr (Ptr CChar))', id `Ptr CInt', id `Ptr CInt' } -> `Int' #}
flcMeasurePixmapWithCdata :: PixmapHs ->  IO (Either UnknownError Size)
flcMeasurePixmapWithCdata pixmap  =
  withPixmap pixmap
    (\pptr ->
       alloca (\wPtr ->
       alloca (\hPtr -> do
         res <- flcMeasurePixmapWithCdata' pptr wPtr hPtr
         if (res == 0) then return (Left UnknownError)
         else do
          w' <- peekIntConv wPtr
          h' <- peekIntConv hPtr
          return (Right (Size (Width (fromIntegral w')) (Height (fromIntegral h'))))
       ))
    )

{# fun flc_shortcut_label as flcShortcutLabel' { `CInt' } -> `CString' #}
flcShortcutLabel :: ShortcutKeySequence ->  IO  T.Text
flcShortcutLabel (ShortcutKeySequence eventstates keytype) =
   flcShortcutLabel' (keySequenceToCInt eventstates keytype) >>= cStringToText

{# fun flc_old_shortcut as flcOldShortcut' { `CString' } -> `CInt' #}
flcOldShortcut :: T.Text -> IO (Maybe ShortcutKeySequence)
flcOldShortcut s = withText s flcOldShortcut' >>= return . cIntToKeySequence

{# fun flc_overlay_rect as flcOverlayRect' { `Int',`Int',`Int',`Int' } -> `()' #}
flcOverlayRect :: Rectangle ->  IO ()
flcOverlayRect rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcOverlayRect' x_pos' y_pos' width' height'

{# fun flc_overlay_clear as flcOverlayClear' {  } -> `()' #}
flcOverlayClear ::  IO ()
flcOverlayClear  = flcOverlayClear'

{# fun flc_cursor_with_fg_bg as flcCursorWithFgBg' { cFromEnum `Cursor',cFromColor `Color',cFromColor `Color' } -> `()' #}
flcCursorWithFgBg :: Cursor -> Color -> Color ->  IO ()
flcCursorWithFgBg cursore fg bg = flcCursorWithFgBg' cursore fg bg

{# fun flc_cursor_with_fg as flcCursorWithFg' { cFromEnum `Cursor',cFromColor `Color' } -> `()' #}
flcCursorWithFg :: Cursor -> Color ->  IO ()
flcCursorWithFg cursor fg = flcCursorWithFg' cursor fg

{# fun flc_cursor_with_bg as flcCursorWithBg' { cFromEnum `Cursor',cFromColor `Color' } -> `()' #}
flcCursorWithBg :: Cursor -> Color ->  IO ()
flcCursorWithBg cursor bg = flcCursorWithBg' cursor bg

{# fun flc_cursor as flcCursor' { cFromEnum `Cursor' } -> `()' #}
flcCursor :: Cursor ->  IO ()
flcCursor cursor = flcCursor' cursor

{# fun flc_set_status as flcSetStatus' { `Int',`Int',`Int',`Int' } -> `()' #}
flcSetStatus :: Rectangle ->  IO ()
flcSetStatus rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcSetStatus' x_pos' y_pos' width' height'

{# fun flc_set_spot_with_win as flcSetSpotWithWin' { `Int',`CInt',`Int',`Int',`Int',`Int',id `Ptr ()' } -> `()' #}
flcSetSpotWithWin :: (Parent a Window) => Font -> FontSize -> Rectangle -> Ref a -> IO ()
flcSetSpotWithWin (Font font') (FontSize size') rectangle win = let (x_pos', y_pos', width', height') = fromRectangle rectangle in withRef win $ \winPtr -> flcSetSpotWithWin' font' size' x_pos' y_pos' width' height' winPtr

{# fun flc_set_spot as flcSetSpot' { `Int',`CInt',`Int',`Int',`Int',`Int' } -> `()' #}
flcSetSpot :: Font -> FontSize -> Rectangle ->  IO ()
flcSetSpot (Font font') (FontSize size') rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcSetSpot' font' size' x_pos' y_pos' width' height'

{# fun flc_reset_spot as flcResetSpot' {  } -> `()' #}
flcResetSpot ::  IO ()
flcResetSpot  = flcResetSpot'

{# fun flc_draw_symbol as flcDrawSymbol' { `CString',`Int',`Int',`Int',`Int',cFromColor `Color' } -> `Int' #}
flcDrawSymbol :: T.Text -> Rectangle -> Color ->  IO (Either UnknownError ())
flcDrawSymbol label rectangle color' =
  let (x_pos', y_pos', width', height') = fromRectangle rectangle
  in do
  res <- withText label (\l -> flcDrawSymbol' l x_pos' y_pos' width' height' color')
  if (res == 0)
  then return (Right ())
  else return (Left UnknownError)

{# fun flc_get_draw_shortcut as flcDrawShortcut' {  } -> `CChar' id #}
flcDrawShortcut :: IO (Maybe DrawShortcut)
flcDrawShortcut = do
  res <- flcDrawShortcut'
  return (drawShortcutFromC res)

{# fun flc_set_draw_shortcut as flcSetDrawShortcut' { id `CChar' } -> `()' #}
flcSetDrawShortcut :: Maybe DrawShortcut -> IO ()
flcSetDrawShortcut sh = flcSetDrawShortcut' (drawShortcutToC sh)

-- | Only available on FLTK version 1.4.0 and above.
flcCreateOffscreen :: Size -> IO FlOffscreen
flcCreateOffscreen (Size (Width w') (Height h')) =
  {#call flc_create_offscreen as flcCreateOffscreen' #} (fromIntegral w') (fromIntegral h') >>= return . FlOffscreen
{#fun flc_begin_offscreen as flcBeginOffscreen' {id `Fl_Offscreen'} -> `()' #}
-- | Only available on FLTK version 1.4.0 and above.
flcBeginOffscreen :: FlOffscreen -> IO ()
flcBeginOffscreen (FlOffscreen o) = flcBeginOffscreen' o
-- | Only available on FLTK version 1.4.0 and above.
flcEndOffscreen :: IO ()
flcEndOffscreen =  {# call flc_end_offscreen as flcEndOffscreen' #}
-- | Only available on FLTK version 1.4.0 and above.
{#fun flc_delete_offscreen as flcDeleteOffscreen' {id `Fl_Offscreen'} -> `()' #}
flcDeleteOffscreen :: FlOffscreen -> IO ()
flcDeleteOffscreen (FlOffscreen o) = flcDeleteOffscreen' o
{#fun flc_rescale_offscreen as flcRescaleOffscreen' {id `Ptr Fl_Offscreen'} -> `()' #}
flcRescaleOffscreen :: FlOffscreen -> IO ()
flcRescaleOffscreen (FlOffscreen o) = with o flcRescaleOffscreen'
{#fun flc_copy_offscreen as flcCopyOffscreen' {`Int', `Int', `Int', `Int', id `Fl_Offscreen', `Int', `Int' } -> `()' #}
flcCopyOffscreen :: Position -> Size -> FlOffscreen -> Position -> IO ()
flcCopyOffscreen (Position (X x') (Y y')) (Size (Width w') (Height h')) (FlOffscreen o) (Position (X srcx) (Y srcy)) =
  flcCopyOffscreen' x' y' w' h' o srcx srcy
