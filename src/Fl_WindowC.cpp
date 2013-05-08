#include "Fl_WindowC.h"
#include "FL/Fl_Window.H"
#include "Fl_ExportMacros.h"

EXPORT {
  FL_EXPORT_C(void*, Fl_Window_New_WithTitle)(int x, int y, const char* title) {
    Fl_Window* window = new Fl_Window(x,y,title);
    return (void*)window;
  }
  FL_EXPORT_C(void*, Fl_Window_New)(int x, int y) {
    Fl_Window* window = new Fl_Window(x,y,0);
    return (void*)window;
  }
  FL_EXPORT_C(void*, Fl_Window_NewWH_WithTitle)(int x, int y, int w, int h, const char* title) {
    Fl_Window* window = new Fl_Window(x,y,w,h,title);
    return (void*)window;
  }
  FL_EXPORT_C(void*, Fl_Window_NewWH)(int x, int y, int w, int h) {
    Fl_Window* window = new Fl_Window(x,y,w,h,0);
    return (void*)window;
  }
  FL_EXPORT_C(void*, Fl_Window_show_with_args)(void* win, int argc, char** argv){
    (static_cast<Fl_Window*>(win))->show(argc,argv);
  }
  FL_EXPORT_C(void*, Fl_Window_show)(void* win){
    (static_cast<Fl_Window*>(win))->show();
  }
  FL_EXPORT_C(void*, Fl_Window_hide)(void* win){
    (static_cast<Fl_Window*>(win))->hide();
  }
  FL_EXPORT_C(void*, Fl_Window_fullscreen)(void* win){
    (static_cast<Fl_Window*>(win))->fullscreen();
  }
  FL_EXPORT_C(void*, Fl_Window_fullscreen_off)(void* win){
    (static_cast<Fl_Window*>(win))->fullscreen_off();
  }
  FL_EXPORT_C(void*, Fl_Window_fullscreen_off_with_resize)(void* win,int X,int Y,int W,int H){
    (static_cast<Fl_Window*>(win))->fullscreen_off(X,Y,W,H);
  }
  FL_EXPORT_C(void*, Fl_Window_resize)(void* win, int X, int Y, int W, int H){
    (static_cast<Fl_Window*>(win))->resize(X,Y,W,H);
  }
  FL_EXPORT_C(void*, Fl_Window_destroy)(void* win){
    delete (static_cast<Fl_Window*>(win));
  }
  FL_EXPORT_C(void*, Fl_Window_make_current)(void* win){
    (static_cast<Fl_Window*>(win))->make_current();
  }
  FL_EXPORT_C(void*, Fl_Window_iconize)(void* win){
    (static_cast<Fl_Window*>(win))->iconize();
  }
}
