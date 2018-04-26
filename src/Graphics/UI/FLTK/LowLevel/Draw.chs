{-# LANGUAGE CPP, FlexibleContexts #-}
module Graphics.UI.FLTK.LowLevel.Draw
       (
       LineStyle(..),
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
       flcSetHeight,
       flcDescent,
       flcWidth,
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
       flcDrawSymbol
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

{# fun flc_not_clipped as flcNotClipped' { `Int',`Int',`Int',`Int' } -> `Int' #}
flcNotClipped :: Rectangle ->  IO (Int)
flcNotClipped rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcNotClipped' x_pos' y_pos' width' height'

{# fun flc_clip_box as flcClipBox' { `Int',`Int',`Int',`Int',alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv* } -> `Int' #}
flcClipBox :: Rectangle ->  IO (Int,Rectangle)
flcClipBox rectangle  =
    let (x_pos', y_pos', width', height') = fromRectangle rectangle
    in
      do
        (result, _x', _y', _w', _h') <- flcClipBox' x_pos' y_pos' width' height'
        return $ (result, toRectangle (_x', _y', _w', _h'))

{# fun flc_restore_clip as flcRestoreClip' {  } -> `()' #}
flcRestoreClip ::  IO ()
flcRestoreClip  = flcRestoreClip'

{# fun flc_set_clip_region as flcSetClipRegion' { id `Ptr ()' } -> `()' #}
flcSetClipRegion :: Ref Region ->  IO ()
flcSetClipRegion r = withRef r $ \rPtr -> flcSetClipRegion' rPtr

{# fun flc_clip_region as flcClipRegion' {  } -> `Ptr ()' id #}
flcClipRegion ::  IO (Maybe (Ref Region))
flcClipRegion  = flcClipRegion' >>= toMaybeRef

{# fun flc_point as flcPoint' { `Int',`Int' } -> `()' #}
flcPoint :: Position ->  IO ()
flcPoint (Position (X x_pos') (Y y_pos')) = flcPoint' x_pos' y_pos'

{# fun flc_line_style_with_width_dashes as flcLineStyleWithWidthDashes' {cFromEnum `LineStyle', `Int', id `Ptr CChar' } -> `()' #}
flcLineStyle :: LineStyle -> Maybe Width -> Maybe T.Text -> IO ()
flcLineStyle style width' dashes' = do
  let _width = case width' of { Just (Width w) -> w ; _ -> 0 }
  _dashes <- maybe (return nullPtr) copyTextToCString dashes'
  flcLineStyleWithWidthDashes' style _width _dashes

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
flcArcByWidthHeight :: Rectangle -> Double -> Double ->  IO ()
flcArcByWidthHeight rectangle a1 a2 = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcArcByWidthHeight' x_pos' y_pos' width' height' a1 a2

{# fun flc_pie as flcPie' { `Int',`Int',`Int',`Int',`Double',`Double' } -> `()' #}
flcPie :: Rectangle -> Double -> Double ->  IO ()
flcPie rectangle a1 a2 = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcPie' x_pos' y_pos' width' height' a1 a2

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
flcRotate :: Double ->  IO ()
flcRotate d = flcRotate' d

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
flcVertex :: ByXY ->  IO ()
flcVertex (ByXY (ByX by_x') (ByY by_y')) = flcVertex' by_x' by_y'

{# fun flc_curve as flcCurve' { `Double',`Double',`Double',`Double',`Double',`Double',`Double',`Double' } -> `()' #}
flcCurve :: Double -> Double -> Double -> Double -> Double -> Double -> Double -> Double ->  IO ()
flcCurve x0 y0 x1 y1 x2 y2 x3 y3 = flcCurve' x0 y0 x1 y1 x2 y2 x3 y3

{# fun flc_arc_by_radius as flcArcByRadius' { `Double',`Double',`Double',`Double',`Double' } -> `()' #}
flcArcByRadius :: ByXY -> Double -> Double -> Double ->  IO ()
flcArcByRadius (ByXY (ByX by_x') (ByY by_y')) r start' end' = flcArcByRadius' by_x' by_y' r start' end'

{# fun flc_circle as flcCircle' { `Double',`Double',`Double' } -> `()' #}
flcCircle :: ByXY -> Double ->  IO ()
flcCircle (ByXY (ByX by_x') (ByY by_y')) r = flcCircle' by_x' by_y' r

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
flcTransformedVertex :: Double -> Double ->  IO ()
flcTransformedVertex xf yf = flcTransformedVertex' xf yf

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
flcHeight ::  IO (Int)
flcHeight  = flcHeight'

{# fun flc_set_height as flcSetHeight' { `Int',`CInt' } -> `Int' #}
flcSetHeight :: Font -> FontSize ->  IO (Int)
flcSetHeight (Font font') (FontSize size') = flcSetHeight' font' size'

{# fun flc_descent as flcDescent' {  } -> `Int' #}
flcDescent ::  IO (Int)
flcDescent  = flcDescent'

{# fun flc_width as flcWidth' { unsafeToCString `T.Text' } -> `Double' #}
flcWidth :: T.Text ->  IO (Double)
flcWidth txt = flcWidth' txt

{# fun flc_width_with_c as flcWidthWithC' { `Int' } -> `Double' #}
flcWidthOfChar :: Int ->  IO (Double)
flcWidthOfChar c = flcWidthWithC' c

{# fun flc_text_extents as flcTextExtents' { unsafeToCString `T.Text',alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv* } -> `()' #}
flcTextExtents :: T.Text -> IO (Rectangle)
flcTextExtents s  = flcTextExtents' s >>= \(rectangle') -> return $ (toRectangle rectangle')

{# fun flc_latin1_to_local as flcLatin1ToLocal' { unsafeToCString `T.Text' } -> `T.Text' unsafeFromCString #}
flcLatin1ToLocal :: T.Text ->  IO  T.Text
flcLatin1ToLocal t = flcLatin1ToLocal' t

{# fun flc_local_to_latin1 as flcLocalToLatin1' { unsafeToCString `T.Text' } -> `T.Text' unsafeFromCString #}
flcLocalToLatin1 :: T.Text ->  IO  T.Text
flcLocalToLatin1 t = flcLocalToLatin1' t

{# fun flc_mac_roman_to_local as flcMacRomanToLocal' { unsafeToCString `T.Text' } -> `T.Text' unsafeFromCString #}
flcMacRomanToLocal :: T.Text ->  IO  T.Text
flcMacRomanToLocal t = flcMacRomanToLocal' t

{# fun flc_local_to_mac_roman as flcLocalToMacRoman' { unsafeToCString `T.Text' } -> `T.Text' unsafeFromCString #}
flcLocalToMacRoman :: T.Text ->  IO  T.Text
flcLocalToMacRoman t = flcLocalToMacRoman' t

{# fun flc_draw as flcDraw' { unsafeToCString `T.Text',`Int',`Int' } -> `()' #}
flcDraw :: T.Text -> Position ->  IO ()
flcDraw str (Position (X x_pos') (Y y_pos')) = flcDraw' str x_pos' y_pos'

{# fun flc_draw_with_angle as flcDrawWithAngle' { `Int',unsafeToCString `T.Text',`Int',`Int' } -> `()' #}
flcDrawWithAngle :: Int -> T.Text -> Position ->  IO ()
flcDrawWithAngle angle str (Position (X x_pos') (Y y_pos')) = flcDrawWithAngle' angle str x_pos' y_pos'

{# fun flc_rtl_draw as flcRtlDraw' { unsafeToCString `T.Text',`Int',`Int',`Int' } -> `()' #}
flcRtlDraw :: T.Text -> Int -> Position ->  IO ()
flcRtlDraw str n (Position (X x_pos') (Y y_pos')) = flcRtlDraw' str n x_pos' y_pos'

{# fun flc_measure_with_draw_symbols as flcMeasureWithDrawSymbols' { unsafeToCString `T.Text', id `Ptr CInt', id `Ptr CInt', `CInt' } -> `()' #}
flcMeasure :: T.Text -> Bool -> Bool -> IO (Size)
flcMeasure str word_wrap draw_symbols =
  alloca $ \widthPtr' ->
  alloca $ \heightPtr' ->
  let doit = do
       flcMeasureWithDrawSymbols' str widthPtr' heightPtr' (fromBool draw_symbols)
       w' <- peekIntConv widthPtr'
       h' <- peekIntConv heightPtr'
       return $ toSize (w',h')
  in
  if word_wrap
  then poke widthPtr' 1 >> doit
  else doit

{# fun flc_draw_with_img_draw_symbols as flcDrawWithImgDrawSymbols' { unsafeToCString `T.Text',`Int',`Int',`Int',`Int',`Int', id `Ptr ()',`Bool' } -> `()' #}
{# fun flc_draw_with_callthis_img_draw_symbols as flcDrawWithCallthisImgDrawSymbols' { unsafeToCString `T.Text',`Int',`Int',`Int',`Int',`Int', id `FunPtr DrawCallbackPrim', id `Ptr ()',`Bool' } -> `()' #}
flcDrawInBoxWithImageReference' ::  T.Text -> Rectangle -> Alignments -> Maybe DrawCallback -> Ptr () -> Maybe Bool -> IO ()
flcDrawInBoxWithImageReference' string' rectangle' align' draw_callback' image_ptr draw_flags' =
  let (x_pos', y_pos', width', height') = fromRectangle rectangle' in
  case draw_callback' of
  Nothing -> flcDrawWithImgDrawSymbols' string' x_pos' y_pos' width' height' (alignmentsToInt align') image_ptr (maybe False id draw_flags')

  Just c' -> do
             fptr <- toDrawCallback c'
             flcDrawWithCallthisImgDrawSymbols' string' x_pos' y_pos' width' height' (alignmentsToInt align') fptr image_ptr (maybe False id draw_flags')
flcDrawInBoxWithImageReference :: (Parent a Image) => T.Text -> Rectangle -> Alignments -> Maybe DrawCallback -> Ref a -> Maybe Bool -> IO ()
flcDrawInBoxWithImageReference string' rectangle' align' draw_callback' image' draw_flags'
  = withRef image' $ \imagePtr' -> flcDrawInBoxWithImageReference' string' rectangle' align' draw_callback' imagePtr' draw_flags'

flcDrawInBox :: T.Text -> Rectangle -> Alignments -> Maybe DrawCallback -> Maybe Bool -> IO ()
flcDrawInBox string' rectangle' align' draw_callback' draw_flags'
  = flcDrawInBoxWithImageReference' string' rectangle' align' draw_callback' (castPtr nullPtr) draw_flags'

{# fun flc_frame as flcFrame' { unsafeToCString `T.Text',`Int',`Int',`Int',`Int' } -> `()' #}
flcFrame :: T.Text -> Rectangle ->  IO ()
flcFrame s rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcFrame' s x_pos' y_pos' width' height'

{# fun flc_frame2 as flcFrame2' { unsafeToCString `T.Text',`Int',`Int',`Int',`Int' } -> `()' #}
flcFrame2 :: T.Text -> Rectangle ->  IO ()
flcFrame2 s rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcFrame2' s x_pos' y_pos' width' height'

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
flcDrawPixmapWithColor :: PixmapHs -> Position -> Color ->  IO (Int)
flcDrawPixmapWithColor pixmap (Position (X x_pos') (Y y_pos')) color' =
    withPixmap pixmap $ \pptr -> flcDrawPixmapWithColor' pptr x_pos' y_pos' color'

{# fun flc_draw_pixmap as flcDrawPixmap' { id `(Ptr(Ptr CChar))',`Int',`Int' } -> `Int' #}
flcDrawPixmap :: PixmapHs -> Position ->  IO (Int)
flcDrawPixmap pixmap (Position (X x_pos') (Y y_pos')) =
    withPixmap pixmap $ \pptr -> flcDrawPixmap' pptr x_pos' y_pos'

{# fun flc_draw_pixmap_with_cdata_color as flcDrawPixmapWithCdataColor' { id `(Ptr (Ptr CChar))',`Int',`Int',cFromColor `Color' } -> `Int' #}
flcDrawPixmapWithCdataColor :: PixmapHs -> Position -> Color ->  IO (Int)
flcDrawPixmapWithCdataColor pixmap (Position (X x_pos') (Y y_pos')) color' =
    withPixmap pixmap $ \pptr -> flcDrawPixmapWithCdataColor' pptr x_pos' y_pos' color'

{# fun flc_draw_pixmap_with_cdata as flcDrawPixmapWithCdata' { id `(Ptr (Ptr CChar))',`Int',`Int' } -> `Int' #}
flcDrawPixmapWithCdata :: PixmapHs -> Position ->  IO (Int)
flcDrawPixmapWithCdata pixmap (Position (X x_pos') (Y y_pos')) =
    withPixmap pixmap $ \pptr -> flcDrawPixmapWithCdata' pptr x_pos' y_pos'

{# fun flc_measure_pixmap as flcMeasurePixmap' { id `(Ptr (Ptr CChar))',alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv* } -> `Int' #}
flcMeasurePixmap :: PixmapHs ->  IO (Int,Size)
flcMeasurePixmap pixmap =
    withPixmap pixmap $ \pptr ->
        flcMeasurePixmap' pptr >>= \(result, width', height') ->
            return $ (result, toSize (width', height'))

{# fun flc_measure_pixmap_with_cdata as flcMeasurePixmapWithCdata' { id `(Ptr (Ptr CChar))',alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv* } -> `Int' #}
flcMeasurePixmapWithCdata :: PixmapHs ->  IO (Int,Size)
flcMeasurePixmapWithCdata pixmap  =
    withPixmap pixmap (\pptr -> do
                         (result, width', height') <- flcMeasurePixmapWithCdata' pptr
                         return (result, toSize (width', height'))
                      )

{# fun flc_shortcut_label as flcShortcutLabel' { `CInt' } -> `T.Text' unsafeFromCString #}
flcShortcutLabel :: ShortcutKeySequence ->  IO  T.Text
flcShortcutLabel (ShortcutKeySequence eventstates keytype) =
   flcShortcutLabel' (keySequenceToCInt eventstates keytype)

{# fun flc_old_shortcut as flcOldShortcut' { unsafeToCString `T.Text' } -> `Int' #}
flcOldShortcut :: T.Text -> IO (Int)
flcOldShortcut s = flcOldShortcut' s

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

{# fun flc_draw_symbol as flcDrawSymbol' { unsafeToCString `T.Text',`Int',`Int',`Int',`Int',cFromColor `Color' } -> `Int' #}
flcDrawSymbol :: T.Text -> Rectangle -> Color ->  IO (Either UnknownError ())
flcDrawSymbol label rectangle color' =
  let (x_pos', y_pos', width', height') = fromRectangle rectangle
  in do
  res <- flcDrawSymbol' label x_pos' y_pos' width' height' color'
  if (res == 0)
  then return (Right ())
  else return (Left UnknownError)
