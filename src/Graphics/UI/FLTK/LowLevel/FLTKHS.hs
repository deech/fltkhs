module Graphics.UI.FLTK.LowLevel.FLTKHS
       (
         -- * Motivation
         --
         -- $Motivation

         -- * Goals
         --
         -- $Goals

         -- * Obstacles
         --
         -- $Obstacles

         -- * Installation
         --
         -- ** Linux & *BSD
         --
         -- $InstallationLinux

         -- ** Mac (Yosemite & El Capitan)
         --
         -- $InstallationMac

         -- ** Installation (Windows 64-bit)
         --
         -- $InstallationWindows

         -- * Demos
         --
         -- $Demos

         -- * Getting Started
         --
         -- $GettingStarted

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

         -- * Running in the REPL
         --
         -- $CabalREPLIssues

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
         module Graphics.UI.FLTK.LowLevel.FileInput,
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
         module Graphics.UI.FLTK.LowLevel.MenuBar,
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
import Graphics.UI.FLTK.LowLevel.MenuBar
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
import Graphics.UI.FLTK.LowLevel.FileInput
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
-- This module re-exports all the available widgets and
-- their core types. The types and list of widgets is listed under the __Core
-- Types__ and __Widgets__ section below.
--
-- A general introduction to the library follows.
--

-- $Motivation
-- This library aims to make it easy for users to build native apps that work portably across platforms.
--
-- The original author is also very interested the renewed interested in user
-- interfaces in the programming community, whether the various kinds of
-- functional reactive programming, meta-object protocol UI's, or something like
-- React.js.
--
-- The hope is that a low-cost hassle-free way of getting a UI up and running
-- without having to deal with browser, authentication and compilation issues
-- will make it more fun to play around with these great ideas using Haskell.
--
-- == Why a native toolkit?
-- Even in this era of web interfaces it is still
-- useful to be able to make native apps. They are usually faster and have fewer
-- security issues.
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
-- These are all great projects and produce really nice UI's, but they all fail
-- at least one of criterion listed under the __Goals__ section below.
--
-- To the author's knowledge, as of the first quarter of 2016, no other package
-- in the Haskell ecosystem meets all those constraints.
--

-- $Goals
-- The goals of this library are to provide a low level API to the <http://fltk.org FLTK> that:
--
-- (1) provides full coverage of the toolkit allowing the user to write GUI's in pure Haskell.
-- (2) feels like it has polymorphic dispatch, meaning a single function dispatches to the right implementation based on the type of widget it is given
-- (3) is /not/ monolithic, meaning new widgets can be incorporated the user's application without needing to recompile this library
-- (4) is easy to install. This library has a minimum of dependencies and <http://fltk.org FLTK> itself compiles cleanly on most architectures
-- (5) allows the user to produce statically linked binaries with no external dependencies
-- (6) includes a lot of complete working demos so that the user can get up and running faster. (see note below)
-- (7) comes with GUI builder support to alleviate the tedium of laying out widgets by hand
--
-- $FluidSupport
--
-- This package also comes with a utility (fltkhs-fluidtohs) that takes a user
-- interface generated using the <https://en.wikipedia.org/wiki/FLUID Fluid GUI builder>
-- that ships with FLTK and generates Haskell code.
--
-- Now the user can drag and drop widgets into place instead of having to
-- calculate coordinates and sizes by hand. Additionally arbitrary Haskell code
-- can be inserted into Fluid interfaces allowing user to do most of callback
-- wiring directly from Fluid.
--
-- The quickest way to get started is to download the
-- <https://github.com/deech/fltkhs-fluid-hello-world Fluid/Haskell project template>.
-- The @Setup.hs@ that comes with the skeleton is configured to use
-- the 'fltkhs-fluidtohs' utility to automatically convert any Fluid in 'src'
-- directory into a Haskell module of the same name during the preprocess step.
-- This means using Fluid in a FLTKHS project is as simple as creating a Fluid
-- interface and running 'cabal build' or 'cabal install'.
--
-- Additionally the <http://hackage.haskell.org/package/fltkhs-fluid-demos fltkhs-fluid-demos> package
-- comes with a number of demos that show off how Fluid integrates with FLTKS.
--

-- $Obstacles
-- This section attempts to briefly highlight some possible dealbreakers users
-- might want to know about before proceeding. To be clear, building and deploying
-- portable static application binaries works well on all platforms which is why the
-- library is considered usable. And most of these issues are being aggressively
-- addressed but in the interests of full disclosure ...
--
-- == Look & Feel (All users)
-- The look and feel of FLTK apps can be charitably described as /retro/. And since
-- FLTK has no support for theming it is also baked in. FLTK was designed for the
-- embedded domain and trades off slickness for speed, portability and
-- binary size. This is unlikely to change.
--
-- == Compile Times (All users)
-- Currently a dense app (~ 160-180 widgets crammed into the same window) takes
-- 9-12 seconds to compile on a 32GB quad-core machine. Surprisingly it only goes up
-- to 10-15 seconds on a 8GB machine indicating that GHC pegs one processor and RAM
-- does not matter. Educated guess, most of the time is being spent traversing type-level lists
-- and chasing down orphan instances. The hope is that this will all go away once GHC 8 has settled
-- in and all the type-level gymnastics can been replaced with OverloadedRecordFields.
--
-- == GHCi (Linux, *BSD & OSX Yosemite)
-- The GHC 7.10.x series has an unfortunate
-- <https://ghc.haskell.org/trac/ghc/ticket/10568 regression> that causes GHCi to
-- crash when loading the shared library that contains the C bindings to the C++
-- API. The REPL loads fine in GHC 7.8.x. This means that each FLTKHS app needs a
-- special GHC environment just for running the REPL. This is achieved by bundling
-- another Stack file (arbitrarily called 'stack-repl.yaml') with sample apps
-- and skeletons specially for loading an app into GHCi but also means that users
-- have to do the following to load a GUI app into the REPL:
--
-- @
-- > STACK_YAML=stack-repl.yaml stack ghci ...
-- @
--
-- Furthermore once an app is launched via the REPL closing the main app window
-- brings the REPL back to a prompt as it should but does not go away. The window
-- stays around ghosted for the life of the session. The user has to `:quit` GHCi in
-- order to get rid of it. So while the REPL is still useful for querying functions etc.
-- and trying things out it leaves a lot of trash behind. Hopefully the fix is simply a
-- case of the author knowing how GHCi and the FFI interact.
--
-- == GHCi + Stack (OSX El Capitan)
-- Running FLTKHS in GHCi via Stack on El Capitan is broken. The reason is that
-- the @Setup.hs@ that comes with FLTKHS requires Cabal-1.2.x. So before running the repl we need to do:
--
-- @
-- > STACK_YAML=stack-repl.yaml stack setup --upgrade-cabal
-- @
--
-- This breaks on El Capitan with an error:
--
-- @
-- > Setup: \/usr\/bin\/ar: permission denied
-- @
--
-- This is a known <https://github.com/haskell/cabal/issues/2653 bug> and unfortunately the
-- <https://ghc.haskell.org/trac/ghc/blog/weekly20150721#MacOSXElCapitansupport workaround> is
-- pretty horrific. Barring that there is no hope for FLTKHS and GHCi on El Capitan.
--
-- To see why it's necessary to use `stack-repl.yaml` please see the previous section
-- "GHCi (Linux, *BSD & OSD Yosemite)".
--
-- == GHC 7.10.3 And Beyond (Windows only)
-- _UPDATE_: This issue has been resolved by updates to 'language-c' and 'c2hs'. This
-- section will be removed in a subsequent release.
--
-- FLTKHS does not work with GHC 7.10.3 on Windows. Period. GHC 7.10.2 and 7.8.4 on
-- Windows work fine. The problem is the MinGW environment that comes bundled with
-- GHC 7.10.3 has brought to a light and unfortunate
-- <https://github.com/haskell/c2hs/issues/157 bug> in the `language-c` package
-- that C2HS depends on. Until this is fixed FLTKHS will not build.
--
-- The workaround is bundling yet another special Stack file (arbitrarily called
-- "stack-windows.yaml") that allows Windows users to run FLTKHS with GHC 7.10.2.
-- Most importantly this pins all Windows users to 7.10.2 until the issue is
-- resolved and as an added inconvenience all Stack commands in Windows have to be
-- prefixed with the cheesy:
--
-- @
-- > STACK_YAML= stack-windows.yaml stack ...
-- @
--
-- == GHCi (Windows only)
-- GHCi does not work with FLTKHS on Windows at all. At least on Windows 7, attempting
-- load an app into the REPL generates a weird error message about not being able to
-- find `uuid.dll`.
--
-- Hopefully this is just an issue of the author not understand GHCi on Windows and
-- will be resolved quickly.

-- $StackTrace
--
-- In a traditional callback-heavy API such as FLTKHS null pointers happen which
-- is why FLTKHS supports partial stack traces. All FLTK functions throw an
-- error along with a stack trace when given a null 'Ref'.
--
-- For pre-7.10 GHCs stack traces will only be shown if the
-- <https://wiki.haskell.org/Debugging#General_usage 'xc'> flag is used when
-- compiling FLTKHS.
--
-- If compiled with GHC > 7.10 a partial stack trace is transparently available
-- to the user. The recently minted
-- <https://hackage.haskell.org/package/base-4.8.1.0/docs/GHC-Stack.html#g:3 'CallStack'>
-- implicit parameter is used to get a trace of the function that
-- made the offending call along with a file name and line number. So, for
-- example, in the following code:
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
--  The steps are:
--
-- - Make sure to have OpenGL installed
-- - Download & install <http://docs.haskellstack.org/en/stable/README/#how-to-install Stack>
-- - Download & install <http://www.fltk.org/software.php?VERSION=1.3.3&FILE=fltk/1.3.3/fltk-1.3.3-source.tar.gz FLTK 1.3.3>
-- - Download & install the <https://github.com/deech/fltkhs-hello-world/archive/master.tar.gz FLTKHS hello world skeleton>
-- - Verify the install by running `fltkhs-hello-world`
--
-- == Download & Install Stack
-- Pick the <http://docs.haskellstack.org/en/stable/README/#how-to-install Stack installer> that matches your distribution and install according the instructions.
--
-- == Download & Install FLTK-1.3.3
-- Please make sure to only download version
-- <http://www.fltk.org/software.php?VERSION=1.3.3&FILE=fltk/1.3.3/fltk-1.3.3-source.tar.gz FLTK 1.3.3>.
-- It should build and install smoothly with the standard:
--
-- @
-- > ./configure --enable-shared
-- > make
-- > sudo make install
-- @
--
-- If you are customizing the `configure` step it is important to at least enable shared libraries, OpenGL and Cairo like so:
--
-- @
-- > ./configure --enable-shared --enable-gl
-- @
--
-- If you didn't install FLTK from source you can use the 'fltk-config' tool to ensure that version 1.3.3 is installed:
--
-- @
-- > fltk-config --version
-- 1.3.3
-- @
--
-- Additionally the FLTK headers should be in the include path and, along with
-- the standard FLTK libraries, `fltk_images`, and `fltk_gl`. You will also need
-- the `make`, `autoconf`, and `autoheader` tools to build the Haskell bindings.
--
--
-- The reason we install from source is that some package managers seem to be
-- behind on versions (as of this writing Ubuntu 14.04 is still on 1.3.2) and
-- others put the headers and libraries in a non-standard locations which will
-- cause the Haskell bindings to throw compilation errors.
--
--
-- == Download & Install the FLTKHS Hello World Skeleton
-- === Downloading Without Git
-- If 'git' is not installed download the latest version of the fltkhs-hello-world application skeleton from <https://github.com/deech/fltkhs-hello-world/archive/master.tar.gz here>
--
-- Rename it:
--
-- @
-- > mv fltkhs-hello-world-master.tar.gz fltkhs-hello-world.tar.gz
-- @
--
--
-- Extract and enter the archive:
--
-- @
-- > tar -zxvf fltkhs-hello-world.tar.gz
-- @
--
-- === Downloading With Git
-- If 'git' is available:
--
-- @
-- > git clone http://github.com/deech/fltkhs-hello-world
-- @
--
-- === Building
-- Build it with Stack:
--
-- @
-- > cd fltkhs-hello-world
-- > stack setup
-- > stack install
-- @
--
-- __Note:__ If the `install` step produces a flood of `undefined reference` errors
-- please ensure that you have the right version of FLTK (1.3.3) installed and
-- that the headers are in the expected locations. It seems as though some
-- package managers put the libraries and headers in non-standard places so it
-- is best to build from source.
--
-- == Verify The Install
-- Test that the build completed successfully by invoking incredibly unimpressive
--
-- @
-- > stack exec fltkhs-hello-world
-- @
--

-- $InstallationMac
-- Unfortunately Mac version older than El Capitan and Yosemite are not supported.
--
-- The general steps are:
--
-- - Brew Install Stack
-- - Brew Install FLTK-1.3.3 (Yosemite)
-- - Brew Install FLTK-1.3.3 (El Capitan)
-- - Download & install the <https://github.com/deech/fltkhs-hello-world/archive/master.tar.gz FLTKHS hello world skeleton>
-- - Verify the install by running `fltkhs-hello-world`
--
-- == Brew Install Stack
-- This should be as simple as:
--
-- @
-- > brew install haskell-stack
-- @
--
-- == Brew Install FLTK-1.3.3 (Yosemite)
--
-- @
-- > brew install autoconf
-- > brew install fltk
-- @
--
-- Unfortunately 'autoconf' is required to build FLTKHS but has been removed
-- for the default XCode install since Yosemite so it is required here.
--
-- == Brew Install FLTK-1.3.3 (El Capitan)
--
-- @
-- > brew install --devel fltk
-- @
-- Unfortunately the version of Clang bundled with El Capitan does not compile the stable FLTK-1.3.3.
-- This installs the as-yet unreleased development version. Although FLTKHS only support 1.3.3
-- it seems to work.
--
-- == Download & Install the FLTKHS Hello World Skeleton
-- === Downloading Without Git
-- If 'git' is not installed download the latest version of the fltkhs-hello-world application skeleton from <https://github.com/deech/fltkhs-hello-world/archive/master.tar.gz here>
--
-- Rename it:
--
-- @
-- > cd \/Users\/\<username\>/Downloads\/
-- > mv fltkhs-hello-world-master.tar.gz fltkhs-hello-world.tar.gz
-- @
--
--
-- Extract the archive:
--
-- @
-- > tar -zxvf fltkhs-hello-world.tar.gz
-- @
--
-- === Downloading With Git
-- If 'git' is available:
--
-- @
-- > git clone http://github.com/deech/fltkhs-hello-world
-- @
--
-- === Building
-- Build it with Stack:
--
-- @
-- > cd fltkhs-hello-world
-- > stack setup
-- > stack install
-- @
--
-- == Verify The Install
-- Test that the build completed successfully by invoking incredibly unimpressive
--
-- @
-- > stack exec fltkhs-hello-world
-- @
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
--  - Install <http://repo.msys2.org/distrib/x86_64/msys2-x86_64-20150916.exe MSYS2>
--  - Install <http://www.cmake.org/files/v3.2/cmake-3.2.1-win32-x86.exe CMake>
--  - Install 'make' via MSYS2.
--  - Install <https://www.stackage.org/stack/windows-x86_64-installer Stack>
--  - Download the <https://github.com/deech/fltkhs-hello-world/archive/master.tar.gz FLTKHS hello world skeleton>
--  - Download & compile <http://www.fltk.org/software.php?VERSION=1.3.3&FILE=fltk/1.3.3/fltk-1.3.3-source.tar.gz FLTK 1.3.3>
--  - Build & install the FLTKHS hello world skeleton project.
--  - Verify the install by running `fltkhs-hello-world`
--
-- This install process is certainly not smooth and there are a number of steps
-- that the user find mysterious and wonder why it is necessary. Each step below
-- starts off with the instructions, followed by a sentence or two that explains
-- why it is necessary.
--
-- == Install MSYS2
-- MSYS2 installers are available
-- <http://repo.msys2.org/distrib/x86_64/msys2-x86_64-20150916.exe here>. Just
-- clicking through the installer wizard should be sufficient.
--
-- MSYS2 provides a much nicer development environment compared to the standard
-- Windows CMD prompt. Additionally the install process needs some tools that are
-- easy to install via 'pacman', the package manager that ships with MSYS2.
--
-- == Install CMake
-- Simply click through the
-- <http://www.cmake.org/files/v3.2/cmake-3.2.1-win32-x86.exe CMake> installer with
-- the default options. Once this process is complete the `cmake` executable should
-- be available at the MSYS2 prompt:
--
-- @
-- > cmake --version
-- cmake version 3.2.1
-- @
--
-- On Windows, CMake is used to generate Makefiles. Yes, CMake is available via
-- 'pacman' but unfortunately that version (as of this writing) does not have the
-- "MSYS Makefiles" generator required by the install process.
--
-- == Install GNU Make
-- The following should just work at the MSYS prompt:
--
-- @
-- > pacman -S make
-- @
--
-- GNU Make is required to build both FLTK and the C files in this package.
--
-- == Install Stack
-- The default installation of
-- <https://www.stackage.org/stack/windows-x86_64-installer Stack> should also just
-- work.
--
-- == Download the FLTKHS Hello World Skeleton
-- The latest version of the skeleton is available
-- <https://github.com/deech/fltkhs-hello-world/archive/master.tar.gz here>.
--
-- Extract it via MSYS as follows:
--
-- @
-- > pacman -S tar
-- > pacman -S gzip
-- > cd \<your-download-location\> # This is usually \/C\/Users/\<username\>\/Downloads
-- > tar -zxvf master.tar.gz
-- > mv fltkhs-hello-world-master fltkhs-hello-world
-- @
--
-- There should now be a directory called 'fltkhs-hello-world' in the current
-- directory. We will need the path to this directory for the next step.
--
-- Why is a skeleton project necessary? In the 'stack' world simply installing a
-- library globally does not work since each package is pinned down to a resolver,
-- GHC version etc. So in order to build this package we need to build and install
-- a package that depends on it. This skeleton is also the preferred way to get
-- started with a plain FLKTHS project, so two birds with one stone and all that ...
--
--
-- == Download & compile FLTK-1.3.3
-- Please make sure to only download version
-- <http://www.fltk.org/software.php?VERSION=1.3.3&FILE=fltk/1.3.3/fltk-1.3.3-source.tar.gz FLTK 1.3.3>.
--
-- If you haven't already installed 'tar' and 'gzip' at the MSYS prompt do:
--
-- @
-- > pacman -S tar
-- > pacman -S gzip
-- @
--
-- Extract the archive:
--
-- @
-- > cd \<your-download-location\> # This is usually \/C\/Users/\<username\>\/Downloads
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
-- And run `cmake` via `stack`:
--
-- @
-- > STACK_YAML=\<path-to-hello-world-skeleton\>/stack-windows.yaml stack exec cmake -- -DOPTION_BUILD_SHARED_LIBS=On .. -G "MSYS Makefiles"
-- @
--
-- If you are confused about the 'STACK_YAML' environment variable please see the "GHC 7.10.3 And Beyond (Windows Only)" in the "Obstacles" section above.
--
-- Running the rest of the command via 'stack exec' gives 'cmake' access to the C/C++ compilers bundled with GHC.
--
-- Please note the `..` after `-DOPTION_BUILD_SHARED_LIBS=On` in the command.
-- This is important because it tells CMake to build using the CMake specification
-- found in the parent directory.
--
-- Once these steps have been completed you should be able to compile the source:
--
-- @
-- > make
-- @
--
--
-- Each compile step may spit out a scary looking warning about a pointer cast,
-- but this can be safely ignored. In the logic that sets up callbacks, FLTK casts
-- a 'long' argument to a '(void *)'. It can be ignored because it doesn't seem to
-- break anything.
--
-- Compiling and linking on an 8GB machine seems to take about 5-6 minutes.
--
-- Also, the final demo may fail to compile and complain about a symbol being
-- redefined. This is again an issue with MinGW and can be safely ignored.
--
-- Now it is necessary to define the `FLTK_HOME` environment variable so this package knows where to look for header and library files:
--
-- @
-- > export FLTK_HOME=\<path-to-the-FLTK-root-directory\>
-- @
--
-- Why install from scratch? The user might have noticed that 'fltk' is
-- available via 'pacman' and wonder why we are building it ourselves and setting
-- some arbitrary environment variable to point to the location of the headers and
-- libraries. The issue is that for some reason CMake can't see the header files
-- and libraries when installed via 'pacman'. The linker throws weird errors about
-- types being defined in two places. The issue magically disappears when
-- installing from scratch and it's pretty easy to do. It's not ideal and we're
-- working on removing this step but for now this is the workaround.
--
-- == Install this package
--
-- At this point return to the directory containing the skeleton FLTKHS
-- application. If it was left in the 'Downloads' folder this should get back to
-- it:
--
-- @
-- > cd \/C\/Users\/\<username\>\/Downloads\/fltkhs-hello-world
-- @
--
-- Now we can to build it:
--
-- @
-- > STACK_YAML=stack-windows.yaml stack setup
-- > STACK_YAML=stack-windows.yaml stack install
-- @
-- If you are confused about the 'STACK_YAML' environment variable please see the "GHC 7.10.3 And Beyond (Windows Only)" in the "Obstacles" section above.
--
-- __Note__: Installing FLTKHS takes a *long* time, almost 15 minutes on the
-- Windows 7, 8GB RAM test machine. The install will just sit at the `configure`
-- and `build` step with no feedback. This is happening because 1. the MinGW C\/C++
-- compiler are way slower than gcc\/g++ and 2. the C2HS preprocess step seems to
-- take at least 3x as long on Windows. You only have to do this once (hopefully).
-- Please be patient.
--
--
-- == Verify The Install
--
-- If all goes well there should be an incredibly unimpressive executable 'fltkhs-hello-world' in the 'stack' path. It can be invoked like:
--
-- @
-- > STACK_YAML=stack-windows.yaml stack exec fltkhs-hello-world
-- @
-- If you are confused about the 'STACK_YAML' environment variable please see the "GHC 7.10.3 And Beyond (Windows Only)" in the "Obstacles" section above.
--

-- $Demos
--
-- __Update__: As of 0.4.0.7 the <http://github.com/deech/fltkhs-demos FLTKHS demos> and the
-- <http://github.com/deech/fltkhs-fluid-demos FLUID demos> will only be updated on Github.
-- It is a chore to keep the versions of the demos on Hackage in sync with the proper version
-- of <http://hackage.haskell.org/package/fltkhs FLTKHS> and Stack makes them easier
-- to install (and play with ) than with Cabal.
--
-- __Update__: As of version 0.4.0.1 all the demos have been moved to their own
-- package <http://hackage.haskell.org/package/fltkhs-demos fltkhs-demos>. This speeds
-- up installation of this package significantly and also allows the examples to
-- be run interactively with `cabal repl`. This was an issue pre-0.4.0.1 because
-- the REPL needed to link against the C library containing the C++ bindings and
-- was having trouble finding it because it was just created by the Cabal build
-- step but not yet installed. This seems like a better solution than hacking
-- @Setup.hs@ to make the library visible.
--
-- There are currently two sets of FLTKHS demos, the ones that are part of the
-- <http://hackage.haskell.org/package/fltkhs-demos fltkhs-demos> package and ones that
-- show off <http://hackage.haskell.org/package/fltkhs-fluid-demos Fluid>
-- support.
--
-- Please see the README in the <http://hackage.haskell.org/package/fltkhs-demos fltkhs-demos> package for more information.
--

-- $GettingStarted
--
-- It is assumed that by this point the user has successfully installed this
-- library and demos in <http://hackage.haskell.org/package/fltkhs-demos fltkhs-demos> (see
-- above).
--
--
-- = Quick Start
-- The quickest way to get started is to the download the
-- <http://github.com/deech/fltkhs-hello-world FLTKHS project skeleton>. It is a
-- simple `hello-world` program that shows the basics of widget creation and
-- callbacks. The project's Cabal file comes pre-configured with the options
-- necessary to produce a statically-linked executable so a simple 'cabal
-- configure && cabal build' should result in an 'fltkhs-hello-world' executable
-- in the 'dist' directory.
--
-- Other demos that ship with this package show more complicated usage of the API.
--
-- Since the API is a low-level binding, code using it takes on the imperative
-- style of the underlying toolkit. Fortunately it should look pretty familiar
-- to those who have used object-oriented GUI toolkits before.
--
--

