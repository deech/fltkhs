#include "Fl_ImageC.h"
#ifdef __cplusplus
Fl_DerivedImage::Fl_DerivedImage(int W, int H, int D, fl_Image_Virtual_Funcs* fs) : Fl_Image(W,H,D){
    overriddenFuncs = fs;
    other_data = 0;
 }
Fl_DerivedImage::~Fl_DerivedImage(){
  destroy_data();
  free(overriddenFuncs);
}
void* Fl_DerivedImage::get_other_data(){
  return this->other_data;
}
void Fl_DerivedImage::set_other_data(void* data){
  this->other_data = data;
}
void Fl_DerivedImage::destroy_data(){
  if (this->overriddenFuncs->destroy_data != NULL){
    this->overriddenFuncs->destroy_data((fl_Image) this);
  }
}
void Fl_DerivedImage::color_average(Fl_Color c, float i){
  if (overriddenFuncs->color_average){
    this->overriddenFuncs->color_average((fl_Image) this,c, i );
  }
  else {
    Fl_Image::color_average(c,i);
  }
}
Fl_Image* Fl_DerivedImage::copy(){
  return Fl_Image::copy();
}
Fl_Image* Fl_DerivedImage::copy(int W, int H){
  if (overriddenFuncs->copy){
    fl_Image image = (fl_Image)this->overriddenFuncs->copy((fl_Image) this, W, H);
    return (static_cast<Fl_Image*>(image));
  }
  else {
    return Fl_Image::copy(W, H);
  }
};
void Fl_DerivedImage::desaturate(){
  if (this->overriddenFuncs->desaturate){
    this->overriddenFuncs->desaturate((fl_Image) this);
  }
  else {
    Fl_Image::desaturate();
  }
}
void Fl_DerivedImage::draw(int X, int Y, int W, int H, int cx, int cy){
  if (overriddenFuncs->draw){
    this->overriddenFuncs->draw((fl_Image) this,X,Y,W,H,cx,cy);
  }
  else {
    Fl_Image::draw(X,Y,W,H,cx,cy);
  }
}
void Fl_DerivedImage::uncache(){
  if (overriddenFuncs->uncache){
    this->overriddenFuncs->uncache((fl_Image) this);
  }
  else {
    Fl_Image::uncache();
  }
}
EXPORT {
#endif
  FL_EXPORT_C(fl_Image_Virtual_Funcs*, Fl_Image_default_virtual_funcs)(){
    fl_Image_Virtual_Funcs* ptr = (fl_Image_Virtual_Funcs*)malloc(sizeof(fl_Image_Virtual_Funcs));
    ptr->draw = NULL;
    ptr->color_average = NULL;
    ptr->copy = NULL;
    ptr->desaturate = NULL;
    ptr->uncache = NULL;
    ptr->destroy_data = NULL;
    return ptr;
  }
  FL_EXPORT_C(void*, Fl_Image_other_data)(fl_Image image){
    return (static_cast<Fl_DerivedImage*>(image))->get_other_data();
  }
  FL_EXPORT_C(void, Fl_Image_set_other_data)(fl_Image image, void* v){
    (static_cast<Fl_DerivedImage*>(image))->set_other_data(v);
  }
  FL_EXPORT_C(fl_Image, Fl_Image_New)(int W, int H, int D){
    fl_Image_Virtual_Funcs* fs = Fl_Image_default_virtual_funcs();
    Fl_DerivedImage* d = new Fl_DerivedImage(W,H,D,fs);
    return (fl_Image)d;
  }
  FL_EXPORT_C(fl_Image, Fl_OverriddenImage_New)(int W, int H, int D, fl_Image_Virtual_Funcs* funcs){
    Fl_DerivedImage* d = new Fl_DerivedImage(W,H,D,funcs);
    return (fl_Image)d;
  }
  FL_EXPORT_C(void, Fl_Image_Destroy)(fl_Image image) {
    delete (static_cast<Fl_Image*>(image));
  }
  FL_EXPORT_C(int,Fl_Image_w)(fl_Image image){
    return (static_cast<Fl_DerivedImage*>(image))->w();
  }
  FL_EXPORT_C(int,Fl_Image_h)(fl_Image image){
    return (static_cast<Fl_DerivedImage*>(image))->h();
  }
  FL_EXPORT_C(int,Fl_Image_d)(fl_Image image){
    return (static_cast<Fl_DerivedImage*>(image))->d();
  }
  FL_EXPORT_C(int,Fl_Image_ld)(fl_Image image){
    return (static_cast<Fl_DerivedImage*>(image))->ld();
  }
  FL_EXPORT_C(int,Fl_Image_count)(fl_Image image){
    return (static_cast<Fl_DerivedImage*>(image))->count();
  }
  FL_EXPORT_C(fl_Image,Fl_Image_copy_with_w_h)(fl_Image image,int W,int H){
    return (fl_Image)(static_cast<Fl_DerivedImage*>(image))->copy(W,H);
  }
  FL_EXPORT_C(fl_Image,Fl_Image_copy)(fl_Image image){
    return (fl_Image)(static_cast<Fl_DerivedImage*>(image))->copy();
  }
  FL_EXPORT_C(void,Fl_Image_color_average)(fl_Image image,Fl_Color c,float i){
    return (static_cast<Fl_DerivedImage*>(image))->color_average(c,i);
  }
  FL_EXPORT_C(void,Fl_Image_inactive)(fl_Image image){
    return (static_cast<Fl_DerivedImage*>(image))->inactive();
  }
  FL_EXPORT_C(void,Fl_Image_desaturate)(fl_Image image){
    return (static_cast<Fl_DerivedImage*>(image))->desaturate();
  }
  FL_EXPORT_C(void,Fl_Image_label)(fl_Image image,fl_Widget w){
    return (static_cast<Fl_DerivedImage*>(image))->label((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Image_label_with_menu_item)(fl_Image image,fl_Menu_Item m){
    return (static_cast<Fl_DerivedImage*>(image))->label((static_cast<Fl_Menu_Item*>(m)));
  }
  FL_EXPORT_C(void,Fl_Image_draw_with_cx_cy)(fl_Image image,int X,int Y,int W,int H,int cx,int cy){
    return (static_cast<Fl_DerivedImage*>(image))->draw(X,Y,W,H,cx,cy);
  }
  FL_EXPORT_C(void,Fl_Image_draw_with_cx)(fl_Image image,int X,int Y,int W,int H,int cx){
    return (static_cast<Fl_DerivedImage*>(image))->draw(X,Y,W,H,cx);
  }
  FL_EXPORT_C(void,Fl_Image_draw_with_cy)(fl_Image image,int X,int Y,int W,int H,int cy){
    return (static_cast<Fl_DerivedImage*>(image))->draw(X,Y,W,H,0,cy);
  }
  FL_EXPORT_C(void,Fl_Image_draw_with)(fl_Image image,int X,int Y,int W,int H){
    return (static_cast<Fl_DerivedImage*>(image))->draw(X,Y,W,H);
  }
  FL_EXPORT_C(void,Fl_Image_draw)(fl_Image image,int X,int Y){
    return (static_cast<Fl_Image*>(image))->draw(X,Y);
  }
  FL_EXPORT_C(void,Fl_Image_uncache)(fl_Image image){
    return (static_cast<Fl_DerivedImage*>(image))->uncache();
  }
#if FL_API_VERSION == 10304
  FL_EXPORT_C(int, Fl_Image_fail)(fl_Image image){
    return (static_cast<Fl_DerivedImage*>(image))->fail();
  }
#endif

#ifdef __cplusplus
}
#endif
