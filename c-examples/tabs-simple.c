#include <Fl_C.h>
#include <Fl_WindowC.h>
#include <Fl_TabsC.h>
#include <Fl_ButtonC.h>
#include <Fl_GroupC.h>

int main (int argc, char** argv){
  Fl_set_scheme("gtk+");
  fl_Window win = (fl_Window)Fl_Window_New_WithLabel(500,200,"Tabs Example");
  {

    // Create the tab widget
    fl_Tabs tabs = (fl_Tabs)Fl_Tabs_New(10,10,500-20,200-20);
    {
      fl_Group aaa = (fl_Group)Fl_Group_New_WithLabel(10,35,500-20,200-45,"Aaa");
      {
	fl_Button b1 = (fl_Button)Fl_Button_New_WithLabel(50, 60,90,25,"Button A1");
	Fl_Button_set_color(b1,88+1);
	fl_Button b2 = (fl_Button)Fl_Button_New_WithLabel(50, 90,90,25,"Button A2");
	Fl_Button_set_color(b2,88+2);
	fl_Button b3 = (fl_Button)Fl_Button_New_WithLabel(50, 120,90,25,"Button A3");
	Fl_Button_set_color(b3,88+3);
      }
      Fl_Group_end(aaa);
      fl_Group bbb = (fl_Group)Fl_Group_New_WithLabel(10,35,500-20,200-45,"Bbb");
      {
	fl_Button b1 = (fl_Button)Fl_Button_New_WithLabel(50, 60,90,25,"Button B1");
	Fl_Button_set_color(b1,88+1);
	fl_Button b2 = (fl_Button)Fl_Button_New_WithLabel(150, 60,90,25,"Button B2");
	Fl_Button_set_color(b2,88+3);
	fl_Button b3 = (fl_Button)Fl_Button_New_WithLabel(50, 60,90,25,"Button B3");
	Fl_Button_set_color(b3,88+5);
	fl_Button b4 = (fl_Button)Fl_Button_New_WithLabel(50, 60,90,25,"Button B4");
	Fl_Button_set_color(b4,88+2);
	fl_Button b5 = (fl_Button)Fl_Button_New_WithLabel(150, 60,90,25,"Button B5");
	Fl_Button_set_color(b5,88+4);
	fl_Button b6 = (fl_Button)Fl_Button_New_WithLabel(250, 60,90,25,"Button B6");
	Fl_Button_set_color(b6,88+6);
      }
      Fl_Group_end(bbb);
    }
    Fl_Tabs_end(tabs);
  }
  Fl_Window_end(win);
  Fl_Window_show_with_args(win, argc, argv);
  return (Fl_run());
}
