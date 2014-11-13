#include "Fl_PixmapC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(fl_Pixmap, Fl_Pixmap_New)(char** bits){
    Fl_Pixmap* i = new Fl_Pixmap((const char* const *)bits);
    return (fl_Pixmap)i;
  }
  FL_EXPORT_C(fl_Pixmap, Fl_Pixmap_New_With_D)(uchar** bits){
    Fl_Pixmap* i = new Fl_Pixmap((const uchar* const *)bits);
    return (fl_Pixmap)i;
  }
  FL_EXPORT_C(void, Fl_Pixmap_Destroy)(fl_Pixmap pixmap){
    delete (static_cast<Fl_Pixmap*>(pixmap));
  }
  FL_EXPORT_C(int,Fl_Pixmap_w)(fl_Pixmap pixmap){
    return (static_cast<Fl_Pixmap*>(pixmap))->w();
  }
  FL_EXPORT_C(int,Fl_Pixmap_h)(fl_Pixmap pixmap){
    return (static_cast<Fl_Pixmap*>(pixmap))->h();
  }
  FL_EXPORT_C(int,Fl_Pixmap_d)(fl_Pixmap pixmap){
    return (static_cast<Fl_Pixmap*>(pixmap))->d();
  }
  FL_EXPORT_C(int,Fl_Pixmap_ld)(fl_Pixmap pixmap){
    return (static_cast<Fl_Pixmap*>(pixmap))->ld();
  }
  FL_EXPORT_C(int,Fl_Pixmap_count)(fl_Pixmap pixmap){
    return (static_cast<Fl_Pixmap*>(pixmap))->count();
  }
  FL_EXPORT_C(fl_Image,Fl_Pixmap_copy_with_w_h)(fl_Pixmap pixmap,int W,int H){
    return (static_cast<Fl_Pixmap*>(pixmap))->copy(W,H);
  }
  FL_EXPORT_C(fl_Image,Fl_Pixmap_copy)(fl_Pixmap pixmap){
    return (static_cast<Fl_Pixmap*>(pixmap))->copy();
  }
  FL_EXPORT_C(void,Fl_Pixmap_color_average)(fl_Pixmap pixmap,Fl_Color c,float i){
    (static_cast<Fl_Pixmap*>(pixmap))->color_average(c,i);
  }
  FL_EXPORT_C(void,Fl_Pixmap_inactive)(fl_Pixmap pixmap){
    (static_cast<Fl_Pixmap*>(pixmap))->inactive();
  }
  FL_EXPORT_C(void,Fl_Pixmap_desaturate)(fl_Pixmap pixmap){
    (static_cast<Fl_Pixmap*>(pixmap))->desaturate();
  }
  FL_EXPORT_C(void,Fl_Pixmap_label)(fl_Pixmap pixmap,fl_Widget w){
    (static_cast<Fl_Pixmap*>(pixmap))->label((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Pixmap_label_with_menu_item)(fl_Pixmap pixmap,fl_Menu_Item m){
    (static_cast<Fl_Pixmap*>(pixmap))->label((static_cast<Fl_Menu_Item*>(m)));
  }
  FL_EXPORT_C(void,Fl_Pixmap_draw_with_cx_cy)(fl_Pixmap pixmap,int X,int Y,int W,int H,int cx,int cy){
    (static_cast<Fl_Pixmap*>(pixmap))->draw(X,Y,W,H,cx,cy);
  }
  FL_EXPORT_C(void,Fl_Pixmap_draw_with_cx)(fl_Pixmap pixmap,int X,int Y,int W,int H,int cx){
    (static_cast<Fl_Pixmap*>(pixmap))->draw(X,Y,W,H,cx);
  }
  FL_EXPORT_C(void,Fl_Pixmap_draw_with_cy)(fl_Pixmap pixmap,int X,int Y,int W,int H,int cy){
    (static_cast<Fl_Pixmap*>(pixmap))->draw(X,Y,W,H,cy);
  }
  FL_EXPORT_C(void,Fl_Pixmap_draw_with)(fl_Pixmap pixmap,int X,int Y,int W,int H){
    (static_cast<Fl_Pixmap*>(pixmap))->draw(X,Y,W,H);
  }
  FL_EXPORT_C(void,Fl_Pixmap_draw)(fl_Pixmap pixmap,int X,int Y){
    (static_cast<Fl_Pixmap*>(pixmap))->draw(X,Y);
  }
  FL_EXPORT_C(void,Fl_Pixmap_uncache)(fl_Pixmap pixmap){
    (static_cast<Fl_Pixmap*>(pixmap))->uncache();
  }
#ifdef __cplusplus
}
#endif
