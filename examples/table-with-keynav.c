#include <Fl_C.h>
#include <Fl_DrawC.h>
#include <Fl_Double_WindowC.h>
#include <Fl_Toggle_ButtonC.h>
#include <Fl_OutputC.h>
#include <Fl_TableC.h>
#include <Fl_Table_RowC.h>
#include <FL/names.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

fl_Toggle_Button G_rowselect = 0;
fl_Table_Row     G_table = 0;
fl_Output        G_sum = 0;

void draw_cell(fl_Table_Row table_row,TableContextC context, int R,int C, int X,int Y,int W,int H){
  static char s[30];
  switch ( context ) {
  case CONTEXT_COL_HEADERC:
  case CONTEXT_ROW_HEADERC:
    flc_set_font(FL_HELVETICA | FL_BOLD, 14);
    flc_push_clip(X,Y,W,H);
    {
      flc_draw_box(FL_THIN_UP_BOX, X,Y,W,H, Fl_Table_col_header_color(table_row));
      flc_set_color(FL_BLACK);
      sprintf(s, "%d", (context == CONTEXT_COL_HEADERC) ? C : R);
      flc_draw_with_align(s, X, Y, W, H, FL_ALIGN_CENTER);
    }
    flc_pop_clip();
    return;

  case CONTEXT_CELLC: {
    int selected = Fl_Toggle_Button_value(G_rowselect) ? Fl_Table_Row_row_selected(table_row,R) : Fl_Table_Row_is_selected(table_row,R,C);
    flc_draw_box(FL_THIN_UP_BOX, X,Y,W,H,selected ? FL_YELLOW:FL_WHITE);
    flc_push_clip(X+3,Y+3,W-6,H-6);
    {
      flc_set_font(FL_HELVETICA, 14);
      flc_set_color(FL_BLACK);
      sprintf(s, "%d", R*C);
      flc_draw_with_align(s, X+3,Y+3,W-6,H-6, FL_ALIGN_CENTER);
    }
    flc_pop_clip();
    return;
  }
  default:
    return;
  }
}
void initializeTable(fl_Table_Row table_row){
  Fl_Table_Row_begin(table_row);
  Fl_Table_Row_set_row_header_width(table_row,70);
  Fl_Table_Row_set_row_header(table_row,1);
  Fl_Table_Row_set_row_resize(table_row,1);
  Fl_Table_Row_set_rows(table_row,11);
  Fl_Table_Row_set_row_height_all(table_row,20);
  Fl_Table_Row_set_col_header(table_row,1);
  Fl_Table_Row_set_col_header_height(table_row,20);
  Fl_Table_Row_set_col_resize(table_row,1);
  Fl_Table_Row_set_cols(table_row,11);
  Fl_Table_Row_set_col_width_all(table_row,70);
  Fl_Table_Row_end(table_row);
}

int GetSelectionSum(fl_Table_Row table_row){
  int sum = -1;
  int R = 0;
  int rows =  Fl_Table_Row_rows(table_row);
  int cols = Fl_Table_Row_cols(table_row);
  for(;R<rows;R++){
    int C = 0;
    for (;C<cols;C++){
      if (Fl_Toggle_Button_value(G_rowselect) ? Fl_Table_Row_row_selected(table_row,R) : Fl_Table_Row_is_selected(table_row,R,C)) {
	if ( sum == -1 ) sum = 0;
	sum += R*C;
      }
    }
  }
  return(sum);
}
void UpdateSum(fl_Table_Row table_row) {
  static char s[80];
  int sum = GetSelectionSum(table_row);
  if ( sum == -1 ) { sprintf(s, "(nothing selected)"); Fl_Output_set_color(G_sum, 48); }
  else             { sprintf(s, "%d", sum); Fl_Output_set_color(G_sum,FL_WHITE); }
  // Update only if different (lets one copy/paste from sum)
  if ( strcmp(s,Fl_Output_value(G_sum)))
    { Fl_Output_set_value(G_sum,s); Fl_Output_redraw(G_sum); }
}

int handle(fl_Table_Row table_row, int e){
  int ret = Fl_Table_Row_handle_super(table_row,e);
  if ( e == FL_KEYBOARD && Fl_event_key() == FL_Escape ) exit(0);
  switch (e) {
  case FL_PUSH:
  case FL_RELEASE:
  case FL_KEYUP:
  case FL_KEYDOWN:
  case FL_DRAG:
 {
    UpdateSum(table_row);
    Fl_Table_Row_redraw(table_row);
    break;
  }
  case FL_FOCUS:
  case FL_UNFOCUS:
    ret = 1;
    break;
  }
  return(ret);
}
void RowSelect_CB(fl_Widget w, void* user_data) {
  fl_Toggle_Button b = (fl_Toggle_Button)w;
  fl_Double_Window window = Fl_Toggle_Button_window(b);
  Fl_Double_Window_redraw(window);
  fl_Table_Row r = (fl_Table_Row)user_data;
  UpdateSum(r);
}
int main (int argc, char** argv){
  Fl_set_option(OPTION_ARROW_FOCUS,0);
  fl_Double_Window win = (fl_Double_Window) Fl_Double_Window_New_WithLabel(862, 312, "Times Table");
  Fl_Double_Window_begin(win);

  fl_Table_Row_Virtual_Funcs* funcs = Fl_Table_Row_default_virtual_funcs();
  funcs->draw_cell = &draw_cell;
  funcs->handle = &handle;
  G_table = (fl_Table_Row)Fl_OverriddenTable_Row_New_WithLabel(10, 30, Fl_Double_Window_w(win)-20, Fl_Double_Window_h(win)-70, "Times Table", funcs);
  initializeTable(G_table);
  Fl_Table_Row_set_tooltip(G_table,"Use mouse or Shift + Arrow Keys to make selections.\n Sum of selected values is shown.");
  G_rowselect = (fl_Toggle_Button)Fl_Toggle_Button_New_WithLabel(140,10,12,12,"Row selection");
  Fl_Toggle_Button_set_align(G_rowselect,FL_ALIGN_LEFT);
  Fl_Toggle_Button_set_value(G_rowselect,0);
  Fl_Toggle_Button_set_selection_color(G_rowselect,FL_YELLOW);
  Fl_Toggle_Button_set_callback_with_user_data(G_rowselect,RowSelect_CB, (void*)G_table);
  Fl_Toggle_Button_set_tooltip(G_rowselect,"Click to toggle row vs. row/col selection");
  Fl_Double_Window_end(win);
  Fl_Double_Window_begin(win);
  G_sum = (fl_Output)Fl_Output_New_WithLabel(140,Fl_Table_Row_y(G_table)+Fl_Table_Row_h(G_table)+10,160,25,"Selection Sum:");
  Fl_Output_set_value(G_sum,"(nothing selected)");
  Fl_Output_set_color(G_sum,48);
  Fl_Output_set_tooltip(G_sum,"This field shows the sum of the selected cells in the table");
  Fl_Double_Window_end(win);
  Fl_Double_Window_set_resizable(win, G_table);
  Fl_Double_Window_show(win);
  return (Fl_run());
}
