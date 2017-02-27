(define-skeleton widget-subclass
  ""
  nil
  '(setq v1 (skeleton-read "class:"))
  > "class Fl_Derived" v1 " : public Fl_" v1 " {"
  ?\n
  > "  fl_Widget_Virtual_Funcs* overriddenFuncs;"
  ?\n
  > "  void* other_data;"
  ?\n
  > "public:"
  ?\n
  > "  virtual void draw();"
  ?\n
  > "  void draw_super();"
  ?\n
  > "  virtual int handle(int event);"
  ?\n
  > "  int handle_super(int event);"
  ?\n
  > "  virtual void resize(int x, int y, int w, int h);"
  ?\n
  > "  void resize_super(int x, int y, int w, int h);"
  ?\n
  > "  virtual void show();"
  ?\n
  > "  void show_super();"
  ?\n
  > "  virtual void hide();"
  ?\n
  > "  void hide_super();"
  ?\n
  > "  Fl_Derived" v1 "(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);"
  ?\n
  > "  Fl_Derived" v1 "(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);"
  ?\n
  > "  ~Fl_Derived" v1 "();"
  ?\n
  > "};"
  ?\n
  )

(define-skeleton widget-methods
  ""
  nil
  '(setq v1 (skeleton-read "class:"))
  > "Fl_Derived" v1 "::Fl_Derived" v1 "(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_" v1 "(X,Y,W,H,l){" ?\n
  > "    overriddenFuncs = funcs;" ?\n
  > "    other_data = (void*)0;" ?\n
  > "}" ?\n
  > "Fl_Derived" v1 "::Fl_Derived" v1 "(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_" v1 "(X,Y,W,H){" ?\n
  > "    overriddenFuncs = funcs;" ?\n
  > "    other_data = (void*)0;" ?\n
  > "}" ?\n
  > "Fl_Derived" v1 "::~Fl_Derived" v1 "(){" ?\n
  > "  free(overriddenFuncs);" ?\n
  > "}" ?\n
  > "void Fl_Derived" v1 "::draw(){" ?\n
  > "  if (this->overriddenFuncs->draw != NULL) {" ?\n
  > "    this->overriddenFuncs->draw((fl_" v1 ") this);" ?\n
  > "  }" ?\n
  > "  else {" ?\n
  > "    Fl_" v1 "::draw();" ?\n
  > "  }" ?\n
  > "}" ?\n
  > "" ?\n
  > "void Fl_Derived" v1 "::draw_super(){" ?\n
  > "  Fl_" v1 "::draw();" ?\n
  > "}" ?\n
  > "" ?\n
  > "int Fl_Derived" v1 "::handle(int event){" ?\n
  > "  int i;" ?\n
  > "  if (this->overriddenFuncs->handle != NULL) {" ?\n
  > "    i = this->overriddenFuncs->handle((fl_" v1 ") this,event);" ?\n
  > "  }" ?\n
  > "  else {" ?\n
  > "    i = Fl_" v1 "::handle(event);" ?\n
  > "  }" ?\n
  > "  return i;" ?\n
  > "}" ?\n
  > "int Fl_Derived" v1 "::handle_super(int event){" ?\n
  > "  return Fl_" v1 "::handle(event);" ?\n
  > "}" ?\n
  > "" ?\n
  > "void Fl_Derived" v1 "::resize(int x, int y, int w, int h){" ?\n
  > "  if (this->overriddenFuncs->resize != NULL) {" ?\n
  > "    this->overriddenFuncs->resize((fl_" v1 ") this,x,y,w,h);" ?\n
  > "  }" ?\n
  > "  else {" ?\n
  > "    Fl_" v1 "::resize(x,y,w,h);" ?\n
  > "  }" ?\n
  > "}" ?\n
  > "" ?\n
  > "void Fl_Derived" v1 "::resize_super(int x, int y, int w, int h){" ?\n
  > "  Fl_" v1 "::resize(x,y,w,h);" ?\n
  > "}" ?\n
  > "void Fl_Derived" v1 "::show(){" ?\n
  > "  if (this->overriddenFuncs->show != NULL) {" ?\n
  > "    this->overriddenFuncs->show((fl_" v1 ") this);" ?\n
  > "  }" ?\n
  > "  else {" ?\n
  > "    Fl_" v1 "::show();" ?\n
  > "  }" ?\n
  > "}" ?\n
  > "void Fl_Derived" v1 "::show_super(){" ?\n
  > "  Fl_" v1 "::show();" ?\n
  > "}" ?\n
  > "" ?\n
  > "void Fl_Derived" v1 "::hide(){" ?\n
  > "  if (this->overriddenFuncs->hide != NULL) {" ?\n
  > "    this->overriddenFuncs->hide((fl_" v1 ") this);" ?\n
  > "  }" ?\n
  > "  else {" ?\n
  > "    Fl_" v1 "::hide();" ?\n
  > "  }" ?\n
  > "}" ?\n
  > "void Fl_Derived" v1 "::hide_super(){" ?\n
  > "  Fl_" v1 "::hide();" ?\n
  > "}" ?\n
  > "" ?\n
  )

