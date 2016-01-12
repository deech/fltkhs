#ifndef __FILENAME_C__
#define __FILENAME_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/filename.H"
#include "Fl_CallbackC.h"
EXPORT {
#else
#include <dirent.h>
#include "FL/filename.H"
#endif
  FL_EXPORT_C(int, flc_filename_list)(const char *d, struct dirent ***l);
  FL_EXPORT_C(int, flc_filename_list_with_s)(const char *d, struct dirent ***l, Fl_File_Sort_F *s);
  FL_EXPORT_C(void,flc_filename_free_list)(struct dirent ***l, int n);
  FL_EXPORT_C(int, flc_open_uri_with_msg_msglen)(const char *uri,char *msg ,int msglen);
  FL_EXPORT_C(int, flc_open_uri_with_msglen)(const char *uri,int msglen);
  FL_EXPORT_C(int, flc_open_uri_with_msg)(const char *uri, char *msg);
  FL_EXPORT_C(int, flc_open_uri)(const char *uri);
  FL_EXPORT_C(void, flc_decode_uri)(char *uri);
  FL_EXPORT_C(const char*	,flc_filename_name)(const char*  filename);
  FL_EXPORT_C(const char*	,flc_filename_ext)(const char* buf);
  FL_EXPORT_C(char*	,flc_filename_setext)(char* to, int tolen, const char* ext);
  FL_EXPORT_C(int		,flc_filename_expand)(char* to, int tolen, const char* from);
  FL_EXPORT_C(int		,flc_filename_absolute)(char* to, int tolen, const char* from);
  FL_EXPORT_C(int		,flc_filename_relative)(char* to, int tolen, const char* from);
  FL_EXPORT_C(int		,flc_filename_match)(const char* name, const char* pattern);
  FL_EXPORT_C(int		,flc_filename_isdir)(const char* name);
  FL_EXPORT_C(int		,flc_filename_relative_with_cwd)(char* to, int tolen, const char* from, const char* cwd);
  FL_EXPORT_C(Fl_File_Sort_F* ,fl_numericsort_reference ());
  FL_EXPORT_C(Fl_File_Sort_F* ,fl_alphasort_reference ());
  FL_EXPORT_C(Fl_File_Sort_F* ,fl_casealphasort_reference ());
  FL_EXPORT_C(Fl_File_Sort_F* ,fl_casenumericsort_reference ());
#ifdef __cplusplus
}
#endif
#endif /* __FILENAME_C__ */
