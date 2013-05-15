#include <stdio.h>
#include "Fl_C.h"

int main(int argc, char** argv)
{
  void* win = Fl_Window_New_WithTitle(500,500,"FLTK Window");
  flkc_check();
  Fl_Window_show(win);
  return flkc_run();
}
