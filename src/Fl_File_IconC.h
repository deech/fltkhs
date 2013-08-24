#ifndef __FL_FILE_ICON_C__
#define __FL_FILE_ICON_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_File_Icon.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  FL_EXPORT_C(fl_File_Icon, Fl_File_Icon_New)(const char* p, int t, int nd, short* d);
  FL_EXPORT_C(void        , Fl_File_Icon_Destroy)(fl_File_Icon file_icon);
  FL_EXPORT_C(short*, Fl_File_Icon_add)(fl_File_Icon file_icon, short d);
  FL_EXPORT_C(short*, Fl_File_Icon_add_color)(fl_File_Icon file_icon, Fl_Color c);
  FL_EXPORT_C(short*, Fl_File_Icon_add_vertex)(fl_File_Icon file_icon, float x, float y);
  FL_EXPORT_C(void, Fl_File_Icon_clear)(fl_File_Icon file_icon);
  FL_EXPORT_C(void, Fl_File_Icon_draw)(fl_File_Icon file_icon, int x, int y, int w, int h, Fl_Color ic);
  FL_EXPORT_C(void, Fl_File_Icon_draw_with_active)(fl_File_Icon file_icon, int x, int y, int w, int h, Fl_Color ic, int active);
  FL_EXPORT_C(void, Fl_File_Icon_label)(fl_File_Icon file_icon, fl_Widget w);
  FL_EXPORT_C(void, Fl_File_Icon_load)(fl_File_Icon file_icon, const char* f);
  FL_EXPORT_C(int, Fl_File_Icon_load_fti)(fl_File_Icon file_icon, const char* fti);
  FL_EXPORT_C(int, Fl_File_Icon_load_image)(fl_File_Icon file_icon, const char* i);
  FL_EXPORT_C(fl_File_Icon, Fl_File_Icon_next)(fl_File_Icon file_icon);
  FL_EXPORT_C(const char*, Fl_File_Icon_pattern)(fl_File_Icon file_icon);
  FL_EXPORT_C(int, Fl_File_Icon_size)(fl_File_Icon file_icon);
  FL_EXPORT_C(int, Fl_File_Icon_type)(fl_File_Icon file_icon);
  FL_EXPORT_C(short*, Fl_File_Icon_value)(fl_File_Icon file_icon);
  FL_EXPORT_C(void, Fl_File_Icon_labeltype)(fl_Label o, int x, int y, int w, int h, Fl_Align a);
  FL_EXPORT_C(fl_File_Icon, Fl_File_Icon_find)(const char* filename, int filetype);
  FL_EXPORT_C(fl_File_Icon, Fl_File_Icon_find_with_filetype)(const char* filename, int filetype);
  FL_EXPORT_C(fl_File_Icon, Fl_File_Icon_first)();
  FL_EXPORT_C(void, Fl_File_Icon_load_system_icons)();
#ifdef __cplusplus
}
#endif
#endif /* __FL_FILE_ICON_C__ */
