#include <stdlib.h>
#include <stdio.h>
#include <Fl_C.h>
#include <Fl_WindowC.h>
#include <Fl_ButtonC.h>
#include <Fl_Return_ButtonC.h>
#include <Fl_Repeat_ButtonC.h>
#include <Fl_Check_ButtonC.h>
#include <Fl_Light_ButtonC.h>
#include <Fl_Round_ButtonC.h>
#include <Fl_Toggle_ButtonC.h>
#include <Fl_TooltipC.h>

int main(int argc, char ** argv) {
  fl_Window window = Fl_Window_New(320,170);
  fl_Button b = Fl_Button_New_WithLabel(10, 10, 130, 30, "Fl_Button");
  Fl_Button_set_tooltip(b,"This is a Tooltip.");
  Fl_Repeat_Button_New_WithLabel(10,50,130,30,"Fl_Repeat_Button");
  Fl_Light_Button_New_WithLabel(10,90,130,30,"Fl_Light_Button");
  Fl_Toggle_Button_New_WithLabel(10,130,130,30,"Fl_Toggle_Button");
  Fl_Return_Button_New_WithLabel(150, 10, 160, 30, "Fl_Return_Button");
  Fl_Round_Button_New_WithLabel(150,50,160,30,"Fl_Round_Button");
  Fl_Check_Button_New_WithLabel(150,90,160,30,"Fl_Check_Button");
  Fl_Window_end(window);
  Fl_Window_show_with_args(window,argc,argv);
  return Fl_run();
}
