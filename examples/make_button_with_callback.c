#include <stdio.h>
#include "Fl_C.h"
#include "Fl_Types.h"

void callback_button1(fl_Button b1, void* user_data) {
  printf("%s %s\n", (char*) Fl_Button_label(b1), "has been clicked");
}
void callback_button2(fl_Button b2, void* user_data) {
  printf("%s %s\n", (char*) Fl_Button_label(b2), "has been clicked");
}
void callback_button3_with_user_data(fl_Button b3, void* user_data) {
  printf("%s:%s %s\n", (char*) Fl_Button_label(b3), "Got the user data :", (char*)user_data);
}
int main(int argc, char** argv)
{
  char* title = "FLTK Button Window";
  fl_Window win = (fl_Window)Fl_Window_New_WithTitle(500,500,title);
  fl_Button b1 = (fl_Button)Fl_Button_New_WithLabel(20,20,100,100,"Button 1");
  Fl_Button_set_callback(b1, (fl_Callback*)callback_button1);
  fl_Button b2 = (fl_Button)Fl_Button_New_WithLabel(130,20,100,100,"Button 2");
  Fl_Button_set_callback(b2, (fl_Callback*)callback_button2);
  fl_Button b3 = (fl_Button)Fl_Button_New_WithLabel(240,20,100,100,"Button 3");
  char* user_data = "User data";
  Fl_Button_set_callback_and_user_data(b3, (fl_Callback*)callback_button3_with_user_data, (void*) user_data);
  fl_Check_Button check = (fl_Check_Button)Fl_Check_Button_New_WithLabel(20,130,100,100,"Check");
  fl_Radio_Button radio = (fl_Radio_Button)Fl_Radio_Button_New_WithLabel(130,130,100,100,"Radio");
  fl_Light_Button light = (fl_Light_Button)Fl_Light_Button_New_WithLabel(240,130,100,100,"Light");
  fl_Toggle_Button toggle = (fl_Toggle_Button)Fl_Toggle_Button_New_WithLabel(350,130,100,100,"Toggle");
  Fl_Window_end(win);
  Fl_Window_show(win);
  return flkc_run();
}
