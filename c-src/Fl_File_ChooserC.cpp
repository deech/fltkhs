#include "Fl_File_ChooserC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(fl_File_Chooser, Fl_File_Chooser_New)(const char *d, const char *p, int t, const char *title){
    Fl_File_Chooser* c= new Fl_File_Chooser(d,p,t,title);
    return (fl_File_Chooser)c;
  }
  FL_EXPORT_C(void, Fl_File_Chooser_Destroy)(fl_File_Chooser file_chooser){
    delete (static_cast<Fl_File_Chooser*>(file_chooser));
  }
  FL_EXPORT_C(void, Fl_File_Chooser_callback)(fl_File_Chooser file_chooser, void (*cb)(fl_File_Chooser, void* )){

  C_to_Fl_Callback* c = new C_to_Fl_Callback(cb);
  c->set_callback(static_cast<Fl_File_Chooser*>(file_chooser));
  
  }
  FL_EXPORT_C(void, Fl_File_Chooser_callback_with_user_data)(fl_File_Chooser file_chooser, void (*cb)(fl_File_Chooser, void* ), void* user_data){
  C_to_Fl_Callback* c = new C_to_Fl_Callback(cb,user_data);
  c->set_callback(static_cast<Fl_File_Chooser*>(file_chooser));
  }
