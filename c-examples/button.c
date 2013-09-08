#include <stdlib.h>
#include <stdio.h>
#include <Fl_C.h>
#include <Fl_AskC.h>
#include <Fl_WindowC.h>
#include <Fl_ButtonC.h>

void beepcb(fl_Widget w,void* user_data) {
  flc_beep();
  fflush(stdout);
}

void exitcb(fl_Widget w, void* user_data) {
  exit(0);
}

#if 0
// test Fl::add_fd()...
void stdin_cb(int i, void* user_data) {
  char buf[1000];
  fgets(buf, sizeof(buf), stdin);
  printf("stdin callback\n");
}
#endif

int main(int argc, char ** argv) {
  fl_Window window = (fl_Window)Fl_Window_New(320,65);
  fl_Button b1 = (fl_Button)Fl_Button_New_WithLabel(20, 20, 80, 25, "&Beep");
  Fl_Button_set_callback_with_user_data(b1,beepcb,0);
  /*Fl_Button *b2 =*/ Fl_Button_New_WithLabel(120,20, 80, 25, "&no op");
  fl_Button b3 = (fl_Button)Fl_Button_New_WithLabel(220,20, 80, 25, "E&xit");
  Fl_Button_set_callback_with_user_data(b3,exitcb,0);
  Fl_Window_end(window);
  Fl_Window_show_with_args(window,argc,argv);
#if 0
  Fl_add_fd(0, stdin_cb);
#endif
  return Fl_run();
}
