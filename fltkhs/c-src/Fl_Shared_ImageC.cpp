#include "Fl_Shared_ImageC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(int,Fl_Shared_Image_w)(fl_Shared_Image shared_image){
    return (static_cast<DerivedShared_Image*>(shared_image))->w();
  }
  FL_EXPORT_C(int,Fl_Shared_Image_h)(fl_Shared_Image shared_image){
    return (static_cast<DerivedShared_Image*>(shared_image))->h();
  }
  FL_EXPORT_C(int,Fl_Shared_Image_d)(fl_Shared_Image shared_image){
    return (static_cast<DerivedShared_Image*>(shared_image))->d();
  }
  FL_EXPORT_C(int,Fl_Shared_Image_ld)(fl_Shared_Image shared_image){
    return (static_cast<DerivedShared_Image*>(shared_image))->ld();
  }
  FL_EXPORT_C(int,Fl_Shared_Image_count)(fl_Shared_Image shared_image){
    return (static_cast<DerivedShared_Image*>(shared_image))->count();
  }
  FL_EXPORT_C(fl_Image,Fl_Shared_Image_copy_with_w_h)(fl_Shared_Image shared_image,int W,int H){
    return (fl_Image)(static_cast<DerivedShared_Image*>(shared_image))->copy(W,H);
  }
  FL_EXPORT_C(void,Fl_Shared_Image_inactive)(fl_Shared_Image shared_image){
    return (static_cast<DerivedShared_Image*>(shared_image))->inactive();
  }
  FL_EXPORT_C(void,Fl_Shared_Image_label)(fl_Shared_Image shared_image,fl_Widget w){
    return (static_cast<DerivedShared_Image*>(shared_image))->label((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Shared_Image_label_with_menu_item)(fl_Shared_Image shared_image,fl_Menu_Item m){
    return (static_cast<DerivedShared_Image*>(shared_image))->label((static_cast<Fl_Menu_Item*>(m)));
  }
  FL_EXPORT_C(const char*,Fl_Shared_Image_name)(fl_Shared_Image shared_image){
    return (static_cast<DerivedShared_Image*>(shared_image))->name();
  }
  FL_EXPORT_C(int,Fl_Shared_Image_refcount)(fl_Shared_Image shared_image){
    return (static_cast<DerivedShared_Image*>(shared_image))->refcount();
  }
  FL_EXPORT_C(void,Fl_Shared_Image_release)(fl_Shared_Image shared_image){
    (static_cast<DerivedShared_Image*>(shared_image))->release();
  }
  FL_EXPORT_C(void,Fl_Shared_Image_reload)(fl_Shared_Image shared_image){
    (static_cast<DerivedShared_Image*>(shared_image))->reload();
  }
  FL_EXPORT_C(fl_Image,Fl_Shared_Image_copy_with_WH)(fl_Shared_Image shared_image, int W,int H){
    return (fl_Image)(static_cast<DerivedShared_Image*>(shared_image))->copy(W,H);
  }
  FL_EXPORT_C(fl_Image,Fl_Shared_Image_copy)(fl_Shared_Image shared_image){
    return (fl_Image)(static_cast<DerivedShared_Image*>(shared_image))->copy();
  }
  FL_EXPORT_C(void,Fl_Shared_Image_color_average)(fl_Shared_Image shared_image,Fl_Color c,float i){
    (static_cast<DerivedShared_Image*>(shared_image))->color_average(c,i);
  }
  FL_EXPORT_C(void,Fl_Shared_Image_desaturate)(fl_Shared_Image shared_image){
    (static_cast<DerivedShared_Image*>(shared_image))->desaturate();
  }
  FL_EXPORT_C(void,Fl_Shared_Image_draw_with_WHcxcy)(fl_Shared_Image shared_image,int X,int Y,int W,int H,int cx,int cy){
    (static_cast<DerivedShared_Image*>(shared_image))->draw(X,Y,W,H,cx,cy);
  }
  FL_EXPORT_C(void,Fl_Shared_Image_draw)(fl_Shared_Image shared_image,int X,int Y){
    (static_cast<DerivedShared_Image*>(shared_image))->draw(X,Y);
  }
  FL_EXPORT_C(void,Fl_Shared_Image_uncache)(fl_Shared_Image shared_image){
    (static_cast<DerivedShared_Image*>(shared_image))->uncache();
  }
  FL_EXPORT_C(fl_Shared_Image,Fl_Shared_Image_find)(const char* n){
    return (fl_Shared_Image)DerivedShared_Image::find(n);
  }
  FL_EXPORT_C(fl_Shared_Image,Fl_Shared_Image_find_W)(const char* n,int W){
    return (fl_Shared_Image)DerivedShared_Image::find(n,W);
  }
  FL_EXPORT_C(fl_Shared_Image,Fl_Shared_Image_find_H)(const char* n,int H){
    return (fl_Shared_Image)DerivedShared_Image::find(n,0,H);
  }
  FL_EXPORT_C(fl_Shared_Image,Fl_Shared_Image_find_WH)(const char* n,int W,int H){
    return (fl_Shared_Image)DerivedShared_Image::find(n,W,H);
  }
  FL_EXPORT_C(fl_Shared_Image,Fl_Shared_Image_get)(const char* n){
    return (fl_Shared_Image)DerivedShared_Image::get(n);
  }
  FL_EXPORT_C(fl_Shared_Image,Fl_Shared_Image_get_W)(const char* n,int W){
    return (fl_Shared_Image)DerivedShared_Image::get(n,W);
  }
  FL_EXPORT_C(fl_Shared_Image,Fl_Shared_Image_get_H)(const char* n,int H){
    return (fl_Shared_Image)DerivedShared_Image::get(n,0,H);
  }
  FL_EXPORT_C(fl_Shared_Image,Fl_Shared_Image_get_WH)(const char* n,int W,int H){
    return (fl_Shared_Image)DerivedShared_Image::get(n,W,H);
  }
  FL_EXPORT_C(fl_Shared_Image*,Fl_Shared_Image_images)(){
    return (fl_Shared_Image*)DerivedShared_Image::images();
  }
  FL_EXPORT_C(int,Fl_Shared_Image_num_images)( ){
    return DerivedShared_Image::num_images();
  }
  FL_EXPORT_C(void,Fl_Shared_Image_add_handler)(fl_Shared_Image_Handler f){
    DerivedShared_Image::add_handler(f);
  }
  FL_EXPORT_C(void,Fl_Shared_Image_remove_handler)(fl_Shared_Image_Handler f){
    DerivedShared_Image::remove_handler(f);
  }
#ifdef __cplusplus
}
#endif
