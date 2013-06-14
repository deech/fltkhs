#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Fl_C.h"
#include "Fl_EnumerationsC.h"
#include "Fl_Types.h"
#include "Fl_TableC.h"
#include "Fl_Int_InputC.h"
#include "Fl_WindowC.h"
#include "Fl_Double_WindowC.h"
#include "Fl_DrawC.h"
#define MAX_ROWS 10
#define MAX_COLS 10
int values[MAX_ROWS][MAX_COLS];		// data array for cells

typedef struct {
  int row_edit;
  int col_edit;
  fl_Int_Input input;
} spreadsheet_properties;
void set_value_hide(fl_Table table) {
  spreadsheet_properties* e = (spreadsheet_properties*)Fl_Table_other_data(table);
  fl_Int_Input input = (fl_Int_Input)(e->input);
  int row_edit = e->row_edit;
  int col_edit = e->col_edit;
  const char* input_value = (const char*)Fl_Int_Input_value(input);
  values[row_edit][col_edit] = atoi(input_value);
  Fl_Int_Input_hide(input);
  fl_Window window = (fl_Window)Fl_Table_window(table);
  Fl_Window_set_cursor(window, FL_CURSOR_DEFAULT);
}

void start_editing(fl_Table table, int R, int C) {
  spreadsheet_properties* e = (spreadsheet_properties*)Fl_Table_other_data(table);
  e->row_edit = R;
  e->col_edit = C;
  fl_Int_Input input = (fl_Int_Input)(e->input);
  Fl_Table_set_selection(table,R,C,R,C);
  int X;
  int Y;
  int W;
  int H;
  Fl_Table_find_cell(table,CONTEXT_CELLC, R,C, &X,&Y,&W,&H);
  Fl_Int_Input_resize(input,X,Y,W,H);
  char s[30]; sprintf(s, "%d", values[R][C]);
  Fl_Int_Input_set_value(input,s);
  Fl_Int_Input_set_position_with_cursor_mark(input,0,strlen(s));
  Fl_Int_Input_show(input);
  Fl_Int_Input_take_focus(input);
}
void done_editing(fl_Table table) {
  spreadsheet_properties* e = (spreadsheet_properties*)Fl_Table_other_data(table);
  fl_Int_Input input = (fl_Int_Input)(e->input);
  if (Fl_Int_Input_visible(input)){
    set_value_hide(table);
  }
}
int sum_rows(fl_Table table,int C) {
  int sum = 0;
  int r;
  int rows = Fl_Table_rows(table);
  for (r=0; r<rows-1; ++r)
    sum += values[r][C];
  return(sum);
}
// Return the sum of all cols in this row
int sum_cols(fl_Table table, int R) {
  int sum = 0;
  int c;
  int cols = Fl_Table_cols(table);
  for (c=0; c<cols-1; ++c)
    sum += values[R][c];
  return(sum);
}
// Return the sum of all cells in table
int sum_all(fl_Table table) {
  int sum = 0;
  int c;
  int r;
  int rows = Fl_Table_rows(table);
  int cols = Fl_Table_cols(table);
  for (c=0; c<cols-1; ++c)
    for (r=0; r<rows-1; ++r)
      sum += values[r][c];
  return(sum);
}

void event_callback(fl_Widget w, void* user_data){
  fl_Table table = (fl_Table)w; // only for readability
  spreadsheet_properties* e = (spreadsheet_properties*)Fl_Table_other_data(table);
  fl_Int_Input input = (fl_Int_Input)e->input;
  int R = Fl_Table_callback_row(table);
  int C = Fl_Table_callback_col(table);
  TableContextC context = Fl_Table_callback_context(table);
  int rows = Fl_Table_rows(table);
  int cols = Fl_Table_cols(table);
  switch ( context ) {
  case CONTEXT_CELLC: {
    switch (Fl_event()) {
    case FL_PUSH:
      done_editing(table);
      if (R != rows-1 && C != cols-1 )
	start_editing(table,R,C);
      return;
    case FL_KEYBOARD:
      if ( Fl_event_key() == FL_Escape ) exit(0);
      done_editing(table);
      if (C==cols-1 || R==rows-1) return;
      switch ( Fl_event_text()[0] ) {
      case '0': case '1': case '2': case '3':
      case '4': case '5': case '6': case '7':
      case '8': case '9': case '+': case '-':
	start_editing(table,R,C);
	Fl_Int_Input_handle(input,Fl_event());
	break;
      case '\r': case '\n':
	start_editing(table,R,C);
	break;
      }
      return;
    }
    return;
  }
  case CONTEXT_TABLEC:
  case CONTEXT_ROW_HEADERC:
  case CONTEXT_COL_HEADERC:
    done_editing(table);
    return;
  default:
    return;
  }
}
void input_cb(fl_Table table, void* user_data){
  set_value_hide(table);
}
void initializeTable(fl_Table table){
  Fl_Table_begin(table);
  Fl_Table_set_callback_and_user_data(table, (fl_Callback*)event_callback, (void*)table);
  Fl_Table_set_when(table,FL_WHEN_NOT_CHANGED|Fl_Table_when(table));
  fl_Int_Input input = (fl_Int_Input)Fl_Int_Input_New(Fl_Table_w(table)/2,
  						      Fl_Table_h(table)/2,
  						      0,0);
  Fl_Int_Input_hide(input);
  Fl_Int_Input_set_callback_and_user_data(input, (fl_Callback*)input_cb, (void*)table);
  Fl_Int_Input_set_when(input,FL_WHEN_ENTER_KEY_ALWAYS);
  Fl_Int_Input_set_maximum_size(input,5);
  Fl_Int_Input_set_color(input,FL_YELLOW);
  int c;
  int r;
  for (c = 0; c < MAX_COLS; c++)
    for (r = 0; r < MAX_ROWS; r++)
      values[r][c] = c + (r*MAX_COLS);		// initialize cells
  Fl_Table_end(table);
  spreadsheet_properties* e = (spreadsheet_properties*)malloc(sizeof(spreadsheet_properties));
  e->row_edit = 0;
  e->col_edit = 0;
  e->input = input;
  Fl_Table_set_other_data(table, (void*)e);
  Fl_Table_set_selection(table,0,0,0,0);
}

