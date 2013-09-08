#include "Fl_Text_BufferC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(int, Fl_Text_Buffer_input_file_was_transcoded)(fl_Text_Buffer text_buffer){
  return (static_cast<Fl_Text_Buffer*>(text_buffer))->input_file_was_transcoded;
}
  FL_EXPORT_C(const char*, Fl_Text_Buffer_file_encoding_warning_message)(fl_Text_Buffer text_buffer){
  return (static_cast<Fl_Text_Buffer*>(text_buffer))->file_encoding_warning_message;
}
  FL_EXPORT_C(void, Fl_Text_Buffer_set_transcoding_warning_action)(fl_Text_Buffer text_buffer, fl_Text_Buffer_Callback* cb){
  C_to_Fl_Callback* c = new C_to_Fl_Callback(cb, text_buffer);
  c->set_callback((static_cast<Fl_Text_Buffer*>(text_buffer)));
}
  FL_EXPORT_C(int,Fl_Text_Buffer_length)(fl_Text_Buffer text_buffer){
  return (static_cast<Fl_Text_Buffer*>(text_buffer))->length();
}
  FL_EXPORT_C(char*,Fl_Text_Buffer_text)(fl_Text_Buffer text_buffer){
  return (static_cast<Fl_Text_Buffer*>(text_buffer))->text();
}
  FL_EXPORT_C(void,Fl_Text_Buffer_set_text)(fl_Text_Buffer text_buffer,const char* text){
  (static_cast<Fl_Text_Buffer*>(text_buffer))->text(text);
}
  FL_EXPORT_C(char*,Fl_Text_Buffer_text_range)(fl_Text_Buffer text_buffer,int start,int end){
  return (static_cast<Fl_Text_Buffer*>(text_buffer))->text_range(start,end);
}
  FL_EXPORT_C(unsigned int,Fl_Text_Buffer_char_at)(fl_Text_Buffer text_buffer,int pos){
  return (static_cast<Fl_Text_Buffer*>(text_buffer))->char_at(pos);
}
  FL_EXPORT_C(char,Fl_Text_Buffer_byte_at)(fl_Text_Buffer text_buffer,int pos){
  return (static_cast<Fl_Text_Buffer*>(text_buffer))->byte_at(pos);
}
  FL_EXPORT_C(char*,Fl_Text_Buffer_address)(fl_Text_Buffer text_buffer,int pos){
  return (static_cast<Fl_Text_Buffer*>(text_buffer))->address(pos);
}
  FL_EXPORT_C(void,Fl_Text_Buffer_insert)(fl_Text_Buffer text_buffer,int pos,const char* text){
  (static_cast<Fl_Text_Buffer*>(text_buffer))->insert(pos,text);
}
  FL_EXPORT_C(void,Fl_Text_Buffer_append)(fl_Text_Buffer text_buffer,const char* t){
  (static_cast<Fl_Text_Buffer*>(text_buffer))->append(t);
}
  FL_EXPORT_C(void,Fl_Text_Buffer_remove)(fl_Text_Buffer text_buffer,int start,int end){
  (static_cast<Fl_Text_Buffer*>(text_buffer))->remove(start,end);
}
  FL_EXPORT_C(void,Fl_Text_Buffer_replace)(fl_Text_Buffer text_buffer,int start,int end,const char* text){
  (static_cast<Fl_Text_Buffer*>(text_buffer))->replace(start,end,text);
}
  FL_EXPORT_C(void,Fl_Text_Buffer_copy)(fl_Text_Buffer text_buffer,fl_Text_Buffer fromBuf,int fromStart,int fromEnd,int toPos){
  (static_cast<Fl_Text_Buffer*>(text_buffer))->copy((static_cast<Fl_Text_Buffer*>(fromBuf)),fromStart,fromEnd,toPos);
}
  FL_EXPORT_C(int,Fl_Text_Buffer_undo)(fl_Text_Buffer text_buffer){
  return (static_cast<Fl_Text_Buffer*>(text_buffer))->undo();
}
  FL_EXPORT_C(int,Fl_Text_Buffer_undo_with_cp)(fl_Text_Buffer text_buffer,int* cp){
  return (static_cast<Fl_Text_Buffer*>(text_buffer))->undo(cp);
}
  FL_EXPORT_C(void,Fl_Text_Buffer_canUndo)(fl_Text_Buffer text_buffer){
  (static_cast<Fl_Text_Buffer*>(text_buffer))->canUndo();
}
  FL_EXPORT_C(void,Fl_Text_Buffer_canUndo_with_flag)(fl_Text_Buffer text_buffer,char flag){
  (static_cast<Fl_Text_Buffer*>(text_buffer))->canUndo(flag);
}
  FL_EXPORT_C(int,Fl_Text_Buffer_insertfile)(fl_Text_Buffer text_buffer,const char* file,int pos){
  return (static_cast<Fl_Text_Buffer*>(text_buffer))->insertfile(file,pos);
}
  FL_EXPORT_C(int,Fl_Text_Buffer_insertfile_with_buflen)(fl_Text_Buffer text_buffer,const char* file,int pos,int buflen){
  return (static_cast<Fl_Text_Buffer*>(text_buffer))->insertfile(file,pos,buflen);
}
  FL_EXPORT_C(int,Fl_Text_Buffer_appendfile)(fl_Text_Buffer text_buffer,const char* file){
  return (static_cast<Fl_Text_Buffer*>(text_buffer))->appendfile(file);
}
  FL_EXPORT_C(int,Fl_Text_Buffer_appendfile_with_buflen)(fl_Text_Buffer text_buffer,const char* file,int buflen){
  return (static_cast<Fl_Text_Buffer*>(text_buffer))->appendfile(file,buflen);
}
  FL_EXPORT_C(int,Fl_Text_Buffer_loadfile)(fl_Text_Buffer text_buffer,const char* file){
  return (static_cast<Fl_Text_Buffer*>(text_buffer))->loadfile(file);
}
  FL_EXPORT_C(int,Fl_Text_Buffer_loadfile_with_buflen)(fl_Text_Buffer text_buffer,const char* file,int buflen){
  return (static_cast<Fl_Text_Buffer*>(text_buffer))->loadfile(file,buflen);
}
  FL_EXPORT_C(int,Fl_Text_Buffer_outputfile)(fl_Text_Buffer text_buffer,const char* file,int start,int end){
  return (static_cast<Fl_Text_Buffer*>(text_buffer))->outputfile(file,start,end);
}
  FL_EXPORT_C(int,Fl_Text_Buffer_outputfile_with_buflen)(fl_Text_Buffer text_buffer,const char* file,int start,int end,int buflen){
  return (static_cast<Fl_Text_Buffer*>(text_buffer))->outputfile(file,start,end,buflen);
}
  FL_EXPORT_C(int,Fl_Text_Buffer_savefile)(fl_Text_Buffer text_buffer,const char* file){
  return (static_cast<Fl_Text_Buffer*>(text_buffer))->savefile(file);
}
  FL_EXPORT_C(int,Fl_Text_Buffer_savefile_with_buflen)(fl_Text_Buffer text_buffer,const char* file,int buflen){
  return (static_cast<Fl_Text_Buffer*>(text_buffer))->savefile(file,buflen);
}
  FL_EXPORT_C(int,Fl_Text_Buffer_tab_distance)(fl_Text_Buffer text_buffer){
  return (static_cast<Fl_Text_Buffer*>(text_buffer))->tab_distance();
  }
  FL_EXPORT_C(void,Fl_Text_Buffer_set_tab_distance)(fl_Text_Buffer text_buffer,int tabDist){
  (static_cast<Fl_Text_Buffer*>(text_buffer))->tab_distance(tabDist);
  }
  FL_EXPORT_C(void,Fl_Text_Buffer_remove_selection)(fl_Text_Buffer text_buffer){
  (static_cast<Fl_Text_Buffer*>(text_buffer))->remove_selection();
}
  FL_EXPORT_C(void,Fl_Text_Buffer_select)(fl_Text_Buffer text_buffer,int start,int end){
    (static_cast<Fl_Text_Buffer*>(text_buffer))->select(start,end);
  }
  FL_EXPORT_C(int,Fl_Text_Buffer_selected)(fl_Text_Buffer text_buffer){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->selected();
  }
  FL_EXPORT_C(void,Fl_Text_Buffer_unselect)(fl_Text_Buffer text_buffer){
    (static_cast<Fl_Text_Buffer*>(text_buffer))->unselect();
  }
  FL_EXPORT_C(int,Fl_Text_Buffer_selection_position)(fl_Text_Buffer text_buffer,int* start,int* end){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->selection_position(start,end);
  }
  FL_EXPORT_C(void,Fl_Text_Buffer_set_secondary_unselect)(fl_Text_Buffer text_buffer){
    (static_cast<Fl_Text_Buffer*>(text_buffer))->secondary_unselect();
  }
  FL_EXPORT_C(char*,Fl_Text_Buffer_selection_text)(fl_Text_Buffer text_buffer){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->selection_text();
  }
  FL_EXPORT_C(void,Fl_Text_Buffer_replace_selection)(fl_Text_Buffer text_buffer,const char* text){
    (static_cast<Fl_Text_Buffer*>(text_buffer))->replace_selection(text);
  }
  FL_EXPORT_C(void,Fl_Text_Buffer_secondary_select)(fl_Text_Buffer text_buffer,int start,int end){
    (static_cast<Fl_Text_Buffer*>(text_buffer))->secondary_select(start,end);
  }
  FL_EXPORT_C(void,Fl_Text_Buffer_replace_secondary_selection)(fl_Text_Buffer text_buffer,const char* text){
    (static_cast<Fl_Text_Buffer*>(text_buffer))->replace_secondary_selection(text);
  }
  FL_EXPORT_C(int,Fl_Text_Buffer_secondary_selected)(fl_Text_Buffer text_buffer){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->secondary_selected();
  }
  FL_EXPORT_C(int,Fl_Text_Buffer_secondary_selection_position)(fl_Text_Buffer text_buffer,int* start,int* end){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->secondary_selection_position(start,end);
  }
  FL_EXPORT_C(char*,Fl_Text_Buffer_secondary_selection_text)(fl_Text_Buffer text_buffer){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->secondary_selection_text();
  }
  FL_EXPORT_C(int,Fl_Text_Buffer_highlight_position)(fl_Text_Buffer text_buffer,int* start,int* end){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->highlight_position(start,end);
  }
  FL_EXPORT_C(void,Fl_Text_Buffer_remove_secondary_selection)(fl_Text_Buffer text_buffer){
    (static_cast<Fl_Text_Buffer*>(text_buffer))->remove_secondary_selection();
  }
  FL_EXPORT_C(void,Fl_Text_Buffer_add_modify_callback)(fl_Text_Buffer text_buffer,Fl_Text_Modify_Cb bufModifiedCB,void* cbArg){
    (static_cast<Fl_Text_Buffer*>(text_buffer))->add_modify_callback(bufModifiedCB,cbArg);
  }
  FL_EXPORT_C(void,Fl_Text_Buffer_set_highlight)(fl_Text_Buffer text_buffer,int start,int end){
    (static_cast<Fl_Text_Buffer*>(text_buffer))->highlight(start,end);
  }
  FL_EXPORT_C(int,Fl_Text_Buffer_highlight)(fl_Text_Buffer text_buffer){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->highlight();
  }
  FL_EXPORT_C(void,Fl_Text_Buffer_unhighlight)(fl_Text_Buffer text_buffer){
    (static_cast<Fl_Text_Buffer*>(text_buffer))->unhighlight();
  }
  FL_EXPORT_C(char*,Fl_Text_Buffer_highlight_text)(fl_Text_Buffer text_buffer){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->highlight_text();
  }
  FL_EXPORT_C(void,Fl_Text_Buffer_remove_modify_callback)(fl_Text_Buffer text_buffer,Fl_Text_Modify_Cb bufModifiedCB,void* cbArg){
    (static_cast<Fl_Text_Buffer*>(text_buffer))->remove_modify_callback(bufModifiedCB,cbArg);
  }
  FL_EXPORT_C(void,Fl_Text_Buffer_call_modify_callbacks)(fl_Text_Buffer text_buffer){
    (static_cast<Fl_Text_Buffer*>(text_buffer))->call_modify_callbacks();
  }
  FL_EXPORT_C(void,Fl_Text_Buffer_add_predelete_callback)(fl_Text_Buffer text_buffer,Fl_Text_Predelete_Cb bufPredelCB,void* cbArg){
    (static_cast<Fl_Text_Buffer*>(text_buffer))->add_predelete_callback(bufPredelCB,cbArg);
  }
  FL_EXPORT_C(void,Fl_Text_Buffer_remove_predelete_callback)(fl_Text_Buffer text_buffer,Fl_Text_Predelete_Cb predelCB,void* cbArg){
    (static_cast<Fl_Text_Buffer*>(text_buffer))->remove_predelete_callback(predelCB,cbArg);
  }
  FL_EXPORT_C(void,Fl_Text_Buffer_call_predelete_callbacks)(fl_Text_Buffer text_buffer){
    (static_cast<Fl_Text_Buffer*>(text_buffer))->call_predelete_callbacks();
  }
  FL_EXPORT_C(char*,Fl_Text_Buffer_line_text)(fl_Text_Buffer text_buffer,int pos){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->line_text(pos);
  }
  FL_EXPORT_C(int,Fl_Text_Buffer_line_start)(fl_Text_Buffer text_buffer,int pos){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->line_start(pos);
  }
  FL_EXPORT_C(int,Fl_Text_Buffer_line_end)(fl_Text_Buffer text_buffer,int pos){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->line_end(pos);
  }
  FL_EXPORT_C(int,Fl_Text_Buffer_word_start)(fl_Text_Buffer text_buffer,int pos){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->word_start(pos);
  }
  FL_EXPORT_C(int,Fl_Text_Buffer_word_end)(fl_Text_Buffer text_buffer,int pos){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->word_end(pos);
  }
  FL_EXPORT_C(int,Fl_Text_Buffer_count_displayed_characters)(fl_Text_Buffer text_buffer,int lineStartPos,int targetPos){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->count_displayed_characters(lineStartPos,targetPos);
  }
  FL_EXPORT_C(int,Fl_Text_Buffer_skip_displayed_characters)(fl_Text_Buffer text_buffer,int lineStartPos,int nChars){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->skip_displayed_characters(lineStartPos,nChars);
  }
  FL_EXPORT_C(int,Fl_Text_Buffer_count_lines)(fl_Text_Buffer text_buffer,int startPos,int endPos){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->count_lines(startPos,endPos);
  }
  FL_EXPORT_C(int,Fl_Text_Buffer_skip_lines)(fl_Text_Buffer text_buffer,int startPos,int nLines){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->skip_lines(startPos,nLines);
  }
  FL_EXPORT_C(int,Fl_Text_Buffer_rewind_lines)(fl_Text_Buffer text_buffer,int startPos,int nLines){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->rewind_lines(startPos,nLines);
  }
  FL_EXPORT_C(int,Fl_Text_Buffer_findchar_forward)(fl_Text_Buffer text_buffer,int startPos,unsigned searchChar,int* foundPos){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->findchar_forward(startPos,searchChar,foundPos);
  }
  FL_EXPORT_C(int,Fl_Text_Buffer_findchar_backward)(fl_Text_Buffer text_buffer,int startPos,unsigned int searchChar,int* foundPos){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->findchar_backward(startPos,searchChar,foundPos);
  }
  FL_EXPORT_C(int,Fl_Text_Buffer_search_forward)(fl_Text_Buffer text_buffer,int startPos,const char* searchString,int* foundPos){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->search_forward(startPos,searchString,foundPos);
  }
  FL_EXPORT_C(int,Fl_Text_Buffer_search_forward_with_matchcase)(fl_Text_Buffer text_buffer,int startPos,const char* searchString,int* foundPos,int matchCase){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->search_forward(startPos,searchString,foundPos,matchCase);
  }
  FL_EXPORT_C(int,Fl_Text_Buffer_search_backward)(fl_Text_Buffer text_buffer,int startPos,const char* searchString,int* foundPos){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->search_backward(startPos,searchString,foundPos);
  }
  FL_EXPORT_C(int,Fl_Text_Buffer_search_backward_with_matchcase)(fl_Text_Buffer text_buffer,int startPos,const char* searchString,int* foundPos,int matchCase){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->search_backward(startPos,searchString,foundPos,matchCase);
  }
  FL_EXPORT_C(fl_Text_Selection,Fl_Text_Buffer_primary_selection)(fl_Text_Buffer text_buffer){
    return (fl_Text_Selection)(static_cast<Fl_Text_Buffer*>(text_buffer))->primary_selection();
  }
  FL_EXPORT_C(const fl_Text_Selection,Fl_Text_Buffer_secondary_selection)(fl_Text_Buffer text_buffer){
    return (fl_Text_Selection)(static_cast<Fl_Text_Buffer*>(text_buffer))->secondary_selection();
  }
  FL_EXPORT_C(int,Fl_Text_Buffer_next_char_clipped)(fl_Text_Buffer text_buffer,int ix){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->next_char_clipped(ix);
  }
  FL_EXPORT_C(const fl_Text_Selection,Fl_Text_Buffer_highlight_selection)(fl_Text_Buffer text_buffer){
    return (fl_Text_Selection)(static_cast<Fl_Text_Buffer*>(text_buffer))->highlight_selection();
  }
  FL_EXPORT_C(int,Fl_Text_Buffer_prev_char)(fl_Text_Buffer text_buffer,int ix){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->prev_char(ix);
  }
  FL_EXPORT_C(int,Fl_Text_Buffer_prev_char_clipped)(fl_Text_Buffer text_buffer,int ix){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->prev_char_clipped(ix);
  }
  FL_EXPORT_C(int,Fl_Text_Buffer_next_char)(fl_Text_Buffer text_buffer,int ix){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->next_char(ix);
  }
  FL_EXPORT_C(int,Fl_Text_Buffer_utf8_align)(fl_Text_Buffer text_buffer,int align){
    return (static_cast<Fl_Text_Buffer*>(text_buffer))->utf8_align(align);
  }
  FL_EXPORT_C(fl_Text_Buffer, Fl_Text_Buffer_New)(){
    Fl_Text_Buffer* b = new Fl_Text_Buffer();
    return (fl_Text_Buffer)b;
  }
  FL_EXPORT_C(fl_Text_Buffer, Fl_Text_Buffer_New_With_RequestedSize)(int requestedSize){
    Fl_Text_Buffer* b = new Fl_Text_Buffer(requestedSize);
    return (fl_Text_Buffer)b;
  }
  FL_EXPORT_C(fl_Text_Buffer, Fl_Text_Buffer_New_With_PreferredGapSize)(int preferredGapSize){
    Fl_Text_Buffer* b = new Fl_Text_Buffer(0,preferredGapSize);
    return (fl_Text_Buffer)b;
  }
  FL_EXPORT_C(fl_Text_Buffer, Fl_Text_Buffer_New_With_RequestedSize_PreferredGapSize)(int requestedSize, int preferredGapSize){
    Fl_Text_Buffer* b = new Fl_Text_Buffer(requestedSize,preferredGapSize);
    return (fl_Text_Buffer)b;
  }
  FL_EXPORT_C(void, Fl_Text_Buffer_Destroy)(fl_Text_Buffer text_buffer){
    delete(static_cast<Fl_Text_Buffer*>(text_buffer));
  }
#ifdef __cplusplus
}
#endif
