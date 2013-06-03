#include <stdio.h>
#include "Fl_C.h"
#include "Fl_EnumerationsC.h"
#include "Fl_Types.h"

#define MAX_ROWS 30
#define MAX_COLS 26		// A-Z

void draw_cell(TableContextC context, int ROW, int COL, int X, int Y, int W, int H){

}

int main(int argc, char* argv){
  fl_Window window = (fl_Window)Fl_Window_New_WithLabel(900,400,"Simple Table");
  fl_Table_Virtual_Funcs* funcs = (fl_Table_Virtual_Funcs*)Fl_Table_default_virtual_funcs();
  funcs->fl_Table_draw_cell = &draw_cell;
  fl_Table table = (fl_Table)Fl_Table_New(10,10,880,380,funcs);
  Fl_Window_end(window);
  Fl_Window_show();
  return (Fl_run());
}
