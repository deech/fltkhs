#include <stdio.h>
#include "Fl_C.h"
#include "Fl_Types.h"

int main(int argc, char** argv)
{
  char* title = "FLTK Input Window";
  fl_Window win = (fl_Window)Fl_Window_New_WithTitle(500,500,title);
  Fl_Window_begin(win);
  Fl_Input_New_WithLabel(100,100,200,200,"Input Box");
  Fl_Window_end(win);
  Fl_Window_show(win);
  return flkc_run();
}