-- $APIGuide
--
-- = Guide to the Haddock Docs
--
-- Convenient access to the underlying C++ is achieved using typeclasses and
-- type-level programming to emulate classes and subclasses. This approach makes
-- Haddock very unhappy and the generated documentation is frequently unhelpful.
-- For instance, newcomers to this library are urged not to look at
-- "Graphics.UI.FLTK.LowLevel.Dispatch" or
-- "Graphics.UI.FLTK.LowLevel.Hierarchy". The purpose of this guide is to point
-- users in a more useful direction.
--
--
-- The documentation provided with this API is not yet self-contained and is
-- meant to be used in tandem with the <http://www.fltk.org/doc-1.3/classes.html C++ documentation>.
-- The rest of this document is about how the Haskell
-- functions and datatypes map to the C++ ones.
--
-- == Widget Construction
-- Each widget has its own module all of which are listed
-- below under the __Widgets__ heading . Most modules include a function named
-- `<widgetName>New` that returns a reference to that widget. Although the user
-- does not have to deal with raw pointers directly it might help to understand
-- that this reference is a pointer to a void pointer to a C++ object.
--
-- For instance, 'windowNew' creates a 'Ref' 'Window' which is a pointer to a
-- C++ object of type `Fl_Window`, the FLTK class that knows how to draw,
-- display and handle window events.
--
-- This value of type 'Ref' 'Window' is then passed along to various functions
-- which, transparent to the user, extract the pointer and pass it to the
-- appropriate /Fl_Window/ instance method.
--
-- == Widget Methods
--
-- The Haskell functions that bind to the instance methods of an FLTK class are
-- listed under the __Functions__ heading in that widget's module. It's worth
-- remembering that these type signatures associated with the functions listed
-- under the __Functions__ heading are not the real ones but are artifically
-- generated because they are much more helpful to users. For instance, the
-- actual type of 'activate' exposes all the type level arithmetic required so
-- it can be used by subclasses of 'Widget' but is pretty unhelpful as a
-- reference compared to the artificial type under __Functions__ heading of
-- "Graphics.UI.FLTK.LowLevel.Widget".
--
-- Unfortunately to see this more helpful type signature the poor reader has to
-- navigate to the corresponding widget's module, find the __Functions__ header
-- and scroll down to the desired function. Haddock, unfortunately, does not
-- support anchors that link to a named point in the page. The author is /very/
-- open to ideas on how to make this easier.
--
-- Carrying on the previous example from the __Widget Creation__ section, the
-- methods on a 'Ref' 'Window' widget are documented in
-- "Graphics.UI.FLTK.LowLevel.Window" under __Functions__. Each function takes
-- the 'Ref' 'Window' reference as its first argument followed by whatever else
-- it needs and delegates it appropriately.
--
-- As this is a low-level binding the Haskell functions are kept as close as
-- possible in name and argument list to the underlying C++. This allows users
-- familiar with the FLTK API to use this library with less learning overhead
-- and it lets newcomers to FLTK take advantage of the already extensive
-- <http://www.fltk.org/doc-1.3/classes.html C++ documentation>.
--
-- Functions are named to make it as easy as possible to find the corresponding
-- C++ function, however there are some naming conventions to keep in mind:
--
-- (1) setters and getters are prefixed with /set/ and /get/ respectively. In
-- C++ both have the same name; the setter takes an argument while the getter
-- does not. Since Haskell does not support overloading this convention is used.
--
-- (2) in many cases C++ uses overloading to provide default values to
-- arguments. Since Haskell does not support overloading, these arguments are
-- 'Maybe' types eg. the `hotspot` function in
-- "Graphics.UI.FLTK.LowLevel.Window". In other cases where the common use case
-- leaves the default arguments unspecified the binding provides two functions,
-- a longer less-convenient-to-type one that takes the default argument and a
-- short one that does not eg. `drawBox` and `drawBoxWithBoxtype`, also in
-- "Graphics.UI.FLTK.LowLevel.Window".
--
-- (3) error codes are 'Either' types
--
-- (4) function arguments which are pointers to be filled are not exposed to the
-- API user. For instance, a common C++ idiom is to return a string by taking a
-- pointer to some initialized but empty chunk of memory and filling it up. The
-- corresponding Haskell function just returns a 'String'.
--
--
-- It is hoped that until the documentation becomes more self-sustaining the
-- user can use these heuristics (and the type signatures) along with the
-- official FLTK documentation to "guess" what the binding functions do.
--
-- == Widget Hierarchy
-- Every widget module in the API has a __Hierarchy__ heading that shows all its parents.
--
-- The design of the API makes all the parent functions transparently available
-- to that widget. This is also the reason why the actual type signatures are so
-- complicated requiring the manual generation of artificial type signatures.
--
-- For instance, the __Functions__ section under
-- "Graphics.UI.FLTK.LowLevel.Window" shows that a 'Ref' 'Window' can be passed
-- to /getModal/ to check if the window is modal, but it can also be passed to
-- /children/ in "Graphics.UI.FLTK.LowLevel.Group" which counts up the number of
-- widgets inside the 'Window' and /getX/ in "Graphics.UI.FLTK.LowLevel.Widget"
-- which returns the X coordinate of the 'Window''s top-left hand corner.
--
-- The hierarchy corresponds almost exactly to the underlying C++ class
-- hierarchy so, again, the user is able to take advantage of the
-- <http://www.fltk.org/doc-1.3/classes.html C++ documentation> to use the
-- binding API.
--
-- === Overriding C++ methods
--
-- The binding API provides a /very/ limited form of inheritance by allowing the
-- user to provide Haskell implementations of certain key methods on a small set
-- of classes. Which methods and which classes were determined by original
-- author of this library based on a casual look at FLTK code in the wild and
-- what was required for porting the demoes. If there is a pressing need for
-- more methods or classes, please contact the maintainer.
--
-- When providing custom methods the object constructor is no longer
-- `<widgetName>New` but `<widgetName>Custom`, which, in addition the parameters
-- taken by `<widgetName>New` also takes records of Haskell functions which are
-- then passed to the C++ side.
--
-- Much like a callback, the Haskell functions are passed as function pointers
-- to the C++ side and called whenever the event loop deems appropriate. Unlike
-- callbacks, they can be set only on object instantiation.
--
-- An example of this is "Graphics.UI.FLTK.LowLevel.Widget" which, since it is a
-- base class for most widgets and doesn't have much functionality of its own,
-- only allows custom construction using 'widgetCustom'. This constructor takes
-- a 'CustomWidgetFuncs' datatype which is a record of functions which tells a
-- "Graphics.UI.FLTK.LowLevel.Widget" how to handle events and draw, resize and
-- display itself.
--
-- Again "Graphics.UI.FLTK.LowLevel.Window" can be used a motivating example.
-- Its custom constructor 'windowCustom', in fact, takes two records. A
-- 'CustomWidgetFuncs' which allows the user to override methods in its
-- "Graphics.UI.FLTK.LowLevel.Widget" parent class and also a
-- 'CustomWindowFuncs' record which allows the user to override /flush/, a
-- method on the Window class which tells the window how to force a redraw. For
-- example, the demo /src\/Examples\/doublebuffer.hs/ (which corresponds to the
-- executable 'ftlkhs-doublebuffer') tells both windows how to draw themselves
-- in a Haskell function that uses low-level FLTK drawing routines by overriding
-- the draw function of their "Graphics.UI.FLTK.LowLevel.Widget" parent.
--
-- Every widget that supports customizing also provides a default function
-- record that can be passed to the constructor. For example,
-- "Graphics.UI.FLTK.LowLevel.Widget" provides 'defaultCustomWidgetFuncs' and
-- "Graphics.UI.FLTK.LowLevel.Window" has 'defaultCustomWindowFuncs'. In the
-- demo mentioned above the 'singleWindowCustom' function is given
-- 'defaultCustomWidgetFuncs' but with an overridden 'drawCustom'.
--
-- Another case where customization comes up a lot is when using
-- "Graphics.UI.FLTK.LowLevel.Table" which is a low-level table widget that
-- needs to be told, for example, how to draw its cells. The demo
-- /src\/Examples\/table-simple.hs/ (corresponding to the executable
-- 'fltkhs-table-simple') shows this in action.
--
-- Hopefully the demos just mentioned and others included with this library show
-- that even though customizing is limited it is possible to do a lot.
--
-- Additionally for most customizable functions a widget provides a
-- corresponding function that calls the default C++ implementation as the
-- function name suffixed with \"Super\". For instance, the user can provide a
-- custom implementation of /handle/ on "Graphics.UI.FLTK.LowLevel.Window" via
-- the constructor and every call to /handle/ invokes that implementation, but
-- the user can also call /handleSuper/ to get at the default C++
-- implementation. This comes in handy when the custom function is just setting
-- up variables or logging and wants underlying implementation to take over at
-- some point.
--
-- __Warning__: since calls to the default implementation of the function,
-- /handleSuper/, for example, are available to the widget they are
-- automatically available to all subclasses of the widget. The author
-- acknowledges this is a confusing aspect of the library's design but hopes the
-- benefit of being able to get at the default implementation out-weighs the
-- trap the user might fall into. If this becomes a pervasive problem the author
-- is open to removing this functionality.
--

