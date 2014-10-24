#include "Fl_BitmapC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(fl_Bitmap, Fl_Bitmap_New)(const char* bits, int W, int H){
    Fl_Bitmap* b = new Fl_Bitmap(bits,W,H);
    return (fl_Bitmap)b;
  }
  FL_EXPORT_C(fl_Bitmap, Fl_Bitmap_New_WithUchar)(const uchar* bits, int W, int H){
    Fl_Bitmap* b = new Fl_Bitmap(bits,W,H);
    return (fl_Bitmap)b;
  }
  FL_EXPORT_C(void, Fl_Bitmap_Destroy)(fl_Bitmap bitmap) {
    delete (static_cast<Fl_Bitmap*>(bitmap));
  }
  FL_EXPORT_C(int,Fl_Bitmap_w)(fl_Bitmap bitmap){
    return (static_cast<Fl_Bitmap*>(bitmap))->w();
  }
  FL_EXPORT_C(int,Fl_Bitmap_h)(fl_Bitmap bitmap){
    return (static_cast<Fl_Bitmap*>(bitmap))->h();
  }
  FL_EXPORT_C(int,Fl_Bitmap_d)(fl_Bitmap bitmap){
    return (static_cast<Fl_Bitmap*>(bitmap))->d();
  }
  FL_EXPORT_C(int,Fl_Bitmap_ld)(fl_Bitmap bitmap){
    return (static_cast<Fl_Bitmap*>(bitmap))->ld();
  }
  FL_EXPORT_C(int,Fl_Bitmap_count)(fl_Bitmap bitmap){
    return (static_cast<Fl_Bitmap*>(bitmap))->count();
  }
  FL_EXPORT_C(fl_Bitmap,Fl_Bitmap_copy_with_w_h)(fl_Bitmap bitmap,int W,int H){
    return (fl_Bitmap)(static_cast<Fl_Bitmap*>(bitmap))->copy(W,H);
  }
  FL_EXPORT_C(fl_Bitmap,Fl_Bitmap_copy)(fl_Bitmap bitmap){
    return (fl_Bitmap)(static_cast<Fl_Bitmap*>(bitmap))->copy();
  }
  FL_EXPORT_C(void,Fl_Bitmap_color_average)(fl_Bitmap bitmap,Fl_Color c,float i){
    return (static_cast<Fl_Bitmap*>(bitmap))->color_average(c,i);
  }
  FL_EXPORT_C(void,Fl_Bitmap_inactive)(fl_Bitmap bitmap){
    return (static_cast<Fl_Bitmap*>(bitmap))->inactive();
  }
  FL_EXPORT_C(void,Fl_Bitmap_desaturate)(fl_Bitmap bitmap){
    return (static_cast<Fl_Bitmap*>(bitmap))->desaturate();
  }
  FL_EXPORT_C(void,Fl_Bitmap_label)(fl_Bitmap bitmap,fl_Widget w){
    return (static_cast<Fl_Bitmap*>(bitmap))->label((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Bitmap_label_with_menu_item)(fl_Bitmap bitmap,fl_Menu_Item m){
    return (static_cast<Fl_Bitmap*>(bitmap))->label((static_cast<Fl_Menu_Item*>(m)));
  }
  FL_EXPORT_C(void,Fl_Bitmap_draw_with_cx_cy)(fl_Bitmap bitmap,int X,int Y,int W,int H,int cx,int cy){
    return (static_cast<Fl_Bitmap*>(bitmap))->draw(X,Y,W,H,cx,cy);
  }
  FL_EXPORT_C(void,Fl_Bitmap_draw_with_cx)(fl_Bitmap bitmap,int X,int Y,int W,int H,int cx){
    return (static_cast<Fl_Bitmap*>(bitmap))->draw(X,Y,W,H,cx);
  }
  FL_EXPORT_C(void,Fl_Bitmap_draw_with_cy)(fl_Bitmap bitmap,int X,int Y,int W,int H,int cy){
    return (static_cast<Fl_Bitmap*>(bitmap))->draw(X,Y,W,H,0,cy);
  }
  FL_EXPORT_C(void,Fl_Bitmap_draw_with)(fl_Bitmap bitmap,int X,int Y,int W,int H){
    return (static_cast<Fl_Bitmap*>(bitmap))->draw(X,Y,W,H);
  }
  FL_EXPORT_C(void,Fl_Bitmap_draw)(fl_Bitmap bitmap,int X,int Y){
    return (static_cast<Fl_Bitmap*>(bitmap))->draw(X,Y);
  }
  FL_EXPORT_C(void,Fl_Bitmap_uncache)(fl_Bitmap bitmap){
    return (static_cast<Fl_Bitmap*>(bitmap))->uncache();
  }
#ifdef __cplusplus
}
#endif
