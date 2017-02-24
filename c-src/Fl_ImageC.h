#ifndef __FL_IMAGE_C__
#define __FL_IMAGE_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Image.H"
#include "Fl_CallbackC.h"
EXPORT {
  class Fl_DerivedImage : public Fl_Image {
    fl_Image_Virtual_Funcs* overriddenFuncs;
    void* other_data;
  public:
    void* get_other_data();
    void set_other_data(void*);
    void destroy_data();
    void color_average(Fl_Color c, float i);
    Fl_Image* copy();
    Fl_Image* copy(int W, int H);
    void desaturate();
    void draw(int X, int Y, int W, int H, int cx=0, int cy=0);
    void uncache();
    void draw_box();
    void draw_box(Fl_Boxtype t, Fl_Color c);
    void draw_box(Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c);
    void draw_backdrop();
    void draw_focus();
    void draw_focus(Fl_Boxtype t, int x,int y,int w,int h);
    void draw_label();
    Fl_DerivedImage(int W, int H, int D, fl_Image_Virtual_Funcs* funcs);
    ~Fl_DerivedImage();
  };
#endif
#ifndef INTERNAL_LINKAGE
  typedef enum Image_Fail_Type {
    ERR_NO_IMAGE    = -1,
    ERR_FILE_ACCESS = -2,
    ERR_FORMAT      = -3
  } Image_Fail_Type;
#endif
  FL_EXPORT_C(fl_Image_Virtual_Funcs*, Fl_Image_default_virtual_funcs)();
  FL_EXPORT_C(void*, Fl_Image_other_data)(fl_Image image);
  FL_EXPORT_C(void, Fl_Image_set_other_data)(fl_Image image, void* v);
  FL_EXPORT_C(fl_Image, Fl_Image_New)(int W, int H, int D);
  FL_EXPORT_C(fl_Image, Fl_OverriddenImage_New)(int W, int H, int D, fl_Image_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Image_Destroy)(fl_Image image);
  FL_EXPORT_C(int, Fl_Image_w)(fl_Image image);
  FL_EXPORT_C(int, Fl_Image_h)(fl_Image image);
  FL_EXPORT_C(int, Fl_Image_d)(fl_Image image);
  FL_EXPORT_C(int, Fl_Image_ld)(fl_Image image);
  FL_EXPORT_C(int, Fl_Image_count)(fl_Image image);
  FL_EXPORT_C(fl_Image, Fl_Image_copy_with_w_h)(fl_Image image,int W, int H);
  FL_EXPORT_C(fl_Image, Fl_Image_copy)(fl_Image image);
  FL_EXPORT_C(void, Fl_Image_color_average)(fl_Image image,Fl_Color c, float i);
  FL_EXPORT_C(void, Fl_Image_inactive)(fl_Image image);
  FL_EXPORT_C(void, Fl_Image_desaturate)(fl_Image image);
  FL_EXPORT_C(void, Fl_Image_draw_with_cx_cy)(fl_Image image,int X, int Y, int W, int H, int cx, int cy);
  FL_EXPORT_C(void, Fl_Image_draw_with_cx)(fl_Image image,int X, int Y, int W, int H, int cx);
  FL_EXPORT_C(void, Fl_Image_draw_with_cy)(fl_Image image,int X, int Y, int W, int H, int cy);
  FL_EXPORT_C(void,Fl_Image_draw_with)(fl_Image image,int X,int Y,int W,int H);
  FL_EXPORT_C(void, Fl_Image_draw)(fl_Image image,int X, int Y);
  FL_EXPORT_C(void, Fl_Image_uncache)(fl_Image image);
#if FL_API_VERSION == 10304
  FL_EXPORT_C(int, Fl_Image_fail)(fl_Image image);
#endif
#ifdef __cplusplus
}
#endif
#endif /* __FL_xxx_C__ */
