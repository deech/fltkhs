#ifndef __FL_TEXT_BUFFER_C__
#define __FL_TEXT_BUFFER_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Text_Buffer.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  FL_EXPORT_C(fl_Text_Buffer, Fl_Text_Buffer_New)();
  FL_EXPORT_C(fl_Text_Buffer, Fl_Text_Buffer_New_With_RequestedSize)(int requestedSize);
  FL_EXPORT_C(fl_Text_Buffer, Fl_Text_Buffer_New_With_PreferredGapSize)(int preferredGapSize);
  FL_EXPORT_C(fl_Text_Buffer, Fl_Text_Buffer_New_With_RequestedSize_PreferredGapSize)(int requestedSize, int preferredGapSize);
  FL_EXPORT_C(void, Fl_Text_Buffer_Destroy)(fl_Text_Buffer text_buffer);
#ifndef INTERNAL_LINKAGE
  typedef void (*Fl_Text_Modify_Cb)(int pos, int nInserted, int nDeleted,
                                  int nRestyled, const char* deletedText,
                                  void* cbArg);
  typedef void (*Fl_Text_Predelete_Cb)(int pos, int nDeleted, void* cbArg);
#endif
  FL_EXPORT_C(int, Fl_Text_Buffer_input_file_was_transcoded)(fl_Text_Buffer text_buffer);
  FL_EXPORT_C(const char*, Fl_Text_Buffer_file_encoding_warning_message)(fl_Text_Buffer text_buffer);
  FL_EXPORT_C(void, Fl_Text_Buffer_set_transcoding_warning_action)(fl_Text_Buffer text_buffer,fl_Text_Buffer_Callback cb);
  /* int input_file_was_transcoded; */
  /* const char* file_encoding_warning_message; */
  /* void (*transcoding_warning_action)(Fl_Text_Buffer*); */
  FL_EXPORT_C(int, Fl_Text_Buffer_length)(fl_Text_Buffer text_buffer);
  FL_EXPORT_C(char*, Fl_Text_Buffer_text)(fl_Text_Buffer text_buffer);
  FL_EXPORT_C(void, Fl_Text_Buffer_set_text)(fl_Text_Buffer text_buffer,const char* text);
  FL_EXPORT_C(char*, Fl_Text_Buffer_text_range)(fl_Text_Buffer text_buffer,int start, int end);
  FL_EXPORT_C(unsigned int, Fl_Text_Buffer_char_at)(fl_Text_Buffer text_buffer,int pos);
  FL_EXPORT_C(char, Fl_Text_Buffer_byte_at)(fl_Text_Buffer text_buffer,int pos);
  FL_EXPORT_C(char*, Fl_Text_Buffer_address)(fl_Text_Buffer text_buffer,int pos);
  FL_EXPORT_C(void, Fl_Text_Buffer_insert)(fl_Text_Buffer text_buffer,int pos, const char* text);
  FL_EXPORT_C(void, Fl_Text_Buffer_append)(fl_Text_Buffer text_buffer,const char* t);
  FL_EXPORT_C(void, Fl_Text_Buffer_remove)(fl_Text_Buffer text_buffer,int start, int end);
  FL_EXPORT_C(void, Fl_Text_Buffer_replace)(fl_Text_Buffer text_buffer,int start, int end, const char* text);
  FL_EXPORT_C(void, Fl_Text_Buffer_copy)(fl_Text_Buffer text_buffer,fl_Text_Buffer fromBuf, int fromStart, int fromEnd, int toPos);
  FL_EXPORT_C(int, Fl_Text_Buffer_undo)(fl_Text_Buffer text_buffer);
  FL_EXPORT_C(int, Fl_Text_Buffer_undo_with_cp)(fl_Text_Buffer text_buffer,int *cp);
  FL_EXPORT_C(void, Fl_Text_Buffer_canUndo)(fl_Text_Buffer text_buffer);
  FL_EXPORT_C(void, Fl_Text_Buffer_canUndo_with_flag)(fl_Text_Buffer text_buffer,char flag);
  FL_EXPORT_C(int, Fl_Text_Buffer_insertfile)(fl_Text_Buffer text_buffer,const char* file, int pos);
  FL_EXPORT_C(int, Fl_Text_Buffer_insertfile_with_buflen)(fl_Text_Buffer text_buffer,const char* file, int pos, int buflen);
  FL_EXPORT_C(int, Fl_Text_Buffer_appendfile)(fl_Text_Buffer text_buffer,const char* file);
  FL_EXPORT_C(int, Fl_Text_Buffer_appendfile_with_buflen)(fl_Text_Buffer text_buffer,const char* file, int buflen);
  FL_EXPORT_C(int, Fl_Text_Buffer_loadfile)(fl_Text_Buffer text_buffer,const char* file);
  FL_EXPORT_C(int, Fl_Text_Buffer_loadfile_with_buflen)(fl_Text_Buffer text_buffer,const char* file, int buflen);
  FL_EXPORT_C(int, Fl_Text_Buffer_outputfile)(fl_Text_Buffer text_buffer,const char* file, int start, int end);
  FL_EXPORT_C(int, Fl_Text_Buffer_outputfile_with_buflen)(fl_Text_Buffer text_buffer,const char* file, int start, int end, int buflen);
  FL_EXPORT_C(int, Fl_Text_Buffer_savefile)(fl_Text_Buffer text_buffer,const char* file);
  FL_EXPORT_C(int, Fl_Text_Buffer_savefile_with_buflen)(fl_Text_Buffer text_buffer,const char* file, int buflen);
  FL_EXPORT_C(int, Fl_Text_Buffer_tab_distance)(fl_Text_Buffer text_buffer);
  FL_EXPORT_C(void, Fl_Text_Buffer_set_tab_distance)(fl_Text_Buffer text_buffer,int tabDist);
  FL_EXPORT_C(void, Fl_Text_Buffer_select)(fl_Text_Buffer text_buffer,int start, int end);
  FL_EXPORT_C(int, Fl_Text_Buffer_selected)(fl_Text_Buffer text_buffer);
  FL_EXPORT_C(void, Fl_Text_Buffer_unselect)(fl_Text_Buffer text_buffer);
  FL_EXPORT_C(int, Fl_Text_Buffer_selection_position)(fl_Text_Buffer text_buffer,int* start, int* end);
  FL_EXPORT_C(char*, Fl_Text_Buffer_selection_text)(fl_Text_Buffer text_buffer);
  FL_EXPORT_C(void, Fl_Text_Buffer_remove_selection)(fl_Text_Buffer text_buffer);
  FL_EXPORT_C(void, Fl_Text_Buffer_replace_selection)(fl_Text_Buffer text_buffer,const char* text);
  FL_EXPORT_C(void, Fl_Text_Buffer_secondary_select)(fl_Text_Buffer text_buffer,int start, int end);
  FL_EXPORT_C(int, Fl_Text_Buffer_secondary_selected)(fl_Text_Buffer text_buffer);
  FL_EXPORT_C(void, Fl_Text_Buffer_set_secondary_unselect)(fl_Text_Buffer text_buffer);
  FL_EXPORT_C(int, Fl_Text_Buffer_secondary_selection_position)(fl_Text_Buffer text_buffer,int* start, int* end);
  FL_EXPORT_C(char*, Fl_Text_Buffer_secondary_selection_text)(fl_Text_Buffer text_buffer);
  FL_EXPORT_C(void, Fl_Text_Buffer_remove_secondary_selection)(fl_Text_Buffer text_buffer);
  FL_EXPORT_C(void, Fl_Text_Buffer_replace_secondary_selection)(fl_Text_Buffer text_buffer,const char* text);
  FL_EXPORT_C(void, Fl_Text_Buffer_set_highlight)(fl_Text_Buffer text_buffer,int start, int end);
  FL_EXPORT_C(int, Fl_Text_Buffer_highlight)(fl_Text_Buffer text_buffer);
  FL_EXPORT_C(void, Fl_Text_Buffer_unhighlight)(fl_Text_Buffer text_buffer);
  FL_EXPORT_C(int, Fl_Text_Buffer_highlight_position)(fl_Text_Buffer text_buffer,int* start, int* end);
  FL_EXPORT_C(char*, Fl_Text_Buffer_highlight_text)(fl_Text_Buffer text_buffer);
  FL_EXPORT_C(void, Fl_Text_Buffer_add_modify_callback)(fl_Text_Buffer text_buffer,Fl_Text_Modify_Cb bufModifiedCB, void* cbArg);
  FL_EXPORT_C(void, Fl_Text_Buffer_remove_modify_callback)(fl_Text_Buffer text_buffer,Fl_Text_Modify_Cb bufModifiedCB, void* cbArg);
  FL_EXPORT_C(void, Fl_Text_Buffer_call_modify_callbacks)(fl_Text_Buffer text_buffer);
  FL_EXPORT_C(void, Fl_Text_Buffer_add_predelete_callback)(fl_Text_Buffer text_buffer,Fl_Text_Predelete_Cb bufPredelCB, void* cbArg);
  FL_EXPORT_C(void, Fl_Text_Buffer_remove_predelete_callback)(fl_Text_Buffer text_buffer,Fl_Text_Predelete_Cb predelCB, void* cbArg);
  FL_EXPORT_C(void, Fl_Text_Buffer_call_predelete_callbacks)(fl_Text_Buffer text_buffer);
  FL_EXPORT_C(char*, Fl_Text_Buffer_line_text)(fl_Text_Buffer text_buffer,int pos);
  FL_EXPORT_C(int, Fl_Text_Buffer_line_start)(fl_Text_Buffer text_buffer,int pos);
  FL_EXPORT_C(int, Fl_Text_Buffer_line_end)(fl_Text_Buffer text_buffer,int pos);
  FL_EXPORT_C(int, Fl_Text_Buffer_word_start)(fl_Text_Buffer text_buffer,int pos);
  FL_EXPORT_C(int, Fl_Text_Buffer_word_end)(fl_Text_Buffer text_buffer,int pos);
  FL_EXPORT_C(int, Fl_Text_Buffer_count_displayed_characters)(fl_Text_Buffer text_buffer,int lineStartPos, int targetPos);
  FL_EXPORT_C(int, Fl_Text_Buffer_skip_displayed_characters)(fl_Text_Buffer text_buffer,int lineStartPos, int nChars);
  FL_EXPORT_C(int, Fl_Text_Buffer_count_lines)(fl_Text_Buffer text_buffer,int startPos, int endPos);
  FL_EXPORT_C(int, Fl_Text_Buffer_skip_lines)(fl_Text_Buffer text_buffer,int startPos, int nLines);
  FL_EXPORT_C(int, Fl_Text_Buffer_rewind_lines)(fl_Text_Buffer text_buffer,int startPos, int nLines);
  FL_EXPORT_C(int, Fl_Text_Buffer_findchar_forward)(fl_Text_Buffer text_buffer,int startPos, unsigned searchChar, int* foundPos);
  FL_EXPORT_C(int, Fl_Text_Buffer_findchar_backward)(fl_Text_Buffer text_buffer,int startPos, unsigned int searchChar, int* foundPos);
  FL_EXPORT_C(int, Fl_Text_Buffer_search_forward)(fl_Text_Buffer text_buffer,int startPos, const char* searchString, int* foundPos);
  FL_EXPORT_C(int, Fl_Text_Buffer_search_forward_with_matchcase)(fl_Text_Buffer text_buffer,int startPos, const char* searchString, int* foundPos, int matchCase );
  FL_EXPORT_C(int, Fl_Text_Buffer_search_backward)(fl_Text_Buffer text_buffer,int startPos, const char* searchString, int* foundPos);
  FL_EXPORT_C(int, Fl_Text_Buffer_search_backward_with_matchcase)(fl_Text_Buffer text_buffer,int startPos, const char* searchString, int* foundPos, int matchCase );
  FL_EXPORT_C(fl_Text_Selection, Fl_Text_Buffer_primary_selection)(fl_Text_Buffer text_buffer);
  FL_EXPORT_C(const fl_Text_Selection, Fl_Text_Buffer_secondary_selection)(fl_Text_Buffer text_buffer);
  FL_EXPORT_C(const fl_Text_Selection, Fl_Text_Buffer_highlight_selection)(fl_Text_Buffer text_buffer);
  FL_EXPORT_C(int, Fl_Text_Buffer_prev_char)(fl_Text_Buffer text_buffer,int ix);
  FL_EXPORT_C(int, Fl_Text_Buffer_prev_char_clipped)(fl_Text_Buffer text_buffer,int ix);
  FL_EXPORT_C(int, Fl_Text_Buffer_next_char)(fl_Text_Buffer text_buffer,int ix);
  FL_EXPORT_C(int, Fl_Text_Buffer_next_char_clipped)(fl_Text_Buffer text_buffer,int ix);
  FL_EXPORT_C(int, Fl_Text_Buffer_utf8_align)(fl_Text_Buffer text_buffer,int align);
#ifdef __cplusplus
}
#endif
#endif /*#ifndef __FL_TEXT_BUFFER_C__*/
