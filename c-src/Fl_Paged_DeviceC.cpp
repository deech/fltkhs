#include "Fl_Paged_DeviceC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(const char*,Fl_Paged_Device_class_id)( ){
    return Fl_Surface_Device::class_id;
  }
  FL_EXPORT_C(const char*,Fl_Paged_Device_class_name)(fl_Paged_Device paged_device){
    return (static_cast<Fl_Paged_Device*>(paged_device))->class_name();
  }
  FL_EXPORT_C(void,Fl_Paged_Device_set_current)(fl_Paged_Device paged_device){
    return (static_cast<Fl_Paged_Device*>(paged_device))->set_current();
  }
  FL_EXPORT_C(void,Fl_Paged_Device_set_driver)(fl_Paged_Device paged_device,fl_Graphics_Driver graphics_driver){
    return (static_cast<Fl_Paged_Device*>(paged_device))->driver((static_cast<Fl_Graphics_Driver*>(graphics_driver)));
  }
  FL_EXPORT_C(fl_Graphics_Driver,Fl_Paged_Device_driver)(fl_Paged_Device paged_device){
    return (fl_Graphics_Driver)(static_cast<Fl_Paged_Device*>(paged_device))->driver();
  }
  FL_EXPORT_C(fl_Surface_Device,Fl_Paged_Device_surface)(){
    return (fl_Surface_Device)Fl_Surface_Device::surface();
  }
  FL_EXPORT_C(int,Fl_Paged_Device_start_job)(fl_Paged_Device paged_device,int pagecount){
    return (static_cast<Fl_Paged_Device*>(paged_device))->start_job(pagecount);
  }
  FL_EXPORT_C(int,Fl_Paged_Device_start_job_with_frompage)(fl_Paged_Device paged_device,int pagecount,int* frompage){
    return (static_cast<Fl_Paged_Device*>(paged_device))->start_job(pagecount,frompage);
  }
  FL_EXPORT_C(int,Fl_Paged_Device_start_job_with_topage)(fl_Paged_Device paged_device,int pagecount,int* topage){
    return (static_cast<Fl_Paged_Device*>(paged_device))->start_job(pagecount,NULL,topage);
  }
  FL_EXPORT_C(int,Fl_Paged_Device_start_job_with_frompage_topage)(fl_Paged_Device paged_device,int pagecount,int* frompage,int* topage){
    return (static_cast<Fl_Paged_Device*>(paged_device))->start_job(pagecount,frompage,topage);
  }
  FL_EXPORT_C(int,Fl_Paged_Device_start_page)(fl_Paged_Device paged_device){
    return (static_cast<Fl_Paged_Device*>(paged_device))->start_page();
  }
  FL_EXPORT_C(int,Fl_Paged_Device_printable_rect)(fl_Paged_Device paged_device,int* w,int* h){
    return (static_cast<Fl_Paged_Device*>(paged_device))->printable_rect(w,h);
  }
  FL_EXPORT_C(void,Fl_Paged_Device_margins)(fl_Paged_Device paged_device,int* left,int* top,int* right,int* bottom){
    (static_cast<Fl_Paged_Device*>(paged_device))->margins(left,top,right,bottom);
  }
  FL_EXPORT_C(void,Fl_Paged_Device_origin)(fl_Paged_Device paged_device,int* x,int* y){
    (static_cast<Fl_Paged_Device*>(paged_device))->origin(x,y);
  }
  FL_EXPORT_C(void,Fl_Paged_Device_scale)(fl_Paged_Device paged_device,float scale_x){
    (static_cast<Fl_Paged_Device*>(paged_device))->scale(scale_x);
  }
  FL_EXPORT_C(void,Fl_Paged_Device_scale_with_scaly_y)(fl_Paged_Device paged_device,float scale_x,float scale_y){
    (static_cast<Fl_Paged_Device*>(paged_device))->scale(scale_x,scale_y);
  }
  FL_EXPORT_C(void,Fl_Paged_Device_rotate)(fl_Paged_Device paged_device,float angle){
    (static_cast<Fl_Paged_Device*>(paged_device))->rotate(angle);
  }
  FL_EXPORT_C(void,Fl_Paged_Device_translate)(fl_Paged_Device paged_device,int x,int y){
    (static_cast<Fl_Paged_Device*>(paged_device))->translate(x,y);
  }
  FL_EXPORT_C(void,Fl_Paged_Device_untranslate)(fl_Paged_Device paged_device){
    (static_cast<Fl_Paged_Device*>(paged_device))->untranslate();
  }
  FL_EXPORT_C(void,Fl_Paged_Device_print_widget)(fl_Paged_Device paged_device,fl_Widget widget){
    (static_cast<Fl_Paged_Device*>(paged_device))->print_widget(static_cast<Fl_Widget*>(widget));
  }
  FL_EXPORT_C(void,Fl_Paged_Device_print_widget_with_delta_x)(fl_Paged_Device paged_device,fl_Widget widget,int delta_x){
    (static_cast<Fl_Paged_Device*>(paged_device))->print_widget(static_cast<Fl_Widget*>(widget),delta_x);
  }
  FL_EXPORT_C(void,Fl_Paged_Device_print_widget_with_delta_y)(fl_Paged_Device paged_device,fl_Widget widget,int delta_y){
    (static_cast<Fl_Paged_Device*>(paged_device))->print_widget(static_cast<Fl_Widget*>(widget),0,delta_y);
  }
  FL_EXPORT_C(void,Fl_Paged_Device_print_widget_with_delta_x_delta_y)(fl_Paged_Device paged_device,fl_Widget widget,int delta_x,int delta_y){
    (static_cast<Fl_Paged_Device*>(paged_device))->print_widget(static_cast<Fl_Widget*>(widget),delta_x,delta_y);
  }
  FL_EXPORT_C(void,Fl_Paged_Device_print_window)(fl_Paged_Device paged_device,fl_Window win){
    (static_cast<Fl_Paged_Device*>(paged_device))->print_window(static_cast<Fl_Window*>(win));
  }
  FL_EXPORT_C(void,Fl_Paged_Device_print_window_with_x_offset)(fl_Paged_Device paged_device,fl_Window win,int x_offset){
    (static_cast<Fl_Paged_Device*>(paged_device))->print_window(static_cast<Fl_Window*>(win),x_offset);
  }
  FL_EXPORT_C(void,Fl_Paged_Device_print_window_with_y_offset)(fl_Paged_Device paged_device,fl_Window win,int y_offset){
    (static_cast<Fl_Paged_Device*>(paged_device))->print_window(static_cast<Fl_Window*>(win),y_offset);
  }
  FL_EXPORT_C(void,Fl_Paged_Device_print_window_with_x_offset_y_offset)(fl_Paged_Device paged_device,fl_Window win,int x_offset,int y_offset){
    (static_cast<Fl_Paged_Device*>(paged_device))->print_window(static_cast<Fl_Window*>(win),x_offset,y_offset);
  }
  FL_EXPORT_C(void,Fl_Paged_Device_print_window_part)(fl_Paged_Device paged_device,fl_Window win,int x,int y,int w,int h){
    (static_cast<Fl_Paged_Device*>(paged_device))->print_window_part(static_cast<Fl_Window*>(win),x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Paged_Device_print_window_part_with_delta_x)(fl_Paged_Device paged_device,fl_Window win,int x,int y,int w,int h,int delta_x){
    (static_cast<Fl_Paged_Device*>(paged_device))->print_window_part(static_cast<Fl_Window*>(win),x,y,w,h,delta_x);
  }
  FL_EXPORT_C(void,Fl_Paged_Device_print_window_part_with_delta_y)(fl_Paged_Device paged_device,fl_Window win,int x,int y,int w,int h,int delta_y){
    (static_cast<Fl_Paged_Device*>(paged_device))->print_window_part(static_cast<Fl_Window*>(win),x,y,w,h,0,delta_y);
  }
  FL_EXPORT_C(void,Fl_Paged_Device_print_window_part_with_delta_xy)(fl_Paged_Device paged_device,fl_Window win,int x,int y,int w,int h,int delta_x,int delta_y){
    (static_cast<Fl_Paged_Device*>(paged_device))->print_window_part(static_cast<Fl_Window*>(win),x,y,w,h,delta_x,delta_y);
  }
  FL_EXPORT_C(int,Fl_Paged_Device_end_page)(fl_Paged_Device paged_device){
    return (static_cast<Fl_Paged_Device*>(paged_device))->end_page();
  }
  FL_EXPORT_C(void,Fl_Paged_Device_end_job)(fl_Paged_Device paged_device){
    (static_cast<Fl_Paged_Device*>(paged_device))->end_job();
  }
#ifdef __cplusplus
}
#endif
