#include <Fl_C.h>
#include <Fl_Double_WindowC.h>
#include <Fl_ClockC.h>
#include <Fl_Round_ClockC.h>

int main(int argc, char **argv) {
  fl_Double_Window window = (fl_Double_Window)Fl_Double_Window_New_WithLabel(220,220,"Fl_Clock");
  fl_Clock c1 = (fl_Clock)Fl_Clock_New(0,0,220,220);
  Fl_Double_Window_set_resizable(window,c1);
  Fl_Double_Window_end(window);
  fl_Double_Window window2 = (fl_Double_Window)Fl_Double_Window_New_WithLabel(220,220,"Fl_Round_Clock");
  fl_Round_Clock c2 = (fl_Round_Clock) Fl_Round_Clock_New(0,0,220,220); // c2.color(3,4);
  Fl_Double_Window_set_resizable(window2,c2);
  Fl_Double_Window_end(window2);
  Fl_Double_Window_set_xclass(window,"Fl_Clock");
  Fl_Double_Window_set_xclass(window2,"Fl_Clock");
  Fl_Double_Window_show_with_args(window,argc,argv);
  Fl_Double_Window_show(window2);
  return Fl_run();
}
