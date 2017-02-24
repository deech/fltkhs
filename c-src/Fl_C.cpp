#include <FL/Fl.H>
#include "Fl_ExportMacros.h"
#ifdef __cplusplus
#include "Fl_C.h"
  class C_to_Fl_Event_Dispatch {
  public:
    static fl_Event_Dispatch* cb;
    static int intercept(int event, Fl_Window* window) {
      fl_Window w = (fl_Window)window;
      return (*cb)(event, w);
    }
  };
  fl_Event_Dispatch* C_to_Fl_Event_Dispatch::cb = 0;
  class C_to_Fl_Label_Draw_F {
  public:
    static fl_Label_Draw_F* cb;
    static void intercept(const Fl_Label* label, int x, int y, int w, int h, Fl_Align align) {
      fl_Label* l = (fl_Label*)label;
      (*cb)(l, x, y, w, h, align);
    }
  };
  fl_Label_Draw_F* C_to_Fl_Label_Draw_F::cb = 0;
  class C_to_Fl_Label_Measure_F {
  public:
    static fl_Label_Measure_F* cb;
    static void intercept(const Fl_Label* label, int& width, int& height) {
      fl_Label* l = (fl_Label*)label;
      int* w = &width;
      int* h = &height;
      (*cb)(l, w, h);
    }
  };
  fl_Label_Measure_F* C_to_Fl_Label_Measure_F::cb = 0;
  class C_to_Fl_Abort_Handler {
  public:
    static fl_Abort_Handler* cb;
    static void intercept(const char* format, ...) {
      va_list argp;
      va_start(argp, format);
      (*cb)(format, argp);
      va_end(argp);
    }
  };
  fl_Abort_Handler* C_to_Fl_Abort_Handler::cb = 0;
  class C_to_Fl_Atclose_Handler {
  public:
    static fl_Atclose_Handler* cb;
    static void intercept(Fl_Window* window, void* data){
      fl_Window w = (fl_Window)window;
      (*cb)(w,data);
    }
  };
  fl_Atclose_Handler* C_to_Fl_Atclose_Handler::cb = 0;
