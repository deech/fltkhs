#include <stdio.h>
#include "Fl_C.h"
#include "Fl_Types.h"

void my_callback(fl_Button b, void* user_data) {
  puts("The callback has been called!");
}
int main(int argc, char** argv)
{
  char* title = "FLTK Button Window";
  fl_Window win = (fl_Window)Fl_Window_New_WithTitle(500,500,title);
  fl_Button b = (fl_Button)Fl_Button_New_WithLabel(20,20,100,100,"Test Button");
  Fl_Button_set_callback(b, (fl_Callback*)my_callback);
  Fl_Window_end(win);
  Fl_Window_show(win);
  return flkc_run();
}
