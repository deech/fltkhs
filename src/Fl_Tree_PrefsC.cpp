#include "Fl_Tree_PrefsC.h"

#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(fl_Tree_Prefs, Fl_Tree_Prefs_New)(){
    Fl_Tree_Prefs* prefs = new Fl_Tree_Prefs();
    return (fl_Tree_Prefs)prefs;
  }
  FL_EXPORT_C(void, Fl_Tree_Prefs_Destroy)(fl_Tree_Prefs tree_prefs){
    delete (static_cast<Fl_Tree_Prefs*>(tree_prefs));
  }
  FL_EXPORT_C(Fl_Font,Fl_Tree_Prefs_item_labelfont)(fl_Tree_Prefs tree_prefs){
    return (static_cast<Fl_Tree_Prefs*>(tree_prefs))->item_labelfont();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_item_labelfont)(fl_Tree_Prefs tree_prefs,Fl_Font val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->item_labelfont(val);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Tree_Prefs_item_labelsize)(fl_Tree_Prefs tree_prefs){
    return (static_cast<Fl_Tree_Prefs*>(tree_prefs))->item_labelsize();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_item_labelsize)(fl_Tree_Prefs tree_prefs,Fl_Fontsize val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->item_labelsize(val);
  }
  FL_EXPORT_C(Fl_Color,Fl_Tree_Prefs_item_labelfgcolor)(fl_Tree_Prefs tree_prefs){
    return (static_cast<Fl_Tree_Prefs*>(tree_prefs))->item_labelfgcolor();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_item_labelfgcolor)(fl_Tree_Prefs tree_prefs,Fl_Color val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->item_labelfgcolor(val);
  }
  FL_EXPORT_C(Fl_Color,Fl_Tree_Prefs_item_labelbgcolor)(fl_Tree_Prefs tree_prefs){
    return (static_cast<Fl_Tree_Prefs*>(tree_prefs))->item_labelbgcolor();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_item_labelbgcolor)(fl_Tree_Prefs tree_prefs,Fl_Color val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->item_labelbgcolor(val);
  }
  FL_EXPORT_C(Fl_Font,Fl_Tree_Prefs_labelfont)(fl_Tree_Prefs tree_prefs){
    return (static_cast<Fl_Tree_Prefs*>(tree_prefs))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_labelfont)(fl_Tree_Prefs tree_prefs,Fl_Font val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->labelfont(val);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Tree_Prefs_labelsize)(fl_Tree_Prefs tree_prefs){
    return (static_cast<Fl_Tree_Prefs*>(tree_prefs))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_labelsize)(fl_Tree_Prefs tree_prefs,Fl_Fontsize val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->labelsize(val);
  }
  FL_EXPORT_C(Fl_Color,Fl_Tree_Prefs_labelfgcolor)(fl_Tree_Prefs tree_prefs){
    return (static_cast<Fl_Tree_Prefs*>(tree_prefs))->labelfgcolor();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_labelfgcolor)(fl_Tree_Prefs tree_prefs,Fl_Color val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->labelfgcolor(val);
  }
  FL_EXPORT_C(Fl_Color,Fl_Tree_Prefs_labelbgcolor)(fl_Tree_Prefs tree_prefs){
    return (static_cast<Fl_Tree_Prefs*>(tree_prefs))->labelbgcolor();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_labelbgcolor)(fl_Tree_Prefs tree_prefs,Fl_Color val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->labelbgcolor(val);
  }
  FL_EXPORT_C(int,Fl_Tree_Prefs_marginleft)(fl_Tree_Prefs tree_prefs){
    return (static_cast<Fl_Tree_Prefs*>(tree_prefs))->marginleft();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_marginleft)(fl_Tree_Prefs tree_prefs,int val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->marginleft(val);
  }
  FL_EXPORT_C(int,Fl_Tree_Prefs_margintop)(fl_Tree_Prefs tree_prefs){
    return (static_cast<Fl_Tree_Prefs*>(tree_prefs))->margintop();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_margintop)(fl_Tree_Prefs tree_prefs,int val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->margintop(val);
  }
#if FLTK_ABI_VERSION >= 10302
  FL_EXPORT_C(int,Fl_Tree_Prefs_marginbottom)(fl_Tree_Prefs tree_prefs){
    return (static_cast<Fl_Tree_Prefs*>(tree_prefs))->marginbottom();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_marginbottom)(fl_Tree_Prefs tree_prefs,int val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->marginbottom(val);
  }
#endif /*FLTK_ABI_VERSION*/
  FL_EXPORT_C(int,Fl_Tree_Prefs_openchild_marginbottom)(fl_Tree_Prefs tree_prefs){
    return (static_cast<Fl_Tree_Prefs*>(tree_prefs))->openchild_marginbottom();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_openchild_marginbottom)(fl_Tree_Prefs tree_prefs,int val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->openchild_marginbottom(val);
  }
  FL_EXPORT_C(int,Fl_Tree_Prefs_usericonmarginleft)(fl_Tree_Prefs tree_prefs){
    return (static_cast<Fl_Tree_Prefs*>(tree_prefs))->usericonmarginleft();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_usericonmarginleft)(fl_Tree_Prefs tree_prefs,int val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->usericonmarginleft(val);
  }
  FL_EXPORT_C(int,Fl_Tree_Prefs_labelmarginleft)(fl_Tree_Prefs tree_prefs){
    return (static_cast<Fl_Tree_Prefs*>(tree_prefs))->labelmarginleft();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_labelmarginleft)(fl_Tree_Prefs tree_prefs,int val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->labelmarginleft(val);
  }
