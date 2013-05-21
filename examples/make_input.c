#include <stdio.h>
#include "Fl_C.h"
#include "Fl_Types.h"

int main(int argc, char** argv)
{
  char* title = "FLTK Input Window";
  fl_Window win = (fl_Window)Fl_Window_New_WithTitle(500,500,title);
  Fl_Window_begin(win);
  Fl_File_Input_New_WithLabel(150,50,200,40,"File Input Box");
  Fl_Float_Input_New_WithLabel(150,100,200,40,"Float Input Box");
  Fl_Int_Input_New_WithLabel(150,150,200,40,"Int Input Box");
  Fl_Secret_Input_New_WithLabel(150,200,200,40,"Secret Input Box");
  Fl_Multiline_Input_New_WithLabel(150,250,200,80,"Multiline Input Box");
  Fl_Input_New_WithLabel(150,320,200,40,"Input Box");
  Fl_Window_end(win);
  Fl_Window_show(win);
  return flkc_run();
}
