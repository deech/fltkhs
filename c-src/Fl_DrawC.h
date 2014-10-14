#ifndef __FL_DRAW_C__
#define __FL_DRAW_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/fl_draw.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  typedef void (*Fl_Draw_Image_Cb)(void* data,int x,int y,int w,uchar* buf);
  FL_EXPORT_C(void      , flc_set_color)(Fl_Color c);
  FL_EXPORT_C(void      , flc_set_color_with_c)(int c);
  FL_EXPORT_C(void      , flc_set_color_with_rgb)(uchar r, uchar g, uchar b); // select actual color
  FL_EXPORT_C(Fl_Color  , flc_color)();
  FL_EXPORT_C(void      , flc_push_clip)(int x, int y, int w, int h);
#define fl_clipc fl_push_clipc
  FL_EXPORT_C(void      , flc_push_no_clip)();
  FL_EXPORT_C(void      , flc_pop_clip)();
  FL_EXPORT_C(int       , flc_not_clipped)(int x, int y, int w, int h);
  FL_EXPORT_C(int       , flc_clip_box)(int x , int y, int w, int h, int* X, int* Y, int* W, int* H);
  FL_EXPORT_C(void      , flc_restore_clip)();
  FL_EXPORT_C(void      , flc_set_clip_region)(fl_Region r);
  FL_EXPORT_C(fl_Region , flc_clip_region)();
  FL_EXPORT_C(void      , flc_point)(int x, int y);
  FL_EXPORT_C(void      , flc_line_style_with_width_dashes)(int style, int width, char* dashes);
  FL_EXPORT_C(void      , flc_line_style_with_dashes)(int style, char* dashes);
  FL_EXPORT_C(void      , flc_line_style_with_width)(int style, int width);
  FL_EXPORT_C(void      , flc_line_style)(int style);
#ifndef INTERNAL_LINKAGE  
  enum {
    FL_SOLID    = 0,
    FL_DASH     = 1,
    FL_DOT      = 2,
    FL_DASHDOT  = 3,
    FL_DASHDOTDOT       = 4,

    FL_CAP_FLAT = 0x100,
    FL_CAP_ROUND        = 0x200,
    FL_CAP_SQUARE       = 0x300,

    FL_JOIN_MITER       = 0x1000,
    FL_JOIN_ROUND       = 0x2000,
    FL_JOIN_BEVEL       = 0x3000
  };