#if FLTK_ABI_VERSION >= 10302
  FL_EXPORT_C(int,Fl_Tree_Prefs_widgetmarginleft)(fl_Tree_Prefs tree_prefs){
    return (static_cast<Fl_Tree_Prefs*>(tree_prefs))->widgetmarginleft();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_widgetmarginleft)(fl_Tree_Prefs tree_prefs,int val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->widgetmarginleft(val);
  }
#endif
  FL_EXPORT_C(int,Fl_Tree_Prefs_linespacing)(fl_Tree_Prefs tree_prefs){
    return (static_cast<Fl_Tree_Prefs*>(tree_prefs))->linespacing();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_linespacing)(fl_Tree_Prefs tree_prefs,int val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->linespacing(val);
  }
  FL_EXPORT_C(Fl_Color,Fl_Tree_Prefs_connectorcolor)(fl_Tree_Prefs tree_prefs){
    return (static_cast<Fl_Tree_Prefs*>(tree_prefs))->connectorcolor();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_connectorcolor)(fl_Tree_Prefs tree_prefs,Fl_Color val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->connectorcolor(val);
  }
  FL_EXPORT_C(Fl_Tree_Connector,Fl_Tree_Prefs_connectorstyle)(fl_Tree_Prefs tree_prefs){
    return (static_cast<Fl_Tree_Prefs*>(tree_prefs))->connectorstyle();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_connectorstyle_with_tree_connector)(fl_Tree_Prefs tree_prefs,Fl_Tree_Connector val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->connectorstyle(val);
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_connectorstyle_with_val)(fl_Tree_Prefs tree_prefs,int val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->connectorstyle(val);
  }
  FL_EXPORT_C(int,Fl_Tree_Prefs_connectorwidth)(fl_Tree_Prefs tree_prefs){
    return (static_cast<Fl_Tree_Prefs*>(tree_prefs))->connectorwidth();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_connectorwidth)(fl_Tree_Prefs tree_prefs,int val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->connectorwidth(val);
  }
  FL_EXPORT_C(fl_Image,Fl_Tree_Prefs_openicon)(fl_Tree_Prefs tree_prefs){
    return (fl_Image)(static_cast<Fl_Tree_Prefs*>(tree_prefs))->openicon();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_openicon)(fl_Tree_Prefs tree_prefs,fl_Image val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->openicon((static_cast<Fl_Image*>(val)));
  }
  FL_EXPORT_C(fl_Image,Fl_Tree_Prefs_closeicon)(fl_Tree_Prefs tree_prefs){
    return (fl_Image)(static_cast<Fl_Tree_Prefs*>(tree_prefs))->closeicon();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_closeicon)(fl_Tree_Prefs tree_prefs,fl_Image val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->closeicon((static_cast<Fl_Image*>(val)));
  }
  FL_EXPORT_C(fl_Image,Fl_Tree_Prefs_usericon)(fl_Tree_Prefs tree_prefs){
    return (fl_Image)(static_cast<Fl_Tree_Prefs*>(tree_prefs))->usericon();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_usericon)(fl_Tree_Prefs tree_prefs,fl_Image val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->usericon((static_cast<Fl_Image*>(val)));
  }
  FL_EXPORT_C(char,Fl_Tree_Prefs_showcollapse)(fl_Tree_Prefs tree_prefs){
    return (static_cast<Fl_Tree_Prefs*>(tree_prefs))->showcollapse();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_showcollapse)(fl_Tree_Prefs tree_prefs,int val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->showcollapse(val);
  }
  FL_EXPORT_C(Fl_Tree_Sort,Fl_Tree_Prefs_sortorder)(fl_Tree_Prefs tree_prefs){
    return (static_cast<Fl_Tree_Prefs*>(tree_prefs))->sortorder();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_sortorder)(fl_Tree_Prefs tree_prefs,Fl_Tree_Sort val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->sortorder(val);
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Tree_Prefs_selectbox)(fl_Tree_Prefs tree_prefs){
    return (static_cast<Fl_Tree_Prefs*>(tree_prefs))->selectbox();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_selectbox)(fl_Tree_Prefs tree_prefs,Fl_Boxtype val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->selectbox(val);
  }
  FL_EXPORT_C(int,Fl_Tree_Prefs_showroot)(fl_Tree_Prefs tree_prefs){
    return (static_cast<Fl_Tree_Prefs*>(tree_prefs))->showroot();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_showroot)(fl_Tree_Prefs tree_prefs,int val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->showroot(val);
  }
  FL_EXPORT_C(Fl_Tree_Select,Fl_Tree_Prefs_selectmode)(fl_Tree_Prefs tree_prefs){
    return (static_cast<Fl_Tree_Prefs*>(tree_prefs))->selectmode();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_selectmode)(fl_Tree_Prefs tree_prefs,Fl_Tree_Select val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->selectmode(val);
  }
#if FLTK_ABI_VERSION >= 10302
  FL_EXPORT_C(Fl_Tree_Item_Reselect_Mode,Fl_Tree_Prefs_item_reselect_mode)(fl_Tree_Prefs tree_prefs){
    return (static_cast<Fl_Tree_Prefs*>(tree_prefs))->item_reselect_mode();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_item_reselect_mode)(fl_Tree_Prefs tree_prefs,Fl_Tree_Item_Reselect_Mode mode){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->item_reselect_mode(mode);
  }
  FL_EXPORT_C(Fl_Tree_Item_Draw_Mode,Fl_Tree_Prefs_item_draw_mode)(fl_Tree_Prefs tree_prefs){
    return (static_cast<Fl_Tree_Prefs*>(tree_prefs))->item_draw_mode();
  }
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_item_draw_mode)(fl_Tree_Prefs tree_prefs,Fl_Tree_Item_Draw_Mode val){
    (static_cast<Fl_Tree_Prefs*>(tree_prefs))->item_draw_mode(val);
  }
#endif
#ifdef __cplusplus
}
#endif
