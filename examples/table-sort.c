#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <Fl_C.h>
#include <Fl_Table_RowC.h>
#include <Fl_DrawC.h>
#include <Fl_Double_WindowC.h>
#include <Fl_WindowC.h>

typedef char* string;

#define MARGIN 20

#ifdef WIN32
// WINDOWS
#  define DIRCMD          "dir"
static const char *G_header[] = { "Date", "Time", "Size", "Filename", "", "", "", "", "", 0 };
#  ifdef _MSC_VER
#    define popen           _popen
#  endif
#else // WIN32
// UNIX
#  include <ctype.h>
#  define DIRCMD          "ls -l"
static const char *G_header[] = { "Perms", "#L", "Own", "Group", "Size", "Date", "", "", "Filename", 0 };
#endif /* WIN32 */

// Font face/sizes for header and rows
#define HEADER_FONTFACE FL_HELVETICA_BOLD
#define HEADER_FONTSIZE 16
#define ROW_FONTFACE    FL_HELVETICA
#define ROW_FONTSIZE    16

void print_array(string arr[], int length){
  printf("{");
  int i = 0;
  for(;i<length;i++){
    if (strcmp(arr[i],"") == 0){
      printf(" <N> ");
    }
    else {
      printf(" %s ", arr[i]);
    }
  }
  printf("}\n");
}

void print_addresses(void* arr[], int length){
  printf("{");
  int i = 0;
  for(;i<length;i++){
    printf(" %p ", &arr[i]);
  }
  printf("}\n");
}

/**
   Doubly Linked List, can't insert or delete mid-list
 */
typedef struct Row {
  int* length;
  string* row; // a 1D array
} Row;

Row* to_row(string* arr, int length){
  int* length_cpy;
  length_cpy = malloc(sizeof(int));
  *length_cpy = length;
  Row* result = malloc(sizeof(Row));
  result->length = length_cpy;
  result->row = arr;
  return result;
}

string get_sort_index(Row* row, int sort_index){
  string* ss = row->row;
  string result;
  if (sort_index > *(row->length)-1){
    result = "";
  }
  else {
    result = ss[sort_index];
  }
  return result;
}
void print_sort_index(Row* row, int sort_index){
  string s = get_sort_index(row, sort_index);
  if (strcmp(s,"") == 0){
    printf("<N>");
  }
  else {
    printf("%s",s);
  }
}
string* extract_index(Row* arr[], int rows, int index){
  int i = 0;
  string* result = malloc(sizeof(string) * rows);
  for(;i<rows;i++){
    result[i] = get_sort_index(arr[i], index);
  }
  return result;
}
typedef struct Node {
  struct Node* prev;
  struct Node* next;
  struct Row* row;
} Node;

Node* make_node(Row* row){
  Node* empty = malloc(sizeof(Node));
  empty->prev = NULL;
  empty->next = NULL;
  empty->row = row;
  return empty;
}

void append(Node* n, Node* next){
  n->next = next;
  next->prev = n;
}

Node* from_array(Row* arr[], int length){
  int curr_index = 0;
  Node* start = NULL;
  Node* curr_node = NULL;
  while(curr_index < length){
    Row* row = arr[curr_index];
    if (curr_index == 0){
      curr_node = make_node(row);
      start = curr_node;
    }
    else {
      Node* new_node = make_node(row);
      append(curr_node, new_node);
      curr_node = new_node;
    }
    curr_index++;
  }
  return start;
}

Node* get_last(Node* start){
  Node* curr = start;
  while (curr->next != NULL){
    curr = curr->next;
  }
  return curr;
}

void traverse_forward(Node* start, void** runningState, void (*f)(void** runningState, Row* row)){
  (*f)(runningState, start->row);
  if (start->next != NULL){
    traverse_forward(start->next, runningState, f);
  }
}

void traverse_backward(Node* end, void** runningState, void (*f)(void** runningState, Row* row)){
  (*f)(runningState, end->row);
  if (end->prev != NULL){
    traverse_backward(end->prev, runningState, f);
  }
}

