#ifndef __FL_FILE_CHOOSER_C__
#define __FL_FILE_CHOOSER_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_File_Chooser.H"
#include "FL/filename.H"
#include "Fl_CallbackC.h"
EXPORT {
#else
#include "FL/filename.H"  
#endif
  FL_EXPORT_C(fl_File_Chooser, Fl_File_Chooser_New)(const char *d, const char *p, int t, const char *title);
  FL_EXPORT_C(void, Fl_File_Chooser_Destroy)(fl_File_Chooser file_chooser);
  FL_EXPORT_C(void, Fl_File_Chooser_callback)(fl_File_Chooser file_chooser, void (*cb)(fl_File_Chooser, void* ));
  FL_EXPORT_C(void, Fl_File_Chooser_callback_with_user_data)(fl_File_Chooser file_chooser, void (*cb)(fl_File_Chooser, void* ), void* d);
  FL_EXPORT_C(void, Fl_File_Chooser_set_color)(fl_File_Chooser file_chooser, Fl_Color c);
  FL_EXPORT_C(Fl_Color, Fl_File_Chooser_color)(fl_File_Chooser file_chooser);
  FL_EXPORT_C(int, Fl_File_Chooser_count)(fl_File_Chooser file_chooser);
  FL_EXPORT_C(void, Fl_File_Chooser_set_directory)(fl_File_Chooser file_chooser, const char* d);
  FL_EXPORT_C(char* , Fl_File_Chooser_directory)(fl_File_Chooser file_chooser);
  FL_EXPORT_C(void, Fl_File_Chooser_set_filter)(fl_File_Chooser file_chooser, const char* p);
  FL_EXPORT_C(const char* , Fl_File_Chooser_filter)(fl_File_Chooser file_chooser);
  FL_EXPORT_C(int, Fl_File_Chooser_set_filter_value)(fl_File_Chooser file_chooser);
  FL_EXPORT_C(void, Fl_File_Chooser_filter_value)(fl_File_Chooser file_chooser, int f);
  FL_EXPORT_C(void, Fl_File_Chooser_hide)(fl_File_Chooser file_chooser);
  FL_EXPORT_C(void, Fl_File_Chooser_set_iconsize)(fl_File_Chooser file_chooser, uchar s);
  FL_EXPORT_C(uchar, Fl_File_Chooser_iconsize)(fl_File_Chooser file_chooser);
  FL_EXPORT_C(void, Fl_File_Chooser_set_label)(fl_File_Chooser file_chooser, const char* l);
  FL_EXPORT_C(const char* , Fl_File_Chooser_label)(fl_File_Chooser file_chooser);
  FL_EXPORT_C(void, Fl_File_Chooser_set_ok_label)(fl_File_Chooser file_chooser, const char* l);
  FL_EXPORT_C(const char* , Fl_File_Chooser_ok_label)(fl_File_Chooser file_chooser);
  FL_EXPORT_C(void, Fl_File_Chooser_set_preview)(fl_File_Chooser file_chooser, int e);
  FL_EXPORT_C(int, Fl_File_Chooser_preview)(fl_File_Chooser file_chooser);
  FL_EXPORT_C(void, Fl_File_Chooser_rescan)(fl_File_Chooser file_chooser);
  FL_EXPORT_C(void, Fl_File_Chooser_rescan_keep_filename)(fl_File_Chooser file_chooser);
  FL_EXPORT_C(void, Fl_File_Chooser_show)(fl_File_Chooser file_chooser);
  FL_EXPORT_C(int, Fl_File_Chooser_shown)(fl_File_Chooser file_chooser);
  FL_EXPORT_C(void, Fl_File_Chooser_set_textcolor)(fl_File_Chooser file_chooser, Fl_Color c);
  FL_EXPORT_C(Fl_Color, Fl_File_Chooser_textcolor)(fl_File_Chooser file_chooser);
  FL_EXPORT_C(void, Fl_File_Chooser_set_textfont)(fl_File_Chooser file_chooser, Fl_Font f);
  FL_EXPORT_C(Fl_Font, Fl_File_Chooser_textfont)(fl_File_Chooser file_chooser);
  FL_EXPORT_C(void, Fl_File_Chooser_set_textsize)(fl_File_Chooser file_chooser, Fl_Fontsize s);
  FL_EXPORT_C(Fl_Fontsize, Fl_File_Chooser_textsize)(fl_File_Chooser file_chooser);
  FL_EXPORT_C(void, Fl_File_Chooser_set_type)(fl_File_Chooser file_chooser, int t);
  FL_EXPORT_C(int, Fl_File_Chooser_type)(fl_File_Chooser file_chooser);
  FL_EXPORT_C(void*, Fl_File_Chooser_user_data)(fl_File_Chooser file_chooser);
  FL_EXPORT_C(void, Fl_File_Chooser_set_user_data)(fl_File_Chooser file_chooser, void* d);
  FL_EXPORT_C(const char*, Fl_File_Chooser_value)(fl_File_Chooser file_chooser);
  FL_EXPORT_C(const char*, Fl_File_Chooser_value_with_f)(fl_File_Chooser file_chooser, int f);
  FL_EXPORT_C(void, Fl_File_Chooser_set_value)(fl_File_Chooser file_chooser, const char* filename);
  FL_EXPORT_C(int, Fl_File_Chooser_visible)(fl_File_Chooser file_chooser);
  FL_EXPORT_C(fl_Widget, Fl_File_Chooser_add_extra)(fl_File_Chooser file_chooser,fl_Widget gr);
  FL_EXPORT_C(const char*, Fl_File_Chooser_add_favorites_label)();
  FL_EXPORT_C(void, Fl_File_Chooser_set_add_favorites_label)(const char* value);
  FL_EXPORT_C(const char*, Fl_File_Chooser_all_files_label)();
  FL_EXPORT_C(void, Fl_File_Chooser_set_all_files_label)(const char* value);
  FL_EXPORT_C(const char*, Fl_File_Chooser_custom_filter_label)();
  FL_EXPORT_C(void, Fl_File_Chooser_set_custom_filter_label)(const char* value);
  FL_EXPORT_C(const char*, Fl_File_Chooser_existing_file_label)();
  FL_EXPORT_C(void, Fl_File_Chooser_set_existing_file_label)(const char* value);
  FL_EXPORT_C(const char*, Fl_File_Chooser_favorites_label)();
  FL_EXPORT_C(void, Fl_File_Chooser_set_favorites_label)(const char* value);
  FL_EXPORT_C(const char*, Fl_File_Chooser_filename_label)();
  FL_EXPORT_C(void, Fl_File_Chooser_set_filename_label)(const char* value);
  FL_EXPORT_C(const char*, Fl_File_Chooser_filesystems_label)();
  FL_EXPORT_C(void, Fl_File_Chooser_set_filesystems_label)(const char* value);
  FL_EXPORT_C(const char*, Fl_File_Chooser_manage_favorites_label)();
  FL_EXPORT_C(void, Fl_File_Chooser_set_manage_favorites_label)(const char* value);
  FL_EXPORT_C(const char*, Fl_File_Chooser_new_directory_label)();
  FL_EXPORT_C(void, Fl_File_Chooser_set_new_directory_label)(const char* value);
  FL_EXPORT_C(const char*, Fl_File_Chooser_new_directory_tooltip)();
  FL_EXPORT_C(void, Fl_File_Chooser_set_new_directory_tooltip)(const char* value);
  FL_EXPORT_C(const char*, Fl_File_Chooser_preview_label)();
  FL_EXPORT_C(void, Fl_File_Chooser_set_preview_label)(const char* value);
  FL_EXPORT_C(const char*, Fl_File_Chooser_save_label)();
  FL_EXPORT_C(void, Fl_File_Chooser_set_save_label)(const char* value);
  FL_EXPORT_C(const char*, Fl_File_Chooser_show_label)();
  FL_EXPORT_C(void, Fl_File_Chooser_set_show_label)(const char* value);
  FL_EXPORT_C(Fl_File_Sort_F*, Fl_File_Chooser_sort)();
  FL_EXPORT_C(void, Fl_File_Chooser_set_sort)(Fl_File_Sort_F* cb);
  FL_EXPORT_C(char*, flc_dir_chooser)(const char* message,const char* fname);
  FL_EXPORT_C(char*, flc_dir_chooser_with_relative)(const char* message,const char* fname,int relative);
  FL_EXPORT_C(char*, flc_file_chooser)(const char* message,const char* pat,const char* fname);
  FL_EXPORT_C(char*, flc_file_chooser_with_relative)(const char* message,const char* pat,const char* fname,int relative);
  FL_EXPORT_C(void, flc_file_chooser_callback)(void (*cb)(const char*));
  FL_EXPORT_C(void, flc_file_chooser_ok_label)(const char*l);
#ifdef __cplusplus
}
#endif
#endif /* __FL_FILE_CHOOSER_C__ */
