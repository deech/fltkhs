#include "filenameC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(int,flc_filename_list)(const char *d,struct dirent ***l){
  return fl_filename_list(d,l);
}
  FL_EXPORT_C(int,flc_filename_list_with_s)(const char *d,struct dirent ***l,Fl_File_Sort_F *s){
  return fl_filename_list(d,l,s);
}
  FL_EXPORT_C(void,flc_filename_free_list)(struct dirent ***l,int n){
  fl_filename_free_list(l,n);
}
  FL_EXPORT_C(int,flc_open_uri_with_msg_msglen)(const char *uri,char *msg,int msglen){
  return fl_open_uri(uri,msg,msglen);
}
  FL_EXPORT_C(int,flc_open_uri_with_msglen)(const char *uri,int msglen){
  return fl_open_uri(uri,0,msglen);
}
  FL_EXPORT_C(int,flc_open_uri_with_msg)(const char *uri,char *msg){
  return fl_open_uri(uri,msg,0);
}
  FL_EXPORT_C(int,flc_open_uri)(const char *uri){
  return fl_open_uri(uri);
}
  FL_EXPORT_C(void,flc_decode_uri)(char *uri){
  fl_decode_uri(uri);
}
#ifdef __cplusplus
}
#endif
  
