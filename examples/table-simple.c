#include <stdio.h>
#include "Fl_C.h"
#include "Fl_EnumerationsC.h"
#include "Fl_Types.h"
#include "Fl_Double_WindowC.h"
#include "Fl_DrawC.h"
#include "Fl_TableC.h"

#define MAX_ROWS 30
#define MAX_COLS 26		// A-Z
int data[MAX_ROWS][MAX_COLS];		// data array for cells

void DrawHeader(fl_Table table,const char *s, int X, int Y, int W, int H){
  flc_push_clip(X,Y,W,H);
  flc_draw_box(FL_THIN_UP_BOX, X,Y,W,H, Fl_Table_row_header_color(table));
  flc_set_color(FL_BLACK);
  flc_draw_with_align(s, X,Y,W,H, FL_ALIGN_CENTER);
  flc_pop_clip();
}
void DrawData(fl_Table table,const char *s, int X, int Y, int W, int H){
  flc_push_clip(X,Y,W,H);
  flc_set_color(FL_WHITE); flc_rectf(X,Y,W,H);
  flc_set_color(FL_GRAY0); flc_draw_with_align(s, X,Y,W,H, FL_ALIGN_CENTER);
  flc_set_color(Fl_Table_color(table));  flc_rect(X,Y,W,H);
  flc_pop_clip();
}
void draw_cell(fl_Table table,TableContextC context, int ROW, int COL, int X, int Y, int W, int H){
  static char s[40];
  switch ( context ) {
  case CONTEXT_STARTPAGEC:
    flc_set_font(FL_HELVETICA, 16);
    return;
  case CONTEXT_COL_HEADERC:
    sprintf(s,"%c",'A'+COL);
    DrawHeader(table,s,X,Y,W,H);
    return;
  case CONTEXT_ROW_HEADERC:
    sprintf(s,"%03d:",ROW);
    DrawHeader(table,s,X,Y,W,H);
    return;
  case CONTEXT_CELLC:
    sprintf(s,"%d",data[ROW][COL]);
    DrawData(table,s,X,Y,W,H);
    return;
  default:
    return;
  }
}
void initialize_table(fl_Table table){
  // Fill data array
  int r;
  int c;
  for (r = 0 ; r<MAX_ROWS; r++ )
    for ( c = 0 ; c<MAX_COLS; c++ )
      data[r][c] = 1000+(r*1000)+c;
  // Rows
  Fl_Table_set_rows(table,MAX_ROWS);             // how many rows
  Fl_Table_set_row_header(table,1);              // enable row headers (along left)
  Fl_Table_set_row_height_all(table,20);         // default height of rows
  Fl_Table_set_row_resize(table,0);              // disable row resizing
  Fl_Table_set_cols(table,MAX_COLS);             // how many columns
  Fl_Table_set_col_header(table,1);              // enable column headers (along top)
  Fl_Table_set_col_width_all(table,80);          // default width of columns
  Fl_Table_set_col_resize(table,1);              // enable column resizing
  Fl_Table_end(table);			// end the Fl_Table group
}
int main(int argc, char** argv){
  fl_Table_Virtual_Funcs* funcs = (fl_Table_Virtual_Funcs*)Fl_Table_default_virtual_funcs();
  funcs->fl_Table_draw_cell = &draw_cell;
  fl_Double_Window window = (fl_Double_Window)Fl_Double_Window_New_WithLabel(900,400,"Simple Table");
  Fl_Double_Window_begin(window);
  fl_Table table = (fl_Table)Fl_Table_New(10,10,880,380,funcs);
  initialize_table(table);
  Fl_Double_Window_set_resizable(window, table);
  Fl_Double_Window_end(window);
  Fl_Double_Window_show(window);
  return (Fl_run());
}
