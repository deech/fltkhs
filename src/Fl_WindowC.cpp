#include "Fl_WindowC.h"
#include "FL/Fl_Window.H"
#include "Fl_ExportMacros.h"

EXPORT {
  FL_EXPORT_C(void*, Fl_Window_New_WithTitle)(int x, int y, int w, int h, const char* title) {
    Fl_Window* window = new Fl_Window(x,y,w,h,title);
    return (void*)window;
  }
  FL_EXPORT_C(void*, Fl_Window_New)(int x, int y, int w, int h) {
    Fl_Window* window = new Fl_Window(x,y,w,h,0);
    return (void*)window;
  }
  FL_EXPORT_C(void*, Fl_Window_show_with_args)(void* win, int argc, char** argv){
    (static_cast<Fl_Window*>(win))->show(argc,argv);
  }
}
