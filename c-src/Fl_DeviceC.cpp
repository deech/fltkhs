#include "Fl_DeviceC.h"
#ifdef __cplusplus
EXPORT {
#endif
FL_EXPORT_C(const char*,Fl_Graphics_Driver_class_id)( ){
 return Fl_Graphics_Driver::class_id;
}
FL_EXPORT_C(const char*,Fl_Graphics_Driver_class_name)(fl_Graphics_Driver graphics_driver){
 return (static_cast<Fl_Graphics_Driver*>(graphics_driver))->class_name();
}
FL_EXPORT_C(void,Fl_Graphics_Driver_set_font)(fl_Graphics_Driver graphics_driver,Fl_Font face,Fl_Fontsize fsize){
 return (static_cast<Fl_Graphics_Driver*>(graphics_driver))->font(face,fsize);
}
FL_EXPORT_C(Fl_Font,Fl_Graphics_Driver_font)(fl_Graphics_Driver graphics_driver){
 return (static_cast<Fl_Graphics_Driver*>(graphics_driver))->font();
}
FL_EXPORT_C(Fl_Fontsize,Fl_Graphics_Driver_size)(fl_Graphics_Driver graphics_driver){
 return (static_cast<Fl_Graphics_Driver*>(graphics_driver))->size();
}
FL_EXPORT_C(double,Fl_Graphics_Driver_width)(fl_Graphics_Driver graphics_driver,const char* str,int n){
 return (static_cast<Fl_Graphics_Driver*>(graphics_driver))->width(str,n);
}
FL_EXPORT_C(double,Fl_Graphics_Driver_width_with_c)(fl_Graphics_Driver graphics_driver,unsigned int c){
  return (static_cast<Fl_Graphics_Driver*>(graphics_driver))->width(c);
}
FL_EXPORT_C(void,Fl_Graphics_Driver_text_extents)(fl_Graphics_Driver graphics_driver,const char* c,int n,int* dx,int* dy,int* w,int* h){
  return (static_cast<Fl_Graphics_Driver*>(graphics_driver))->text_extents(c,n,*dx,*dy,*w,*h);
}
FL_EXPORT_C(int,Fl_Graphics_Driver_height)(fl_Graphics_Driver graphics_driver){
 return (static_cast<Fl_Graphics_Driver*>(graphics_driver))->height();
}
FL_EXPORT_C(int,Fl_Graphics_Driver_descent)(fl_Graphics_Driver graphics_driver){
 return (static_cast<Fl_Graphics_Driver*>(graphics_driver))->descent();
}
FL_EXPORT_C(Fl_Color,Fl_Graphics_Driver_color)(fl_Graphics_Driver graphics_driver){
 return (static_cast<Fl_Graphics_Driver*>(graphics_driver))->color();
}
FL_EXPORT_C(fl_Font_Descriptor,Fl_Graphics_Driver_font_descriptor)(fl_Graphics_Driver graphics_driver){
 Fl_Font_Descriptor* _d = (static_cast<Fl_Graphics_Driver*>(graphics_driver))->font_descriptor();
 return static_cast<Fl_Font_Descriptor*>(_d);
}
FL_EXPORT_C(void,Fl_Graphics_Driver_set_font_descriptor)(fl_Graphics_Driver graphics_driver,fl_Font_Descriptor d){
  Fl_Font_Descriptor* _d = static_cast<Fl_Font_Descriptor*>(d);
 return (static_cast<Fl_Graphics_Driver*>(graphics_driver))->font_descriptor(_d);
}
#if FL_API_VERSION == 10304
FL_EXPORT_C(int, fl_Graphics_Driver_draw_scaled)(fl_Graphics_Driver graphics_driver, fl_Image i,  int X, int Y, int W, int H)
{
  return (static_cast<Fl_Graphics_Driver*>(graphics_driver))->draw_scaled(static_cast<Fl_Image*>(i),X,Y,W,H);
}
#endif
FL_EXPORT_C(void,Fl_Graphics_Driver_Destroy)(fl_Graphics_Driver graphics_driver){
 delete (static_cast<Fl_Graphics_Driver*>(graphics_driver));
}
FL_EXPORT_C(const char*,Fl_Surface_Device_class_id)( ){
 return Fl_Surface_Device::class_id;
}
FL_EXPORT_C(const char*,Fl_Surface_Device_class_name)(fl_Surface_Device surface_device){
 return (static_cast<Fl_Surface_Device*>(surface_device))->class_name();
}
FL_EXPORT_C(void,Fl_Surface_Device_set_current)(fl_Surface_Device surface_device){
 return (static_cast<Fl_Surface_Device*>(surface_device))->set_current();
}
FL_EXPORT_C(void,Fl_Surface_Device_set_driver)(fl_Surface_Device surface_device,fl_Graphics_Driver graphics_driver){
  return (static_cast<Fl_Surface_Device*>(surface_device))->driver((static_cast<Fl_Graphics_Driver*>(graphics_driver)));
}
FL_EXPORT_C(fl_Graphics_Driver,Fl_Surface_Device_driver)(fl_Surface_Device surface_device){
 return (fl_Graphics_Driver)(static_cast<Fl_Surface_Device*>(surface_device))->driver();
}
FL_EXPORT_C(fl_Surface_Device,Fl_Surface_Device_surface)(){
  return (fl_Surface_Device)Fl_Surface_Device::surface();
}
FL_EXPORT_C(void,Fl_Surface_Device_Destroy)(fl_Surface_Device surface_device){
 delete (static_cast<Fl_Surface_Device*>(surface_device));
}
#ifdef __cplusplus
}
#endif
