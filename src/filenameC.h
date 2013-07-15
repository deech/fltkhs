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
#endif
  FL_EXPORT_C(int, flc_filename_list)(const char *d, struct dirent ***l);
  FL_EXPORT_C(int, flc_filename_list_with_s)(const char *d, struct dirent ***l, Fl_File_Sort_F *s);
  FL_EXPORT_C(void,flc_filename_free_list)(struct dirent ***l, int n);
  FL_EXPORT_C(int, flc_open_uri_with_msg_msglen)(const char *uri,char *msg ,int msglen);
  FL_EXPORT_C(int, flc_open_uri_with_msglen)(const char *uri,int msglen);
  FL_EXPORT_C(int, flc_open_uri_with_msg)(const char *uri, char *msg);
  FL_EXPORT_C(int, flc_open_uri)(const char *uri);
  FL_EXPORT_C(void, flc_decode_uri)(char *uri);
#ifdef __cplusplus
}
#endif
#endif /* __FILENAME_C__ */
