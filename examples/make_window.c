#include <stdio.h>
#include "Fl_C.h"
#include "Fl_Types.h"

int main(int argc, char** argv)
{
  char* title = "FLTK Window";
  fl_Window win = (fl_Window)Fl_Window_New_WithTitle(500,500,title);
  flkc_check();
  Fl_Window_show(win);
  return flkc_run();
}