void update_count(void** soFar_ref, Row* ignored){
  int* soFar = (int*)(*soFar_ref);
  *soFar = *soFar + 1;
}

typedef struct {
  int* soFar;
  struct Row** row; // array of rows
} accumulator;

void into_accumulator(void** accum_ref, Row* row){
  accumulator* accum = (accumulator*)(*accum_ref);
  accum->row[*(accum->soFar)] = row;
  *(accum->soFar) = *(accum->soFar) + 1;
}

int* count_nodes(Node* start){
  int* count = malloc(sizeof(int));
  *count = 0;
  traverse_forward(start, (void**)&count, &update_count);
  return count;
}

void update_max(void** max, Row* row){
  int* maxSoFar = (int*)(*max);
  int* length = row->length;
  if (*length > *maxSoFar) {
    *maxSoFar = *maxSoFar + 1;
  }
}

int* max_cols(Node* start){
  int* max = malloc(sizeof(int));
  *max = 0;
  traverse_forward(start, (void**)&max, &update_max);
  return max;
}

Row** to_array(Node* start){
  int* count = count_nodes(start);
  Row** into;
  into = malloc(sizeof(Row) * (*count));
  int soFar = 0;
  accumulator* accum = malloc(sizeof(accumulator));
  accum->soFar = &soFar;
  accum->row = into;
  traverse_forward(start, (void**)&accum, &into_accumulator);
  return into;
}

void print_node(void** ignored, Row* row){
  if (row != NULL){
    print_array(row->row, *(row->length));
  }
  else {
    puts("Row: NULL");
  }
}

void unlink_dll(Node** start){
  Node* next = (*start)->next;
  (*start)->next = NULL;
  (*start)->prev = NULL;
  (*start)->row = NULL;
  if (next != NULL){
    unlink_dll(&next);
  }
}

void free_row(Row* r){
  free(r->length);
  free(r);
  r->row = NULL;
  r->length = NULL;
  r = NULL;
}

void free_rows(Row* arr[], int length){
  int i = 0;
  for(;i<length;i++){
    free_row(arr[i]);
  }
  arr = NULL;
}

void print_rows(Row* rows[], int num_rows){
  printf("{");
  int i = 0;
  for (;i<num_rows;i++){
    print_array(rows[i]->row, *(rows[i]->length));
  }
  printf("}\n");
}

int find_pivot(int i, int j, int sort_index, Row* A[], int (*cmp)(string,string)){
  string firstKey = get_sort_index(A[i],sort_index);
  int k = i + 1;
  for(;k<=j;k++){
    int comparison = (*cmp)(get_sort_index(A[k], sort_index), firstKey);
    if (comparison == 1) {
      return k;
    }
    else if (comparison == -1) {
      return i;
    }
  }
  return -1;
}

void swap(void** a, void** b){
  void* tmp = *a;
  *a = *b;
  *b = tmp;
}

int numcmp(string a, string b){
  int a_int;
  int b_int;
  (strcmp(a,"") == 0) ? a_int = 0 : sscanf(a, "%d", &a_int);
  (strcmp(b,"") == 0) ? b_int = 0 : sscanf(b, "%d", &b_int);
  if (a_int < b_int) {
    return -1;
  }
  else if (a_int > b_int) {
    return 1;
  }
  else {
    return 0;
  }
}

int strcmp_wrapper(string a, string b){
  return strcmp(a,b);
}

int partition(int i, int j, int sort_index,string pivot, Row* A[], int (*cmp)(string,string)){
  int l = i;
  int r = j;
  while(l <= r){
    swap((void**)&A[l], (void**)&A[r]);
    while((*cmp)(get_sort_index(A[l],sort_index),pivot) < 0){
      l++;
    }
    while(((*cmp)(get_sort_index(A[r],sort_index),pivot) >= 0)){
      r--;
    }
  }
  return l;
}