-- $Compilation
--
-- As described above, the API emulates multiple dispatch using type-level
-- programming, closed type families and typeclasses. While this is makes for a
-- nice API it has also
-- slowed down compilation of executables much more than expected.
--
-- To clarify the time taken to compile the library itself has not changed, but
-- applications that use the library to create executables are taking a lot
-- longer to compile. To further emphasize, there does not appear to be any
-- runtime performance issues. This is only a compile time problem.
--
-- To preserve the user's and the author's sanity a flag `fastCompile` has been
-- introduced to the <http://hackage.haskell.org/package/fltkhs-demos fltkhs-demos> and
-- to the <http://hackage.haskell.org/package/fltkhs-fluid-demos fltkhs-fluid-demos>.
-- This flag which tells the compiler to skip the specialising step when
-- compiling executables, dramatically decreases compile time but also bloats
-- the resulting executable size and probably makes runtime performance much
-- slower. In this package and <http://hackage.haskell.org/package/fltkhs-fluid-demos fltkhs-fluid-demos>
-- it is enabled by default, since the executables are just
-- demos that are not meant to show off performance. To disable this flag, tell
-- Stack to ignore it during the `build` step:
--
-- @
-- > stack build --flag fltkhs-demos:-fastCompile
-- @
--
-- In the <https://github.com/deech/fltkhs-hello-world fltkhs> and the
-- <https://github.com/deech/fltkhs-fluid-hello-world fltkhs-fluid> project
-- skeletons this flag is /disabled/ by default to provide the best runtime
-- performance. To enable the flag for a smoother development workflow, tell
-- Stack to enable it during the `configure` step:
--
-- @
-- > stack build --flag fltkhs-hello-world:fastCompile
-- @

-- $CabalREPLIssues
--
-- The recommended way to load FLTKHS app into GHCi is the use the
-- `stack-repl.yaml` that comes bundled with the
-- <http://github.com/deech/fltkhs-hello-world FLTKHS project skeleton>. The
-- reasons are outlined in the "GHCi (All Users)" subsection of "Obstacles" above.
--
-- The REPL in the skeleton, for example, be run with:
--
-- @
-- > STACK_YAML=stack-repl.yaml stack setup --upgrade-cabal
-- > STACK_YAML=stack-repl.yaml stack ghci fltkhs-hello-world:exe:fltkhs-hello-world
-- @
--
-- The '--upgrade-cabal' flag above tells GHC to use the version in
-- 'stack-repl.yaml' (7.8.4) but upgrade the Cabal to 1.2.2.

-- =File Layout
-- @
-- Root
--   - c-src            -- The C bindings
--   - c-examples       -- demos written using the C bindings (not installed)
--   - src
--     - TestPrograms   -- Haskell test programs
--     - Fluid          -- The Fluid file to Haskell conversion utility
--     - Graphics
--       - UI
--         - FLTK
--           - LowLevel -- Haskell bindings
--   - scripts          -- various helper scripts (probably not interesting to anyone but the original author)
-- @
