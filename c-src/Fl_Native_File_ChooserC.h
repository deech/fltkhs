#ifndef __FL_NATIVE_FILE_CHOOSER_C__
#define __FL_NATIVE_FILE_CHOOSER_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Native_File_Chooser.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
#ifndef INTERNAL_LINKAGE
  enum Type {
    BROWSE_FILE = 0,
    BROWSE_DIRECTORY,
    BROWSE_MULTI_FILE,
    BROWSE_MULTI_DIRECTORY,
    BROWSE_SAVE_FILE,
    BROWSE_SAVE_DIRECTORY
  };
  enum Option {
    NO_OPTIONS     = 0x0000,
    SAVEAS_CONFIRM = 0x0001,
    NEW_FOLDER     = 0x0002,
    PREVIEW        = 0x0004,
    USE_FILTER_EXT = 0x0008
  };
#endif
  FL_EXPORT_C(fl_Native_File_Chooser, Fl_Native_File_Chooser_New_WithVal)(int val);
  FL_EXPORT_C(fl_Native_File_Chooser, Fl_Native_File_Chooser_New)();
  FL_EXPORT_C(void, Fl_Native_File_Chooser_Destroy)(fl_Native_File_Chooser chooser);
  FL_EXPORT_C(void, Fl_Native_File_Chooser_set_type)(fl_Native_File_Chooser chooser, int type);
  FL_EXPORT_C(int, Fl_Native_File_Chooser_type)(fl_Native_File_Chooser chooser);
  FL_EXPORT_C(void, Fl_Native_File_Chooser_set_options)(fl_Native_File_Chooser chooser, int options);
  FL_EXPORT_C(int, Fl_Native_File_Chooser_options)(fl_Native_File_Chooser chooser);
  FL_EXPORT_C(int, Fl_Native_File_Chooser_count)(fl_Native_File_Chooser chooser);
  FL_EXPORT_C(const char*, Fl_Native_File_Chooser_filename)(fl_Native_File_Chooser chooser);
  FL_EXPORT_C(const char*, Fl_Native_File_Chooser_filename_with_i)(fl_Native_File_Chooser chooser, int i);
  FL_EXPORT_C(void, Fl_Native_File_Chooser_set_directory)(fl_Native_File_Chooser chooser, const char *val);
  FL_EXPORT_C(const char*, Fl_Native_File_Chooser_directory)(fl_Native_File_Chooser chooser);
  FL_EXPORT_C(void, Fl_Native_File_Chooser_set_title)(fl_Native_File_Chooser chooser, const char *);
  FL_EXPORT_C(const char*, Fl_Native_File_Chooser_title)(fl_Native_File_Chooser chooser);
  FL_EXPORT_C(const char*, Fl_Native_File_Chooser_filter)(fl_Native_File_Chooser chooser);
  FL_EXPORT_C(void, Fl_Native_File_Chooser_set_filter)(fl_Native_File_Chooser chooser, const char *);
  FL_EXPORT_C(int, Fl_Native_File_Chooser_filters)(fl_Native_File_Chooser chooser);
  FL_EXPORT_C(void, Fl_Native_File_Chooser_set_filter_value)(fl_Native_File_Chooser chooser, int i);
  FL_EXPORT_C(int, Fl_Native_File_Chooser_filter_value)(fl_Native_File_Chooser chooser);
  FL_EXPORT_C(void, Fl_Native_File_Chooser_set_preset_file)(fl_Native_File_Chooser chooser, const char*);
  FL_EXPORT_C(const char*, Fl_Native_File_Chooser_preset_file)(fl_Native_File_Chooser chooser);
  FL_EXPORT_C(const char*, Fl_Native_File_Chooser_errmsg)(fl_Native_File_Chooser chooser);
  FL_EXPORT_C(int, Fl_Native_File_Chooser_show)(fl_Native_File_Chooser chooser);
#ifdef __cplusplus
}
#endif
#endif /* __FL_NATIVE_FILE_CHOOSER_C__ */