void draw_cell(fl_Table table,TableContextC context, int R,int C, int X,int Y,int W,int H){
  static char s[30];
  spreadsheet_properties* e = (spreadsheet_properties*)Fl_Table_other_data(table);
  int row_edit = e->row_edit;
  int col_edit = e->col_edit;
  int rows = Fl_Table_rows(table);
  int cols = Fl_Table_cols(table);
  fl_Int_Input input = (fl_Int_Input)e->input;
  switch ( context ) {
  case CONTEXT_STARTPAGEC:
    break;

  case CONTEXT_COL_HEADERC:
    flc_set_font(FL_HELVETICA | FL_BOLD, 14);
    flc_push_clip(X,Y,W,H);
    {
      flc_draw_box(FL_THIN_UP_BOX, X,Y,W,H, Fl_Table_col_header_color(table));
      flc_set_color(FL_BLACK);
      if (C == cols-1) {
	flc_draw_with_align("TOTAL", X,Y,W,H, FL_ALIGN_CENTER);
      } else {
	sprintf(s, "%c", 'A' + C);
	flc_draw_with_align(s, X,Y,W,H, FL_ALIGN_CENTER);
      }
    }
    flc_pop_clip();
    return;

  case CONTEXT_ROW_HEADERC:
    flc_set_font(FL_HELVETICA | FL_BOLD, 14);
    flc_push_clip(X,Y,W,H);
    {
      flc_draw_box(FL_THIN_UP_BOX, X,Y,W,H, Fl_Table_row_header_color(table));
      flc_set_color(FL_BLACK);
      if (R == rows-1) {
	flc_draw_with_align("TOTAL", X,Y,W,H, FL_ALIGN_CENTER);
      } else {
	sprintf(s, "%d", R+1);
	flc_draw_with_align(s, X,Y,W,H, FL_ALIGN_CENTER);
      }
    }
    flc_pop_clip();
    return;

  case CONTEXT_CELLC: {
    if (R == row_edit && C == col_edit && Fl_Int_Input_visible(input)) {
      return;
    }
    if ( C < cols-1 && R < rows-1 ) {
      flc_draw_box(FL_THIN_UP_BOX, X,Y,W,H, Fl_Table_is_selected(table,R,C) ? FL_YELLOW : FL_WHITE);
    } else {
      flc_draw_box(FL_THIN_UP_BOX, X,Y,W,H, 0xbbddbb00);
    }
    flc_push_clip(X+3, Y+3, W-6, H-6);
    {
      flc_set_color(FL_BLACK);
      if (C == cols-1 || R == rows-1) {
	flc_set_font(FL_HELVETICA | FL_BOLD, 14);
	if (C == cols-1 && R == Fl_Table_rows(table)-1) {
	  sprintf(s, "%d", sum_all(table));
	} else if (C == cols-1) {
	  sprintf(s, "%d", sum_cols(table,R));
	} else if (R == rows-1) {
	  sprintf(s, "%d", sum_rows(table,C));
	}
	flc_draw_with_align(s, X+3,Y+3,W-6,H-6, FL_ALIGN_RIGHT);
      } else {
	flc_set_font(FL_HELVETICA, 14);
	sprintf(s, "%d", values[R][C]);
	flc_draw_with_align(s, X+3,Y+3,W-6,H-6, FL_ALIGN_RIGHT);
      }
    }
    flc_pop_clip();
    return;
  }
  default:
    return;
  }
}

int main(){
  fl_Double_Window win = (fl_Double_Window) Fl_Double_Window_New_WithLabel(862,322,"Fl_Table Spreadsheet");
  Fl_Double_Window_begin(win);
  fl_Table_Virtual_Funcs* funcs = (fl_Table_Virtual_Funcs*)Fl_Table_default_virtual_funcs();
  funcs->fl_Table_draw_cell = &draw_cell;
  fl_Table spreadsheet = (fl_Table)Fl_Table_New(10,10,
						Fl_Double_Window_w(win)-20,
						Fl_Double_Window_h(win)-20,
						funcs);
  initializeTable(spreadsheet);
#if FLTK_ABI_VERSION >= 10303
  Fl_Table_set_tab_cell_nav(spreadsheet,1);
#endif
  Fl_Table_set_tooltip(spreadsheet,"Use keyboard to navigate cells:\n Arrow keys or Tab/Shift-Tab");
    // Table rows
  Fl_Table_set_row_header(spreadsheet,1);
  Fl_Table_set_row_header_width(spreadsheet,70);
  Fl_Table_set_row_resize(spreadsheet,1);
  Fl_Table_set_rows(spreadsheet,MAX_ROWS+1);
  Fl_Table_set_row_height_all(spreadsheet,25);
  // Table cols
  Fl_Table_set_col_header(spreadsheet,1);
  Fl_Table_set_col_header_height(spreadsheet,25);
  Fl_Table_set_col_resize(spreadsheet,1);
  Fl_Table_set_cols(spreadsheet,MAX_COLS+1);
  Fl_Table_set_col_width_all(spreadsheet,70);

  Fl_Double_Window_end(win);
  Fl_Double_Window_set_resizable(win,spreadsheet);
  Fl_Double_Window_show(win);
  return Fl_run();
}
