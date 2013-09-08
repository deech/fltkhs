#include "Fl_PNM_ImageC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(fl_PNM_Image, Fl_PNM_Image_New)(const char* filename){
    Fl_PNM_Image* i = new Fl_PNM_Image(filename);
    return (fl_PNM_Image)i;
  }
  FL_EXPORT_C(void, Fl_PNM_Image_Destroy)(fl_PNM_Image image){
    delete (static_cast<Fl_PNM_Image*>(image));
  }
  FL_EXPORT_C(int,Fl_PNM_Image_w)(fl_PNM_Image image){
    return (static_cast<Fl_PNM_Image*>(image))->w();
  }
  FL_EXPORT_C(int,Fl_PNM_Image_h)(fl_PNM_Image image){
    return (static_cast<Fl_PNM_Image*>(image))->h();
  }
  FL_EXPORT_C(int,Fl_PNM_Image_d)(fl_PNM_Image image){
    return (static_cast<Fl_PNM_Image*>(image))->d();
  }
  FL_EXPORT_C(int,Fl_PNM_Image_ld)(fl_PNM_Image image){
    return (static_cast<Fl_PNM_Image*>(image))->ld();
  }
  FL_EXPORT_C(int,Fl_PNM_Image_count)(fl_PNM_Image image){
    return (static_cast<Fl_PNM_Image*>(image))->count();
  }
  FL_EXPORT_C(fl_PNM_Image,Fl_PNM_Image_copy_with_w_h)(fl_PNM_Image image,int W,int H){
    return (fl_PNM_Image)(static_cast<Fl_PNM_Image*>(image))->copy(W,H);
  }
  FL_EXPORT_C(fl_PNM_Image,Fl_PNM_Image_copy)(fl_PNM_Image image){
    return (fl_PNM_Image)(static_cast<Fl_PNM_Image*>(image))->copy();
  }
  FL_EXPORT_C(void,Fl_PNM_Image_color_average)(fl_PNM_Image image,Fl_Color c,float i){
    return (static_cast<Fl_PNM_Image*>(image))->color_average(c,i);
  }
  FL_EXPORT_C(void,Fl_PNM_Image_inactive)(fl_PNM_Image image){
    return (static_cast<Fl_PNM_Image*>(image))->inactive();
  }
  FL_EXPORT_C(void,Fl_PNM_Image_desaturate)(fl_PNM_Image image){
    return (static_cast<Fl_PNM_Image*>(image))->desaturate();
  }
  FL_EXPORT_C(void,Fl_PNM_Image_label)(fl_PNM_Image image,fl_Widget w){
    return (static_cast<Fl_PNM_Image*>(image))->label((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_PNM_Image_label_with_menu_item)(fl_PNM_Image image,fl_Menu_Item m){
    return (static_cast<Fl_PNM_Image*>(image))->label((static_cast<Fl_Menu_Item*>(m)));
  }
  FL_EXPORT_C(void,Fl_PNM_Image_draw_with_cx_cy)(fl_PNM_Image image,int X,int Y,int W,int H,int cx,int cy){
    return (static_cast<Fl_PNM_Image*>(image))->draw(X,Y,W,H,cx,cy);
  }
  FL_EXPORT_C(void,Fl_PNM_Image_draw_with_cx)(fl_PNM_Image image,int X,int Y,int W,int H,int cx){
    return (static_cast<Fl_PNM_Image*>(image))->draw(X,Y,W,H,cx);
  }
  FL_EXPORT_C(void,Fl_PNM_Image_draw_with_cy)(fl_PNM_Image image,int X,int Y,int W,int H,int cy){
    return (static_cast<Fl_PNM_Image*>(image))->draw(X,Y,W,H,0,cy);
  }
  FL_EXPORT_C(void,Fl_PNM_Image_draw)(fl_PNM_Image image,int X,int Y){
    return (static_cast<Fl_PNM_Image*>(image))->draw(X,Y);
  }
  FL_EXPORT_C(void,Fl_PNM_Image_uncache)(fl_PNM_Image image){
    return (static_cast<Fl_PNM_Image*>(image))->uncache();
  }
#ifdef __cplusplus
}
#endif
