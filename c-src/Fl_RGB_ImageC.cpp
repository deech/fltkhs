#include "Fl_RGB_ImageC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(fl_RGB_Image, Fl_RGB_Image_New)(uchar* bits, int W, int H){
    Fl_RGB_Image* i = new Fl_RGB_Image(bits,W,H);
    return (fl_RGB_Image)i;
  }
  FL_EXPORT_C(fl_RGB_Image, Fl_RGB_Image_New_With_D)(uchar* bits, int W, int H, int D){
    Fl_RGB_Image* i = new Fl_RGB_Image(bits,W,H,D);
    return (fl_RGB_Image)i;
  }
  FL_EXPORT_C(fl_RGB_Image, Fl_RGB_Image_New_With_LD)(uchar* bits, int W, int H, int LD){
    Fl_RGB_Image* i = new Fl_RGB_Image(bits,W,H,0,LD);
    return (fl_RGB_Image)i;
  }
  FL_EXPORT_C(fl_RGB_Image, Fl_RGB_Image_New_With_D_LD)(uchar* bits, int W, int H, int D, int LD){
    Fl_RGB_Image* i = new Fl_RGB_Image(bits,W,H,D,LD);
    return (fl_RGB_Image)i;
  }
  FL_EXPORT_C(void, Fl_RGB_Image_Destroy)(fl_RGB_Image rgb_image) {
    delete (static_cast<Fl_RGB_Image*>(rgb_image));
  }
  FL_EXPORT_C(int,Fl_RGB_Image_w)(fl_RGB_Image rgb_image){
    return (static_cast<Fl_RGB_Image*>(rgb_image))->w();
  }
  FL_EXPORT_C(int,Fl_RGB_Image_h)(fl_RGB_Image rgb_image){
    return (static_cast<Fl_RGB_Image*>(rgb_image))->h();
  }
  FL_EXPORT_C(int,Fl_RGB_Image_d)(fl_RGB_Image rgb_image){
    return (static_cast<Fl_RGB_Image*>(rgb_image))->d();
  }
  FL_EXPORT_C(int,Fl_RGB_Image_ld)(fl_RGB_Image rgb_image){
    return (static_cast<Fl_RGB_Image*>(rgb_image))->ld();
  }
  FL_EXPORT_C(int,Fl_RGB_Image_count)(fl_RGB_Image rgb_image){
    return (static_cast<Fl_RGB_Image*>(rgb_image))->count();
  }
  FL_EXPORT_C(fl_Image,Fl_RGB_Image_copy_with_w_h)(fl_RGB_Image rgb_image,int W,int H){
    return (static_cast<Fl_RGB_Image*>(rgb_image))->copy(W,H);
  }
  FL_EXPORT_C(fl_Image,Fl_RGB_Image_copy)(fl_RGB_Image rgb_image){
    return (static_cast<Fl_RGB_Image*>(rgb_image))->copy();
  }
  FL_EXPORT_C(void,Fl_RGB_Image_color_average)(fl_RGB_Image rgb_image,Fl_Color c,float i){
    (static_cast<Fl_RGB_Image*>(rgb_image))->color_average(c,i);
  }
  FL_EXPORT_C(void,Fl_RGB_Image_inactive)(fl_RGB_Image rgb_image){
    (static_cast<Fl_RGB_Image*>(rgb_image))->inactive();
  }
  FL_EXPORT_C(void,Fl_RGB_Image_desaturate)(fl_RGB_Image rgb_image){
    (static_cast<Fl_RGB_Image*>(rgb_image))->desaturate();
  }
  FL_EXPORT_C(void,Fl_RGB_Image_label)(fl_RGB_Image rgb_image,fl_Widget w){
    (static_cast<Fl_RGB_Image*>(rgb_image))->label((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_RGB_Image_label_with_menu_item)(fl_RGB_Image rgb_image,fl_Menu_Item m){
    (static_cast<Fl_RGB_Image*>(rgb_image))->label((static_cast<Fl_Menu_Item*>(m)));
  }
  FL_EXPORT_C(void,Fl_RGB_Image_draw_with_cx_cy)(fl_RGB_Image rgb_image,int X,int Y,int W,int H,int cx,int cy){
    (static_cast<Fl_RGB_Image*>(rgb_image))->draw(X,Y,W,H,cx,cy);
  }
  FL_EXPORT_C(void,Fl_RGB_Image_draw_with_cx)(fl_RGB_Image rgb_image,int X,int Y,int W,int H,int cx){
    (static_cast<Fl_RGB_Image*>(rgb_image))->draw(X,Y,W,H,cx);
  }
  FL_EXPORT_C(void,Fl_RGB_Image_draw_with_cy)(fl_RGB_Image rgb_image,int X,int Y,int W,int H,int cy){
    (static_cast<Fl_RGB_Image*>(rgb_image))->draw(X,Y,W,H,cy);
  }
  FL_EXPORT_C(void,Fl_RGB_Image_draw_with)(fl_RGB_Image rgb_image,int X,int Y,int W,int H){
    (static_cast<Fl_RGB_Image*>(rgb_image))->draw(X,Y,W,H);
  }
  FL_EXPORT_C(void,Fl_RGB_Image_draw)(fl_RGB_Image rgb_image,int X,int Y){
    (static_cast<Fl_RGB_Image*>(rgb_image))->draw(X,Y);
  }
  FL_EXPORT_C(void,Fl_RGB_Image_uncache)(fl_RGB_Image rgb_image){
    (static_cast<Fl_RGB_Image*>(rgb_image))->uncache();
  }
  FL_EXPORT_C(void,Fl_RGB_Image_set_max_size)(size_t size){
    Fl_RGB_Image::max_size(size);
  }
  FL_EXPORT_C(size_t,Fl_RGB_Image_max_size)( ){
    return Fl_RGB_Image::max_size();
  }
#ifdef __cplusplus
}
#endif