EXPORT {
#endif
  FL_EXPORT_C(int, Fl_run)(){ return Fl::run(); }
  FL_EXPORT_C(int, Fl_check)() { return Fl::check(); }
  FL_EXPORT_C(int, Fl_ready)() { return Fl::ready(); }
  FL_EXPORT_C(int, Fl_add_awake_handler_)(fl_Awake_Handler handler, void* user_data){
    return Fl::add_awake_handler_(handler, user_data);}

  FL_EXPORT_C(int, Fl_get_awake_handler_)(fl_Awake_Handler* handler, void** user_data){
    return Fl::get_awake_handler_(*handler, *user_data);
  }
  FL_EXPORT_C(double,Fl_version)( ){
    return Fl::version();
  }
  FL_EXPORT_C(const char*, Fl_help)(){
    return Fl::help;
  }
  FL_EXPORT_C(void,Fl_args)(int argc,char **argv){
    Fl::args(argc,argv);
  }
  FL_EXPORT_C(int,Fl_args_with_handler)(int argc,char **argv,int i,fl_Args_Handler cb){
    return Fl::args(argc,argv,i,cb);
  }
  FL_EXPORT_C(int,Fl_arg)(int argc,char **argv,int i){
    return Fl::arg(argc,argv,i);
  }
  FL_EXPORT_C(int,Fl_args_with_i)(int argc,char **argv,int i){
    return Fl::args(argc,argv,i);
  }
  FL_EXPORT_C(void,Fl_display)(const char* text){
    Fl::display(text);
  }
  FL_EXPORT_C(int,Fl_visual)(int mode){
    return Fl::visual(mode);
  }
#if !defined(__APPLE__)
  FL_EXPORT_C(int,Fl_gl_visual)(int mode){
    return Fl::gl_visual(mode);
  }
  FL_EXPORT_C(int,Fl_gl_visual_with_alist)(int mode,int *alist){
    return Fl::gl_visual(mode,alist);
  }
#endif
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
  FL_EXPORT_C(int,Fl_is_scheme)(const char* text){
    return Fl::is_scheme(text);
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
  FL_EXPORT_C(int,Fl_option)(Fl_Option option){
    Fl::Fl_Option o = (Fl::Fl_Option)-1;
    switch(option){
    case OPTION_ARROW_FOCUS: { o = Fl::OPTION_ARROW_FOCUS; break;}
    case OPTION_VISIBLE_FOCUS: { o = Fl::OPTION_VISIBLE_FOCUS; break;}
    case OPTION_DND_TEXT: { o = Fl::OPTION_DND_TEXT; break;}
    case OPTION_SHOW_TOOLTIPS: { o = Fl::OPTION_SHOW_TOOLTIPS; break;}
    case OPTION_LAST: { o = Fl::OPTION_LAST; break;}
    default:                 {o = (Fl::Fl_Option)-1;  break;}
    }
    return Fl::option(o) ? 1 : 0;
  }
  FL_EXPORT_C(void,Fl_set_option)(Fl_Option option, int val){
    Fl::Fl_Option o = (Fl::Fl_Option)-1;
    switch(option){
    case OPTION_ARROW_FOCUS: { o = Fl::OPTION_ARROW_FOCUS; break;}
    case OPTION_VISIBLE_FOCUS: { o = Fl::OPTION_VISIBLE_FOCUS; break;}
    case OPTION_DND_TEXT: { o = Fl::OPTION_DND_TEXT; break;}
    case OPTION_SHOW_TOOLTIPS: { o = Fl::OPTION_SHOW_TOOLTIPS; break;}
    case OPTION_LAST: { o = Fl::OPTION_LAST; break;}
    default:                 {o = (Fl::Fl_Option)-1;  break;}
    }
    Fl::option(o,val >= 1 ? true : false);
  }
  FL_EXPORT_C(fl_Widget,Fl_readqueue)(){
    return (fl_Widget)Fl::readqueue();
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
  FL_EXPORT_C(void,Fl_remove_idle)(fl_Idle_Handler cb){
    Fl::remove_idle(cb);
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
  FL_EXPORT_C(fl_Window,Fl_next_window)(fl_Window window){
    return (fl_Window)Fl::next_window((static_cast<Fl_Window*>(window)));
  }
  FL_EXPORT_C(fl_Window,Fl_modal)(){
    return (fl_Window)Fl::modal();
  }
  FL_EXPORT_C(fl_Window,Fl_grab)( ){
    return (fl_Window)Fl::grab();
  }
  FL_EXPORT_C(fl_Window,Fl_first_window)(){
    return (fl_Window)Fl::first_window();
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
  FL_EXPORT_C(int,Fl_event)( ){
    return Fl::event();
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
  FL_EXPORT_C(int,Fl_contains_event_state)(int i){
    return Fl::event_state(i);
  }
  FL_EXPORT_C(int,Fl_event_key)( ){
    return Fl::event_key();
  }
  FL_EXPORT_C(int,Fl_event_original_key)( ){
    return Fl::event_original_key();
  }
  FL_EXPORT_C(int,Fl_event_key_pressed)(int key){
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
  FL_EXPORT_C(void,Fl_enable_im)(){
    return Fl::enable_im();
  }
  FL_EXPORT_C(void,Fl_disable_im)(){
    return Fl::disable_im();
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
  FL_EXPORT_C(void,Fl_set_pushed)(fl_Widget widget){
    Fl::pushed((static_cast<Fl_Widget*>(widget)));
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
  FL_EXPORT_C(void,Fl_set_event_dispatch)(fl_Event_Dispatch* d){
    C_to_Fl_Event_Dispatch::cb = d;
    Fl::event_dispatch(C_to_Fl_Event_Dispatch::intercept);
  }
  FL_EXPORT_C(fl_Event_Dispatch,Fl_event_dispatch)( ){
    return *C_to_Fl_Event_Dispatch::cb;
  }
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
  FL_EXPORT_C(int,Fl_screen_count)( ){
    return Fl::screen_count();
  }
  FL_EXPORT_C(void,Fl_screen_xywh)(int* X,int* Y,int* W,int* H){
    Fl::screen_xywh(*X,*Y,*W,*H);
  }
  FL_EXPORT_C(void,Fl_screen_xywh_with_mxmy)(int* X,int* Y,int* W,int* H,int mx,int my){
    Fl::screen_xywh(*X,*Y,*W,*H,mx,my);
  }
  FL_EXPORT_C(void,Fl_screen_xywh_with_n)(int* X,int* Y,int* W,int* H,int n){
    Fl::screen_xywh(*X,*Y,*W,*H,n);
  }
  FL_EXPORT_C(void,Fl_screen_xywh_with_mxmymwmh)(int* X,int* Y,int* W,int* H,int mx,int my,int mw,int mh){
    Fl::screen_xywh(*X,*Y,*W,*H,mx,my,mw,mh);
  }
  FL_EXPORT_C(void,Fl_screen_dpi)(float* h,float* v){
    Fl::screen_dpi(*h,*v);
  }
  FL_EXPORT_C(void,Fl_screen_dpi_with_n)(float* h,float* v,int n){
    Fl::screen_dpi(*h,*v,n);
  }
  FL_EXPORT_C(void,Fl_screen_work_area_with_mx_my)(int* X,int* Y,int* W,int* H,int mx,int my){
    Fl::screen_work_area(*X,*Y,*W,*H,mx,my);
  }
  FL_EXPORT_C(void,Fl_screen_work_area_with_n)(int* X,int* Y,int* W,int* H,int n){
    Fl::screen_work_area(*X,*Y,*W,*H,n);
  }
  FL_EXPORT_C(void,Fl_screen_work_area)(int* X,int* Y,int* W,int* H){
    Fl::screen_work_area(*X,*Y,*W,*H);
  }
  FL_EXPORT_C(void,Fl_set_color_rgb)(Fl_Color color,uchar r,uchar g,uchar b){
    Fl::set_color(color,r,g,b);
  }
  FL_EXPORT_C(void,Fl_set_color)(Fl_Color i,unsigned c){
    Fl::set_color(i,c);
  }
  FL_EXPORT_C(unsigned,Fl_get_color)(Fl_Color i){
    return Fl::get_color(i);
  }
  FL_EXPORT_C(void,Fl_get_color_rgb)(Fl_Color i,uchar *red,uchar *green,uchar *blue){
    Fl::get_color(i,*red,*green,*blue);
  }
#if !defined(__APPLE__)
  FL_EXPORT_C(void,Fl_free_color)(Fl_Color i){
    Fl::free_color(i);
  }
  FL_EXPORT_C(void,Fl_free_color_with_overlay)(Fl_Color i,int overlay){
    Fl::free_color(i,overlay);
  }
#endif
  FL_EXPORT_C(const char*,Fl_get_font)(Fl_Font font){
    return Fl::get_font(font);
  }
  FL_EXPORT_C(const char*,Fl_get_font_name)(Fl_Font font){
    return Fl::get_font_name(font);
  }
  FL_EXPORT_C(const char*,Fl_get_font_name_with_attributes)(Fl_Font font,int* attributes){
    return Fl::get_font_name(font,attributes);
  }
  FL_EXPORT_C(int,Fl_get_font_sizes)(Fl_Font font,int* sizep){
    return Fl::get_font_sizes(font,sizep);
  }
  FL_EXPORT_C(void,Fl_set_font_by_string)(Fl_Font font,const char* text){
    Fl::set_font(font,text);
  }
  FL_EXPORT_C(void,Fl_set_font_by_font)(Fl_Font to,Fl_Font from){
    Fl::set_font(to,from);
  }
  FL_EXPORT_C(Fl_Font,Fl_set_fonts)(){
    return Fl::set_fonts();
  }
  FL_EXPORT_C(Fl_Font,Fl_set_fonts_with_string)(const char* string){
    return Fl::set_fonts(string);
  }
  FL_EXPORT_C(void,Fl_set_labeltype)(Fl_Labeltype labeltype,fl_Label_Draw_F* label_draw_f,fl_Label_Measure_F* label_measure_f){
    C_to_Fl_Label_Draw_F::cb = label_draw_f;
    C_to_Fl_Label_Measure_F::cb = label_measure_f;
    Fl::set_labeltype(labeltype,C_to_Fl_Label_Draw_F::intercept,C_to_Fl_Label_Measure_F::intercept);
  }
  // FL_EXPORT_C(void,Fl_set_labeltype_by_labeltype)(Fl_Labeltype to ,Fl_Labeltype from){
  //   Fl::set_labeltype(to,from);
  // }
  FL_EXPORT_C(fl_Box_Draw_F*,Fl_get_boxtype)(Fl_Boxtype boxtype){
    return Fl::get_boxtype(boxtype);
  }
  FL_EXPORT_C(void,Fl_set_boxtype)(Fl_Boxtype boxtype,fl_Box_Draw_F* box_draw_f,uchar offsetX,uchar offsetY,uchar offsetW,uchar offsetH){
    Fl::set_boxtype(boxtype,box_draw_f,offsetX,offsetY,offsetW,offsetH);
  }
  FL_EXPORT_C(void,Fl_set_boxtype_by_boxtype)(Fl_Boxtype to,Fl_Boxtype from){
    Fl::set_boxtype(to,from);
  }
  FL_EXPORT_C(int,Fl_box_dx)(Fl_Boxtype boxtype){
    return Fl::box_dx(boxtype);
  }
  FL_EXPORT_C(int,Fl_box_dy)(Fl_Boxtype boxtype){
    return Fl::box_dy(boxtype);
  }
  FL_EXPORT_C(int,Fl_box_dw)(Fl_Boxtype boxtype){
    return Fl::box_dw(boxtype);
  }
  FL_EXPORT_C(int,Fl_box_dh)(Fl_Boxtype boxtype){
    return Fl::box_dh(boxtype);
  }
  FL_EXPORT_C(int,Fl_draw_box_active)( ){
    return Fl::draw_box_active();
  }
  FL_EXPORT_C(void,Fl_default_atclose)(fl_Window window,void* data){
    Fl::default_atclose((static_cast<Fl_Window*>(window)),data);
  }
  FL_EXPORT_C(void,Fl_set_atclose)(fl_Atclose_Handler* f){
    C_to_Fl_Atclose_Handler::cb = f;
    Fl::set_atclose(C_to_Fl_Atclose_Handler::intercept);
  }
  FL_EXPORT_C(int,Fl_event_shift)( ){
    return Fl::event_shift();
  }
  FL_EXPORT_C(int,Fl_event_ctrl)( ){
    return Fl::event_ctrl();
  }
  FL_EXPORT_C(int,Fl_event_command)( ){
    return Fl::event_command();
  }
  FL_EXPORT_C(int,Fl_event_alt)( ){
    return Fl::event_alt();
  }
  FL_EXPORT_C(int,Fl_event_buttons)( ){
    return Fl::event_buttons();
  }
  FL_EXPORT_C(int,Fl_event_button1)( ){
    return Fl::event_button1();
  }
  FL_EXPORT_C(int,Fl_event_button2)( ){
    return Fl::event_button2();
  }
  FL_EXPORT_C(int,Fl_event_button3)( ){
    return Fl::event_button3();
  }
  FL_EXPORT_C(void,Fl_set_idle)(fl_Old_Idle_Handler cb){
    Fl::set_idle(cb);
  }
  FL_EXPORT_C(void,Fl_release)( ){
    Fl::release();
  }
  FL_EXPORT_C(void,Fl_set_visible_focus)(int v){
    Fl::visible_focus(v);
  }
  FL_EXPORT_C(int,Fl_visible_focus)( ){
    return Fl::visible_focus();
  }
  FL_EXPORT_C(void,Fl_set_dnd_text_ops)(int v){
    Fl::dnd_text_ops(v);
  }
  FL_EXPORT_C(int,Fl_dnd_text_ops)( ){
    return Fl::dnd_text_ops();
  }
  FL_EXPORT_C(int,Fl_lock)( ){
    return Fl::lock();
  }
  FL_EXPORT_C(void,Fl_unlock)( ){
    Fl::unlock();
  }
  FL_EXPORT_C(void,Fl_awake)(){
    Fl::awake((void*)0);
  }
  FL_EXPORT_C(void,Fl_awake_with_message)(void* message){
    Fl::awake(message);
  }
  FL_EXPORT_C(int,Fl_awake_with_cb)(fl_Awake_Handler cb){
    return Fl::awake(cb,0);
  }
  FL_EXPORT_C(int,Fl_awake_with_cb_message)(fl_Awake_Handler cb, void* message){
    return Fl::awake(cb, message);
  }
  FL_EXPORT_C(void*,Fl_thread_message)( ){
    return Fl::thread_message();
  }
  FL_EXPORT_C(void,Fl_delete_widget)(fl_Widget w) {
    Fl::delete_widget((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_clear_widget_pointer)(fl_Widget w){
    Fl::clear_widget_pointer((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_do_widget_deletion)( ){
    Fl::do_widget_deletion();
  }
  FL_EXPORT_C(void,Fl_watch_widget_pointer)(fl_Widget w){
    Fl_Widget& ref = *(static_cast<Fl_Widget*>(w));
    Fl_Widget* refPtr = &ref;
    Fl::watch_widget_pointer(refPtr);
  }
  FL_EXPORT_C(void,Fl_release_widget_pointer)(fl_Widget w){
    Fl_Widget& ref = *(static_cast<Fl_Widget*>(w));
    Fl_Widget* refPtr = &ref;
    Fl::release_widget_pointer(refPtr);
  }
#if FL_API_VERSION == 10304
  FL_EXPORT_C(void,Fl_set_box_color)(Fl_Color c) {
    Fl::set_box_color(c);
  }
  FL_EXPORT_C(Fl_Color,Fl_box_color)(Fl_Color c){
    return Fl::box_color(c);
  }
  FL_EXPORT_C(int,Fl_abi_version)(){
    return Fl::abi_version();
  }
  FL_EXPORT_C(int,Fl_api_version)(){
    return Fl::api_version();
  }
  FL_EXPORT_C(const char*,Fl_local_ctrl)(){
    return fl_local_ctrl;
  }
  FL_EXPORT_C(const char*,Fl_local_meta)(){
    return fl_local_meta;
  }
  FL_EXPORT_C(const char*,Fl_local_alt)(){
    return fl_local_alt;
  }
  FL_EXPORT_C(const char*,Fl_local_shift)(){
    return fl_local_shift;
  }
#endif

#ifdef __cplusplus
}
#endif
