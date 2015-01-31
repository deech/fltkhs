module Graphics.UI.FLTK.LowLevel.FLTKHS
       (
         -- * Motivation
         --
         -- $Motivation

         -- * Goals
         --
         -- $Goals

         -- * Installation
         --
         -- $Installation

         -- * Demos
         --
         -- $Demos

         -- * Getting Started
         --
         -- $GettingStarted

         -- * API Guide
         --
         -- $APIGuide

         -- * Core Types
         module Graphics.UI.FLTK.LowLevel.Fl_Types,
         -- * Widgets
         module Graphics.UI.FLTK.LowLevel.Adjuster,
         module Graphics.UI.FLTK.LowLevel.Bitmap,
         module Graphics.UI.FLTK.LowLevel.Box,
         module Graphics.UI.FLTK.LowLevel.Browser,
         module Graphics.UI.FLTK.LowLevel.Button,
         module Graphics.UI.FLTK.LowLevel.CheckButton,
         module Graphics.UI.FLTK.LowLevel.Choice,
         module Graphics.UI.FLTK.LowLevel.Clock,
         module Graphics.UI.FLTK.LowLevel.CopySurface,
         module Graphics.UI.FLTK.LowLevel.Counter,
         module Graphics.UI.FLTK.LowLevel.Dial,
         module Graphics.UI.FLTK.LowLevel.DoubleWindow,
         module Graphics.UI.FLTK.LowLevel.Draw,
         module Graphics.UI.FLTK.LowLevel.FillDial,
         module Graphics.UI.FLTK.LowLevel.FillSlider,
         module Graphics.UI.FLTK.LowLevel.GlWindow,
         module Graphics.UI.FLTK.LowLevel.Group,
         module Graphics.UI.FLTK.LowLevel.HorFillSlider,
         module Graphics.UI.FLTK.LowLevel.HorNiceSlider,
         module Graphics.UI.FLTK.LowLevel.HorSlider,
         module Graphics.UI.FLTK.LowLevel.HorValueSlider,
         module Graphics.UI.FLTK.LowLevel.Image,
         module Graphics.UI.FLTK.LowLevel.ImageSurface,
         module Graphics.UI.FLTK.LowLevel.Input,
         module Graphics.UI.FLTK.LowLevel.IntInput,
         module Graphics.UI.FLTK.LowLevel.LightButton,
         module Graphics.UI.FLTK.LowLevel.LineDial,
         module Graphics.UI.FLTK.LowLevel.MenuPrim,
         module Graphics.UI.FLTK.LowLevel.MenuButton,
         module Graphics.UI.FLTK.LowLevel.MenuItem,
         module Graphics.UI.FLTK.LowLevel.NiceSlider,
         module Graphics.UI.FLTK.LowLevel.OverlayWindow,
         module Graphics.UI.FLTK.LowLevel.Pixmap,
         module Graphics.UI.FLTK.LowLevel.Positioner,
         module Graphics.UI.FLTK.LowLevel.Progress,
         module Graphics.UI.FLTK.LowLevel.RadioLightButton,
         module Graphics.UI.FLTK.LowLevel.RepeatButton,
         module Graphics.UI.FLTK.LowLevel.ReturnButton,
         module Graphics.UI.FLTK.LowLevel.Roller,
         module Graphics.UI.FLTK.LowLevel.RoundButton,
         module Graphics.UI.FLTK.LowLevel.Scrollbar,
         module Graphics.UI.FLTK.LowLevel.SelectBrowser,
         module Graphics.UI.FLTK.LowLevel.SimpleCounter,
         module Graphics.UI.FLTK.LowLevel.SingleWindow,
         module Graphics.UI.FLTK.LowLevel.Slider,
         module Graphics.UI.FLTK.LowLevel.SysMenuBar,
         module Graphics.UI.FLTK.LowLevel.Table,
         module Graphics.UI.FLTK.LowLevel.TableRow,
         module Graphics.UI.FLTK.LowLevel.Timer,
         module Graphics.UI.FLTK.LowLevel.ToggleButton,
         module Graphics.UI.FLTK.LowLevel.Tree,
         module Graphics.UI.FLTK.LowLevel.TreeItem,
         module Graphics.UI.FLTK.LowLevel.TreePrefs,
         module Graphics.UI.FLTK.LowLevel.Valuator,
         module Graphics.UI.FLTK.LowLevel.ValueInput,
         module Graphics.UI.FLTK.LowLevel.ValueOutput,
         module Graphics.UI.FLTK.LowLevel.ValueSlider,
         module Graphics.UI.FLTK.LowLevel.Widget,
         module Graphics.UI.FLTK.LowLevel.Window,
         module Graphics.UI.FLTK.LowLevel.Wizard,
         -- * Machinery for static dispatch
         module Graphics.UI.FLTK.LowLevel.Dispatch,
         -- * Association of widgets and functions
         module Graphics.UI.FLTK.LowLevel.Hierarchy
       )
