#include "Fl_C.h"
#include "Fl_Double_WindowC.h"
#include "Fl_Text_EditorC.h"
#include "Fl_Text_BufferC.h"
int main(int argc, char** argv){
  fl_Double_Window win = (fl_Double_Window)Fl_Double_Window_New_WithLabel(640, 480, "Simple Fl_Text_Editor");
  fl_Text_Buffer buff = (fl_Text_Buffer)Fl_Text_Buffer_New();
  fl_Text_Editor edit = (fl_Text_Editor)Fl_Text_Editor_New(20, 20, 640-40, 480-40);
  Fl_Text_Editor_set_buffer(edit, buff);
  Fl_Double_Window_set_resizable(win,edit);
  Fl_Double_Window_show(win);
  Fl_Text_Buffer_set_text(buff,"line 0\nline 1\nline 2\nline 3\nline 4\nline 5\nline 6\nline 7\nline 8\nline 9\nline 10\nline 11\nline 12\nline 13\nline 14\nline 15\nline 16\nline 17\nline 18\nline 19\nline 20\nline 21\nline 22\nline 23\n");
  return (Fl_run());
}