void quicksort(int i, int j, int sort_index, Row* arr[], int (*cmp)(string,string)){
  int pivot_index = find_pivot(i,j,sort_index,arr,cmp);
  string pivot;
  int k;
  if(pivot_index != -1){
    pivot = get_sort_index(arr[pivot_index], sort_index);
    k = partition(i,j,sort_index,pivot,arr,cmp);
    quicksort(i, k-1, sort_index,arr,cmp);
    quicksort(k, j,sort_index, arr,cmp);
  }
}

void reverse(void* arr[], int l, int r){
  int last = r - 1;
  while(l <= last){
    swap(&arr[l],&arr[last]);
    l++;last--;
  }
}

int numeric(string candidate){
  string endptr;
  long int parse = strtol(candidate, &endptr, 0);
  int result = ((parse != 0L) && (*endptr == '\0'));
  return result;
}

int get_first_non_null_index(string arr[], int length){
  int index = -1;
  int curr = 0;
  while(index == -1 && curr < length){
    if (strcmp(arr[curr],"") != 0){
      index = curr;
    }
    curr++;
  }
  return index;
}

int (*(determine_comparator(Row* arr[], int rows, int index)))(string,string){
  int (*cmp)(char*, char*) = NULL;
  string* col  = extract_index(arr,rows,index);
  int test_index = get_first_non_null_index(col, rows);
  if (test_index != -1){
    if (numeric(col[test_index])){
      cmp = &numcmp;
    }
    else {
      cmp = &strcmp_wrapper;
    }
  }
  return cmp;
}

typedef struct {
  Node* _rowData;
  int* _sort_reverse;
  int* _sort_lastcol;
} other_data;

void sort_column(fl_Table_Row table, int col, int should_reverse){
  other_data* o = (other_data*)Fl_Table_Row_other_data(table);
  Node* _rowData = o->_rowData;
  int num_rows = *count_nodes(_rowData);
  Row** rows = to_array(_rowData);

  int (*cmp)(string,string) = NULL;
  cmp = determine_comparator(rows,num_rows,col);
  quicksort(0,num_rows - 1, col, rows, cmp);
  if (should_reverse) {
    reverse((void**)rows, 0, num_rows);
  }
  unlink_dll(&_rowData);
  _rowData = from_array(rows, num_rows);
  o->_rowData = _rowData;
  Fl_Table_Row_set_other_data(table,(void*)o);
  Fl_Table_Row_redraw(table);
}

void event_callback(fl_Widget widget, void* data){
  fl_Table_Row table = (fl_Table_Row) widget; // does nothing but aid readability
  int COL = Fl_Table_Row_callback_col(table);
  TableContextC context = Fl_Table_Row_callback_context(table);
  other_data* o = (other_data*)Fl_Table_Row_other_data(table);
  int* _sort_lastcol = o->_sort_lastcol;
  int* _sort_reverse = o->_sort_reverse;
  switch ( context ) {
  case CONTEXT_COL_HEADERC: {              // someone clicked on column header
    if ( Fl_event() == FL_RELEASE && Fl_event_button() == 1 ) {
      if ( *_sort_lastcol == COL ) {   // Click same column? Toggle sort
	*(o->_sort_reverse) ^= 1;
      } else {                        // Click diff column? Up sort
	*(o->_sort_reverse) ^= 0;
      }
      sort_column(table, COL,*_sort_reverse);
      *(o->_sort_lastcol) = COL;
      Fl_Table_Row_set_other_data(table,(void*)o);
    }
    break;
  }
  default:
    break;
  }
}

void initializeTable(fl_Table_Row table){
  other_data* d = malloc(sizeof(other_data));
  d->_sort_reverse = malloc(sizeof(int));;
  *(d->_sort_reverse) = 0;
  d->_sort_lastcol = malloc(sizeof(int));
  *(d->_sort_lastcol) = -1;
  d->_rowData = malloc(sizeof(Node));
  d->_rowData = NULL;
  Fl_Table_Row_set_other_data(table,(void*) d);
  // Fl_Table_Row_set_callback(table,(fl_Callback*)event_callback);
}