where
import Graphics.UI.FLTK.LowLevel.GlWindow
import Graphics.UI.FLTK.LowLevel.SingleWindow
import Graphics.UI.FLTK.LowLevel.Window
import Graphics.UI.FLTK.LowLevel.DoubleWindow
import Graphics.UI.FLTK.LowLevel.OverlayWindow
import Graphics.UI.FLTK.LowLevel.Button
import Graphics.UI.FLTK.LowLevel.LightButton
import Graphics.UI.FLTK.LowLevel.RadioLightButton
import Graphics.UI.FLTK.LowLevel.CheckButton
import Graphics.UI.FLTK.LowLevel.ReturnButton
import Graphics.UI.FLTK.LowLevel.RoundButton
import Graphics.UI.FLTK.LowLevel.RepeatButton
import Graphics.UI.FLTK.LowLevel.ToggleButton
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Group
import Graphics.UI.FLTK.LowLevel.Widget
import Graphics.UI.FLTK.LowLevel.Valuator
import Graphics.UI.FLTK.LowLevel.Slider
import Graphics.UI.FLTK.LowLevel.HorSlider
import Graphics.UI.FLTK.LowLevel.FillSlider
import Graphics.UI.FLTK.LowLevel.HorFillSlider
import Graphics.UI.FLTK.LowLevel.HorNiceSlider
import Graphics.UI.FLTK.LowLevel.HorValueSlider
import Graphics.UI.FLTK.LowLevel.NiceSlider
import Graphics.UI.FLTK.LowLevel.MenuItem
import Graphics.UI.FLTK.LowLevel.MenuPrim
import Graphics.UI.FLTK.LowLevel.SysMenuBar
import Graphics.UI.FLTK.LowLevel.Choice
import Graphics.UI.FLTK.LowLevel.MenuButton
import Graphics.UI.FLTK.LowLevel.Image
import Graphics.UI.FLTK.LowLevel.Bitmap
import Graphics.UI.FLTK.LowLevel.Pixmap
import Graphics.UI.FLTK.LowLevel.Draw
import Graphics.UI.FLTK.LowLevel.CopySurface
import Graphics.UI.FLTK.LowLevel.ImageSurface
import Graphics.UI.FLTK.LowLevel.Adjuster
import Graphics.UI.FLTK.LowLevel.Dial
import Graphics.UI.FLTK.LowLevel.FillDial
import Graphics.UI.FLTK.LowLevel.LineDial
import Graphics.UI.FLTK.LowLevel.Roller
import Graphics.UI.FLTK.LowLevel.Counter
import Graphics.UI.FLTK.LowLevel.SimpleCounter
import Graphics.UI.FLTK.LowLevel.Scrollbar
import Graphics.UI.FLTK.LowLevel.ValueSlider
import Graphics.UI.FLTK.LowLevel.ValueInput
import Graphics.UI.FLTK.LowLevel.ValueOutput
import Graphics.UI.FLTK.LowLevel.Timer
import Graphics.UI.FLTK.LowLevel.Progress
import Graphics.UI.FLTK.LowLevel.Positioner
import Graphics.UI.FLTK.LowLevel.Input
import Graphics.UI.FLTK.LowLevel.Wizard
import Graphics.UI.FLTK.LowLevel.Table
import Graphics.UI.FLTK.LowLevel.TableRow
import Graphics.UI.FLTK.LowLevel.Box
import Graphics.UI.FLTK.LowLevel.Browser
import Graphics.UI.FLTK.LowLevel.SelectBrowser
import Graphics.UI.FLTK.LowLevel.IntInput
import Graphics.UI.FLTK.LowLevel.Clock
import Graphics.UI.FLTK.LowLevel.TreePrefs
import Graphics.UI.FLTK.LowLevel.TreeItem
import Graphics.UI.FLTK.LowLevel.Tree

