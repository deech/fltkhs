#include <stdio.h>
#include "Fl_C.h"
#include "Fl_Types.h"

void callback_button1(fl_Button b1, void* user_data) {
  printf("%s %s\n", Fl_Button_label(b1), "has been clicked");
}
void callback_button2(fl_Button b2, void* user_data) {
  printf("%s %s\n", Fl_Button_label(b2), "has been clicked");
}

int main(int argc, char** argv)
{
  char* title = "FLTK Button Window";
  fl_Window win = (fl_Window)Fl_Window_New_WithTitle(500,500,title);
  fl_Button b1 = (fl_Button)Fl_Button_New_WithLabel(20,20,100,100,"Button 1");
  Fl_Button_set_callback(b1, (fl_Callback*)callback_button1);
  fl_Button b2 = (fl_Button)Fl_Button_New_WithLabel(130,20,100,100,"Button 2");
  Fl_Button_set_callback(b2, (fl_Callback*)callback_button2);
  Fl_Window_end(win);
  Fl_Window_show(win);
  return flkc_run();
}