void autowidth(fl_Table_Row table, int pad){
  int w, h;
  other_data* o = (other_data*)Fl_Table_Row_other_data(table);
  int num_rows = *(count_nodes(o->_rowData));
  int num_cols = *(max_cols(o->_rowData));
  Row** rows = to_array(o->_rowData);
  // Initialize all column widths to header width
  flc_set_font(HEADER_FONTFACE, HEADER_FONTSIZE);
  int c = 0;
  for (; G_header[c]; c++ ) {
    w=0;
    flc_measure_with_draw_symbols(G_header[c], &w, &h, 0);
    Fl_Table_Row_set_col_width(table, c, w+pad);
  }
  flc_set_font(ROW_FONTFACE, ROW_FONTSIZE);
  int r = 0;
  for (;r<num_rows; r++ ) {
    int c = 0;
    for (; c<num_cols; c++ ) {
      string s = get_sort_index(rows[r], c);
      w=0;
      flc_measure_with_draw_symbols(s, &w, &h, 0);
      if ( (w + pad) > Fl_Table_Row_col_width(table,c)) Fl_Table_Row_set_col_width(table, c, w + pad);
    }
  }
  // need to do { table_resized(); redraw(); }
  // but table_resized() is unexposed.
  // setting the row_header flag induces this.
  int row_header = Fl_Table_Row_row_header(table);
  Fl_Table_Row_set_row_header(table, row_header);
}

void load_command(fl_Table_Row table, const string cmd){
  char s[512];
  FILE *fp = popen(cmd,"r");
  Fl_Table_Row_set_cols(table,0);
  Node* first_row;
  Node* curr_row;
  int r = 0;
  for (;fgets(s, sizeof(s)-1, fp); r++){
    string ss;
    const string delim = " \t\n";
    int t = 0;
    Node* first_col;
    Node* curr_col;
    for(;(t==0)?(ss=strtok(s,delim)):(ss=strtok(NULL, delim));t++) {
      Row* r = malloc(sizeof(Row));
      int* length = malloc(sizeof(int));
      *length = 1;
      string* contents = malloc(sizeof(char*));
      contents[0] = strdup(ss);
      r->length = length;
      r->row = contents;
      Node* new_col = make_node(r);
      if(t == 0){
	first_col = curr_col = new_col;
      }
      else {
	append(curr_col, new_col);
	curr_col = curr_col->next;
      }
    }
    int* num_cols = count_nodes(first_col);
    Row** fragmented = to_array(first_col);
    string* cols = extract_index(fragmented, *num_cols, 0);
    Row* row = malloc(sizeof(Row));
    row->length = num_cols;
    row->row = cols;
    Node* new_row = make_node(row);
    if (r == 0){
      first_row = curr_row = new_row;
    }
    else{
      append(curr_row, new_row);
      curr_row = curr_row->next;
    }
    if (*num_cols > Fl_Table_Row_cols(table)){
      Fl_Table_Row_set_cols(table,*num_cols);
    }
  }
  other_data* o = (other_data*)Fl_Table_Row_other_data(table);
  o->_rowData = first_row;
  Fl_Table_Row_set_other_data(table, (void*)o);
  int num_rows = *count_nodes(first_row);
  Fl_Table_Row_set_rows(table,num_rows);
  autowidth(table, 20);
}

void draw_sort_arrow(fl_Table_Row table,int X,int Y,int W,int H){
  other_data* o = (other_data*)Fl_Table_Row_other_data(table);
  int sort_reverse = *(o->_sort_reverse);
  int xlft = X+(W-6)-8;
  int xctr = X+(W-6)-4;
  int xrit = X+(W-6)-0;
  int ytop = Y+(H/2)-4;
  int ybot = Y+(H/2)+4;
  if ( sort_reverse ) {
    // Engraved down arrow
    flc_set_color(FL_WHITE);
    flc_line(xrit, ytop, xctr, ybot);
    flc_set_color(41);                   // dark gray
    flc_line(xlft, ytop, xrit, ytop);
    flc_line(xlft, ytop, xctr, ybot);
  } else {
    // Engraved up arrow
    flc_set_color(FL_WHITE);
    flc_line(xrit, ybot, xctr, ytop);
    flc_line(xrit, ybot, xlft, ybot);
    flc_set_color(41);                   // dark gray
    flc_line(xlft, ybot, xctr, ytop);
  }
}

