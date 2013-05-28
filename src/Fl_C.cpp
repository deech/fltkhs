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
    Fl::add_timeout(t,handler,0);
  }
  FL_EXPORT_C(void,Fl_add_timeout_with_userdata)(double t,fl_Timeout_Handler handler,void* userdata){
    Fl::add_timeout(t,handler,userdata);
  }
  FL_EXPORT_C(void,Fl_repeat_timeout)(double t,fl_Timeout_Handler handler){
    return Fl::repeat_timeout(t,handler,0);
  }
  FL_EXPORT_C(void,Fl_repeat_timeout_with_userdata)(double t,fl_Timeout_Handler handler,void* userdata){
    return Fl::repeat_timeout(t,handler,userdata);
  }
  FL_EXPORT_C(int,Fl_has_timeout)(fl_Timeout_Handler handler){
    return Fl::has_timeout(handler,0);
  }
  FL_EXPORT_C(int,Fl_has_timeout_with_userdata)(fl_Timeout_Handler handler, void* userdata){
    return Fl::has_timeout(handler,userdata);
  }
  FL_EXPORT_C(void,Fl_remove_timeout)(fl_Timeout_Handler handler){
    return Fl::remove_timeout(handler,0);
  }
  FL_EXPORT_C(void,Fl_remove_timeout_with_userdata)(fl_Timeout_Handler handler,void* userdata){
    return Fl::remove_timeout(handler,userdata);
  }
  FL_EXPORT_C(void,Fl_add_check)(fl_Timeout_Handler handler){ return Fl::add_check(handler,0); }
  FL_EXPORT_C(void,Fl_add_check_with_userdata)(fl_Timeout_Handler handler,void* userdata){ return Fl::add_check(handler, userdata); }
  FL_EXPORT_C(int ,Fl_has_check)(fl_Timeout_Handler handler){ return Fl::has_check(handler,0); }
  FL_EXPORT_C(int ,Fl_has_check_with_userdata)(fl_Timeout_Handler handler, void* userdata){ return Fl::has_check(handler,userdata); }
  FL_EXPORT_C(void,Fl_remove_check)(fl_Timeout_Handler handler){ return Fl::remove_check(handler,0); }
  FL_EXPORT_C(void,Fl_remove_check_with_userdata)(fl_Timeout_Handler handler,void* userdata){ return Fl::remove_check(handler, userdata); }
  FL_EXPORT_C(void,Fl_add_fd_with_when)(int fd,int when,fl_FD_Handler cb){ return Fl::add_fd(fd,when,cb,0); }
  FL_EXPORT_C(void,Fl_add_fd_with_when_userdata)(int fd,int when,fl_FD_Handler cb,void* userdata){ return Fl::add_fd(fd,when,cb,userdata); }
  FL_EXPORT_C(void,Fl_add_fd)(int fd,fl_FD_Handler cb){ return Fl::add_fd(fd,cb,0); }
  FL_EXPORT_C(void,Fl_add_fd_with_userdata)(int fd,fl_FD_Handler cb,void* userdata){ return Fl::add_fd(fd,cb,userdata); }
  FL_EXPORT_C(void,Fl_add_idle)(fl_Idle_Handler cb){
    Fl::add_idle(cb,0);
  }
  FL_EXPORT_C(void,Fl_add_idle_with_userdata)(fl_Idle_Handler cb,void* userdata){
    Fl::add_idle(cb,userdata);
  }
  FL_EXPORT_C(int,Fl_has_idle)(fl_Idle_Handler cb){
    return Fl::has_idle(cb,0);
  }
  FL_EXPORT_C(int,Fl_has_idle_with_userdata)(fl_Idle_Handler cb,void* userdata){
    return Fl::has_idle(cb,userdata);
  }
  FL_EXPORT_C(void,Fl_remove_idle_with_userdata)(fl_Idle_Handler cb,void* data){
    Fl::remove_idle(cb,data);
  }
  FL_EXPORT_C(int,Fl_damage)( ){
    return Fl::damage();
  }
  FL_EXPORT_C(void,Fl_redraw)( ){
    Fl::redraw();
  }
  FL_EXPORT_C(void,Fl_flush)( ){
    Fl::flush();
  }
  FL_EXPORT_C(fl_Window*,Fl_modal)(){
    return (fl_Window*)Fl::modal();
  }
  FL_EXPORT_C(fl_Window*,Fl_grab)( ){
    return (fl_Window*)Fl::grab();
  }
  FL_EXPORT_C(fl_Window*,Fl_first_window)(){
    (fl_Window*)Fl::first_window();
  }
  FL_EXPORT_C(void,Fl_set_first_window)(fl_Window window){
    Fl::first_window((static_cast<Fl_Window*>(window)));
  }
  FL_EXPORT_C(void,Fl_remove_fd_with_when)(int fd_handle, int when){
    Fl::remove_fd(fd_handle,when);
  }
  FL_EXPORT_C(void,Fl_remove_fd)(int fd_handle){
    Fl::remove_fd(fd_handle, -1);
  }
  FL_EXPORT_C(void,Fl_set_grab)(fl_Window window){
    Fl::grab((static_cast<Fl_Window*>(window)));
  }
  FL_EXPORT_C(int,Fl_event_x)( ){
    return Fl::event_x();
  }
  FL_EXPORT_C(int,Fl_event_y)( ){
    return Fl::event_y();
  }
  FL_EXPORT_C(int,Fl_event_x_root)( ){
    return Fl::event_x_root();
  }
  FL_EXPORT_C(int,Fl_event_y_root)( ){
    return Fl::event_y_root();
  }
  FL_EXPORT_C(int,Fl_event_dx)( ){
    return Fl::event_dx();
  }
  FL_EXPORT_C(int,Fl_event_dy)( ){
    return Fl::event_dy();
  }
  FL_EXPORT_C(void,Fl_get_mouse)(int* x,int* y){
    Fl::get_mouse(*x,*y);
  }
  FL_EXPORT_C(int,Fl_event_clicks)( ){
    return Fl::event_clicks();
  }
  FL_EXPORT_C(void,Fl_set_event_clicks)(int i){
    Fl::event_clicks(i);
  }
  FL_EXPORT_C(int,Fl_event_is_click)( ){
    return Fl::event_is_click();
  }
  FL_EXPORT_C(void,Fl_set_event_is_click)(int i){
    Fl::event_is_click(i);
  }
  FL_EXPORT_C(int,Fl_event_button)( ){
    return Fl::event_button();
  }
  FL_EXPORT_C(int,Fl_event_state)( ){
    return Fl::event_state();
  }
  FL_EXPORT_C(int,Fl_event_set_state)(int i){
    return Fl::event_state(i);
  }
  FL_EXPORT_C(int,Fl_event_key)( ){
    return Fl::event_key();
  }
  FL_EXPORT_C(int,Fl_event_original_key)( ){
    return Fl::event_original_key();
  }
  FL_EXPORT_C(int,Fl_set_event_key)(int key){
    return Fl::event_key(key);
  }
  FL_EXPORT_C(int,Fl_get_key)(int key){
    return Fl::get_key(key);
  }
  FL_EXPORT_C(const char*,Fl_event_text)( ){
    return Fl::event_text();
  }
  FL_EXPORT_C(int,Fl_event_length)( ){
    return Fl::event_length();
  }
  FL_EXPORT_C(int,Fl_compose)(int* del){
    return Fl::compose(*del);
  }
  FL_EXPORT_C(void,Fl_compose_reset)( ){
    Fl::compose_reset();
  }
  FL_EXPORT_C(int,Fl_event_inside_region)(int X,int Y,int W,int H){
    return Fl::event_inside(X,Y,W,H);
  }
  FL_EXPORT_C(int,Fl_event_inside_widget)(fl_Widget widget){
    return Fl::event_inside((static_cast<Fl_Widget*>(widget)));
  }
  FL_EXPORT_C(int,Fl_test_shortcut)(Fl_Shortcut shortcut){
    return Fl::test_shortcut(shortcut);
  }
  FL_EXPORT_C(int,Fl_handle)(int event,fl_Window window){
    return Fl::handle(event,(static_cast<Fl_Window*>(window)));
  }
  FL_EXPORT_C(int,Fl_handle_)(int event,fl_Window window){
    return Fl::handle_(event,(static_cast<Fl_Window*>(window)));
  }
  FL_EXPORT_C(fl_Widget,Fl_belowmouse)( ){
    return (fl_Widget)(Fl::belowmouse());
  }
  FL_EXPORT_C(void,Fl_set_belowmouse)(fl_Widget widget){
    Fl::belowmouse((static_cast<Fl_Widget*>(widget)));
  }
  FL_EXPORT_C(fl_Widget,Fl_pushed)( ){
    return (fl_Widget)Fl::pushed();
  }
  FL_EXPORT_C(void,Fl_set_pushed)( ){
    Fl::pushed();
  }
  FL_EXPORT_C(fl_Widget,Fl_focus)( ){
    return (fl_Widget)Fl::focus();
  }
  FL_EXPORT_C(void,Fl_set_focus)(fl_Widget widget){
    Fl::focus((static_cast<Fl_Widget*>(widget)));
  }
  FL_EXPORT_C(void,Fl_add_handler)(fl_Event_Handler h){
    Fl::add_handler(h);
  }
  FL_EXPORT_C(void,Fl_remove_handler)(fl_Event_Handler h){
    Fl::remove_handler(h);
  }
  // FL_EXPORT_C(void,Fl_event_set_dispatch)(fl_Event_Dispatch d){
  //   Fl::event_dispatch(d)
  // }
  // FL_EXPORT_C(Fl_Event_Dispatch,Fl_event_dispatch)( ){
  //   return Fl::event_dispatch();
  // }
  FL_EXPORT_C(void,Fl_copy)(const char* stuff,int len){
    Fl::copy(stuff,len,0);
  }
  FL_EXPORT_C(void,Fl_copy_with_destination)(const char* stuff,int len,int destination){
    Fl::copy(stuff,len,destination);
  }
  FL_EXPORT_C(void,Fl_paste)(fl_Widget receiver){
    Fl::paste(*(static_cast<Fl_Widget*>(receiver)));
  }
  FL_EXPORT_C(void,Fl_paste_with_source)(fl_Widget receiver,int source){
    Fl::paste(*(static_cast<Fl_Widget*>(receiver)), source);
  }
  FL_EXPORT_C(int,Fl_dnd)( ){
    return Fl::dnd();
  }
  FL_EXPORT_C(fl_Widget,Fl_selection_owner)( ){
    return (fl_Widget)Fl::selection_owner();
  }
  FL_EXPORT_C(void,Fl_set_selection_owner)(fl_Widget widget){
    Fl::selection_owner((static_cast<Fl_Widget*>(widget)));
  }
  FL_EXPORT_C(void,Fl_selection)(fl_Widget owner,const char* text,int len){
    Fl::selection(*(static_cast<Fl_Widget*>(owner)),text,len);
  }
  FL_EXPORT_C(int,Fl_x)( ){
    return Fl::x();
  }
  FL_EXPORT_C(int,Fl_y)( ){
    return Fl::y();
  }
  FL_EXPORT_C(int,Fl_w)( ){
    return Fl::w();
  }
  FL_EXPORT_C(int,Fl_h)( ){
    return Fl::h();
  }
#ifdef __cplusplus
}
#endif