-- $Module Documentation
-- This module re-exports all the available widgets and their core types. The types and list
-- of widgets is listed under the __Core Types__ and __Widgets__ section below.
--
-- A general introduction to the library follows.
--

-- $Motivation
-- This library aims to make it easy for users to build native apps that work portably across platforms.
--
-- The original author is also very interested the renewed interested in user interfaces in the
-- programming community, whether the various kinds of functional reactive programming, meta-object protocol UI's,
-- or something like React.js.
--
-- The hope is that a low-cost hassle-free way of getting a UI up and running without having to deal with
-- browser, authentication and compilation issues will make it more fun to play around with these great ideas
-- using Haskell.
--
-- == Why a native toolkit?
-- Even in this era of web interfaces it is still useful to be able to make native apps. They are usually faster
-- , easier to deploy and have fewer issues with respect to security.
--
-- == Why FLTK, or why not QT?
-- - The original author chose FLTK because it was small enough that one person could bind the whole thing in an initial
-- pass. QT, although way slicker, would require many man-years of effort.
-- - FLTK is quite featureful
-- - FLTK is mature and maintained, the project is about 20 years old and author has had good experiences with the community
--
-- == What about HsQML\/WxHaskell/Gtk2Hs?
-- These are all great projects and produce really nice UI's, but they all fail at least one of criterion listed under the __Goals__ section below.
--
-- To the author's knowledge, as of the first quarter of 2015, no other package in the Haskell ecosystem meets all those constraints.
--

-- $Goals
-- The goals of this library are to provide a low level API to the <http://fltk.org FLTK> that:
--
-- (1) provides full coverage of the toolkit allowing the user to write GUI's in pure Haskell.
-- (2) feels like it has polymorphic dispatch, meaning a single function dispatches to the right implementation based on the type of widget it is given
-- (3) is /not/ monolithic, meaning new widgets can be incorporated the user's application without needing to recompile this library
-- (4) is conservative on the extensions so that older GHC's (and perhaps non-GHC compilers) can use it
-- (5) is easy to install. This library has a minimum of dependencies and <http://fltk.org FLTK> itself compiles cleanly on most architectures
-- (6) allows the user to produce statically linked binaries with no external dependencies
-- (7) includes a lot of complete working demos so that the user can get up and running faster
--

-- $Installation
-- Unfortunately this package does not currently install in Windows. The instructions below are only for OSX and Linux.
--
-- - Make sure you have OpenGL installed
-- - Download and install <http://www.fltk.org/software.php?VERSION=1.3.3&FILE=fltk/1.3.3/fltk-1.3.3-source.tar.gz FLTK 1.3.3>.
-- - The recommended way of installing FLTK on Linux is from source. The reason is that some package managers seem to put the headers and libraries in a non-standard locations which will cause the Haskell bindings to throw compilation errors. On OSX and Linux it should build and install smoothly using the standard:
--
-- @
-- > ./configure
-- > make
-- > make install
-- @
--
-- If you are customizing your `configure` step it is important to at least enable OpenGL and Cairo like so:
--
--     > > ./configure --enable-gl --enable-cairo
--
-- If you didn't install FLTK from source you will need to ensure that the FLTK headers are in the include path and, along with the standard FLTK library, `fltk_gl`, and `fltk_cairo` are also in the library path. You will also need the `make`, `autoconf`, and `autoheader` tools to build the Haskell bindings.
--
-- - Make sure `c2hs` is installed with `cabal install c2hs`.
--
-- - Do
--
--     > > cabal install fltkhs
--
-- or:
--
--     > > git clone https://github.com/deech/fltkhs
--     > > cabal install
--
-- __Note:__ If this step produces a flood of `undefined reference` errors please ensure that you have the right version of FLTK (1.3.3) installed and that the headers are in the expected locations. It seems as though some package managers put the libraries and headers in non-standard places.
--
-- - Test that the build completed successfully by invoking
--
--     > > fltkhs-hello-world
--

