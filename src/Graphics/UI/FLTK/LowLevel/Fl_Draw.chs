{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Draw
       (
       flcSetColor,
       flcSetColorWithC,
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
       flcLineWithX2Y2,
       flcLoop,
       flcLoopWithX3Y3,
       flcPolygon,
       flcPolygonWithX3Y3,
       flcXyline,
       flcXylineWithX2,
       flcXylineWithY2X3,
       flcYxlineWithY1,
       flcYxlineWithY2X2,
       flcYxlineWithY2X3,
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
       flcSetHeight,
       flcDescent,
       flcWidth,
       flcWidthWithN,
       flcWidthWithC,
       flcTextExtents,
       flcTextExtentsWithN,
       flcLatin1ToLocal,
       flcLatin1ToLocalWithN,
       flcLocalToLatin1,
       flcLocalToLatin1WithN,
       flcMacRomanToLocal,
       flcMacRomanToLocalWithN,
       flcLocalToMacRoman,
       flcLocalToMacRomanWithN,
       flcDraw,
       flcDrawWithAngle,
       flcDrawWithN,
       flcDrawWithNAngle,
       flcRtlDraw,
       flcMeasure,
       flcDrawInBoundingBox,
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
       flcDrawSymbol
    )
where
#include "Fl_C.h"
#include "Fl_DrawC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Utils
import Data.ByteString
import Data.ByteString.Unsafe

#c
enum LineStyle {
  SolidLineStyle  = FL_SOLID,
  SolidDash       = FL_DASH,
  SolidDot        = FL_DOT,
  SolidDashDot    = FL_DASHDOT,
  SolidDashDotDot = FL_DASHDOTDOT,

  SolidCapFlat    = FL_CAP_FLAT,
  SolidCapRound   = FL_CAP_ROUND,
  SolidCapSquare  = FL_CAP_SQUARE,

  SolidJoinMiter  = FL_JOIN_MITER,
  SolidJoinRound  = FL_JOIN_ROUND,
  SolidJoinBevel  = FL_JOIN_BEVEL
};
#endc
{#enum LineStyle {} deriving (Show) #}

{# fun unsafe flc_set_color as flcSetColor' { cFromColor `Color' } -> `()' #}
flcSetColor :: Color ->  IO ()
flcSetColor c = flcSetColor' c

{# fun unsafe flc_set_color_with_c as flcSetColorWithC' { `Int' } -> `()' #}
flcSetColorWithC :: Int ->  IO ()
flcSetColorWithC c = flcSetColorWithC' c

{# fun unsafe flc_set_color_with_rgb as flcSetColorWithRgb' { `Word8',`Word8',`Word8' } -> `()' #}
flcSetColorWithRgb :: RGB ->  IO ()
flcSetColorWithRgb (r', g' , b') = flcSetColorWithRgb' r' g' b'

{# fun unsafe flc_color as flcColor' {  } -> `Color' cToColor #}
flcColor ::  IO (Color)
flcColor  = flcColor'

{# fun unsafe flc_push_clip as flcPushClip' { `Int',`Int',`Int',`Int' } -> `()' #}
flcPushClip :: Rectangle ->  IO ()
flcPushClip rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcPushClip' x_pos' y_pos' width' height'

{# fun unsafe flc_push_no_clip as flcPushNoClip' {  } -> `()' #}
flcPushNoClip ::  IO ()
flcPushNoClip  = flcPushNoClip'

{# fun unsafe flc_pop_clip as flcPopClip' {  } -> `()' #}
flcPopClip ::  IO ()
flcPopClip  = flcPopClip'

{# fun unsafe flc_not_clipped as flcNotClipped' { `Int',`Int',`Int',`Int' } -> `Int' #}
flcNotClipped :: Rectangle ->  IO (Int)
flcNotClipped rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcNotClipped' x_pos' y_pos' width' height'

{# fun unsafe flc_clip_box as flcClipBox' { `Int',`Int',`Int',`Int',alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv* } -> `Int' #}
flcClipBox :: Rectangle ->  IO (Int,Rectangle)
flcClipBox rectangle  =
    let (x_pos', y_pos', width', height') = fromRectangle rectangle
    in
      do
        (result, _x', _y', _w', _h') <- flcClipBox' x_pos' y_pos' width' height'
        return $ (result, toRectangle (_x', _y', _w', _h'))

{# fun unsafe flc_restore_clip as flcRestoreClip' {  } -> `()' #}
flcRestoreClip ::  IO ()
flcRestoreClip  = flcRestoreClip'

{# fun unsafe flc_set_clip_region as flcSetClipRegion' { id `Ptr ()' } -> `()' #}
flcSetClipRegion :: Region ->  IO ()
flcSetClipRegion r = withObject r $ \rPtr -> flcSetClipRegion' rPtr

{# fun unsafe flc_clip_region as flcClipRegion' {  } -> `Ptr ()' id #}
flcClipRegion ::  IO (Ptr ())
flcClipRegion  = flcClipRegion'

{# fun unsafe flc_point as flcPoint' { `Int',`Int' } -> `()' #}
flcPoint :: Position ->  IO ()
flcPoint (Position (X x_pos') (Y y_pos')) = flcPoint' x_pos' y_pos'

{# fun unsafe flc_line_style_with_width_dashes as flcLineStyleWithWidthDashes' {cFromEnum `LineStyle', `Int', id `Ptr CChar' } -> `()' #}
flcLineStyle :: LineStyle -> Maybe Int -> Maybe String -> IO ()
flcLineStyle style width' dashes' = do
  let _width = maybe 0 id width'
  _dashes <- maybe (return nullPtr) newCString dashes'
  flcLineStyleWithWidthDashes' style _width _dashes

{# fun unsafe flc_rect as flcRect' { `Int',`Int',`Int',`Int' } -> `()' #}
flcRect :: Rectangle ->  IO ()
flcRect rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcRect' x_pos' y_pos' width' height'

{# fun unsafe flc_rect_with_color as flcRectWithColor' { `Int',`Int',`Int',`Int',cFromColor `Color' } -> `()' #}
flcRectWithColor :: Rectangle -> Color ->  IO ()
flcRectWithColor rectangle c = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcRectWithColor' x_pos' y_pos' width' height' c

{# fun unsafe flc_rectf as flcRectf' { `Int',`Int',`Int',`Int' } -> `()' #}
flcRectf :: Rectangle ->  IO ()
flcRectf rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcRectf' x_pos' y_pos' width' height'

{# fun unsafe flc_rectf_with_color as flcRectfWithColor' { `Int',`Int',`Int',`Int',cFromColor `Color' } -> `()' #}
flcRectfWithColor :: Rectangle -> Color ->  IO ()
flcRectfWithColor rectangle c = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcRectfWithColor' x_pos' y_pos' width' height' c

{# fun unsafe flc_rectf_with_rgb as flcRectfWithRgb' { `Int',`Int',`Int',`Int',`Word8',`Word8',`Word8' } -> `()' #}
flcRectfWithRgb :: Rectangle -> RGB ->  IO ()
flcRectfWithRgb rectangle (r', g' , b') = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcRectfWithRgb' x_pos' y_pos' width' height' r' g' b'

{# fun unsafe flc_line as flcLine' { `Int',`Int',`Int',`Int' } -> `()' #}
flcLine :: Position -> Int -> Int ->  IO ()
flcLine (Position (X x_pos') (Y y_pos')) x1 y1 = flcLine' x_pos' y_pos' x1 y1

{# fun unsafe flc_line_with_x2_y2 as flcLineWithX2Y2' { `Int',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
flcLineWithX2Y2 :: Position -> Int -> Int -> Int -> Int ->  IO ()
flcLineWithX2Y2 (Position (X x_pos') (Y y_pos')) x1 y1 x2 y2 = flcLineWithX2Y2' x_pos' y_pos' x1 y1 x2 y2

{# fun unsafe flc_loop as flcLoop' { `Int',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
flcLoop :: Position -> Int -> Int -> Int -> Int ->  IO ()
flcLoop (Position (X x_pos') (Y y_pos')) x1 y1 x2 y2 = flcLoop' x_pos' y_pos' x1 y1 x2 y2

{# fun unsafe flc_loop_with_x3_y3 as flcLoopWithX3Y3' { `Int',`Int',`Int',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
flcLoopWithX3Y3 :: Position -> Int -> Int -> Int -> Int -> Int -> Int ->  IO ()
flcLoopWithX3Y3 (Position (X x_pos') (Y y_pos')) x1 y1 x2 y2 x3 y3 = flcLoopWithX3Y3' x_pos' y_pos' x1 y1 x2 y2 x3 y3

{# fun unsafe flc_polygon as flcPolygon' { `Int',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
flcPolygon :: Position -> Int -> Int -> Int -> Int ->  IO ()
flcPolygon (Position (X x_pos') (Y y_pos')) x1 y1 x2 y2 = flcPolygon' x_pos' y_pos' x1 y1 x2 y2

{# fun unsafe flc_polygon_with_x3_y3 as flcPolygonWithX3Y3' { `Int',`Int',`Int',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
flcPolygonWithX3Y3 :: Position -> Int -> Int -> Int -> Int -> Int -> Int ->  IO ()
flcPolygonWithX3Y3 (Position (X x_pos') (Y y_pos')) x1 y1 x2 y2 x3 y3 = flcPolygonWithX3Y3' x_pos' y_pos' x1 y1 x2 y2 x3 y3

{# fun unsafe flc_xyline as flcXyline' { `Int',`Int',`Int' } -> `()' #}
flcXyline :: Position -> Int ->  IO ()
flcXyline (Position (X x_pos') (Y y_pos')) x1 = flcXyline' x_pos' y_pos' x1

{# fun unsafe flc_xyline_with_x2 as flcXylineWithX2' { `Int',`Int',`Int',`Int' } -> `()' #}
flcXylineWithX2 :: Position -> Int -> Int ->  IO ()
flcXylineWithX2 (Position (X x_pos') (Y y_pos')) x1 y2 = flcXylineWithX2' x_pos' y_pos' x1 y2

{# fun unsafe flc_xyline_with_y2_x3 as flcXylineWithY2X3' { `Int',`Int',`Int',`Int',`Int' } -> `()' #}
flcXylineWithY2X3 :: Position -> Int -> Int -> Int ->  IO ()
flcXylineWithY2X3 (Position (X x_pos') (Y y_pos')) x1 y2 x3 = flcXylineWithY2X3' x_pos' y_pos' x1 y2 x3

{# fun unsafe flc_yxline_with_y1 as flcYxlineWithY1' { `Int',`Int',`Int' } -> `()' #}
flcYxlineWithY1 :: Position -> Int ->  IO ()
flcYxlineWithY1 (Position (X x_pos') (Y y_pos')) y1 = flcYxlineWithY1' x_pos' y_pos' y1

{# fun unsafe flc_yxline_with_y2_x2 as flcYxlineWithY2X2' { `Int',`Int',`Int',`Int' } -> `()' #}
flcYxlineWithY2X2 :: Position -> Int -> Int ->  IO ()
flcYxlineWithY2X2 (Position (X x_pos') (Y y_pos')) y1 x2 = flcYxlineWithY2X2' x_pos' y_pos' y1 x2

{# fun unsafe flc_yxline_with_y2_x3 as flcYxlineWithY2X3' { `Int',`Int',`Int',`Int',`Int' } -> `()' #}
flcYxlineWithY2X3 :: Position -> Int -> Int -> Int ->  IO ()
flcYxlineWithY2X3 (Position (X x_pos') (Y y_pos')) y1 x2 y3 = flcYxlineWithY2X3' x_pos' y_pos' y1 x2 y3

{# fun unsafe flc_arc_by_width_height as flcArcByWidthHeight' { `Int',`Int',`Int',`Int',`Double',`Double' } -> `()' #}
flcArcByWidthHeight :: Rectangle -> Double -> Double ->  IO ()
flcArcByWidthHeight rectangle a1 a2 = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcArcByWidthHeight' x_pos' y_pos' width' height' a1 a2

{# fun unsafe flc_pie as flcPie' { `Int',`Int',`Int',`Int',`Double',`Double' } -> `()' #}
flcPie :: Rectangle -> Double -> Double ->  IO ()
flcPie rectangle a1 a2 = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcPie' x_pos' y_pos' width' height' a1 a2

{# fun unsafe flc_push_matrix as flcPushMatrix' {  } -> `()' #}
flcPushMatrix ::  IO ()
flcPushMatrix  = flcPushMatrix'

{# fun unsafe flc_pop_matrix as flcPopMatrix' {  } -> `()' #}
flcPopMatrix ::  IO ()
flcPopMatrix  = flcPopMatrix'

{# fun unsafe flc_scale_with_y as flcScaleWithY' { `Double',`Double' } -> `()' #}
flcScaleWithY :: ByXY ->  IO ()
flcScaleWithY (ByXY (ByX by_x') (ByY by_y')) = flcScaleWithY' by_x' by_y'

{# fun unsafe flc_scale as flcScale' { `Double' } -> `()' #}
flcScale :: ByX ->  IO ()
flcScale (ByX by_x') = flcScale' by_x'

{# fun unsafe flc_translate as flcTranslate' { `Double',`Double' } -> `()' #}
flcTranslate :: ByXY ->  IO ()
flcTranslate (ByXY (ByX by_x') (ByY by_y')) = flcTranslate' by_x' by_y'

{# fun unsafe flc_rotate as flcRotate' { `Double' } -> `()' #}
flcRotate :: Double ->  IO ()
flcRotate d = flcRotate' d

{# fun unsafe flc_mult_matrix as flcMultMatrix' { `Double',`Double',`Double',`Double',`Double',`Double' } -> `()' #}
flcMultMatrix :: Double -> Double -> Double -> Double -> ByXY ->  IO ()
flcMultMatrix a b c d (ByXY (ByX by_x') (ByY by_y')) = flcMultMatrix' a b c d by_x' by_y'

{# fun unsafe flc_begin_points as flcBeginPoints' {  } -> `()' #}
flcBeginPoints ::  IO ()
flcBeginPoints  = flcBeginPoints'

{# fun unsafe flc_begin_line as flcBeginLine' {  } -> `()' #}
flcBeginLine ::  IO ()
flcBeginLine  = flcBeginLine'

{# fun unsafe flc_begin_loop as flcBeginLoop' {  } -> `()' #}
flcBeginLoop ::  IO ()
flcBeginLoop  = flcBeginLoop'

{# fun unsafe flc_begin_polygon as flcBeginPolygon' {  } -> `()' #}
flcBeginPolygon ::  IO ()
flcBeginPolygon  = flcBeginPolygon'

{# fun unsafe flc_vertex as flcVertex' { `Double',`Double' } -> `()' #}
flcVertex :: ByXY ->  IO ()
flcVertex (ByXY (ByX by_x') (ByY by_y')) = flcVertex' by_x' by_y'

{# fun unsafe flc_curve as flcCurve' { `Double',`Double',`Double',`Double',`Double',`Double',`Double',`Double' } -> `()' #}
flcCurve :: Double -> Double -> Double -> Double -> Double -> Double -> Double -> Double ->  IO ()
flcCurve x0 y0 x1 y1 x2 y2 x3 y3 = flcCurve' x0 y0 x1 y1 x2 y2 x3 y3

{# fun unsafe flc_arc_by_radius as flcArcByRadius' { `Double',`Double',`Double',`Double',`Double' } -> `()' #}
flcArcByRadius :: ByXY -> Double -> Double -> Double ->  IO ()
flcArcByRadius (ByXY (ByX by_x') (ByY by_y')) r start end = flcArcByRadius' by_x' by_y' r start end

{# fun unsafe flc_circle as flcCircle' { `Double',`Double',`Double' } -> `()' #}
flcCircle :: ByXY -> Double ->  IO ()
flcCircle (ByXY (ByX by_x') (ByY by_y')) r = flcCircle' by_x' by_y' r

{# fun unsafe flc_end_points as flcEndPoints' {  } -> `()' #}
flcEndPoints ::  IO ()
flcEndPoints  = flcEndPoints'

{# fun unsafe flc_end_line as flcEndLine' {  } -> `()' #}
flcEndLine ::  IO ()
flcEndLine  = flcEndLine'

{# fun unsafe flc_end_loop as flcEndLoop' {  } -> `()' #}
flcEndLoop ::  IO ()
flcEndLoop  = flcEndLoop'

{# fun unsafe flc_end_polygon as flcEndPolygon' {  } -> `()' #}
flcEndPolygon ::  IO ()
flcEndPolygon  = flcEndPolygon'

{# fun unsafe flc_begin_complex_polygon as flcBeginComplexPolygon' {  } -> `()' #}
flcBeginComplexPolygon ::  IO ()
flcBeginComplexPolygon  = flcBeginComplexPolygon'

{# fun unsafe flc_gap as flcGap' {  } -> `()' #}
flcGap ::  IO ()
flcGap  = flcGap'

{# fun unsafe flc_end_complex_polygon as flcEndComplexPolygon' {  } -> `()' #}
flcEndComplexPolygon ::  IO ()
flcEndComplexPolygon  = flcEndComplexPolygon'

{# fun unsafe flc_transform_x as flcTransformX' { `Double',`Double' } -> `Double' #}
flcTransformX :: ByXY ->  IO (Double)
flcTransformX (ByXY (ByX by_x') (ByY by_y')) = flcTransformX' by_x' by_y'

{# fun unsafe flc_transform_y as flcTransformY' { `Double',`Double' } -> `Double' #}
flcTransformY :: ByXY ->  IO (Double)
flcTransformY (ByXY (ByX by_x') (ByY by_y')) = flcTransformY' by_x' by_y'

{# fun unsafe flc_transform_dx as flcTransformDx' { `Double',`Double' } -> `Double' #}
flcTransformDx :: ByXY ->  IO (Double)
flcTransformDx (ByXY (ByX by_x') (ByY by_y')) = flcTransformDx' by_x' by_y'

{# fun unsafe flc_transform_dy as flcTransformDy' { `Double',`Double' } -> `Double' #}
flcTransformDy :: ByXY ->  IO (Double)
flcTransformDy (ByXY (ByX by_x') (ByY by_y')) = flcTransformDy' by_x' by_y'

{# fun unsafe flc_transformed_vertex as flcTransformedVertex' { `Double',`Double' } -> `()' #}
flcTransformedVertex :: Double -> Double ->  IO ()
flcTransformedVertex xf yf = flcTransformedVertex' xf yf

{# fun unsafe flc_set_font as flcSetFont' { cFromFont `Font',id `CInt' } -> `()' #}
flcSetFont :: Font -> FontSize ->  IO ()
flcSetFont face (FontSize fsize) = flcSetFont' face fsize

{# fun unsafe flc_font as flcFont' {  } -> `Font' cToFont #}
flcFont ::  IO (Font)
flcFont  = flcFont'

{# fun unsafe flc_size as flcSize' {  } -> `CInt' id #}
flcSize ::  IO (FontSize)
flcSize  = flcSize' >>= return . FontSize

{# fun unsafe flc_height as flcHeight' {  } -> `Int' #}
flcHeight ::  IO (Int)
flcHeight  = flcHeight'

{# fun unsafe flc_set_height as flcSetHeight' { `Int',`Int' } -> `Int' #}
flcSetHeight :: Int -> Int ->  IO (Int)
flcSetHeight font' size' = flcSetHeight' font' size'

{# fun unsafe flc_descent as flcDescent' {  } -> `Int' #}
flcDescent ::  IO (Int)
flcDescent  = flcDescent'

{# fun unsafe flc_width as flcWidth' { `String' } -> `Double' #}
flcWidth :: String ->  IO (Double)
flcWidth txt = flcWidth' txt

{# fun unsafe flc_width_with_n as flcWidthWithN' { `String',`Int' } -> `Double' #}
flcWidthWithN :: String -> Int ->  IO (Double)
flcWidthWithN txt n = flcWidthWithN' txt n

{# fun unsafe flc_width_with_c as flcWidthWithC' { `Int' } -> `Double' #}
flcWidthWithC :: Int ->  IO (Double)
flcWidthWithC c = flcWidthWithC' c

{# fun unsafe flc_text_extents as flcTextExtents' { `String',alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv* } -> `()' #}
flcTextExtents :: String -> IO (Rectangle)
flcTextExtents s  = flcTextExtents' s >>= \(rectangle') -> return $ (toRectangle rectangle')

{# fun unsafe flc_text_extents_with_n as flcTextExtentsWithN' { `String',`Int',alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv* } -> `()' #}
flcTextExtentsWithN :: String -> Int ->  IO (Rectangle)
flcTextExtentsWithN t n  = flcTextExtentsWithN' t n >>= \(rectangle') -> return $ (toRectangle rectangle')

{# fun unsafe flc_latin1_to_local as flcLatin1ToLocal' { `String' } -> `String' #}
flcLatin1ToLocal :: String ->  IO (String)
flcLatin1ToLocal t = flcLatin1ToLocal' t

{# fun unsafe flc_latin1_to_local_with_n as flcLatin1ToLocalWithN' { `String',`Int' } -> `String' #}
flcLatin1ToLocalWithN :: String -> Int ->  IO (String)
flcLatin1ToLocalWithN t n = flcLatin1ToLocalWithN' t n

{# fun unsafe flc_local_to_latin1 as flcLocalToLatin1' { `String' } -> `String' #}
flcLocalToLatin1 :: String ->  IO (String)
flcLocalToLatin1 t = flcLocalToLatin1' t

{# fun unsafe flc_local_to_latin1_with_n as flcLocalToLatin1WithN' { `String',`Int' } -> `String' #}
flcLocalToLatin1WithN :: String -> Int ->  IO (String)
flcLocalToLatin1WithN t n = flcLocalToLatin1WithN' t n

{# fun unsafe flc_mac_roman_to_local as flcMacRomanToLocal' { `String' } -> `String' #}
flcMacRomanToLocal :: String ->  IO (String)
flcMacRomanToLocal t = flcMacRomanToLocal' t

{# fun unsafe flc_mac_roman_to_local_with_n as flcMacRomanToLocalWithN' { `String',`Int' } -> `String' #}
flcMacRomanToLocalWithN :: String -> Int ->  IO (String)
flcMacRomanToLocalWithN t n = flcMacRomanToLocalWithN' t n

{# fun unsafe flc_local_to_mac_roman as flcLocalToMacRoman' { `String' } -> `String' #}
flcLocalToMacRoman :: String ->  IO (String)
flcLocalToMacRoman t = flcLocalToMacRoman' t

{# fun unsafe flc_local_to_mac_roman_with_n as flcLocalToMacRomanWithN' { `String',`Int' } -> `String' #}
flcLocalToMacRomanWithN :: String -> Int ->  IO (String)
flcLocalToMacRomanWithN t n = flcLocalToMacRomanWithN' t n

{# fun unsafe flc_draw as flcDraw' { `String',`Int',`Int' } -> `()' #}
flcDraw :: String -> Position ->  IO ()
flcDraw str (Position (X x_pos') (Y y_pos')) = flcDraw' str x_pos' y_pos'

{# fun unsafe flc_draw_with_angle as flcDrawWithAngle' { `Int',`String',`Int',`Int' } -> `()' #}
flcDrawWithAngle :: Int -> String -> Position ->  IO ()
flcDrawWithAngle angle str (Position (X x_pos') (Y y_pos')) = flcDrawWithAngle' angle str x_pos' y_pos'

{# fun unsafe flc_draw_with_n as flcDrawWithN' { `String',`Int',`Int',`Int' } -> `()' #}
flcDrawWithN :: String -> Int -> Position ->  IO ()
flcDrawWithN str n (Position (X x_pos') (Y y_pos')) = flcDrawWithN' str n x_pos' y_pos'

{# fun unsafe flc_draw_with_n_angle as flcDrawWithNAngle' { `Int',`String',`Int',`Int',`Int' } -> `()' #}
flcDrawWithNAngle :: Int -> String -> Int -> Position ->  IO ()
flcDrawWithNAngle angle str n (Position (X x_pos') (Y y_pos')) = flcDrawWithNAngle' angle str n x_pos' y_pos'

{# fun unsafe flc_rtl_draw as flcRtlDraw' { `String',`Int',`Int',`Int' } -> `()' #}
flcRtlDraw :: String -> Int -> Position ->  IO ()
flcRtlDraw str n (Position (X x_pos') (Y y_pos')) = flcRtlDraw' str n x_pos' y_pos'

{# fun unsafe flc_measure_with_draw_symbols as flcMeasureWithDrawSymbols' { `String',alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*,`Int' } -> `()' #}
flcMeasure :: String -> Maybe Bool -> IO (Size)
flcMeasure str draw_symbols =
    let _draw_symbols = maybe 0 fromBool draw_symbols in
    flcMeasureWithDrawSymbols' str _draw_symbols >>= \(size') -> return $ (toSize size')

{# fun flc_draw_with_img_draw_symbols as flcDrawWithImgDrawSymbols' { `String',`Int',`Int',`Int',`Int',cFromEnum `AlignType', id `Ptr ()',`Bool' } -> `()' #}
{# fun flc_draw_with_callthis_img_draw_symbols as flcDrawWithCallthisImgDrawSymbols' { `String',`Int',`Int',`Int',`Int',cFromEnum `AlignType', id `FunPtr DrawCallbackPrim', id `Ptr ()',`Bool' } -> `()' #}
flcDrawInBoundingBox :: String -> Rectangle -> AlignType -> Maybe DrawCallback -> Maybe (Image a) -> Maybe Bool -> IO ()
flcDrawInBoundingBox string' rectangle' align' draw_callback' image' draw_flags'
  = let (x_pos', y_pos', width', height') = fromRectangle rectangle'
    in
      withMaybeObject image' $ \image_ptr -> do
          case draw_callback' of 
            Nothing -> flcDrawWithImgDrawSymbols' string' x_pos' y_pos' width' height' align' image_ptr (maybe False id draw_flags') 
            Just c' -> do 
              fptr <- toDrawCallback c'
              flcDrawWithCallthisImgDrawSymbols' string' x_pos' y_pos' width' height' align' fptr image_ptr (maybe False id draw_flags')

{# fun unsafe flc_frame as flcFrame' { `String',`Int',`Int',`Int',`Int' } -> `()' #}
flcFrame :: String -> Rectangle ->  IO ()
flcFrame s rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcFrame' s x_pos' y_pos' width' height'

{# fun unsafe flc_frame2 as flcFrame2' { `String',`Int',`Int',`Int',`Int' } -> `()' #}
flcFrame2 :: String -> Rectangle ->  IO ()
flcFrame2 s rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcFrame2' s x_pos' y_pos' width' height'

{# fun unsafe flc_draw_box as flcDrawBox' { cFromEnum `Boxtype',`Int',`Int',`Int',`Int',cFromColor `Color' } -> `()' #}
flcDrawBox :: Boxtype -> Rectangle -> Color ->  IO ()
flcDrawBox boxtype rectangle color' = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcDrawBox' boxtype x_pos' y_pos' width' height' color'

{# fun unsafe flc_draw_image_buf_with_d_l as flcDrawImageBufWithDL' { id `Ptr CUChar',`Int',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
flcDrawImageBuf :: ByteString -> Rectangle -> Delta -> LineDelta -> IO ()
flcDrawImageBuf buf rectangle d l =
  let (x_pos', y_pos', width', height') = fromRectangle rectangle
  in unsafeUseAsCString
       buf
       (\cs ->
         case (d,l) of
           (Just d', Nothing) -> flcDrawImageBufWithDL' (castPtr cs) x_pos' y_pos' width' height' d' 0
           (Nothing, Just l') -> flcDrawImageBufWithDL' (castPtr cs) x_pos' y_pos' width' height' 0 l'
           (Nothing, Nothing) -> flcDrawImageBufWithDL' (castPtr cs) x_pos' y_pos' width' height' 0 0
           (Just d', Just l') -> flcDrawImageBufWithDL' (castPtr cs) x_pos' y_pos' width' height' d' l')

{# fun unsafe flc_draw_image_mono_buf_with_d_l as flcDrawImageMonoBufWithDL' { id `Ptr CUChar',`Int',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
flcDrawImageMonoBuf :: ByteString -> Rectangle -> Delta -> LineDelta ->  IO ()
flcDrawImageMonoBuf buf rectangle d l =
  let (x_pos', y_pos', width', height') = fromRectangle rectangle
  in unsafeUseAsCString
       buf
       (\cs ->
         case (d,l) of
           (Just d', Nothing) -> flcDrawImageMonoBufWithDL' (castPtr cs) x_pos' y_pos' width' height' d' 0
           (Nothing, Just l') -> flcDrawImageMonoBufWithDL' (castPtr cs) x_pos' y_pos' width' height' 0 l'
           (Nothing, Nothing) -> flcDrawImageMonoBufWithDL' (castPtr cs) x_pos' y_pos' width' height' 0 0
           (Just d', Just l') -> flcDrawImageMonoBufWithDL' (castPtr cs) x_pos' y_pos' width' height' d' l')

{# fun unsafe flc_can_do_alpha_blending as flcCanDoAlphaBlending' {  } -> `Bool' cToBool #}
flcCanDoAlphaBlending ::  IO (Bool)
flcCanDoAlphaBlending  = flcCanDoAlphaBlending'

{# fun unsafe flc_read_image_with_alpha as flcReadImageWithAlpha' { id `Ptr CUChar', `Int',`Int',`Int',`Int',`Bool' } -> `Ptr CUChar' id #}
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

{# fun unsafe flc_draw_pixmap_with_color as flcDrawPixmapWithColor' { id `(Ptr (Ptr CChar))',`Int',`Int',cFromColor `Color' } -> `Int' #}
flcDrawPixmapWithColor :: PixmapHs -> Position -> Color ->  IO (Int)
flcDrawPixmapWithColor pixmap (Position (X x_pos') (Y y_pos')) color' =
    withPixmap pixmap $ \pptr -> flcDrawPixmapWithColor' pptr x_pos' y_pos' color'

{# fun unsafe flc_draw_pixmap as flcDrawPixmap' { id `(Ptr(Ptr CChar))',`Int',`Int' } -> `Int' #}
flcDrawPixmap :: PixmapHs -> Position ->  IO (Int)
flcDrawPixmap pixmap (Position (X x_pos') (Y y_pos')) =
    withPixmap pixmap $ \pptr -> flcDrawPixmap' pptr x_pos' y_pos'

{# fun unsafe flc_draw_pixmap_with_cdata_color as flcDrawPixmapWithCdataColor' { id `(Ptr (Ptr CChar))',`Int',`Int',cFromColor `Color' } -> `Int' #}
flcDrawPixmapWithCdataColor :: PixmapHs -> Position -> Color ->  IO (Int)
flcDrawPixmapWithCdataColor pixmap (Position (X x_pos') (Y y_pos')) color' =
    withPixmap pixmap $ \pptr -> flcDrawPixmapWithCdataColor' pptr x_pos' y_pos' color'

{# fun unsafe flc_draw_pixmap_with_cdata as flcDrawPixmapWithCdata' { id `(Ptr (Ptr CChar))',`Int',`Int' } -> `Int' #}
flcDrawPixmapWithCdata :: PixmapHs -> Position ->  IO (Int)
flcDrawPixmapWithCdata pixmap (Position (X x_pos') (Y y_pos')) =
    withPixmap pixmap $ \pptr -> flcDrawPixmapWithCdata' pptr x_pos' y_pos'

{# fun unsafe flc_measure_pixmap as flcMeasurePixmap' { id `(Ptr (Ptr CChar))',alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv* } -> `Int' #}
flcMeasurePixmap :: PixmapHs ->  IO (Int,Size)
flcMeasurePixmap pixmap =
    withPixmap pixmap $ \pptr ->
        flcMeasurePixmap' pptr >>= \(result, width', height') ->
            return $ (result, toSize (width', height'))

{# fun unsafe flc_measure_pixmap_with_cdata as flcMeasurePixmapWithCdata' { id `(Ptr (Ptr CChar))',alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv* } -> `Int' #}
flcMeasurePixmapWithCdata :: PixmapHs ->  IO (Int,Size)
flcMeasurePixmapWithCdata pixmap  =
    withPixmap pixmap (\pptr -> do
                         (result, width', height') <- flcMeasurePixmapWithCdata' pptr
                         return (result, toSize (width', height'))
                      )

{# fun unsafe flc_shortcut_label as flcShortcutLabel' { `Int' } -> `String' #}
flcShortcutLabel :: Int ->  IO (String)
flcShortcutLabel shortcut = flcShortcutLabel' shortcut

{# fun unsafe flc_old_shortcut as flcOldShortcut' { `String' } -> `Int' #}
flcOldShortcut :: String -> IO (Int)
flcOldShortcut s = flcOldShortcut' s

{# fun unsafe flc_overlay_rect as flcOverlayRect' { `Int',`Int',`Int',`Int' } -> `()' #}
flcOverlayRect :: Rectangle ->  IO ()
flcOverlayRect rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcOverlayRect' x_pos' y_pos' width' height'

{# fun unsafe flc_overlay_clear as flcOverlayClear' {  } -> `()' #}
flcOverlayClear ::  IO ()
flcOverlayClear  = flcOverlayClear'

{# fun unsafe flc_cursor_with_fg_bg as flcCursorWithFgBg' { cFromEnum `Cursor',cFromColor `Color',cFromColor `Color' } -> `()' #}
flcCursorWithFgBg :: Cursor -> Color -> Color ->  IO ()
flcCursorWithFgBg cursore fg bg = flcCursorWithFgBg' cursore fg bg

{# fun unsafe flc_cursor_with_fg as flcCursorWithFg' { cFromEnum `Cursor',cFromColor `Color' } -> `()' #}
flcCursorWithFg :: Cursor -> Color ->  IO ()
flcCursorWithFg cursor fg = flcCursorWithFg' cursor fg

{# fun unsafe flc_cursor_with_bg as flcCursorWithBg' { cFromEnum `Cursor',cFromColor `Color' } -> `()' #}
flcCursorWithBg :: Cursor -> Color ->  IO ()
flcCursorWithBg cursor bg = flcCursorWithBg' cursor bg

{# fun unsafe flc_cursor as flcCursor' { cFromEnum `Cursor' } -> `()' #}
flcCursor :: Cursor ->  IO ()
flcCursor cursor = flcCursor' cursor

{# fun unsafe flc_set_status as flcSetStatus' { `Int',`Int',`Int',`Int' } -> `()' #}
flcSetStatus :: Rectangle ->  IO ()
flcSetStatus rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcSetStatus' x_pos' y_pos' width' height'

{# fun unsafe flc_set_spot_with_win as flcSetSpotWithWin' { `Int',`Int',`Int',`Int',`Int',`Int',id `Ptr ()' } -> `()' #}
flcSetSpotWithWin :: Int -> Int -> Rectangle -> Window a  ->  IO ()
flcSetSpotWithWin font' size' rectangle win = let (x_pos', y_pos', width', height') = fromRectangle rectangle in withObject win $ \winPtr -> flcSetSpotWithWin' font' size' x_pos' y_pos' width' height' winPtr

{# fun unsafe flc_set_spot as flcSetSpot' { `Int',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
flcSetSpot :: Int -> Int -> Rectangle ->  IO ()
flcSetSpot font' size' rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcSetSpot' font' size' x_pos' y_pos' width' height'

{# fun unsafe flc_reset_spot as flcResetSpot' {  } -> `()' #}
flcResetSpot ::  IO ()
flcResetSpot  = flcResetSpot'

{# fun unsafe flc_draw_symbol as flcDrawSymbol' { `String',`Int',`Int',`Int',`Int',cFromColor `Color' } -> `Int' #}
flcDrawSymbol :: String -> Rectangle -> Color ->  IO (Int)
flcDrawSymbol label rectangle color' = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcDrawSymbol' label x_pos' y_pos' width' height' color'
