#include <stdio.h>
#include "Fl_C.h"
#include "Fl_Types.h"

void my_callback(fl_Widget w, void* user_data) {
  puts("My callback has been called!");
}
int main(int argc, char** argv)
{
  fl_Window win = (fl_Window)Fl_Window_NewWH_WithTitle(640,480,500,500,"FLTK Window");
  Fl_Window_set_callback(win,(fl_Callback*)my_callback);
  Fl_Window_show(win);
  return flkc_run();
}
