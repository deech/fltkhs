#include <stdio.h>
#include "Fl_C.h"
#include "Fl_Types.h"
#include "Fl_WindowC.h"
int main(int argc, char** argv)
{
  fl_Window win = (fl_Window)Fl_Window_NewWH_WithLabel(640,480,100,100,"FLTK Window");
  Fl_Window_show_with_args(win, argc, argv);
  Fl_Window_hide(win);
  puts("Should just return. We're showing a window and immediately hiding it.");
  Fl_run();
  Fl_Window_Destroy(win);
  win = NULL;
  if (win == NULL) {  puts("Now we've freed the window object"); }
  return 0;
}