(define-skeleton group-subclass
  ""
  nil
  '(setq v1 (skeleton-read "class:"))
  > "class Fl_Derived" v1 " : public Fl_" v1 " {"
  ?\n
  > "  fl_Widget_Virtual_Funcs* overriddenFuncs;"
  ?\n
  > "  void* other_data;"
  ?\n
  > "public:"
  ?\n
  > "  virtual void draw();"
  ?\n
  > "  void draw_super();"
  ?\n
  > "  virtual int handle(int event);"
  ?\n
  > "  int handle_super(int event);"
  ?\n
  > "  virtual void resize(int x, int y, int w, int h);"
  ?\n
  > "  void resize_super(int x, int y, int w, int h);"
  ?\n
  > "  virtual void show();"
  ?\n
  > "  void show_super();"
  ?\n
  > "  virtual void hide();"
  ?\n
  > "  void hide_super();"
  ?\n
  > "  void draw_child(Fl_Widget* widget);"
  ?\n
  > "  void draw_children();"
  ?\n
  > "  void draw_outside_label(Fl_Widget* widget);"
  ?\n
  > "  void update_child(Fl_Widget* widget);"
  ?\n
  > "  Fl_Derived" v1 "(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);"
  ?\n
  > "  Fl_Derived" v1 "(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);"
  ?\n
  > "  ~Fl_Derived" v1 "();"
  ?\n
  > "};"
  ?\n
  )

(define-skeleton group-methods
  ""
  nil
  '(setq v1 (skeleton-read "class:"))
  > "Fl_Derived" v1 "::Fl_Derived" v1 "(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_" v1 "(X,Y,W,H,l){" ?\n
  > "    overriddenFuncs = funcs;" ?\n
  > "    other_data = (void*)0;" ?\n
  > "}" ?\n
  > "Fl_Derived" v1 "::Fl_Derived" v1 "(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_" v1 "(X,Y,W,H){" ?\n
  > "    overriddenFuncs = funcs;" ?\n
  > "    other_data = (void*)0;" ?\n
  > "}" ?\n
  > "Fl_Derived" v1 "::~Fl_Derived" v1 "(){" ?\n
  > "  free(overriddenFuncs);" ?\n
  > "}" ?\n
  > "void Fl_Derived" v1 "::draw(){" ?\n
  > "  if (this->overriddenFuncs->draw != NULL) {" ?\n
  > "    this->overriddenFuncs->draw((fl_" v1 ") this);" ?\n
  > "  }" ?\n
  > "  else {" ?\n
  > "    Fl_" v1 "::draw();" ?\n
  > "  }" ?\n
  > "}" ?\n
  > "" ?\n
  > "void Fl_Derived" v1 "::draw_super(){" ?\n
  > "  Fl_" v1 "::draw();" ?\n
  > "}" ?\n
  > "" ?\n
  > "int Fl_Derived" v1 "::handle(int event){" ?\n
  > "  int i;" ?\n
  > "  if (this->overriddenFuncs->handle != NULL) {" ?\n
  > "    i = this->overriddenFuncs->handle((fl_" v1 ") this,event);" ?\n
  > "  }" ?\n
  > "  else {" ?\n
  > "    i = Fl_" v1 "::handle(event);" ?\n
  > "  }" ?\n
  > "  return i;" ?\n
  > "}" ?\n
  > "int Fl_Derived" v1 "::handle_super(int event){" ?\n
  > "  return Fl_" v1 "::handle(event);" ?\n
  > "}" ?\n
  > "" ?\n
  > "void Fl_Derived" v1 "::resize(int x, int y, int w, int h){" ?\n
  > "  if (this->overriddenFuncs->resize != NULL) {" ?\n
  > "    this->overriddenFuncs->resize((fl_" v1 ") this,x,y,w,h);" ?\n
  > "  }" ?\n
  > "  else {" ?\n
  > "    Fl_" v1 "::resize(x,y,w,h);" ?\n
  > "  }" ?\n
  > "}" ?\n
  > "" ?\n
  > "void Fl_Derived" v1 "::resize_super(int x, int y, int w, int h){" ?\n
  > "  Fl_" v1 "::resize(x,y,w,h);" ?\n
  > "}" ?\n
  > "void Fl_Derived" v1 "::show(){" ?\n
  > "  if (this->overriddenFuncs->show != NULL) {" ?\n
  > "    this->overriddenFuncs->show((fl_" v1 ") this);" ?\n
  > "  }" ?\n
  > "  else {" ?\n
  > "    Fl_" v1 "::show();" ?\n
  > "  }" ?\n
  > "}" ?\n
  > "void Fl_Derived" v1 "::show_super(){" ?\n
  > "  Fl_" v1 "::show();" ?\n
  > "}" ?\n
  > "" ?\n
  > "void Fl_Derived" v1 "::hide(){" ?\n
  > "  if (this->overriddenFuncs->hide != NULL) {" ?\n
  > "    this->overriddenFuncs->hide((fl_" v1 ") this);" ?\n
  > "  }" ?\n
  > "  else {" ?\n
  > "    Fl_" v1 "::hide();" ?\n
  > "  }" ?\n
  > "}" ?\n
  > "void Fl_Derived" v1 "::hide_super(){" ?\n
  > "  Fl_" v1 "::hide();" ?\n
  > "}" ?\n
  > "" ?\n
  > "void Fl_Derived" v1 "::draw_child(Fl_Widget* widget){" ?\n
  > "  Fl_" v1 "::draw_child(*widget);" ?\n
  > "}" ?\n
  > "void Fl_Derived" v1 "::draw_children(){" ?\n
  > "  Fl_" v1 "::draw_children();" ?\n
  > "}" ?\n
  > "void Fl_Derived" v1 "::draw_outside_label(Fl_Widget* widget){" ?\n
  > "  Fl_" v1 "::draw_outside_label(*widget);" ?\n
  > "}" ?\n
  > "void Fl_Derived" v1 "::update_child(Fl_Widget* widget){" ?\n
  > "  Fl_" v1 "::update_child(*widget);" ?\n
  > "}" ?\n
  )

