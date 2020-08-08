#ifndef __FL_MULTI_LABEL_C__
#define __FL_MULTI_LABEL_C__
#ifdef __cplusplus
#include "FL/Fl.H"
#include "FL/Fl_Multi_Label.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  FL_EXPORT_C_HEADER(const char*,Fl_Multi_Label_labela,(fl_Multi_Label label));
  FL_EXPORT_C_HEADER(void,Fl_Multi_Label_set_labela,(fl_Multi_Label label, const char* text));
  FL_EXPORT_C_HEADER(const char*,Fl_Multi_Label_labelb,(fl_Multi_Label label));
  FL_EXPORT_C_HEADER(void,Fl_Multi_Label_set_labelb,(fl_Multi_Label label, const char* text));
  FL_EXPORT_C_HEADER(uchar,Fl_Multi_Label_typea,(fl_Multi_Label label));
  FL_EXPORT_C_HEADER(void,Fl_Multi_Label_set_typea,(fl_Multi_Label label, uchar typea));
  FL_EXPORT_C_HEADER(uchar,Fl_Multi_Label_typeb,(fl_Multi_Label label));
  FL_EXPORT_C_HEADER(void,Fl_Multi_Label_set_typeb,(fl_Multi_Label label, uchar typeb));
  FL_EXPORT_C_HEADER(fl_Multi_Label,Fl_Multi_Label_New,(const char* labela, const char* labelb, uchar typea, uchar typeb));
  FL_EXPORT_C_HEADER(void, Fl_Multi_Label_label_widget, (fl_Multi_Label l, fl_Widget w));
  FL_EXPORT_C_HEADER(void, Fl_Multi_Label_label_menu_item, (fl_Multi_Label l, fl_Menu_Item i));
#ifdef __cplusplus
}
#endif
#endif
