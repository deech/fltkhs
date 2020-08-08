#include "Fl_Multi_LabelC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(const char*,Fl_Multi_Label_labela)(fl_Multi_Label label){
    return (static_cast<Fl_Multi_Label*>(label))->labela;
  };
  FL_EXPORT_C(void,Fl_Multi_Label_set_labela)(fl_Multi_Label label, const char* text){
    (static_cast<Fl_Multi_Label*>(label))->labela = text;
  };
  FL_EXPORT_C(const char*,Fl_Multi_Label_labelb)(fl_Multi_Label label){
    return (static_cast<Fl_Multi_Label*>(label))->labelb;
  };
  FL_EXPORT_C(void,Fl_Multi_Label_set_labelb)(fl_Multi_Label label, const char* text){
    (static_cast<Fl_Multi_Label*>(label))->labelb = text;
  };
  FL_EXPORT_C(uchar,Fl_Multi_Label_typea)(fl_Multi_Label label){
    return (static_cast<Fl_Multi_Label*>(label))->typea;
  };
  FL_EXPORT_C(void,Fl_Multi_Label_set_typea)(fl_Multi_Label label, uchar typea){
    (static_cast<Fl_Multi_Label*>(label))->typea = typea;
  };
  FL_EXPORT_C(uchar,Fl_Multi_Label_typeb)(fl_Multi_Label label){
    return (static_cast<Fl_Multi_Label*>(label))->typeb;
  };
  FL_EXPORT_C(void,Fl_Multi_Label_set_typeb)(fl_Multi_Label label, uchar typeb){
    (static_cast<Fl_Multi_Label*>(label))->typeb = typeb;
  };
  FL_EXPORT_C(fl_Multi_Label,Fl_Multi_Label_New)(const char* labela, const char* labelb, uchar typea, uchar typeb){
    Fl_Multi_Label *l = new Fl_Multi_Label();
    l->labela = labela;
    l->labelb = labelb;
    l->typea = typea;
    l->typeb = typeb;
    return (fl_Multi_Label)l;
  };
  FL_EXPORT_C(void, Fl_Multi_Label_label_widget)(fl_Multi_Label l, fl_Widget w){
    (static_cast<Fl_Multi_Label*>(l))->label((static_cast<Fl_Widget*>(w)));
  };
  FL_EXPORT_C(void, Fl_Multi_Label_label_menu_item)(fl_Multi_Label l, fl_Menu_Item i){
    (static_cast<Fl_Multi_Label*>(l))->label((static_cast<Fl_Menu_Item*>(i)));
  };
#ifdef __cplusplus
}
#endif
