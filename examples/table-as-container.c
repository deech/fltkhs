#include <stdio.h>
#include <string.h>
#include <Fl_C.h>
#include <Fl_Double_WindowC.h>
#include <Fl_Light_ButtonC.h>
#include <Fl_InputC.h>
#include <Fl_DrawC.h>
#include <Fl_WidgetC.h>
#include <Fl_TableC.h>

void button_cb(fl_Widget w, void* userdata){
  fprintf(stderr, "BUTTON: %s\n", (const char*)Fl_Widget_label(w));
}
void SetSize(fl_Table table, int newrows, int newcols){
  Fl_Table_clear(table);
  Fl_Table_set_rows(table,newrows);
  Fl_Table_set_cols(table,newcols);

  Fl_Table_begin(table);
  {
    int r;
    int c;
    for (r = 0; r<newrows; r++ ) {
      for (c = 0; c<newcols; c++ ) {
	int X,Y,W,H;
	Fl_Table_find_cell(table, CONTEXT_TABLEC, r, c, &X, &Y, &W, &H);
	char s[40];
	if ( c & 1 ) {
	  // Create the input widgets
	  sprintf(s, "%d.%d", r, c);
	  fl_Input in = (fl_Input)Fl_Input_New(X,Y,W,H);
	  Fl_Input_set_value(in, s);
	} else {
	  // Create the light buttons
	  sprintf(s, "%d/%d ", r, c);
	  fl_Light_Button butt = Fl_Light_Button_New_WithLabel(X,Y,W,H,strdup(s));
	  Fl_Light_Button_set_align(butt,FL_ALIGN_CENTER|FL_ALIGN_INSIDE);
	  Fl_Light_Button_set_callback_with_user_data(butt,(fl_Callback*)button_cb, (void*)0);
	  Fl_Light_Button_set_value(butt,((r+c*2) & 4 ) ? 1 : 0);
	}
      }
    }
  }
  Fl_Table_end(table);
}
// Handle drawing all cells in table
void draw_cell(fl_Table table, TableContextC context,
	       int R, int C, int X, int Y, int W, int H) {
  switch ( context ) {
  case CONTEXT_STARTPAGEC:
    flc_set_font(FL_HELVETICA, 12);		// font used by all headers
    break;

  case CONTEXT_RC_RESIZEC: {
    int X, Y, W, H;
    int index = 0;
    int r;
    int c;
    for ( r = 0; r<Fl_Table_rows(table); r++ ) {
      for ( c = 0; c<Fl_Table_cols(table); c++ ) {
	if ( index >= Fl_Table_children(table) ) break;
	Fl_Table_find_cell(table,CONTEXT_TABLEC, r, c, &X, &Y, &W, &H);
	fl_Widget child = (fl_Widget) Fl_Table_child(table,index++);
	Fl_Widget_resize(child,X,Y,W,H);
      }
    }
    Fl_Table_init_sizes(table);
    return;
  }

  case CONTEXT_ROW_HEADERC:
    flc_push_clip(X, Y, W, H);
    {
      static char s[40];
      sprintf(s, "Row %d", R);
      flc_draw_box(FL_THIN_UP_BOX, X, Y, W, H, Fl_Table_row_header_color(table));
      flc_set_color(FL_BLACK);
      flc_draw_with_align(s, X, Y, W, H, FL_ALIGN_CENTER);
    }
    flc_pop_clip();
    return;

  case CONTEXT_COL_HEADERC:
    flc_push_clip(X, Y, W, H);
    {
      static char s[40];
      sprintf(s, "Column %d", C);
      flc_draw_box(FL_THIN_UP_BOX, X, Y, W, H, Fl_Table_col_header_color(table));
      flc_set_color(FL_BLACK);
      flc_draw_with_align(s, X, Y, W, H, FL_ALIGN_CENTER);
    }
    flc_pop_clip();
    return;

  case CONTEXT_CELLC:
    return;		// fltk handles drawing the widgets

  default:
    return;
  }
}
void initializeTable(fl_Table table){
  Fl_Table_set_col_header(table,1);
  Fl_Table_set_col_resize(table,1);
  Fl_Table_set_col_header_height(table,25);
  Fl_Table_set_row_header(table,1);
  Fl_Table_set_row_resize(table,1);
  Fl_Table_set_row_header_width(table,80);
  Fl_Table_end(table);
}
int main(int argc, char** argv){
  fl_Double_Window win = (fl_Double_Window)Fl_Double_Window_New_WithLabel(940, 500, "table as container");
  fl_Table_Virtual_Funcs* funcs = (fl_Table_Virtual_Funcs*)Fl_Table_default_virtual_funcs();
  funcs->draw_cell = &draw_cell;
  fl_Table table = (fl_Table)Fl_Table_New_WithLabel(20, 20, Fl_Double_Window_w(win)-40, Fl_Double_Window_h(win)-40, "FLTK widget table", funcs);
  initializeTable(table);
  SetSize(table,50,50);
  Fl_Double_Window_end(win);
  Fl_Double_Window_set_resizable(win,table);
  Fl_Double_Window_show(win);
  return Fl_run();
}