void draw_cell(fl_Table_Row table, TableContextC context, int R, int C, int X, int Y, int W, int H) {
  const char *s = "";
  other_data* o = (other_data*)Fl_Table_Row_other_data(table);
  Node* _rowdata = o->_rowData;
  if (_rowdata != NULL){
    Row** rows = to_array(_rowdata);
    int num_rows = *count_nodes(_rowdata);
    if ( R < num_rows && C < *(rows[R]->length)){
      s = rows[R]->row[C];
    }
  }
  switch ( context ) {
  case CONTEXT_COL_HEADERC:
    flc_push_clip(X,Y,W,H);
    {
      flc_draw_box(FL_THIN_UP_BOX, X,Y,W,H, FL_BACKGROUND_COLOR);
      if ( C < 9 ) {
	flc_set_font(HEADER_FONTFACE, HEADER_FONTSIZE);
	flc_set_color(FL_BLACK);
	flc_draw_with_img_draw_symbols(G_header[C], X+2,Y,W,H, FL_ALIGN_LEFT, 0, 0);         // +2=pad left
	// Draw sort arrow
	if ( C == *(o->_sort_lastcol)) {
	  draw_sort_arrow(table,X,Y,W,H);
	}
      }
    }
    flc_pop_clip();
    return;
  case CONTEXT_CELLC: {
    flc_push_clip(X,Y,W,H);
    {
      // Bg color
      Fl_Color bgcolor;
      if (Fl_Table_Row_row_selected(table,R)){
	bgcolor = Fl_Table_Row_selection_color(table);
      }
      else {
	bgcolor = FL_WHITE;
      }
      flc_set_color(bgcolor);
      flc_rectf(X,Y,W,H);
      flc_set_font(ROW_FONTFACE, ROW_FONTSIZE);
      flc_set_color(FL_BLACK);
      flc_draw_with_align(s, X+2,Y,W,H, FL_ALIGN_LEFT);
      // Border
      flc_set_color(FL_LIGHT2);
      flc_rect(X,Y,W,H);
    }
    flc_pop_clip();
    return;
  }
  default:
    return;
  }
}

// Resize parent window to size of table
void resize_window(fl_Table table) {
  int width = 4;                                          // width of table borders
  int t = 0;
  for (; t<Fl_Table_Row_cols(table); t++ ){
    width += Fl_Table_Row_col_width(table,t);
  }
  width += MARGIN*2;
  if (width < 200 || width > Fl_w()) return;
  fl_Window window = (fl_Window)Fl_Table_Row_window(table);
  Fl_Window_resize(window, Fl_Window_x(window), Fl_Window_y(window), width, Fl_Window_h(window));
}

