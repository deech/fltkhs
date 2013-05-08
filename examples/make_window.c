#include <stdio.h>
#include "Fl_C.h"

int main(int argc, char** argv)
{
  void* win = Fl_Window_New_WithTitle(1000,1000,"FLTK Window");
  Fl_Window_show(win);
  return flkc_run();
}