FL_EXPORT_C(void,Fl_File_Chooser_set_color)(fl_File_Chooser file_chooser,Fl_Color c){
  (static_cast<Fl_File_Chooser*>(file_chooser))->color(c);
}
FL_EXPORT_C(Fl_Color,Fl_File_Chooser_color)(fl_File_Chooser file_chooser){
 return (static_cast<Fl_File_Chooser*>(file_chooser))->color();
}
FL_EXPORT_C(int,Fl_File_Chooser_count)(fl_File_Chooser file_chooser){
 return (static_cast<Fl_File_Chooser*>(file_chooser))->count();
}
FL_EXPORT_C(void,Fl_File_Chooser_filter_value)(fl_File_Chooser file_chooser,int f){
  (static_cast<Fl_File_Chooser*>(file_chooser))->filter_value(f);
}
FL_EXPORT_C(void,Fl_File_Chooser_set_directory)(fl_File_Chooser file_chooser,const char* d){
  (static_cast<Fl_File_Chooser*>(file_chooser))->directory(d);
}
FL_EXPORT_C(char*,Fl_File_Chooser_directory)(fl_File_Chooser file_chooser){
 return (static_cast<Fl_File_Chooser*>(file_chooser))->directory();
}
FL_EXPORT_C(void,Fl_File_Chooser_set_filter)(fl_File_Chooser file_chooser,const char* p){
  (static_cast<Fl_File_Chooser*>(file_chooser))->filter(p);
}
FL_EXPORT_C(const char*,Fl_File_Chooser_filter)(fl_File_Chooser file_chooser){
 return (static_cast<Fl_File_Chooser*>(file_chooser))->filter();
}
FL_EXPORT_C(int,Fl_File_Chooser_set_filter_value)(fl_File_Chooser file_chooser){
 return (static_cast<Fl_File_Chooser*>(file_chooser))->filter_value();
}
FL_EXPORT_C(void,Fl_File_Chooser_hide)(fl_File_Chooser file_chooser){
  (static_cast<Fl_File_Chooser*>(file_chooser))->hide();
}
FL_EXPORT_C(void,Fl_File_Chooser_set_iconsize)(fl_File_Chooser file_chooser,uchar s){
  (static_cast<Fl_File_Chooser*>(file_chooser))->iconsize(s);
}
FL_EXPORT_C(uchar,Fl_File_Chooser_iconsize)(fl_File_Chooser file_chooser){
 return (static_cast<Fl_File_Chooser*>(file_chooser))->iconsize();
}
FL_EXPORT_C(void,Fl_File_Chooser_set_label)(fl_File_Chooser file_chooser,const char* l){
  (static_cast<Fl_File_Chooser*>(file_chooser))->label(l);
}
FL_EXPORT_C(const char*,Fl_File_Chooser_label)(fl_File_Chooser file_chooser){
 return (static_cast<Fl_File_Chooser*>(file_chooser))->label();
}
FL_EXPORT_C(void,Fl_File_Chooser_set_ok_label)(fl_File_Chooser file_chooser,const char* l){
  (static_cast<Fl_File_Chooser*>(file_chooser))->ok_label(l);
}
FL_EXPORT_C(const char*,Fl_File_Chooser_ok_label)(fl_File_Chooser file_chooser){
 return (static_cast<Fl_File_Chooser*>(file_chooser))->ok_label();
}
FL_EXPORT_C(void,Fl_File_Chooser_set_preview)(fl_File_Chooser file_chooser,int e){
  (static_cast<Fl_File_Chooser*>(file_chooser))->preview(e);
}
FL_EXPORT_C(int,Fl_File_Chooser_preview)(fl_File_Chooser file_chooser){
 return (static_cast<Fl_File_Chooser*>(file_chooser))->preview();
}
FL_EXPORT_C(void,Fl_File_Chooser_rescan)(fl_File_Chooser file_chooser){
  (static_cast<Fl_File_Chooser*>(file_chooser))->rescan();
}
FL_EXPORT_C(void,Fl_File_Chooser_rescan_keep_filename)(fl_File_Chooser file_chooser){
  (static_cast<Fl_File_Chooser*>(file_chooser))->rescan_keep_filename();
}
FL_EXPORT_C(void,Fl_File_Chooser_show)(fl_File_Chooser file_chooser){
  (static_cast<Fl_File_Chooser*>(file_chooser))->show();
}
FL_EXPORT_C(int,Fl_File_Chooser_shown)(fl_File_Chooser file_chooser){
 return (static_cast<Fl_File_Chooser*>(file_chooser))->shown();
}
FL_EXPORT_C(void,Fl_File_Chooser_set_textcolor)(fl_File_Chooser file_chooser,Fl_Color c){
  (static_cast<Fl_File_Chooser*>(file_chooser))->textcolor(c);
}
FL_EXPORT_C(Fl_Color,Fl_File_Chooser_textcolor)(fl_File_Chooser file_chooser){
 return (static_cast<Fl_File_Chooser*>(file_chooser))->textcolor();
}
FL_EXPORT_C(void,Fl_File_Chooser_set_textfont)(fl_File_Chooser file_chooser,Fl_Font f){
  (static_cast<Fl_File_Chooser*>(file_chooser))->textfont(f);
}
FL_EXPORT_C(Fl_Font,Fl_File_Chooser_textfont)(fl_File_Chooser file_chooser){
 return (static_cast<Fl_File_Chooser*>(file_chooser))->textfont();
}
FL_EXPORT_C(void,Fl_File_Chooser_set_textsize)(fl_File_Chooser file_chooser,Fl_Fontsize s){
  (static_cast<Fl_File_Chooser*>(file_chooser))->textsize(s);
}
FL_EXPORT_C(Fl_Fontsize,Fl_File_Chooser_textsize)(fl_File_Chooser file_chooser){
 return (static_cast<Fl_File_Chooser*>(file_chooser))->textsize();
}
FL_EXPORT_C(void,Fl_File_Chooser_set_type)(fl_File_Chooser file_chooser,int t){
  (static_cast<Fl_File_Chooser*>(file_chooser))->type(t);
}
FL_EXPORT_C(int,Fl_File_Chooser_type)(fl_File_Chooser file_chooser){
 return (static_cast<Fl_File_Chooser*>(file_chooser))->type();
}
 FL_EXPORT_C(void,Fl_File_Chooser_set_user_data)(fl_File_Chooser file_chooser, void* v){
  C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_File_Chooser*>(file_chooser))->user_data()));
  if (stored_cb) {
    stored_cb->set_user_data(v);
    (static_cast<Fl_File_Chooser*>(file_chooser))->user_data(stored_cb);
  }
  else {
    (static_cast<Fl_File_Chooser*>(file_chooser))->user_data(v);
  }
}
FL_EXPORT_C(void*,Fl_File_Chooser_user_data)(fl_File_Chooser file_chooser){
  C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_File_Chooser*>(file_chooser))->user_data()));
  if(stored_cb){
    return stored_cb->get_user_data();
  }
  else {
    return (static_cast<Fl_File_Chooser*>(file_chooser))->user_data();
  }
}
FL_EXPORT_C(const char*,Fl_File_Chooser_value)(fl_File_Chooser file_chooser){
 return (static_cast<Fl_File_Chooser*>(file_chooser))->value();
}
FL_EXPORT_C(const char*,Fl_File_Chooser_value_with_f)(fl_File_Chooser file_chooser,int f){
 return (static_cast<Fl_File_Chooser*>(file_chooser))->value(f);
}
FL_EXPORT_C(void,Fl_File_Chooser_set_value)(fl_File_Chooser file_chooser,const char* filename){
  (static_cast<Fl_File_Chooser*>(file_chooser))->value(filename);
}
FL_EXPORT_C(int,Fl_File_Chooser_visible)(fl_File_Chooser file_chooser){
 return (static_cast<Fl_File_Chooser*>(file_chooser))->visible();
}
 FL_EXPORT_C(fl_Widget,Fl_File_Chooser_add_extra)(fl_File_Chooser file_chooser,fl_Widget gr){
 return (static_cast<Fl_File_Chooser*>(file_chooser))->add_extra((static_cast<Fl_Widget*>(gr)));
}
FL_EXPORT_C(const char*,Fl_File_Chooser_add_favorites_label)( ){
 return Fl_File_Chooser::add_favorites_label;
}
FL_EXPORT_C(void,Fl_File_Chooser_set_add_favorites_label)( const char* value){
 Fl_File_Chooser::add_favorites_label = value;
}
FL_EXPORT_C(const char*,Fl_File_Chooser_all_files_label)( ){
 return Fl_File_Chooser::all_files_label;
}
FL_EXPORT_C(void,Fl_File_Chooser_set_all_files_label)( const char* value){
 Fl_File_Chooser::all_files_label = value;
}
FL_EXPORT_C(const char*,Fl_File_Chooser_custom_filter_label)( ){
 return Fl_File_Chooser::custom_filter_label;
}
FL_EXPORT_C(void,Fl_File_Chooser_set_custom_filter_label)( const char* value){
 Fl_File_Chooser::custom_filter_label = value;
}
FL_EXPORT_C(const char*,Fl_File_Chooser_existing_file_label)( ){
 return Fl_File_Chooser::existing_file_label;
}
FL_EXPORT_C(void,Fl_File_Chooser_set_existing_file_label)( const char* value){
 Fl_File_Chooser::existing_file_label = value;
}
FL_EXPORT_C(const char*,Fl_File_Chooser_favorites_label)( ){
 return Fl_File_Chooser::favorites_label;
}
FL_EXPORT_C(void,Fl_File_Chooser_set_favorites_label)( const char* value){
 Fl_File_Chooser::favorites_label = value;
}
FL_EXPORT_C(const char*,Fl_File_Chooser_filename_label)( ){
 return Fl_File_Chooser::filename_label;
}
FL_EXPORT_C(void,Fl_File_Chooser_set_filename_label)( const char* value){
 Fl_File_Chooser::filename_label = value;
}
FL_EXPORT_C(const char*,Fl_File_Chooser_filesystems_label)( ){
 return Fl_File_Chooser::filesystems_label;
}
FL_EXPORT_C(void,Fl_File_Chooser_set_filesystems_label)( const char* value){
 Fl_File_Chooser::filesystems_label = value;
}
FL_EXPORT_C(const char*,Fl_File_Chooser_manage_favorites_label)( ){
 return Fl_File_Chooser::manage_favorites_label;
}
FL_EXPORT_C(void,Fl_File_Chooser_set_manage_favorites_label)( const char* value){
 Fl_File_Chooser::manage_favorites_label = value;
}
FL_EXPORT_C(const char*,Fl_File_Chooser_new_directory_label)( ){
 return Fl_File_Chooser::new_directory_label;
}
FL_EXPORT_C(void,Fl_File_Chooser_set_new_directory_label)( const char* value){
 Fl_File_Chooser::new_directory_label = value;
}
FL_EXPORT_C(const char*,Fl_File_Chooser_new_directory_tooltip)( ){
 return Fl_File_Chooser::new_directory_tooltip;
}
FL_EXPORT_C(void,Fl_File_Chooser_set_new_directory_tooltip)( const char* value){
 Fl_File_Chooser::new_directory_tooltip = value;
}
FL_EXPORT_C(const char*,Fl_File_Chooser_preview_label)( ){
 return Fl_File_Chooser::preview_label;
}
FL_EXPORT_C(void,Fl_File_Chooser_set_preview_label)( const char* value){
 Fl_File_Chooser::preview_label = value;
}
FL_EXPORT_C(const char*,Fl_File_Chooser_save_label)( ){
 return Fl_File_Chooser::save_label;
}
FL_EXPORT_C(void,Fl_File_Chooser_set_save_label)( const char* value){
 Fl_File_Chooser::save_label = value;
}
FL_EXPORT_C(const char*,Fl_File_Chooser_show_label)( ){
 return Fl_File_Chooser::show_label;
}
FL_EXPORT_C(void,Fl_File_Chooser_set_show_label)(const char* value){
 Fl_File_Chooser::show_label = value;
}
FL_EXPORT_C(Fl_File_Sort_F*,Fl_File_Chooser_sort)( ){
 return Fl_File_Chooser::sort;
}
FL_EXPORT_C(void,Fl_File_Chooser_set_sort)(Fl_File_Sort_F* cb){
 Fl_File_Chooser::sort = cb;
}
FL_EXPORT_C(char*,flc_dir_chooser)(const char* message,const char* fname){
 return fl_dir_chooser(message,fname);
}
FL_EXPORT_C(char*,flc_dir_chooser_with_relative)(const char* message,const char* fname,int relative){
 return fl_dir_chooser(message,fname,relative);
}
FL_EXPORT_C(char*,flc_file_chooser)(const char* message,const char* pat,const char* fname){
 return fl_file_chooser(message,pat,fname);
}
FL_EXPORT_C(char*,flc_file_chooser_with_relative)(const char* message,const char* pat,const char* fname,int relative){
 return fl_file_chooser(message,pat,fname,relative);
}
  FL_EXPORT_C(void, flc_file_chooser_callback)(void (*cb)(const char*)){
    fl_file_chooser_callback(cb);
  };
FL_EXPORT_C(void,flc_file_chooser_ok_label)(const char* l){
  fl_file_chooser_ok_label(l);
}
#ifdef __cplusplus
}
#endif
