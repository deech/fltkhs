#include "Fl_Text_SelectionC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(void,Fl_Text_Selection_set)(fl_Text_Selection text_selection,int start,int end){
  (static_cast<Fl_Text_Selection*>(text_selection))->set(start,end);
}
  FL_EXPORT_C(void,Fl_Text_Selection_update)(fl_Text_Selection text_selection,int pos,int nDeleted,int nInserted){
  (static_cast<Fl_Text_Selection*>(text_selection))->update(pos,nDeleted,nInserted);
}
  FL_EXPORT_C(int,Fl_Text_Selection_start)(fl_Text_Selection text_selection){
  return (static_cast<Fl_Text_Selection*>(text_selection))->start();
}
  FL_EXPORT_C(int,Fl_Text_Selection_end)(fl_Text_Selection text_selection){
  return (static_cast<Fl_Text_Selection*>(text_selection))->end();
}
  FL_EXPORT_C(int,Fl_Text_Selection_selected)(fl_Text_Selection text_selection){
  return (static_cast<Fl_Text_Selection*>(text_selection))->selected();
}
  FL_EXPORT_C(void,Fl_Text_Selection_set_selected)(fl_Text_Selection text_selection,int b){
  (static_cast<Fl_Text_Selection*>(text_selection))->selected(b);
}
  FL_EXPORT_C(int,Fl_Text_Selection_includes)(fl_Text_Selection text_selection,int pos){
  return (static_cast<Fl_Text_Selection*>(text_selection))->includes(pos);
}
  FL_EXPORT_C(int,Fl_Text_Selection_position)(fl_Text_Selection text_selection,int* start,int* end){
  return (static_cast<Fl_Text_Selection*>(text_selection))->position(start,end);
}
  FL_EXPORT_C(fl_Text_Selection, Fl_Text_Selection_New)(){
  Fl_Text_Selection* t = new Fl_Text_Selection();
  return (fl_Text_Selection)t;
}
#ifdef __cplusplus
}
#endif
