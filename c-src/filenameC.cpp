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
  FL_EXPORT_C(const char*,flc_filename_name)(const char* filename){
    return fl_filename_name(filename);
  }
  FL_EXPORT_C(const char*,flc_filename_ext)(const char* buf){
    return fl_filename_ext(buf);
  }
  FL_EXPORT_C(char*,flc_filename_setext)(char* to,int tolen,const char* ext){
    return fl_filename_setext(to,tolen,ext);
  }
  FL_EXPORT_C(int,flc_filename_expand)(char* to,int tolen,const char* from){
    return fl_filename_expand(to,tolen,from);
  }
  FL_EXPORT_C(int,flc_filename_absolute)(char* to,int tolen,const char* from){
    return fl_filename_absolute(to,tolen,from);
  }
  FL_EXPORT_C(int,flc_filename_relative)(char* to,int tolen,const char* from){
    return fl_filename_relative(to,tolen,from);
  }
  FL_EXPORT_C(int,flc_filename_match)(const char* name,const char* pattern){
    return fl_filename_match(name,pattern);
  }
  FL_EXPORT_C(int,flc_filename_isdir)(const char* name){
    return fl_filename_isdir(name);
  }
  FL_EXPORT_C(int,flc_filename_relative_with_cwd)(char* to,int tolen,const char* from,const char* cwd){
    return fl_filename_relative(to,tolen,from,cwd);
  }
  FL_EXPORT_C(Fl_File_Sort_F* ,fl_numericsort_reference ()){
    return &fl_numericsort;
  }
  FL_EXPORT_C(Fl_File_Sort_F* ,fl_alphasort_reference ()){
    return &fl_alphasort;
  }
  FL_EXPORT_C(Fl_File_Sort_F* ,fl_casealphasort_reference ()){
    return &fl_casealphasort;
  }
  FL_EXPORT_C(Fl_File_Sort_F* ,fl_casenumericsort_reference ()){
    return &fl_casenumericsort;
  }
#ifdef __cplusplus
}
#endif