-- $Demos
--
-- The available demos are listed in `fltkhs.cabal` as separate `Executable` components.
-- Once the package is installed they are installed to Cabal's standard /bin/ directory (usually /~\/.cabal\/bin).
--
-- Note that the executables install prefixed with \"fltkhs-\". Typing:
--
--     > > fltkhs-<TAB>
--
-- at the command line should show a list of available demos.
--
-- Alternatively you can do:
--
--     > > ls ~/.cabal/bin/fltkhs-*
--
--
-- Most of the demos are exact ports of those shipped in the /test/ directory of the <http://fltk.org FLTK> distribution.
-- It is hoped the user will study the Haskell demo code side-by-side with the C++ demo code in order to understand the API.
-- The section __API Guide__ covers this in more detail.
--
-- == Why is the demo code so un-Haskelly?
-- For being written in Haskell, the demo code is horrifyingly\/amazingly imperative and stateful. Although it may repulse those
-- who used to pure Haskell idioms it is that way for a reason.
--
-- The demo code was never meant to be idiomatic Haskell code but a way of showing as much of the API as possible. The API itself
-- closely resembles the underlying C++ code which is imperative and stateful. This has the advantage of making the API easier
-- to learn.
--
-- For instance, assuming FLTK was installed from source compare /src\/Examples\/arc.hs with /test\/arc.cxx in the FLTK
-- source directory. There is quite a bit of correspondence and it is easy to see how the Haskell API functions map to the C++ ones.
--
--

-- $GettingStarted
--
-- It is assumed that by this point the user has successfully installed this library and examples.
--
--
-- = Quick Start
-- The quickest way to a working program is /src\/Examples\/hello-world.hs/ which gets compiled
-- to the executable 'fltkhs-hello-world'. It show basic widget creation and callbacks.
--
-- The other demos show more complicated usage.
--
-- Since the API is a low-level binding, code using it takes on the imperative style of the underlying toolkit.
-- Fortunately it should look pretty familiar to those who have used object-oriented GUI toolkits before.
--
--

