#include <stdio.h>
#include "Fl_C.h"
#include "Fl_Types.h"
#include "Fl_WindowC.h"

int main(int argc, char** argv)
{
  fl_Window win = (fl_Window)Fl_Window_NewWH_WithLabel(640,480,500,500,"FLTK Window");
  Fl_Window_show(win);
  return Fl_run();
}

