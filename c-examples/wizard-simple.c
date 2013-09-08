#include <stdlib.h>
#include "Fl_C.h"
#include "Fl_WindowC.h"
#include "Fl_GroupC.h"
#include "Fl_WizardC.h"
#include "Fl_ButtonC.h"
#include "Fl_Multiline_OutputC.h"

fl_Window G_win = 0;
fl_Wizard G_wiz = 0;

void back_cb(fl_Widget w, void* user_data){
  Fl_Wizard_prev(G_wiz);
}
void next_cb(fl_Widget w, void* user_data){
  Fl_Wizard_next(G_wiz);
}
void done_cb(fl_Widget w, void* user_data){
  exit(0);
}
int main (int argc, char** argv){
  G_win = (fl_Window)Fl_Window_New_WithLabel(400,300,"Example Wizard");
  G_wiz = (fl_Wizard)Fl_Wizard_New(0,0,400,300);
  Fl_Wizard_begin(G_wiz);
  {
    fl_Group g = (fl_Group)Fl_Group_New(0,0,400,300);
    fl_Button next = (fl_Button)Fl_Button_New_WithLabel(290,265,100,25,"Next @->");
    Fl_Button_set_callback(next,next_cb);

    fl_Multiline_Output out = (fl_Multiline_Output)Fl_Multiline_Output_New_WithLabel(10,30,400-20,300-80,"Welcome");
    Fl_Multiline_Output_set_labelsize(out,20);
    Fl_Multiline_Output_set_align(out, FL_ALIGN_TOP|FL_ALIGN_LEFT);
    Fl_Multiline_Output_set_value(out, "This is First page");
    Fl_Group_end(g);
  }
  {
    fl_Group g = (fl_Group)Fl_Group_New(0,0,400,300);
    fl_Button next = (fl_Button)Fl_Button_New_WithLabel(290,265,100,25,"Next @->");
    Fl_Button_set_callback(next,next_cb);

    fl_Button back = (fl_Button)Fl_Button_New_WithLabel(180,265,100,25,"@<- Back");
    Fl_Button_set_callback(back,back_cb);

    fl_Multiline_Output out = (fl_Multiline_Output)Fl_Multiline_Output_New_WithLabel(10,30,400-20,300-80,"Terms And Conditions");
    Fl_Multiline_Output_set_labelsize(out,20);
    Fl_Multiline_Output_set_align(out, FL_ALIGN_TOP|FL_ALIGN_LEFT);
    Fl_Multiline_Output_set_value(out, "This is Second page");
    Fl_Group_end(g);
  }
  {
    fl_Group g = (fl_Group)Fl_Group_New(0,0,400,300);
    fl_Button next = (fl_Button)Fl_Button_New_WithLabel(290,265,100,25,"Next @->");
    Fl_Button_set_callback(next,next_cb);

    fl_Button back = (fl_Button)Fl_Button_New_WithLabel(180,265,100,25,"@<- Back");
    Fl_Button_set_callback(back,back_cb);

    fl_Multiline_Output out = (fl_Multiline_Output)Fl_Multiline_Output_New_WithLabel(10,30,400-20,300-80,"Finish");
    Fl_Multiline_Output_set_labelsize(out,20);
    Fl_Multiline_Output_set_align(out, FL_ALIGN_TOP|FL_ALIGN_LEFT);
    Fl_Multiline_Output_set_value(out, "Finish");
    Fl_Group_end(g);
  }
  Fl_Wizard_end(G_wiz);
  Fl_Window_end(G_win);
  Fl_Window_show_with_args(G_win,argc,argv);
  return (Fl_run());
}