#endif
  FL_EXPORT_C(void         , flc_rect)(int x, int y, int w, int h);
  FL_EXPORT_C(void         , flc_rect_with_color)(int x, int y, int w, int h, Fl_Color c);
  FL_EXPORT_C(void         , flc_rectf)(int x, int y, int w, int h);
  FL_EXPORT_C(void         , flc_rectf_with_color)(int x, int y, int w, int h, Fl_Color c);
  FL_EXPORT_C(void         , flc_rectf_with_rgb)(int x, int y, int w, int h, uchar r, uchar g, uchar b);
  FL_EXPORT_C(void         , flc_line)(int x, int y, int x1, int y1);
  FL_EXPORT_C(void         , flc_line_with_x2_y2)(int x, int y, int x1, int y1, int x2, int y2);
  FL_EXPORT_C(void         , flc_loop)(int x, int y, int x1, int y1, int x2, int y2);
  FL_EXPORT_C(void         , flc_loop_with_x3_y3)(int x, int y, int x1, int y1, int x2, int y2, int x3, int y3);
  FL_EXPORT_C(void         , flc_polygon)(int x, int y, int x1, int y1, int x2, int y2);
  FL_EXPORT_C(void         , flc_polygon_with_x3_y3)(int x, int y, int x1, int y1, int x2, int y2, int x3, int y3);
  FL_EXPORT_C(void         , flc_xyline)(int x, int y, int x1);
  FL_EXPORT_C(void         , flc_xyline_with_x2)(int x, int y, int x1, int y2);
  FL_EXPORT_C(void         , flc_xyline_with_y2_x3)(int x, int y, int x1, int y2, int x3);
  FL_EXPORT_C(void         , flc_yxline_with_y1)(int x, int y, int y1);
  FL_EXPORT_C(void         , flc_yxline_with_y2_x2)(int x, int y, int y1, int x2);
  FL_EXPORT_C(void         , flc_yxline_with_y2_x3)(int x, int y, int y1, int x2, int y3);
  FL_EXPORT_C(void         , flc_arc_by_width_height)(int x, int y, int w, int h, double a1, double a2);
  FL_EXPORT_C(void         , flc_pie)(int x, int y, int w, int h, double a1, double a2);
  FL_EXPORT_C(void         , flc_push_matrix)();
  FL_EXPORT_C(void         , flc_pop_matrix)();
  FL_EXPORT_C(void         , flc_scale_with_y)(double x, double y);
  FL_EXPORT_C(void         , flc_scale)(double x);
  FL_EXPORT_C(void         , flc_translate)(double x, double y);
  FL_EXPORT_C(void         , flc_rotate)(double d);
  FL_EXPORT_C(void         , flc_mult_matrix)(double a, double b, double c, double d, double x,double y);
  FL_EXPORT_C(void         , flc_begin_points)();
  FL_EXPORT_C(void         , flc_begin_line)();
  FL_EXPORT_C(void         , flc_begin_loop)();
  FL_EXPORT_C(void         , flc_begin_polygon)();
  FL_EXPORT_C(void         , flc_vertex)(double x, double y);
  FL_EXPORT_C(void         , flc_curve)(double X0, double Y0, double X1, double Y1, double X2, double Y2, double X3, double Y3);
  FL_EXPORT_C(void         , flc_arc_by_radius)(double x, double y, double r, double start, double end);
  FL_EXPORT_C(void         , flc_circle)(double x, double y, double r);
  FL_EXPORT_C(void         , flc_end_points)();
  FL_EXPORT_C(void         , flc_end_line)();
  FL_EXPORT_C(void         , flc_end_loop)();
  FL_EXPORT_C(void         , flc_end_polygon)();
  FL_EXPORT_C(void         , flc_begin_complex_polygon)();
  FL_EXPORT_C(void         , flc_gap)();
  FL_EXPORT_C(void         , flc_end_complex_polygon)();
  FL_EXPORT_C(double       , flc_transform_x)(double x, double y);
  FL_EXPORT_C(double       , flc_transform_y)(double x, double y);
  FL_EXPORT_C(double       , flc_transform_dx)(double x, double y);
  FL_EXPORT_C(double       , flc_transform_dy)(double x, double y);
  FL_EXPORT_C(void         , flc_transformed_vertex)(double xf, double yf);
  FL_EXPORT_C(void         , flc_set_font)(Fl_Font face, Fl_Fontsize fsize);
  FL_EXPORT_C(Fl_Font      , flc_font)();
  FL_EXPORT_C(Fl_Fontsize  , flc_size)();
  FL_EXPORT_C(int          , flc_height)();
  FL_EXPORT_C(int          , flc_set_height)(int font, int size);
  FL_EXPORT_C(int          , flc_descent)();
  FL_EXPORT_C(double       , flc_width)(const char* txt);
  FL_EXPORT_C(double       , flc_width_with_n)(const char* txt, int n);
  FL_EXPORT_C(double       , flc_width_with_c)(unsigned int c);
  FL_EXPORT_C(void         , flc_text_extents)(const char* s, int* dx, int* dy, int* w, int* h); // NO fltk symbol expansion will be performed
  FL_EXPORT_C(void         , flc_text_extents_with_n)(const char* t, int n, int* dx, int* dy, int* w, int* h);
  FL_EXPORT_C(const char*  , flc_latin1_to_local)(const char* t);
  FL_EXPORT_C(const char*  , flc_latin1_to_local_with_n)(const char* t, int n);
  FL_EXPORT_C(const char*  , flc_local_to_latin1)(const char* t);
  FL_EXPORT_C(const char*  , flc_local_to_latin1_with_n)(const char* t, int n);
  FL_EXPORT_C(const char*  , flc_mac_roman_to_local)(const char* t);
  FL_EXPORT_C(const char*  , flc_mac_roman_to_local_with_n)(const char* t, int n);
  FL_EXPORT_C(const char*  , flc_local_to_mac_roman)(const char* t);
  FL_EXPORT_C(const char*  , flc_local_to_mac_roman_with_n)(const char* t, int n);
  FL_EXPORT_C(void         , flc_draw)(const char* str, int x, int y);
  FL_EXPORT_C(void         , flc_draw_with_angle)(int angle, const char* str, int x, int y);
  FL_EXPORT_C(void         , flc_draw_with_n)(const char* str, int n, int x, int y);
  FL_EXPORT_C(void         , flc_draw_with_n_angle)(int angle, const char* str, int n, int x, int y);
  FL_EXPORT_C(void         , flc_rtl_draw)(const char* str, int n, int x, int y);
  FL_EXPORT_C(void         , flc_measure)(const char* str, int* x, int* y);
  FL_EXPORT_C(void         , flc_measure_with_draw_symbols)(const char* str, int* x, int* y,int draw_symbols);
  FL_EXPORT_C(void         , flc_draw_with_img_draw_symbols)(const char* str, int x, int y, int w, int h, Fl_Align align, fl_Image img,int draw_symbols);
  FL_EXPORT_C(void         , flc_draw_with_img)(const char* str, int x, int y, int w, int h, Fl_Align align, fl_Image img);
  FL_EXPORT_C(void         , flc_draw_with_draw_symbols)(const char* str, int x, int y, int w, int h, Fl_Align align,int draw_symbols);
  FL_EXPORT_C(void         , flc_draw_with_align)(const char* str, int x, int y, int w, int h, Fl_Align align);
  FL_EXPORT_C(void         , flc_draw_with_callthis_img_draw_symbols)(const char* str, int x, int y, int w, int h, Fl_Align align,void (*callthis)(const char* ,int,int,int), fl_Image img,int draw_symbols);
  FL_EXPORT_C(void         , flc_draw_with_callthis_img)(const char* str, int x, int y, int w, int h, Fl_Align align,void (*callthis)(const char* ,int,int,int), fl_Image img);
  FL_EXPORT_C(void         , flc_draw_with_callthis_draw_symbols)(const char* str, int x, int y, int w, int h, Fl_Align align,void (*callthis)(const char* ,int,int,int),int draw_symbols);
  FL_EXPORT_C(void         , flc_draw_with_callthis)(const char* str, int x, int y, int w, int h, Fl_Align align, void (*callthis)(const char* ,int,int,int));
  FL_EXPORT_C(void         , flc_frame)(const char* s, int x, int y, int w, int h);
  FL_EXPORT_C(void         , flc_frame2)(const char* s, int x, int y, int w, int h);
  FL_EXPORT_C(void         , flc_draw_box)(Fl_Boxtype boxtype, int x, int y, int w, int h, Fl_Color color);
  FL_EXPORT_C(void         , flc_draw_image_buf_with_d_l)(const uchar* buf, int X,int Y,int W,int H, int D, int L);
  FL_EXPORT_C(void         , flc_draw_image_buf_with_d)(const uchar* buf, int X,int Y,int W,int H, int D);
  FL_EXPORT_C(void         , flc_draw_image_buf_with_l)(const uchar* buf, int X,int Y,int W,int H,int L);
  FL_EXPORT_C(void         , flc_draw_image_buf)(const uchar* buf, int X,int Y,int W,int H);
  FL_EXPORT_C(void         , flc_draw_image_mono_buf_with_d_l)(const uchar* buf, int X,int Y,int W,int H, int D, int L);
  FL_EXPORT_C(void         , flc_draw_box)(Fl_Boxtype boxtype, int x, int y, int w, int h, Fl_Color color);
  FL_EXPORT_C(void         , flc_draw_image_mono_buf_with_d)(const uchar* buf, int X,int Y,int W,int H, int D);
  FL_EXPORT_C(void         , flc_draw_image_mono_buf_with_l)(const uchar* buf, int X,int Y,int W,int H, int L);
  FL_EXPORT_C(void         , flc_draw_image_mono_buf)(const uchar* buf, int X,int Y,int W,int H);
  FL_EXPORT_C(void         , flc_draw_image_cb)(Fl_Draw_Image_Cb cb, void* data, int X,int Y,int W,int H);
  FL_EXPORT_C(void         , flc_draw_image_cb_with_d)(Fl_Draw_Image_Cb cb, void* data, int X,int Y,int W,int H, int D);
  FL_EXPORT_C(void         , flc_draw_image_mono_cb_with_d)(Fl_Draw_Image_Cb cb, void* data, int X,int Y,int W,int H, int D);
  FL_EXPORT_C(void         , flc_draw_image_mono_cb)(Fl_Draw_Image_Cb cb, void* data, int X,int Y,int W,int H);
  FL_EXPORT_C(char         , flc_can_do_alpha_blending)();
  FL_EXPORT_C(uchar*       , flc_read_image_with_alpha)(uchar* p,int X,int Y,int W,int H,int alpha);
  FL_EXPORT_C(uchar*       , flc_read_image)(uchar* p,int X,int Y,int W,int H);
  FL_EXPORT_C(int          , flc_draw_pixmap_with_color)(char* const* data, int x,int y,Fl_Color color);
  FL_EXPORT_C(int          , flc_draw_pixmap)(char* const* data, int x,int y);
  FL_EXPORT_C(int          , flc_draw_pixmap_with_cdata_color)(char* const* cdata, int x,int y,Fl_Color color);
  FL_EXPORT_C(int          , flc_draw_pixmap_with_cdata)(char* const* cdata, int x,int y);
  FL_EXPORT_C(int          , flc_measure_pixmap)(char* const* data, int* w, int* h);
  FL_EXPORT_C(int          , flc_measure_pixmap_with_cdata)(const char* const* cdata, int* w, int* h);
  FL_EXPORT_C(void         , flc_scroll)(int X, int Y, int W, int H, int dx, int dy, void (*draw_area)(void*, int,int,int,int), void* data);
  FL_EXPORT_C(const char*  , flc_shortcut_label)(unsigned int shortcut);
  FL_EXPORT_C(const char*  , flc_shortcut_label_with_eom)(unsigned int shortcut, const char* *eom);
  FL_EXPORT_C(unsigned int , flc_old_shortcut)(const char* s);
  FL_EXPORT_C(void         , flc_overlay_rect)(int x,int y,int w,int h);
  FL_EXPORT_C(void         , flc_overlay_clear)();
  FL_EXPORT_C(void         , flc_cursor_with_fg_bg)(Fl_Cursor cursore, Fl_Color fg, Fl_Color bg);
  FL_EXPORT_C(void         , flc_cursor_with_fg)(Fl_Cursor cursor, Fl_Color fg);
  FL_EXPORT_C(void         , flc_cursor_with_bg)(Fl_Cursor cursor, Fl_Color bg);
  FL_EXPORT_C(void         , flc_cursor)(Fl_Cursor cursor);
  FL_EXPORT_C(const char*  , flc_expand_text_with_draw_symbols)(const char* from, char* buf, int maxbuf, double maxw, int* n, double* width, int wrap, int draw_symbols);
  FL_EXPORT_C(const char*  , flc_expand_text)(const char* from, char* buf, int maxbuf, double maxw, int* n, double *width, int wrap);
  FL_EXPORT_C(void         , flc_set_status)(int X, int Y, int W, int H);
  FL_EXPORT_C(void         , flc_set_spot_with_win)(int font, int size, int X, int Y, int W, int H, fl_Window win);
  FL_EXPORT_C(void         , flc_set_spot)(int font, int size, int X, int Y, int W, int H);
  FL_EXPORT_C(void         , flc_reset_spot)();
  FL_EXPORT_C(int          , flc_draw_symbol)(const char* label,int x,int y,int w,int h, Fl_Color color);
  FL_EXPORT_C(int          , flc_add_symbol)(const char* name, void (*drawit)(Fl_Color), int scalable);
#ifdef __cplusplus
}
#endif
#endif /* __FL_DRAW_C__ */
