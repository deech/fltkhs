#include <stdio.h>
#include <Fl_C.h>
#include <Fl_WindowC.h>
#include <Fl_ButtonC.h>
#include <Fl_ProgressC.h>

#ifdef WIN32
// WINDOWS
#include <windows.h>
#define usleep(v) Sleep(v/1000)
#else /*WIN32*/
// UNIX
#include <unistd.h>                            // usleep
#endif /*WIN32*/

void butt_cb(fl_Widget b, void* data){
  fl_Button butt = (fl_Button)b;
  Fl_Button_deactivate(butt);
  Fl_check();
  fl_Window w = (fl_Window)data;
  Fl_Window_begin(w);
  fl_Progress progress = Fl_Progress_New(10,50,200,30);
  Fl_Progress_set_minimum(progress,0);
  Fl_Progress_set_maximum(progress,1);
  Fl_Progress_set_color(progress,0x88888800);
  Fl_Progress_set_selection_color(progress,0x4444ff00);
  Fl_Progress_set_labelcolor(progress,FL_WHITE);
  Fl_Window_end(w);
  int t = 1;
  for (;t <= 500; t++){
    Fl_Progress_set_value(progress,t/500.0);
    char percent[10];
    sprintf(percent, "%d%%", (int)((t/500.0)*100.0));
    Fl_Progress_set_label(progress,percent);
    Fl_check();
    usleep(1000);
  }
  Fl_Window_remove_widget(w,progress);
  Fl_Progress_Destroy(progress);
  Fl_Button_activate(butt);
  Fl_Window_redraw(w);
}
int main(int argc, char** argv){
  fl_Window win = (fl_Window)Fl_Window_New(220,90);
  fl_Button butt = (fl_Button)Fl_Button_New_WithLabel(10,10,100,25,"Press");
  Fl_Button_set_callback_with_user_data(butt,butt_cb, (void*)win);
  Fl_Window_resizable(win);
  Fl_Window_show(win);
  return(Fl_run());
}
