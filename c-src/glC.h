#ifndef __GL_C__
#define __GL_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/gl.h"
#include "Fl_CallbackC.h"
EXPORT {
#endif
#  ifdef __APPLE__
#    include <OpenGL/gl.h>
#  else
#    include <GL/gl.h>
#  endif
  FL_EXPORT_C(void, flc_gl_start)();
  FL_EXPORT_C(void, flc_gl_finish)();
  FL_EXPORT_C(void, flc_gl_color)(Fl_Color i);
  FL_EXPORT_C(void, flc_gl_color_with_i)(int c);
  FL_EXPORT_C(void, flc_gl_rect)(int x,int y,int w,int h);
  FL_EXPORT_C(void, flc_gl_rectf)(int x,int y,int w,int h);
  FL_EXPORT_C(void, flc_gl_font)(int fontid, int size);
  FL_EXPORT_C(int, flc_gl_height)();
  FL_EXPORT_C(int, flc_gl_descent)();
  FL_EXPORT_C(double, flc_gl_width)(const char* str);
  FL_EXPORT_C(double, flc_gl_width_with_n)(const char* str, int n);
  FL_EXPORT_C(double, flc_gl_width_with_uchar_str)(uchar str);
  FL_EXPORT_C(void, flc_gl_draw)(const char* str);
  FL_EXPORT_C(void, flc_gl_draw_with_n)(const char* str, int n);
  FL_EXPORT_C(void, flc_gl_draw_with_xy)(const char* str, float x, float y);
  FL_EXPORT_C(void, flc_gl_draw_with_nxy)(const char* str, int n, float x, float y);
  FL_EXPORT_C(void, flc_gl_draw_with_xywh_align)(const char* str, int x, int y, int w, int h, Fl_Align align);
  FL_EXPORT_C(void, flc_gl_measure)(const char* str, int x, int y);
#ifdef __APPLE__
  FL_EXPORT_C(void, flc_set_gl_texture_pile_height)(int max);
  FL_EXPORT_C(int, flc_gl_texture_pile_height)();
#endif
  FL_EXPORT_C(void, flc_gl_draw_image)(const uchar* str, int x,int y,int w,int h);
  FL_EXPORT_C(void, flc_gl_draw_image_with_d)(const uchar* str, int x,int y,int w,int h, int d);
  FL_EXPORT_C(void, flc_gl_draw_image_with_ld)(const uchar* str, int x,int y,int w,int h, int ld);
  FL_EXPORT_C(void, flc_gl_draw_image_with_d_ld)(const uchar* str, int x,int y,int w,int h, int d, int ld);
#ifdef __cplusplus
}
#endif
#endif /* __GL_C__ */
