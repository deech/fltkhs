#include "Fl_SVG_ImageC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(fl_SVG_Image,Fl_SVG_Image_New_WithData)(const char* name, const char* data){
    Fl_SVG_Image* image = new Fl_SVG_Image(name, data);
    return (static_cast<fl_SVG_Image>(image));
  }
  FL_EXPORT_C(void, Fl_SVG_Image_Destroy)(fl_SVG_Image image){
    delete (static_cast<Fl_SVG_Image*>(image));
  }
  FL_EXPORT_C(fl_SVG_Image,Fl_SVG_Image_copy_with_w_h)(fl_SVG_Image image,int W,int H){
    return (fl_SVG_Image)(static_cast<Fl_SVG_Image*>(image))->copy(W,H);
  }
  FL_EXPORT_C(void,Fl_SVG_Image_color_average)(fl_SVG_Image image,Fl_Color c,float i){
    return (static_cast<Fl_SVG_Image*>(image))->color_average(c,i);
  }
  FL_EXPORT_C(void,Fl_SVG_Image_desaturate)(fl_SVG_Image image){
    return (static_cast<Fl_SVG_Image*>(image))->desaturate();
  }
  FL_EXPORT_C(void,Fl_SVG_Image_draw_with_cx_cy)(fl_SVG_Image image,int X,int Y,int W,int H,int cx,int cy){
    return (static_cast<Fl_SVG_Image*>(image))->draw(X,Y,W,H,cx,cy);
  }
  FL_EXPORT_C(void,Fl_SVG_Image_draw_with_cx)(fl_SVG_Image image,int X,int Y,int W,int H,int cx){
    return (static_cast<Fl_SVG_Image*>(image))->draw(X,Y,W,H,cx);
  }
  FL_EXPORT_C(void,Fl_SVG_Image_draw_with_cy)(fl_SVG_Image image,int X,int Y,int W,int H,int cy){
    return (static_cast<Fl_SVG_Image*>(image))->draw(X,Y,W,H,0,cy);
  }
  FL_EXPORT_C(void,Fl_SVG_Image_draw_with)(fl_Image image,int X,int Y,int W,int H){
    return (static_cast<Fl_SVG_Image*>(image))->draw(X,Y,W,H);
  }
  FL_EXPORT_C(void,Fl_SVG_Image_draw)(fl_SVG_Image image,int X,int Y){
    return (static_cast<Fl_SVG_Image*>(image))->draw(X,Y);
  }
  FL_EXPORT_C(void, Fl_SVG_Image_resize)(fl_SVG_Image image, int width, int height) {
    (static_cast<Fl_SVG_Image*>(image))->resize(width,height);
  }
#ifdef __cplusplus
}
#endif
