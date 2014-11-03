#ifndef __FL_TEXT_SELECTION_C__
#define __FL_TEXT_SELECTION_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Text_Buffer.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  FL_EXPORT_C(void, Fl_Text_Selection_set)(fl_Text_Selection text_selection,int start, int end);
  FL_EXPORT_C(void, Fl_Text_Selection_update)(fl_Text_Selection text_selection, int pos, int nDeleted, int nInserted);
  FL_EXPORT_C(int, Fl_Text_Selection_start)(fl_Text_Selection text_selection);
  FL_EXPORT_C(int, Fl_Text_Selection_end)(fl_Text_Selection text_selection);
  FL_EXPORT_C(int, Fl_Text_Selection_selected)(fl_Text_Selection text_selection);
  FL_EXPORT_C(void, Fl_Text_Selection_set_selected)(fl_Text_Selection text_selection, int b);
  FL_EXPORT_C(int, Fl_Text_Selection_includes)(fl_Text_Selection text_selection, int pos);
  FL_EXPORT_C(int, Fl_Text_Selection_position)(fl_Text_Selection text_selection, int* start, int* end);
#ifdef __cplusplus
}
#endif
#endif /*#ifndef __FL_TEXT_SELECTION_C__*/
