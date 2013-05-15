#include <stdio.h>
#include "Fl_C.h"
#include "Fl_Types.h"

int main(int argc, char** argv)
{
  fl_Window win = (fl_Window)Fl_Window_NewWH_WithTitle(640,480,100,100,"FLTK Window");
  Fl_Window_show_with_args(win, argc, argv);
  Fl_Window_fullscreen(win);
  return flkc_run();
}
