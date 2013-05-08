#include <stdio.h>
#include "Fl_C.h"

int main(int argc, char** argv)
{
  void* win = Fl_Window_NewWH_WithTitle(640,480,100,100,"FLTK Window");
  Fl_Window_show_with_args(win, argc, argv);
  Fl_Window_hide(win);
  puts("Should just return. We're showing a window and immediately hiding it.");
  return flkc_run();
}
