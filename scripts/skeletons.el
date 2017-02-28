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
  > (format "FL_EXPORT_C(void, Fl_%s_draw)(fl_%s o){
               (static_cast<Fl_Derived%s*>(o))->draw();
             }" v1 v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_draw_super)(fl_%s o){
               (static_cast<Fl_Derived%s*>(o))->draw_super();
             }" v1 v1 v1)
  ?\n
  > (format "FL_EXPORT_C(int, Fl_%s_handle)(fl_%s o, int event){
               return (static_cast<Fl_Derived%s*>(o))->handle(event);
             }" v1 v1 v1)
  ?\n
  > (format "FL_EXPORT_C(int, Fl_%s_handle_super)(fl_%s o, int event){
               return (static_cast<Fl_Derived%s*>(o))->handle_super(event);
             }" v1 v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_resize)(fl_%s o, int x, int y, int w, int h){
               (static_cast<Fl_Derived%s*>(o))->resize(x,y,w,h);
             }" v1 v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_resize_super)(fl_%s o, int x, int y, int w, int h){
               (static_cast<Fl_Derived%s*>(o))->resize_super(x,y,w,h);
             }" v1 v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_show)(fl_%s o){
               (static_cast<Fl_Derived%s*>(o))->show();
             }" v1 v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_show_super)(fl_%s o){
               (static_cast<Fl_Derived%s*>(o))->show_super();
             }" v1 v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_hide)(fl_%s o){
               (static_cast<Fl_Derived%s*>(o))->hide();
             }" v1 v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_hide_super)(fl_%s o){
               (static_cast<Fl_Derived%s*>(o))->hide_super();
             }" v1 v1 v1)
  ?\n
  )

(define-skeleton widget-methods-c-sigs
  ""
  nil
  '(setq v1 (skeleton-read "class:"))
  > (format "FL_EXPORT_C(fl_%s,    Fl_Overridden%s_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);" v1 v1)
  ?\n
  > (format "FL_EXPORT_C(fl_%s,    Fl_Overridden%s_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);" v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_draw)(fl_%s o);" v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_draw_super)(fl_%s o);" v1 v1)
  ?\n
  > (format "FL_EXPORT_C(int, Fl_%s_handle)(fl_%s o, int event);" v1 v1)
  ?\n
  > (format "FL_EXPORT_C(int, Fl_%s_handle_super)(fl_%s o, int event);" v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_resize)(fl_%s o, int x, int y, int w, int h);" v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_resize_super)(fl_%s o, int x, int y, int w, int h);" v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_show)(fl_%s o);" v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_show_super)(fl_%s o);" v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_hide)(fl_%s o);" v1 v1)
  ?\n
  > (format "FL_EXPORT_C(void, Fl_%s_hide_super)(fl_%s o);" v1 v1)
  ?\n
  )

(define-skeleton haskell-custom
  ""
  nil
  '(setq v1 (skeleton-read "class:"))
  > (format "{# fun Fl_Overridden%s_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}" (capitalize v1))
  ?\n
  > (format "{# fun Fl_Overridden%s_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}" (capitalize v1))
  ?\n
  > (format "%sCustom ::
       Rectangle                         -- ^ The bounds of this %s
    -> Maybe T.Text                      -- ^ The %s label
    -> Maybe (Ref %s -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs %s)      -- ^ Optional custom widget functions
    -> IO (Ref %s)
%sCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'
" (s-lower-camel-case v1) (s-upper-camel-case v1) (s-upper-camel-case v1) (s-upper-camel-case v1) (s-upper-camel-case v1) (s-upper-camel-case v1) (s-lower-camel-case v1))
  ?\n
  )


(defun custom-instances-list (class)
  (let (
        (draw (format "{# fun Fl_%s_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) %s orig impl where
  runOp _ _ %s = withRef %s $ \\%sPtr -> draw'' %sPtr"  class (s-upper-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class)))
        (draw-super (format "{# fun Fl_%s_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) %s orig impl where
  runOp _ _ %s = withRef %s $ \\%sPtr -> drawSuper' %sPtr"  class (s-upper-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class)))
        (handle (format "{#fun Fl_%s_handle as %sHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) %s orig impl where
  runOp _ _ %s event = withRef %s (\\p -> %sHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent"  class (s-lower-camel-case class) (s-upper-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class)))
        (handle-super (format "{# fun Fl_%s_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) %s orig impl where
  runOp _ _ %s event = withRef %s $ \\%sPtr -> handleSuper' %sPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent" class (s-upper-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class)))
        (resize (format "{# fun Fl_%s_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) %s orig impl where
  runOp _ _ %s rectangle = withRef %s $ \\%sPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' %sPtr x_pos y_pos w_pos h_pos" class (s-upper-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class)))
        (resize-super (format "{# fun Fl_%s_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) %s orig impl where
  runOp _ _ %s rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef %s $ \\%sPtr -> resizeSuper' %sPtr x_pos y_pos width height" class (s-upper-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class)))
        (hide (format "{# fun Fl_%s_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) %s orig impl where
  runOp _ _ %s = withRef %s $ \\%sPtr -> hide' %sPtr"  class (s-upper-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class)))
        (hide-super (format "{# fun Fl_%s_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) %s orig impl where
  runOp _ _ %s = withRef %s $ \\%sPtr -> hideSuper' %sPtr"  class (s-upper-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class)))
        (show (format "{# fun Fl_%s_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) %s orig impl where
  runOp _ _ %s = withRef %s $ \\%sPtr -> show' %sPtr"  class (s-upper-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class)))
        (show-super (format "{# fun Fl_%s_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) %s orig impl where
  runOp _ _ %s = withRef %s $ \\%sPtr -> showSuper' %sPtr"  class (s-upper-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class) (s-lower-camel-case class)))
        )
    (list draw draw-super handle handle-super resize resize-super hide hide-super show show-super))
  )

(define-skeleton custom-instances
  ""
  nil
  '(setq v1 (skeleton-read "class:"))
  '(setq v2 (custom-instances-list v1))
  > (format "%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n" (nth 0 v2) (nth 1 v2) (nth 2 v2) (nth 3 v2) (nth 4 v2) (nth 5 v2) (nth 6 v2) (nth 7 v2) (nth 8 v2) (nth 9 v2))
  )

(define-skeleton custom-datatype
  ""
  nil
  > (format "%s"  "(Draw
   (DrawSuper
   (Handle
   (HandleSuper
   (ShowWidget
   (ShowWidgetSuper
   (Hide
   (HideSuper")
  )

(define-skeleton imports
  ""
  nil
  > (format "%s" "import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Widget
"))