-- $APIGuide
--
-- = Guide to the Haddock Docs
-- Convenient access to the underlying C++ is achieved using typeclasses and type-level programming to emulate
-- classes and subclasses. This approach makes Haddock very unhappy and the generated documentation
-- is frequently unhelpful. For instance, newcomers to this library  are urged
-- not to look at "Graphics.UI.FLTK.LowLevel.Dispatch" or "Graphics.UI.FLTK.LowLevel.Hierarchy". The purpose
-- of this guide is to point users in a more useful direction.
--
--
-- The documentation provided with this API is not yet self-contained and is meant to be used in tandem
-- with the <http://www.fltk.org/doc-1.3/classes.html C++ documentation>. The rest of this document is about
-- how the Haskell functions and datatypes map to the C++ ones.
--
-- == Widget Construction
-- Each widget has its own module all of which are listed below under the __Widgets__ heading . Most modules
-- include a function named `<widgetName>New` that returns a reference to that widget. Although the user does not
-- have to deal with raw pointers directly it might help to understand that this reference is a pointer to a void
-- pointer to a C++ object.
--
-- For instance, 'windowNew' creates a 'Ref' 'Window' which is a pointer to a C++ object of type `Fl_Window`,
-- the FLTK class that knows how to draw, display and handle window events.
--
-- This value of type 'Ref' 'Window' is then passed along to various functions which, transparent to the user,
-- extract the pointer and pass it to the appropriate /Fl_Window/ instance method.
--
-- == Widget Methods
-- The Haskell functions that bind to the instance methods of an FLTK class are listed under the __Functions__ heading in that widget's module.
-- It's worth remembering that these type signatures associated with the functions listed under the __Functions__ heading are not
-- the real ones but are artifically generated because they are much more helpful to users. For instance, the actual type of 'activate' exposes
-- all the type level arithmetic required so it can be used by subclasses of 'Widget' but is pretty unhelpful as a reference
-- compared to the artificial type under __Functions__ heading of  "Graphics.UI.FLTK.LowLevel.Widget".
--
-- Unfortunately to see this more helpful type signature the poor reader has to navigate to the corresponding widget's
-- module, find the __Functions__ header and scroll down to the desired function. Haddock, unfortunately, does not support anchors that
-- link to a named point in the page. The author is /very/ open to ideas on how to make this easier.
--
-- Carrying on the previous example from the __Widget Creation__ section, the methods on a 'Ref' 'Window' widget are documented in "Graphics.UI.FLTK.LowLevel.Window"
-- under __Functions__. Each function takes the 'Ref' 'Window' reference as its first argument followed by whatever else it needs and
-- delegates it appropriately.
--
-- As this is a low-level binding the Haskell functions are kept as close as possible in name and argument list to the underlying C++.
-- This allows users familiar with the FLTK API to use this library with less learning overhead and it lets newcomers to
-- FLTK take advantage of the already extensive <http://www.fltk.org/doc-1.3/classes.html C++ documentation>.
--
-- Functions are named to make it as easy as possible to find the corresponding C++ function, however there are
-- some naming conventions to keep in mind:
--
-- (1) setters and getters are prefixed with /set/ and /get/ respectively. In C++ both have the same name; the setter
-- takes an argument while the getter does not. Since Haskell does not support overloading this convention is used.
--
-- (2) in many cases C++ uses overloading to provide default values to arguments. Since Haskell does
-- not support overloading these arguments are 'Maybe' types eg. the `hotspot` function in "Graphics.UI.FLTK.LowLevel.Window".
-- In other cases where the common use case leaves the default arguments unspecified the binding provides two functions,
-- a longer less-convenient-to-type one that takes the default argument and a short one that does not
-- eg. `drawBox` and `drawBoxWithBoxtype`, also in "Graphics.UI.FLTK.LowLevel.Window".
--
-- (3) error codes are 'Either' types
--
-- (4) function arguments which are pointers to be filled are not exposed to the API user. For instance, a common C++ idiom is to
-- return a string by taking a pointer to some initialized but empty chunk of memory and filling it up. The corresponding Haskell
-- function just returns a 'String'.
--
--
-- It is hoped that until the documentation becomes more self-sustaining the user can use these heuristics (and the type signatures)
-- along with the official FLTK documentation to "guess" what the binding functions do.
--
-- == Widget Hierarchy
-- Every widget module in the API has a __Hierarchy__ heading that shows all its parents.
--
-- The design of the API makes all the parent functions transparently available to that widget. This is also the reason why the actual type
-- signatures are so complicated requiring the manual generation of artificial type signatures.
--
-- For instance, the __Functions__ section under "Graphics.UI.FLTK.LowLevel.Window" shows that a 'Ref' 'Window' can be passed to /getModal/ to check if
-- the window is modal, but it can also be passed to /children/ in "Graphics.UI.FLTK.LowLevel.Group" which counts up the number
-- of widgets inside the 'Window' and /getX/ in "Graphics.UI.FLTK.LowLevel.Widget" which returns the X coordinate of the
-- 'Window''s top-left hand corner.
--
-- The hierarchy corresponds almost exactly to the underlying C++ class hierarchy so, again, the user is able to take advantage of the
-- <http://www.fltk.org/doc-1.3/classes.html C++ documentation> to use the binding API.
--
-- === Overriding C++ methods
-- The binding API provides a /very/ limited form of inheritance by allowing the user to provide Haskell implementations
-- of certain key methods on a small set of classes. Which methods and which classes were determined by original author of this
-- library based on a casual look at FLTK code in the wild and what was required for porting the demoes. If there is a
-- pressing need for more methods or classes, please contact the maintainer.
--
-- When providing custom methods the object constructor is no longer `<widgetName>New` but `<widgetName>Custom`,
-- which, in addition the parameters taken by `<widgetName>New` also takes records of Haskell functions which are
-- then passed to the C++ side.
--
-- Much like a callback, the Haskell functions are passed as function pointers to the C++ side and called whenever
-- the event loop deems appropriate. Unlike callbacks, they can be set only on object instantiation.
--
-- An example of this is "Graphics.UI.FLTK.LowLevel.Widget" which, since it is a base class for most widgets and doesn't have much
-- functionality of its own, only allows custom construction using 'widgetCustom'. This constructor takes a 'CustomWidgetFuncs'
-- datatype which is a record of functions which tells a "Graphics.UI.FLTK.LowLevel.Widget" how to handle events and draw,
-- resize and display itself.
--
-- Again "Graphics.UI.FLTK.LowLevel.Window" can be used a motivating example. Its custom constructor 'windowCustom', in fact, takes two
-- records. A 'CustomWidgetFuncs' which allows the user to override methods in its "Graphics.UI.FLTK.LowLevel.Widget" parent class
-- and also a 'CustomWindowFuncs' record which allows the user to override /flush/, a method on the Window class which tells the window
-- how to force a redraw. For example, the demo /src\/Examples\/doublebuffer.hs/ (which corresponds to the executable 'ftlkhs-doublebuffer')
-- tells both windows how to draw themselves in a Haskell function that uses low-level FLTK drawing routines by overriding the draw function
-- of their "Graphics.UI.FLTK.LowLevel.Widget" parent.
--
-- Every widget that supports customizing also provides a default function record that can be passed to the constructor. For example, "Graphics.UI.FLTK.LowLevel.Widget"
-- provides 'defaultCustomWidgetFuncs' and "Graphics.UI.FLTK.LowLevel.Window" has 'defaultCustomWindowFuncs'. In the demo mentioned above
-- the 'singleWindowCustom' function is given 'defaultCustomWidgetFuncs' but with an overridden 'drawCustom'.
--
-- Another case where customization comes up a lot is when using "Graphics.UI.FLTK.LowLevel.Table" which is a low-level table widget that needs
-- to be told, for example, how to draw its cells. The demo /src\/Examples\/table-simple.hs/ (corresponding to the executable 'fltkhs-table-simple')
-- shows this  in action.
--
-- Hopefully the demos just mentioned and others included with this library show that even though customizing is limited it is possible to do a lot.
--
-- Additionally for most customizable functions a widget provides a corresponding function that calls the default C++ implementation
-- as the function name suffixed with \"Super\". For instance, the user can provide a custom implementation of /handle/ on "Graphics.UI.FLTK.LowLevel.Window"
-- via the constructor and every call to /handle/ invokes that implementation, but the user can also call /handleSuper/ to get at the default C++
-- implementation. This comes in handy when the custom function is just setting up variables or logging and wants underlying
-- implementation to take over at some point.
--
-- __Warning__: since calls to the default implementation of the function, /handleSuper/, for example, are available to the widget they are automatically
-- available to all subclasses of the widget. The author acknowledges this is a confusing aspect of the library's design but hopes the benefit of
-- being able to get at the default implementation out-weighs the trap the user might fall into. If this becomes a pervasive problem the author is
-- open to removing this functionality.
--
-- =File Layout
-- @
-- Root
--   - c-src            -- The C bindings
--   - c-examples       -- demos written using the C bindings (not installed)
--   - src
--     - Examples       -- Haskell demos
--     - TestPrograms   -- Haskell test programs
--     - Graphics
--       - UI
--         - FLTK
--           - LowLevel -- Haskell bindings
--   - scripts          -- various helper scripts (probably not interesting to anyone but the original author)
-- @
--
-- = Common Type Errors
--
-- * No instance for ('FindOp' () (Blah ()) ('Match' r0)) ...
--
-- Given code that look something like:
--
-- @
-- do
--   ...
--   blah widget
--   ...
-- @
--
-- that means this the widget `widget` does not support the function `blah`.
