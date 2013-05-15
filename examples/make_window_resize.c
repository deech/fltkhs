#include <stdio.h>
#include "Fl_C.h"
#include "Fl_Types.h"

int main(int argc, char** argv)
{
  fl_Window win = (fl_Window)Fl_Window_NewWH_WithTitle(640,480,200,300,"FLTK Window");
  Fl_Window_show_with_args(win,argc,argv);
  flkc_run();
  Fl_Window_resize(win, 100,100, 500,500);
  return 0;
}