void test(){
  int arr_length = 11;
  string a[] = {"a","4"};
  Row* a_row = to_row(a,2);
  string b[] = {"b","3","row_B"};
  Row* b_row = to_row(b,3);
  string c[] = {"c","2","row_C"};
  Row* c_row = to_row(c,3);
  string d[] = {"d","1","row_D"};
  Row* d_row = to_row(d,3);
  string e[] = {"e","1","row_E"};
  Row* e_row = to_row(e,3);
  string f[] = {"f","1","row_F"};
  Row* f_row = to_row(f,3);
  string g[] = {"g","1","row_G"};
  Row* g_row = to_row(g,3);
  string h[] = {"h","1","row_H"};
  Row* h_row = to_row(h,3);
  string i[] = {"i","1","row_I"};
  Row* i_row = to_row(i,3);
  string j[] = {"j","1","row_J"};
  Row* j_row = to_row(j,3);
  string k[] = {"k","1","row_K"};
  Row* k_row = to_row(k,3);
  int sort_index = 0;
  Row** rows;
  rows = malloc(sizeof(Row*) * arr_length);
  rows[0] = a_row;
  rows[1] = b_row;
  rows[2] = c_row;
  rows[3] = d_row;
  rows[4] = e_row;
  rows[5] = f_row;
  rows[6] = g_row;
  rows[7] = h_row;
  rows[8] = i_row;
  rows[9] = j_row;
  rows[10] = k_row;

  // Reversing a reversed list should be idempotent
  reverse((void**)rows, 0, arr_length);
  print_rows(rows, arr_length);
  reverse((void**)rows, 0, arr_length);
  print_rows(rows, arr_length);
  puts("Row array -> doubly linked list.");
  Node* start = from_array(rows, arr_length);
  unlink_dll(&start);
  start = NULL;

  puts("Doubly linked list -> row array");
  int (*cmp)(string,string) = NULL;
  cmp = determine_comparator(rows,arr_length,sort_index);
  printf("Sort by column : %d\n", sort_index);
  quicksort(0,arr_length - 1,sort_index,rows,cmp);
  puts("Row array -> doubly linked list.");
  puts("Print doubly linked list");
  start = from_array(rows, arr_length);
  traverse_forward(start, NULL, &print_node);

  puts("Print it backwards");
  Node* last = get_last(start);
  traverse_backward(last, NULL, &print_node);

  unlink_dll(&start);
  start = NULL;

  puts("Change sort index to the numbers");
  sort_index = 1;
  cmp =  determine_comparator(rows,arr_length,sort_index);
  puts("Re-sort");
  quicksort(0,arr_length - 1,sort_index,rows,cmp);
  start = from_array(rows, arr_length);
  traverse_forward(start, NULL, &print_node);
  reverse((void**)rows, 0, arr_length);
  unlink_dll(&start);
  start = NULL;

  puts("Change sort index to uppercase letters");
  sort_index = 2;
  cmp =  determine_comparator(rows,arr_length,sort_index);
  puts("Re-sort");
  quicksort(0,arr_length - 1,sort_index,rows,cmp);
  start = from_array(rows, arr_length);
  traverse_forward(start, NULL, &print_node);
  unlink_dll(&start);
  start = NULL;

  puts("Count nodes");
  start = from_array(rows, arr_length);
  int* count = count_nodes(start);
  printf("Number of nodes: %d\n", *count);

  puts("Test turning a dll back into an array");
  Row** from_node = to_array(start);
  print_rows(from_node, arr_length);
  free_rows(rows, arr_length);
}

int main(int argc, string* argv){
  fl_Table_Row_Virtual_Funcs* funcs = (fl_Table_Row_Virtual_Funcs*)Fl_Table_Row_default_virtual_funcs();
  funcs->draw_cell = &draw_cell;
  fl_Double_Window window = (fl_Double_Window)Fl_Double_Window_New_WithLabel(900,500,"Table Sorting");
  Fl_Double_Window_begin(window);
  fl_Table_Row table = (fl_Table_Row)Fl_OverriddenTable_Row_New(MARGIN, MARGIN, Fl_Double_Window_w(window)-MARGIN*2, Fl_Double_Window_h(window)-MARGIN*2,funcs);
  initializeTable(table);
  Fl_Table_Row_set_selection_color(table,FL_YELLOW);
  Fl_Table_Row_set_col_header(table,1);
  Fl_Table_Row_set_col_resize(table,1);
  Fl_Table_Row_set_when(table,FL_WHEN_RELEASE);
  load_command(table,DIRCMD);
  Fl_Table_Row_set_row_height_all(table,18);
  Fl_Table_Row_set_tooltip(table,"Click on column headings to toggle column sorting");
  Fl_Table_Row_set_color(table,FL_WHITE);
  Fl_Double_Window_end(window);
  Fl_Double_Window_set_resizable(window,table);
  resize_window(table);
  Fl_Double_Window_show(window);
  return (Fl_run());
}
