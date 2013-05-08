#include <stdio.h>
#include "Fl_C.h"

int main(int argc, char** argv)
{
  void* win = Fl_Window_NewWH_WithTitle(640,480,200,300,"FLTK Window");
  Fl_Window_show_with_args(win,argc,argv);
  flkc_run();
  Fl_Window_resize(win, 100,100, 500,500);
  return 0;
}
