#include <FL/Fl.H>
#include "Fl_ExportMacros.h"
#ifdef __cplusplus
#include "Fl_C.h"
EXPORT {
#endif
  FL_EXPORT_C(int, Fl_run)(){ return Fl::run(); }
  FL_EXPORT_C(int, Fl_check)() { return Fl::check(); }
  FL_EXPORT_C(int, Fl_ready)() { return Fl::ready(); }
  FL_EXPORT_C(int, Fl_add_awake_handler_)(fl_Awake_Handler handler, void* user_data){
    return Fl::add_awake_handler_(handler, user_data);}

  FL_EXPORT_C(int, Fl_get_awake_handler_)(fl_Awake_Handler handler, void* user_data){
    return Fl::get_awake_handler_(handler, user_data);
  }
  FL_EXPORT_C(double,Fl_version)( ){
    return Fl::version();
  }
  FL_EXPORT_C(int,Fl_args)(int argc,char **argv,int *i){
    return Fl::args(argc,argv,*i,0);
  }
  FL_EXPORT_C(int,Fl_args_with_handler)(int argc,char **argv,int* i,fl_Args_Handler cb){
    return Fl::args(argc,argv,*i,cb);
  }
  FL_EXPORT_C(int,Fl_arg)(int argc,char **argv,int* i){
    return Fl::arg(argc,argv,*i);
  }
  FL_EXPORT_C(void,Fl_display)(const char* text){
    Fl::display(text);
  }
  FL_EXPORT_C(int,Fl_visual)(int mode){
    return Fl::visual(mode);
  }
  FL_EXPORT_C(int,Fl_gl_visual)(int mode){
    return Fl::gl_visual(mode);
  }
  FL_EXPORT_C(int,Fl_gl_visual_with_alist)(int mode,int *alist){
    return Fl::gl_visual(mode,alist);
  }
  FL_EXPORT_C(void,Fl_own_colormap)( ){
    Fl::own_colormap();
  }
  FL_EXPORT_C(void,Fl_get_system_colors)( ){
    Fl::get_system_colors();
  }
  FL_EXPORT_C(void,Fl_foreground)(uchar r,uchar g,uchar b){
    Fl::foreground(r,g,b);
  }
  FL_EXPORT_C(void,Fl_background)(uchar r,uchar g,uchar b){
    Fl::background(r,g,b);
  }
  FL_EXPORT_C(void,Fl_background2)(uchar r,uchar g,uchar b){
    Fl::background2(r,g,b);
  }
  FL_EXPORT_C(int,Fl_set_scheme)(const char* text){
    return Fl::scheme(text);
  }
  FL_EXPORT_C(const char*,Fl_scheme)(){
    return Fl::scheme();
  }
  FL_EXPORT_C(int,Fl_scrollbar_size)( ){
    return Fl::scrollbar_size();
  }
  FL_EXPORT_C(void,Fl_set_scrollbar_size)(int W){
    Fl::scrollbar_size(W);
  }
  FL_EXPORT_C(int,Fl_wait)( ){
    return Fl::wait();
  }
  FL_EXPORT_C(double,Fl_set_wait)(double time){
    return Fl::wait(time);
  }
  FL_EXPORT_C(fl_Widget*,Fl_readqueue)(){
    return (fl_Widget*)Fl::readqueue();
  }
  FL_EXPORT_C(void,Fl_add_timeout)(double t,fl_Timeout_Handler handler){
    Fl::add_timeout(t,handler);
  }
  FL_EXPORT_C(void,Fl_add_timeout_with_userdata)(double t,fl_Timeout_Handler handler,void* userdata){
    Fl::add_timeout(t,handler,userdata);
  }
#ifdef __cplusplus
}
#endif