(define-skeleton new-subclass
  ""
  nil
  '(setq v1  (skeleton-read "class:"))
  > "  FL_EXPORT_C(fl_" v1 ",    Fl_" v1 "_New)(int X, int Y, int W, int H){" ?\n
  > "    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();" ?\n
  > "    Fl_Derived" v1 "* w = new Fl_Derived" v1 "(X,Y,W,H,fs);" ?\n
  > "    return (fl_" v1 ")w;" ?\n
  > "  }" ?\n
  > "  FL_EXPORT_C(fl_" v1 ",    Fl_" v1 "_New_WithLabel)(int X, int Y, int W, int H, const char* label){" ?\n
  > "    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();" ?\n
  > "    Fl_Derived" v1 "* w = new Fl_Derived" v1 "(X,Y,W,H,label,fs);" ?\n
  > "    return (fl_" v1 ")w;" ?\n
  > "  }" ?\n
  > "  FL_EXPORT_C(fl_" v1 ",    Fl_Overridden" v1 "_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){" ?\n
  > "    Fl_Derived" v1 "* w = new Fl_Derived" v1 "(X,Y,W,H,fs);" ?\n
  > "    return (fl_" v1 ")w;" ?\n
  > "  }" ?\n
  > "  FL_EXPORT_C(fl_" v1 ",    Fl_Overridden" v1 "_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){" ?\n
  > "    Fl_Derived" v1 "* w = new Fl_Derived" v1 "(X,Y,W,H,label,fs);" ?\n
  > "    return (fl_" v1 ")w;" ?\n
  > "  }" ?\n
  )

(define-skeleton widget-methods-c
  ""
  nil
  '(setq v1 (skeleton-read "class:"))
  > (format "FL_EXPORT_C(void, Fl_%s_draw)(fl_%s w){
               (static_cast<Fl_Derived%s*>(w))->draw();
             }" v1 v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_draw_super)(fl_%s w){
               (static_cast<Fl_%s*>(w))->draw();
             }" v1 v1 v1)
  ?\n
  > (format "FL_EXPORT_C(int, Fl_%s_handle)(fl_%s w, int event){
               return (static_cast<Fl_Derived%s*>(w))->handle(event);
             }" v1 v1 v1)
  ?\n
  > (format "FL_EXPORT_C(int, Fl_%s_handle_super)(fl_%s w, int event){
               return (static_cast<Fl_%s*>(w))->handle(event);
             }" v1 v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_resize)(fl_%s w, int x, int y, int w, int h){
               (static_cast<Fl_Derived%s*>(w))->resize(x,y,w,h);
             }" v1 v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_resize_super)(fl_%s w, int x, int y, int w, int h){
               (static_cast<Fl_%s*>(w))->resize(x,y,w,h);
             }" v1 v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_show)(fl_%s w){
               (static_cast<Fl_Derived%s*>(w))->show();
             }" v1 v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_show_super)(fl_%s w){
               (static_cast<Fl_%s*>(w))->show();
             }" v1 v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_hide)(fl_%s w){
               (static_cast<Fl_Derived%s*>(w))->hide();
             }" v1 v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_hide_super)(fl_%s w){
               (static_cast<Fl_%s*>(w))->hide();
             }" v1 v1 v1)
  ?\n
  )

(define-skeleton widget-methods-c-sigs
  ""
  nil
  '(setq v1 (skeleton-read "class:"))
  > (format "FL_EXPORT_C(void, Fl_%s_draw)(fl_%s w);" v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_draw_super)(fl_%s w);" v1 v1)
  ?\n
  > (format "FL_EXPORT_C(int, Fl_%s_handle)(fl_%s w, int event);" v1 v1)
  ?\n
  > (format "FL_EXPORT_C(int, Fl_%s_handle_super)(fl_%s w, int event);" v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_resize)(fl_%s w, int x, int y, int w, int h);" v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_resize_super)(fl_%s w, int x, int y, int w, int h);" v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_show)(fl_%s w);" v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_show_super)(fl_%s w);" v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_hide)(fl_%s w);" v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_hide_super)(fl_%s w);" v1 v1)
  ?\n
  )
