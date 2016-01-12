module Graphics.UI.FLTK.LowLevel.FLTKHS
       (
         -- * Motivation
         --
         -- $Motivation

         -- * Goals
         --
         -- $Goals

         -- * Installation (Linux & Mac)
         --
         -- $InstallationLinux

         -- * Installation (Windows 64-bit)
         --
         -- $InstallationWindows

         -- * Getting Started
         --
         -- $GettingStarted

         -- * Demos
         --
         -- $Demos

         -- * Fluid Support
         --
         -- $FluidSupport

         -- * Stack Traces
         --
         -- $StackTrace

         -- * API Guide
         --
         -- $APIGuide

         -- * Slow Compilation Issues
         --
         -- $Compilation

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
         module Graphics.UI.FLTK.LowLevel.Output,
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
         module Graphics.UI.FLTK.LowLevel.Spinner,
         module Graphics.UI.FLTK.LowLevel.SysMenuBar,
         module Graphics.UI.FLTK.LowLevel.Tabs,
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
         module Graphics.UI.FLTK.LowLevel.TextSelection,
         module Graphics.UI.FLTK.LowLevel.TextBuffer,
         module Graphics.UI.FLTK.LowLevel.TextDisplay,
         module Graphics.UI.FLTK.LowLevel.TextEditor,
         module Graphics.UI.FLTK.LowLevel.NativeFileChooser,
         module Graphics.UI.FLTK.LowLevel.Tile,
         module Graphics.UI.FLTK.LowLevel.Pack,
         module Graphics.UI.FLTK.LowLevel.Scrolled,
         module Graphics.UI.FLTK.LowLevel.Ask,
         module Graphics.UI.FLTK.LowLevel.ColorChooser,
         module Graphics.UI.FLTK.LowLevel.FileBrowser,
         module Graphics.UI.FLTK.LowLevel.JPEGImage,
         module Graphics.UI.FLTK.LowLevel.RGBImage,
         module Graphics.UI.FLTK.LowLevel.BMPImage,
         module Graphics.UI.FLTK.LowLevel.GIFImage,
         module Graphics.UI.FLTK.LowLevel.XBMImage,
         module Graphics.UI.FLTK.LowLevel.XPMImage,
         module Graphics.UI.FLTK.LowLevel.PNGImage,
         module Graphics.UI.FLTK.LowLevel.PNMImage,
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
import Graphics.UI.FLTK.LowLevel.Spinner
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
import Graphics.UI.FLTK.LowLevel.Output
import Graphics.UI.FLTK.LowLevel.Wizard
import Graphics.UI.FLTK.LowLevel.Tabs
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
import Graphics.UI.FLTK.LowLevel.TextSelection()
import Graphics.UI.FLTK.LowLevel.TextBuffer
import Graphics.UI.FLTK.LowLevel.TextDisplay
import Graphics.UI.FLTK.LowLevel.TextEditor
import Graphics.UI.FLTK.LowLevel.NativeFileChooser
import Graphics.UI.FLTK.LowLevel.Tile
import Graphics.UI.FLTK.LowLevel.Pack
import Graphics.UI.FLTK.LowLevel.Scrolled
import Graphics.UI.FLTK.LowLevel.Ask
import Graphics.UI.FLTK.LowLevel.ColorChooser
import Graphics.UI.FLTK.LowLevel.FileBrowser
import Graphics.UI.FLTK.LowLevel.JPEGImage
import Graphics.UI.FLTK.LowLevel.RGBImage
import Graphics.UI.FLTK.LowLevel.BMPImage
import Graphics.UI.FLTK.LowLevel.GIFImage
import Graphics.UI.FLTK.LowLevel.XBMImage
import Graphics.UI.FLTK.LowLevel.XPMImage
import Graphics.UI.FLTK.LowLevel.PNGImage
import Graphics.UI.FLTK.LowLevel.PNMImage

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
-- and have fewer security issues.
--
-- == Why FLTK?
-- - The original author chose FLTK because it was small enough that one person could bind the whole thing in an initial
-- pass. Larger toolkits like QT, although way slicker, would require many man-years of effort.
-- - FLTK is quite featureful
-- - FLTK is mature and maintained, the project is about 20 years old and author has had good experiences with the community
-- - FLTK comes with a simple but quite useful GUI builder, <https://en.wikipedia.org/wiki/FLUID Fluid> which is now able to
--   generate Haskell code. See the `Fluid Support` section for more details.
--
-- == What about HsQML\/WxHaskell/Gtk2Hs?
-- These are all great projects and produce really nice UI's, but they all fail at least one of criterion listed under the __Goals__ section below.
--
-- To the author's knowledge, as of the third quarter of 2015, no other package in the Haskell ecosystem meets all those constraints.
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
-- (8) comes with GUI builder support to alleviate the tedium of laying out widgets by hand

-- $FluidSupport
--
-- This package also comes with a utility (fltkhs-fluidtohs) that takes a user interface generated using the
-- <https://en.wikipedia.org/wiki/FLUID Fluid GUI builder> that ships with FLTK and generates Haskell code.
--
-- Now the user can drag and drop widgets into place instead of having to calculate coordinates and sizes by hand.
-- Additionally arbitrary Haskell code can be inserted into Fluid interfaces allowing user to do most of callback wiring
-- directly from Fluid.
--
-- The quickest way to get started is to download the <https://github.com/deech/fltkhs-fluid-hello-world Fluid/Haskell project template>.
-- The "Setup.hs" that comes with the skeleton is configured to use the 'fltkhs-fluidtohs' utility to automatically convert any Fluid in 'src' directory
-- into a Haskell module of the same name during the preprocess step. This means using Fluid in a FLTKHS project is as simple
-- as creating a Fluid interface and running 'cabal build' or 'cabal install'.
--
-- Additionally the <http://hackage.haskell.org/package/fltkhs-fluid-examples fltkhs-fluid-examples> comes with
-- a number of demos that show off how Fluid integrates with FLTKS.
--

-- $StackTrace
--
-- In a traditional callback-heavy API such as FLTKHS null pointers happen which is why FLTKHS supports partial stack traces. All FLTK
-- functions throw an error along with a stack trace when given a null 'Ref'.
--
-- For pre-7.10 GHCs stack traces will only be shown if the <https://wiki.haskell.org/Debugging#General_usage 'xc'> flag is used when compiling FLTKHS.
--
-- If compiled with GHC > 7.10 a partial stack trace is transparently available to the user. The recently minted <https://hackage.haskell.org/package/base-4.8.1.0/docs/GHC-Stack.html#g:3 'CallStack'>
-- implicit parameter is used to get a trace of the function that made the offending call along with a file name and line number. So, for example, in the following
-- code:
--
-- @
-- buttonCb :: Ref Button -> IO ()
-- buttonCb b' = do
--   FL.deleteWidget b'
--   l' <- getLabel b'
--   ...
--
-- main :: IO ()
-- main = do
--  window <- windowNew ...
--  begin window
--  b' <- buttonNew ...
--  setCallback b' buttonCb
--  ...
-- @
--
-- a button is placed inside a window in the main method but the first time it is clicked the callback will delete it and then try
-- the extract the label from the null 'Ref'.
-- The resulting stack trace will look something like:
--
-- @
-- Ref does not exist. ?loc, called at src\/Graphics\/UI\/FLTK\/LowLevel\/Fl_Types.chs:395:58 in fltkh_Cx8029B5VOwKjdT0OwMERC:Graphics.UI.FLTK.LowLevel.Fl_Types
--   toRefPtr, called at src\/Graphics\/UI\/FLTK\/LowLevel\/Fl_Types.chs:403:22 in fltkh_Cx8029B5VOwKjdT0OwMERC:Graphics.UI.FLTK.LowLevel.Fl_Types
--   withRef, called at src\/Graphics\/UI\/FLTK\/LowLevel\/Hierarchy.hs:1652:166 in fltkh_Cx8029B5VOwKjdT0OwMERC:Graphics.UI.FLTK.LowLevel.Hierarchy
--   getLabel, called at src\/Main.hs:11:10 in main:Main
-- @
--
-- It says that the null pointer was originally detected in the library function 'toRefPtr' function which was called by the library function 'withRef', which
-- was called by 'getLabel' on line 11 of 'src/Main.hs'. Notice, however, that the trace stops there. It does not tell you 'getLabel' was invoked from 'buttonCb'.
-- For a more detailed trace the 'CallStack' implicit parameter needs to be passed to each function in the chain like:
--
-- @
-- buttonCb :: (?loc :: CallStack) => Ref Button ...
--  ...
-- main :: IO ()
--  ...
-- @
--

-- $InstallationLinux
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

-- $InstallationWindows
--
-- Note: Currently this package only works on 64-bit Windows.
--
-- This install guide has been tested on Windows 7 64-bit with 8GB of RAM.
--
--
-- The general steps involved are:
--
--  - Install <https://github.com/fpco/minghc MinGHC> and upgrade cabal-install
--  - Install <http://www.cmake.org/files/v3.2/cmake-3.2.1-win32-x86.exe CMake>
--  - Download & compile <http://www.fltk.org/software.php?VERSION=1.3.3&FILE=fltk/1.3.3/fltk-1.3.3-source.tar.gz FLTK 1.3.3>
--  - Install this package
--
-- == Install MinGHC
-- MinGHC installers are available <https://github.com/fpco/minghc here>. This package has been tested with GHC 7.8.4 64-bit and may work with newer versions.
--
-- Once MinGHC is downloaded and installed per the instructions in the link above, install the newest version of cabal-install. This is an important step because the "Setup.hs" that ships with this package uses some of the newer features of the Cabal 1.2.x API.
--
-- @
-- > cabal update
-- > cabal install cabal-install
-- @
--
-- == Install CMake
-- Simply click through the <http://www.cmake.org/files/v3.2/cmake-3.2.1-win32-x86.exe CMake> with the default options. Once this process is complete the `cmake` executable should be available at the CMD prompt:
--
-- @
-- > cmake --version
-- cmake version 2.8.11.2
-- @
--
-- Your version will likely be `cmake version 3.2.x` but so long as it is above `cmake version 2.6.x` the install should proceed smoothly.
--
-- == Download & compile FLTK-1.3.3
-- Please make sure to only download version <http://www.fltk.org/software.php?VERSION=1.3.3&FILE=fltk/1.3.3/fltk-1.3.3-source.tar.gz FLTK 1.3.3>.
--
-- Once this is downloaded, since the `tar` and `gunzip` utilities ship with MinGHC, you should be able to unpack it at the command prompt:
--
-- @
-- > tar -zxvf fltk-1.3.3-source.tar.gz
-- @
--
-- Then descend into the source directory:
--
-- @
-- > cd fltkh-1.3.3-source
-- @
--
-- Make a build directory to hold the generated CMake files:
--
-- @
-- > mkdir build
-- @
--
-- Descend into the `build` directory:
--
-- @
-- > cd build
-- @
--
-- And run `cmake` telling it to work with the `make` utility that ships with MSYS:
--
-- @
-- > cmake .. -G "MSYS Makefiles"
-- @
--
-- Please note the `..` after `cmake` in the command. This is important because it tells CMake to build using the CMake specification found in the parent directory.
--
-- Once these steps have been completed you should be able to compile the source:
--
-- @
-- > make
-- @
--
--
-- Each compile step may spit out a scary looking warning about a pointer to int cast, but this can be safely ignored. It seems to be an issue with the MinGW g++/gcc compiler.
--
-- Also, the final demo `windowFocus` may fail to compile and complain about a symbol being redefined. This is again an issue with MinGW and can be safely ignored.
--
-- Now it is necessary to define the `FLTK_HOME` environment variable so this package knows where to look for header and library files:
--
-- @
-- > set FLTK_HOME=\<path-to-the-FLTK-root-directory\>
-- @
--
-- == Install this package
--
-- At this point it is highly likely that running `cabal --version` at the command line still invokes the old version even though `cabal` was updated. This is because the location of the newly installed `cabal` has not been added to the PATH variable. You can do so with this command:
--
-- @
-- > set PATH=C:\\Users\\\<your-username\>\\AppData\\Roaming\\cabal\\bin;%PATH%
-- @
--
-- Now you can finally install this package:
--
-- @
-- > > cabal install fltkhs
-- @
--
-- Please note that compared to the Linux and Mac installs the compilation process takes a very long time. The reason for this is the MinGW gcc/g++ compilers are much slower.
--
-- Once this has completed, you can test it by:
--
-- @
-- > fltkhs-hello-world
-- @

-- $Demos
--
-- There are currently two sets of FLTKHS demos, the ones that ship with this package
-- and ones that show off <http://hackage.haskell.org/package/fltkhs-fluid-examples Fluid> support.
--
-- The demos shipped with this package are listed in `fltkhs.cabal` as separate `Executable` components.
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
-- The quickest way to get started is to the download the <http://github.com/deech/fltkhs-hello-world FLTKHS project skeleton>.
-- It is a simple `hello-world` program that shows the basics of widget creation and callbacks.
-- The project's Cabal file comes pre-configured with the options necessary to produce a statically-linked executable so a simple
-- 'cabal configure && cabal build' should result in an 'fltkhs-hello-world' executable in the 'dist' directory.
--
-- Other demos that ship with this package show more complicated usage of the API.
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

-- $Compilation
--
-- As described above, the API emulates multiple dispatch using type-level programming and typeclasseses. While this is makes for a nice API it has also
-- slowed down compilation of executables much more than expected. This is especially true in the GHC 7.10.x series in which the step where GHC specialises typeclass
-- function calls to concrete types has apparently taken a *huge* compile-time performance hit.
--
-- To clarify the time taken to compile the library itself has not changed, but applications that use the library to create executables are taking a lot
-- longer (almost 3x compared to GHC 7.8.x) to compile. To further emphasize, there does not appear to be any runtime performance issues. This is only a
-- compile time problem.
--
-- To preserve the user's and the author's sanity a flag `fastCompile` has been introduced to this package and to the <http://hackage.haskell.org/fltkhs-fluid-examples fltkhs-fluid-examples>.
-- This flag which tells the compiler to skip the specialising step when compiling executables, dramatically decreases compile time but also bloats the resulting executable size and
-- probably makes runtime performance much slower. In this package and <http://hackage.haskell.org/fltkhs-fluid-examples fltkhs-fluid-examples> it is enabled by default, since the executables are just
-- demos that are not meant to show off performance. To disable this flag, tell Cabal to ignore it during the `configure` step:
--
-- @
-- cabal configure -f-fastCompile
-- @
--
-- In the <https://github.com/deech/fltkhs-hello-world fltkhs> and the <https://github.com/deech/fltkhs-fluid-hello-world fltkhs-fluid> project skeletons this flag is /disabled/ by
-- default to provide the best runtime performance. To enable the flag for a smoother development workflow, tell Cabal to enable it during the `configure` step:
--
-- @
-- cabal configure -f fastCompile
-- @


-- =File Layout
-- @
-- Root
--   - c-src            -- The C bindings
--   - c-examples       -- demos written using the C bindings (not installed)
--   - src
--     - Examples       -- Haskell demos
--     - TestPrograms   -- Haskell test programs
--     - Fluid          -- The Fluid file to Haskell conversion utility
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
