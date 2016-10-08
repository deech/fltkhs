{-# LANGUAGE CPP, FlexibleContexts #-}
module Graphics.UI.FLTK.LowLevel.Gl
  (
   glStart,
   glFinish,
   glHeight,
   glDescent,
   glColor,
   glRect,
   glRectf,
   glFont,
   glWidth,
   glWidthChars,
   glWidthChar,
   glDraw,
   glDrawChars,
   glDrawAt,
   glDrawCharsAt,
   glDrawInBox,
   glMeasure,
   glDrawImage
  )
where
#include "Fl_C.h"
#include "glC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Utils
import qualified Data.Text as T
{# fun flc_gl_start   as glStart   { } -> `()' #}
{# fun flc_gl_finish  as glFinish  { } -> `()' #}
{# fun flc_gl_height  as glHeight  { } -> `()' #}
{# fun flc_gl_descent as glDescent { } -> `()' #}

{# fun flc_gl_color   as glColor {cFromColor `Color'} -> `()' #}

{# fun flc_gl_rect as flcGlRect' { `Int',`Int',`Int',`Int' } -> `()' #}
glRect :: Rectangle ->  IO ()
glRect rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcGlRect' x_pos' y_pos' width' height'

{# fun flc_gl_rectf as flcGlRectf' { `Int',`Int',`Int',`Int' } -> `()' #}
glRectf :: Rectangle ->  IO ()
glRectf rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcGlRectf' x_pos' y_pos' width' height'
{# fun flc_gl_font as flcGlFont' {cFromFont `Font',`Int' } -> `()' #}
glFont :: Font -> Int ->  IO ()
glFont fontid size = flcGlFont' fontid size

{# fun flc_gl_width as flcGlWidth' { unsafeToCString `T.Text' } -> `Double' #}
glWidth :: T.Text ->  IO (Double)
glWidth str = flcGlWidth' str

{# fun flc_gl_width_with_n as flcGlWidthWithN' { unsafeToCString `T.Text',`Int' } -> `Double' #}
glWidthChars :: T.Text -> Int ->  IO (Double)
glWidthChars str n = flcGlWidthWithN' str n

{# fun flc_gl_width_with_uchar_str as flcGlWidthWithUcharStr' { castCharToCUChar `Char' } -> `Double' #}
glWidthChar :: Char ->  IO (Double)
glWidthChar str = flcGlWidthWithUcharStr' str

{# fun flc_gl_draw as flcGlDraw' { unsafeToCString `T.Text' } -> `()' #}
glDraw :: T.Text ->  IO ()
glDraw str = flcGlDraw' str

{# fun flc_gl_draw_with_n as flcGlDrawWithN' { unsafeToCString `T.Text',`Int' } -> `()' #}
glDrawChars :: T.Text -> Int ->  IO ()
glDrawChars str n = flcGlDrawWithN' str n

{# fun flc_gl_draw_with_xy as flcGlDrawWithXy' { unsafeToCString `T.Text',`Float',`Float' } -> `()' #}
glDrawAt :: T.Text -> Float -> Float ->  IO ()
glDrawAt str x y = flcGlDrawWithXy' str x y

{# fun flc_gl_draw_with_nxy as flcGlDrawWithNxy' { unsafeToCString `T.Text',`Int',`Float',`Float' } -> `()' #}
glDrawCharsAt :: T.Text -> Int -> Float -> Float ->  IO ()
glDrawCharsAt str n x y = flcGlDrawWithNxy' str n x y

{# fun flc_gl_draw_with_xywh_align as flcGlDrawWithXywhAlign' { unsafeToCString `T.Text',`Int',`Int',`Int',`Int',cFromEnum `AlignType' } -> `()' #}
glDrawInBox :: T.Text -> Rectangle -> AlignType ->  IO ()
glDrawInBox str rectangle align = let (x_pos', y_pos', width', height') = fromRectangle rectangle in flcGlDrawWithXywhAlign' str x_pos' y_pos' width' height' align

{# fun flc_gl_measure as flcGlMeasure' { unsafeToCString `T.Text',`Int',`Int' } -> `()' #}
glMeasure :: T.Text -> Position ->  IO ()
glMeasure str (Position (X x_pos') (Y y_pos')) = flcGlMeasure' str x_pos' y_pos'

{# fun flc_gl_draw_image_with_d_ld as flcGlDrawImageWithDLd' { id `Ptr CUChar',`Int',`Int',`Int',`Int',`Int', `Int'} -> `()' #}
glDrawImage :: BitmapHs -> Position -> Maybe Depth -> Maybe LineSize -> IO ()
glDrawImage bitmap' (Position (X x_pos') (Y y_pos')) depth' linesize' =
  let d = maybe 0 (\(Depth d') -> d') depth'
      l = maybe 0 (\(LineSize l') -> l') linesize'
  in
  withBitmap bitmap' $ \ptr width' height' -> flcGlDrawImageWithDLd' (castPtr ptr) x_pos' y_pos' width' height' d l
