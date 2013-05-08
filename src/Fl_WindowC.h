#ifndef __FL_WINDOW_C__
#define __FL_WINDOW_C__

#ifdef __cplusplus
extern "C" {
#endif

  void* Fl_Window_New_WithTitle(int x, int y, int w, int h, const char* title);
  void* Fl_Window_New(int x, int y, int w, int h);
  void* Fl_Window_show_with_args (void* win, int argc, char** argv);
  
#ifdef __cplusplus
}
#endif

#endif /* __FL_WINDOW_C__ */
