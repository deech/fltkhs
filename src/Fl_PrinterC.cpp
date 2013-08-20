#include "Fl_PrinterC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(const char*,Fl_Printer_class_id)( ){
    return Fl_Surface_Device::class_id;
  }
  FL_EXPORT_C(const char*,Fl_Printer_class_name)(fl_Printer printer){
    return (static_cast<Fl_Printer*>(printer))->class_name();
  }
  FL_EXPORT_C(void,Fl_Printer_set_current)(fl_Printer printer){
    return (static_cast<Fl_Printer*>(printer))->set_current();
  }
  FL_EXPORT_C(fl_Graphics_Driver,Fl_Printer_driver)(fl_Printer printer){
    return (fl_Graphics_Driver)(static_cast<Fl_Printer*>(printer))->driver();
  }
  FL_EXPORT_C(fl_Surface_Device,Fl_Printer_surface)(){
    return (fl_Surface_Device)Fl_Surface_Device::surface();
  }
  FL_EXPORT_C(int,Fl_Printer_start_job)(fl_Printer printer,int pagecount){
    return (static_cast<Fl_Printer*>(printer))->start_job(pagecount);
  }
  FL_EXPORT_C(int,Fl_Printer_start_job_with_frompage)(fl_Printer printer,int pagecount,int* frompage){
    return (static_cast<Fl_Printer*>(printer))->start_job(pagecount,frompage);
  }
  FL_EXPORT_C(int,Fl_Printer_start_job_with_topage)(fl_Printer printer,int pagecount,int* topage){
    return (static_cast<Fl_Printer*>(printer))->start_job(pagecount,NULL,topage);
  }
  FL_EXPORT_C(int,Fl_Printer_start_job_with_frompage_topage)(fl_Printer printer,int pagecount,int* frompage,int* topage){
    return (static_cast<Fl_Printer*>(printer))->start_job(pagecount,frompage,topage);
  }
  FL_EXPORT_C(int,Fl_Printer_start_page)(fl_Printer printer){
    return (static_cast<Fl_Printer*>(printer))->start_page();
  }
  FL_EXPORT_C(int,Fl_Printer_printable_rect)(fl_Printer printer,int* w,int* h){
    return (static_cast<Fl_Printer*>(printer))->printable_rect(w,h);
  }
  FL_EXPORT_C(void,Fl_Printer_margins)(fl_Printer printer,int* left,int* top,int* right,int* bottom){
    (static_cast<Fl_Printer*>(printer))->margins(left,top,right,bottom);
  }
  FL_EXPORT_C(void,Fl_Printer_origin)(fl_Printer printer,int* x,int* y){
    (static_cast<Fl_Printer*>(printer))->origin(x,y);
  }
  FL_EXPORT_C(void,Fl_Printer_scale)(fl_Printer printer,float scale_x){
    (static_cast<Fl_Printer*>(printer))->scale(scale_x);
  }
  FL_EXPORT_C(void,Fl_Printer_scale_with_scale_y)(fl_Printer printer,float scale_x,float scale_y){
    (static_cast<Fl_Printer*>(printer))->scale(scale_x,scale_y);
  }
  FL_EXPORT_C(void,Fl_Printer_rotate)(fl_Printer printer,float angle){
    (static_cast<Fl_Printer*>(printer))->rotate(angle);
  }
  FL_EXPORT_C(void,Fl_Printer_translate)(fl_Printer printer,int x,int y){
    (static_cast<Fl_Printer*>(printer))->translate(x,y);
  }
  FL_EXPORT_C(void,Fl_Printer_untranslate)(fl_Printer printer){
    (static_cast<Fl_Printer*>(printer))->untranslate();
  }
  FL_EXPORT_C(void,Fl_Printer_print_widget)(fl_Printer printer,fl_Widget widget){
    (static_cast<Fl_Printer*>(printer))->print_widget((static_cast<Fl_Widget*>(widget)));
  }
  FL_EXPORT_C(void,Fl_Printer_print_widget_with_delta_x)(fl_Printer printer,fl_Widget widget,int delta_x){
    (static_cast<Fl_Printer*>(printer))->print_widget((static_cast<Fl_Widget*>(widget)),delta_x);
  }
  FL_EXPORT_C(void,Fl_Printer_print_widget_with_delta_y)(fl_Printer printer,fl_Widget widget,int delta_y){
    (static_cast<Fl_Printer*>(printer))->print_widget((static_cast<Fl_Widget*>(widget)),0,delta_y);
  }
  FL_EXPORT_C(void,Fl_Printer_print_widget_with_delta_x_delta_y)(fl_Printer printer,fl_Widget widget,int delta_x,int delta_y){
    (static_cast<Fl_Printer*>(printer))->print_widget((static_cast<Fl_Widget*>(widget)),delta_x,delta_y);
  }
  FL_EXPORT_C(void,Fl_Printer_print_window)(fl_Printer printer,fl_Window win){
    (static_cast<Fl_Printer*>(printer))->print_window((static_cast<Fl_Window*>(win)));
  }
  FL_EXPORT_C(void,Fl_Printer_print_window_with_x_offset)(fl_Printer printer,fl_Window win,int x_offset){
    (static_cast<Fl_Printer*>(printer))->print_window((static_cast<Fl_Window*>(win)),x_offset);
  }
  FL_EXPORT_C(void,Fl_Printer_print_window_with_y_offset)(fl_Printer printer,fl_Window win,int y_offset){
    (static_cast<Fl_Printer*>(printer))->print_window((static_cast<Fl_Window*>(win)),y_offset);
  }
  FL_EXPORT_C(void,Fl_Printer_print_window_with_x_offset_y_offset)(fl_Printer printer,fl_Window win,int x_offset,int y_offset){
    (static_cast<Fl_Printer*>(printer))->print_window((static_cast<Fl_Window*>(win)),x_offset,y_offset);
  }
  FL_EXPORT_C(void,Fl_Printer_print_window_part)(fl_Printer printer,fl_Window win,int x,int y,int w,int h){
    (static_cast<Fl_Printer*>(printer))->print_window_part((static_cast<Fl_Window*>(win)),x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Printer_print_window_part_with_delta_x)(fl_Printer printer,fl_Window win,int x,int y,int w,int h,int delta_x){
    (static_cast<Fl_Printer*>(printer))->print_window_part((static_cast<Fl_Window*>(win)),x,y,w,h,delta_x);
  }
  FL_EXPORT_C(void,Fl_Printer_print_window_part_with_delta_y)(fl_Printer printer,fl_Window win,int x,int y,int w,int h,int delta_y){
    (static_cast<Fl_Printer*>(printer))->print_window_part((static_cast<Fl_Window*>(win)),x,y,w,h,0,delta_y);
  }
  FL_EXPORT_C(void,Fl_Printer_print_window_part_with_delta_xy)(fl_Printer printer,fl_Window win,int x,int y,int w,int h,int delta_x,int delta_y){
    (static_cast<Fl_Printer*>(printer))->print_window_part((static_cast<Fl_Window*>(win)),x,y,w,h,delta_x,delta_y);
  }
  FL_EXPORT_C(int,Fl_Printer_end_page)(fl_Printer printer){
    return (static_cast<Fl_Printer*>(printer))->end_page();
  }
  FL_EXPORT_C(void,Fl_Printer_end_job)(fl_Printer printer){
    (static_cast<Fl_Printer*>(printer))->end_job();
  }
  FL_EXPORT_C(fl_Printer, Fl_Printer_New)(){
    Fl_Printer* p = new Fl_Printer();
    return (fl_Printer)p;
  }
  FL_EXPORT_C(void, Fl_Printer_Destroy)(fl_Printer printer){
    delete (static_cast<Fl_Printer*>(printer));
  }
#ifdef __cplusplus
}
#endif
