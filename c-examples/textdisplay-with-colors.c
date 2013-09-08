#include <stdio.h>
#include <Fl_C.h>
#include <Fl_WindowC.h>
#include <Fl_Text_DisplayC.h>
#include <Fl_Text_BufferC.h>
int main(int argc, char** argv){
   Style_Table_Entry stable[] = {
       {  FL_RED,         FL_COURIER, 18 },
       {  FL_DARK_YELLOW, FL_COURIER, 18 },
       {  FL_DARK_GREEN,  FL_COURIER, 18 },
       {  FL_BLUE,        FL_COURIER, 18 },
   };
   fl_Window win = (fl_Window)Fl_Window_New_WithLabel(640, 480, "Simple Text Display With Colors");
   fl_Text_Display disp = (fl_Text_Display)Fl_Text_Display_New(20, 20, 640-40, 480-40);
   fl_Text_Buffer tbuff = (fl_Text_Buffer)Fl_Text_Buffer_New();
   fl_Text_Buffer sbuff = (fl_Text_Buffer)Fl_Text_Buffer_New();
   Fl_Text_Display_set_buffer(disp,tbuff);
   int stable_size = sizeof(stable)/sizeof(stable[0]);	// # entries in style table (4)
   Fl_Text_Display_highlight_data(disp,sbuff, stable, stable_size, 'A', 0, 0);
   Fl_Text_Buffer_set_text(tbuff,"Red Line 1\nYel Line 2\nGrn Line 3\nBlu Line 4\nRed Line 5\nYel Line 6\nGrn Line 7\nBlu Line 8\n");
   Fl_Text_Buffer_set_text(sbuff,"AAAAAAAAAA\nBBBBBBBBBB\nCCCCCCCCCC\nDDDDDDDDDD\nAAAAAAAAAA\nBBBBBBBBBB\nCCCCCCCCCC\nDDDDDDDDDD\n");
   Fl_Window_set_resizable(win,disp);
   Fl_Window_show(win);
   return (Fl_run());
}
