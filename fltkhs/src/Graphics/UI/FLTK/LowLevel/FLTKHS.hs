module Graphics.UI.FLTK.LowLevel.FLTKHS
       (
         -- * Motivation
         --
         -- $Motivation

         -- * Goals
         --
         -- $Goals

         -- * Look And Feel
         --
         -- $LookAndFeel

         -- * Obstacles
         --
         -- $Obstacles

         -- * Installation #Installation#
         --
         -- $InstallationSummary

         -- ** Build With Bundled FLTK #BundledBuild#

         -- *** Linux & *BSD
         --
         -- $InstallationLinuxBundled

         -- *** Mac (Yosemite, El Capitan, Sierra)
         --
         -- $InstallationMacBundled

         -- *** Windows(7,8,10)(64-bit)
         --
         -- $InstallationWindowsBundled

         -- ** Compile FLTK Yourself #SelfCompilation#

         -- *** Linux & *BSD
         --
         -- $InstallationLinux

         -- *** Mac (Yosemite & El Capitan)
         --
         -- $InstallationMac

         -- *** Windows(7,8,10)(64-bit)
         --
         -- $InstallationWindows10

         -- * Demos
         --
         -- $Demos

         -- * Getting Started
         --
         -- $GettingStarted

         -- * Fluid Support #FluidSupport#
         --
         -- $FluidSupport

         -- * Stack Traces
         --
         -- $StackTrace

         -- * API Guide
         --
         -- ** Guide to the Haddock Docs
         --
         -- $guidetothehaddockdocs

         -- ** Widget Construction
         --
         -- $widgetconstruction
        
         -- ** Widget Methods
         --
         -- $widgetmethods

         -- ** Widget Hierachy
         --
         -- $widgethierarchyguide
      
         -- ** Overriding C++ Methods (Creating Custom Widgets)
         --
         -- $overriding

         -- ** Explicitly Calling Base Class Methods
         --
         -- $explicitbaseclasscalling

         -- ** Overriding the Widget Destructor
         --
         -- $destructors
        
         -- * Slow Compilation Issues
         --
         -- $Compilation

         -- * Running in the REPL #RunningInTheREPL#
         --
         -- $REPL

         -- * Core Types
         module Graphics.UI.FLTK.LowLevel.Fl_Types,
         -- * Widgets
         module Graphics.UI.FLTK.LowLevel.Base.Adjuster,
         module Graphics.UI.FLTK.LowLevel.Adjuster,
         module Graphics.UI.FLTK.LowLevel.Ask,
         module Graphics.UI.FLTK.LowLevel.BMPImage,
         module Graphics.UI.FLTK.LowLevel.Bitmap,
         module Graphics.UI.FLTK.LowLevel.Box,
         module Graphics.UI.FLTK.LowLevel.Base.Browser,
         module Graphics.UI.FLTK.LowLevel.Browser,
         module Graphics.UI.FLTK.LowLevel.Base.Button,
         module Graphics.UI.FLTK.LowLevel.Button,
         module Graphics.UI.FLTK.LowLevel.Base.CheckButton,
         module Graphics.UI.FLTK.LowLevel.CheckButton,
         module Graphics.UI.FLTK.LowLevel.Base.Choice,
         module Graphics.UI.FLTK.LowLevel.Choice,
         module Graphics.UI.FLTK.LowLevel.Base.Clock,
         module Graphics.UI.FLTK.LowLevel.Clock,
         module Graphics.UI.FLTK.LowLevel.Base.ColorChooser,
         module Graphics.UI.FLTK.LowLevel.ColorChooser,
         module Graphics.UI.FLTK.LowLevel.CopySurface,
         module Graphics.UI.FLTK.LowLevel.Base.Counter,
         module Graphics.UI.FLTK.LowLevel.Counter,
         module Graphics.UI.FLTK.LowLevel.Base.Dial,
         module Graphics.UI.FLTK.LowLevel.Dial,
         module Graphics.UI.FLTK.LowLevel.DoubleWindow,
         module Graphics.UI.FLTK.LowLevel.Base.DoubleWindow,
         module Graphics.UI.FLTK.LowLevel.Draw,
         module Graphics.UI.FLTK.LowLevel.Base.FileBrowser,
         module Graphics.UI.FLTK.LowLevel.FileBrowser,
         module Graphics.UI.FLTK.LowLevel.Base.FileInput,
         module Graphics.UI.FLTK.LowLevel.FileInput,
         module Graphics.UI.FLTK.LowLevel.FillDial,
         module Graphics.UI.FLTK.LowLevel.Base.FillSlider,
         module Graphics.UI.FLTK.LowLevel.FillSlider,
         module Graphics.UI.FLTK.LowLevel.GIFImage,
         module Graphics.UI.FLTK.LowLevel.Base.Group,
         module Graphics.UI.FLTK.LowLevel.Group,
         module Graphics.UI.FLTK.LowLevel.Base.HorFillSlider,
         module Graphics.UI.FLTK.LowLevel.HorFillSlider,
         module Graphics.UI.FLTK.LowLevel.Base.HorNiceSlider,
         module Graphics.UI.FLTK.LowLevel.HorNiceSlider,
         module Graphics.UI.FLTK.LowLevel.Base.HorSlider,
         module Graphics.UI.FLTK.LowLevel.HorSlider,
         module Graphics.UI.FLTK.LowLevel.HorValueSlider,
         module Graphics.UI.FLTK.LowLevel.Image,
         module Graphics.UI.FLTK.LowLevel.ImageSurface,
         module Graphics.UI.FLTK.LowLevel.Base.Input,
         module Graphics.UI.FLTK.LowLevel.Input,
         module Graphics.UI.FLTK.LowLevel.JPEGImage,
         module Graphics.UI.FLTK.LowLevel.Base.LightButton,
         module Graphics.UI.FLTK.LowLevel.LightButton,
         module Graphics.UI.FLTK.LowLevel.LineDial,
         module Graphics.UI.FLTK.LowLevel.Base.MenuBar,
         module Graphics.UI.FLTK.LowLevel.MenuBar,
         module Graphics.UI.FLTK.LowLevel.Base.MenuButton,
         module Graphics.UI.FLTK.LowLevel.MenuButton,
         module Graphics.UI.FLTK.LowLevel.Base.MenuItem,
         module Graphics.UI.FLTK.LowLevel.MenuItem,
         module Graphics.UI.FLTK.LowLevel.Base.MenuPrim,
         module Graphics.UI.FLTK.LowLevel.MenuPrim,
         module Graphics.UI.FLTK.LowLevel.MultiLabel,
         module Graphics.UI.FLTK.LowLevel.NativeFileChooser,
         module Graphics.UI.FLTK.LowLevel.Base.NiceSlider,
         module Graphics.UI.FLTK.LowLevel.NiceSlider,
         module Graphics.UI.FLTK.LowLevel.Base.Output,
         module Graphics.UI.FLTK.LowLevel.Output,
         module Graphics.UI.FLTK.LowLevel.OverlayWindow,
         module Graphics.UI.FLTK.LowLevel.Base.OverlayWindow,
         module Graphics.UI.FLTK.LowLevel.PNGImage,
         module Graphics.UI.FLTK.LowLevel.PNMImage,
         module Graphics.UI.FLTK.LowLevel.Base.Pack,
         module Graphics.UI.FLTK.LowLevel.Pack,
         module Graphics.UI.FLTK.LowLevel.Pixmap,
         module Graphics.UI.FLTK.LowLevel.Base.Positioner,
         module Graphics.UI.FLTK.LowLevel.Positioner,
         module Graphics.UI.FLTK.LowLevel.Base.Progress,
         module Graphics.UI.FLTK.LowLevel.Progress,
         module Graphics.UI.FLTK.LowLevel.RGBImage,
         module Graphics.UI.FLTK.LowLevel.Base.RadioLightButton,
         module Graphics.UI.FLTK.LowLevel.RadioLightButton,
         module Graphics.UI.FLTK.LowLevel.Base.RepeatButton,
         module Graphics.UI.FLTK.LowLevel.RepeatButton,
         module Graphics.UI.FLTK.LowLevel.Base.ReturnButton,
         module Graphics.UI.FLTK.LowLevel.ReturnButton,
         module Graphics.UI.FLTK.LowLevel.Base.Roller,
         module Graphics.UI.FLTK.LowLevel.Roller,
         module Graphics.UI.FLTK.LowLevel.Base.RoundButton,
         module Graphics.UI.FLTK.LowLevel.RoundButton,
         module Graphics.UI.FLTK.LowLevel.SVGImage,
         module Graphics.UI.FLTK.LowLevel.Base.Scrollbar,
         module Graphics.UI.FLTK.LowLevel.Scrollbar,
         module Graphics.UI.FLTK.LowLevel.Base.Scrolled,
         module Graphics.UI.FLTK.LowLevel.Scrolled,
         module Graphics.UI.FLTK.LowLevel.SelectBrowser,
         module Graphics.UI.FLTK.LowLevel.Base.SimpleTerminal,
         module Graphics.UI.FLTK.LowLevel.SimpleTerminal,
         module Graphics.UI.FLTK.LowLevel.Base.SingleWindow,
         module Graphics.UI.FLTK.LowLevel.SingleWindow,
         module Graphics.UI.FLTK.LowLevel.Base.Slider,
         module Graphics.UI.FLTK.LowLevel.Slider,
         module Graphics.UI.FLTK.LowLevel.Base.Spinner,
         module Graphics.UI.FLTK.LowLevel.Spinner,
         module Graphics.UI.FLTK.LowLevel.Base.SysMenuBar,
         module Graphics.UI.FLTK.LowLevel.SysMenuBar,
         module Graphics.UI.FLTK.LowLevel.Base.Table,
         module Graphics.UI.FLTK.LowLevel.Table,
         module Graphics.UI.FLTK.LowLevel.Base.TableRow,
         module Graphics.UI.FLTK.LowLevel.TableRow,
         module Graphics.UI.FLTK.LowLevel.Base.Tabs,
         module Graphics.UI.FLTK.LowLevel.Tabs,
         module Graphics.UI.FLTK.LowLevel.TextBuffer,
         module Graphics.UI.FLTK.LowLevel.Base.TextDisplay,
         module Graphics.UI.FLTK.LowLevel.TextDisplay,
         module Graphics.UI.FLTK.LowLevel.Base.TextEditor,
         module Graphics.UI.FLTK.LowLevel.TextEditor,
         module Graphics.UI.FLTK.LowLevel.TextSelection,
         module Graphics.UI.FLTK.LowLevel.Base.Tile,
         module Graphics.UI.FLTK.LowLevel.Tile,
         module Graphics.UI.FLTK.LowLevel.Base.ToggleButton,
         module Graphics.UI.FLTK.LowLevel.ToggleButton,
         module Graphics.UI.FLTK.LowLevel.Tooltip,
         module Graphics.UI.FLTK.LowLevel.Base.Tree,
         module Graphics.UI.FLTK.LowLevel.Tree,
         module Graphics.UI.FLTK.LowLevel.TreeItem,
         module Graphics.UI.FLTK.LowLevel.TreePrefs,
         module Graphics.UI.FLTK.LowLevel.Base.Valuator,
         module Graphics.UI.FLTK.LowLevel.Valuator,
         module Graphics.UI.FLTK.LowLevel.Base.ValueInput,
         module Graphics.UI.FLTK.LowLevel.ValueInput,
         module Graphics.UI.FLTK.LowLevel.Base.ValueOutput,
         module Graphics.UI.FLTK.LowLevel.ValueOutput,
         module Graphics.UI.FLTK.LowLevel.Base.ValueSlider,
         module Graphics.UI.FLTK.LowLevel.ValueSlider,
         module Graphics.UI.FLTK.LowLevel.Widget,
         module Graphics.UI.FLTK.LowLevel.Base.Widget,
         module Graphics.UI.FLTK.LowLevel.Base.Window,
         module Graphics.UI.FLTK.LowLevel.Window,
         module Graphics.UI.FLTK.LowLevel.Base.Wizard,
         module Graphics.UI.FLTK.LowLevel.Wizard,
         module Graphics.UI.FLTK.LowLevel.XBMImage,
         module Graphics.UI.FLTK.LowLevel.XPMImage,
         -- * Machinery for static dispatch
         module Graphics.UI.FLTK.LowLevel.Dispatch,
         -- * Association of widgets and functions
         module Graphics.UI.FLTK.LowLevel.Hierarchy
       )
where
import Graphics.UI.FLTK.LowLevel.Base.Adjuster
import Graphics.UI.FLTK.LowLevel.Adjuster()
import Graphics.UI.FLTK.LowLevel.Ask
import Graphics.UI.FLTK.LowLevel.BMPImage
import Graphics.UI.FLTK.LowLevel.Bitmap
import Graphics.UI.FLTK.LowLevel.Box
import Graphics.UI.FLTK.LowLevel.Base.Browser
import Graphics.UI.FLTK.LowLevel.Browser()
import Graphics.UI.FLTK.LowLevel.Base.Button
import Graphics.UI.FLTK.LowLevel.Button()
import Graphics.UI.FLTK.LowLevel.Base.CheckButton
import Graphics.UI.FLTK.LowLevel.CheckButton()
import Graphics.UI.FLTK.LowLevel.Base.Choice
import Graphics.UI.FLTK.LowLevel.Choice()
import Graphics.UI.FLTK.LowLevel.Base.Clock
import Graphics.UI.FLTK.LowLevel.Clock()
import Graphics.UI.FLTK.LowLevel.Base.ColorChooser
import Graphics.UI.FLTK.LowLevel.ColorChooser()
import Graphics.UI.FLTK.LowLevel.CopySurface
import Graphics.UI.FLTK.LowLevel.Base.Counter
import Graphics.UI.FLTK.LowLevel.Counter()
import Graphics.UI.FLTK.LowLevel.Base.Dial
import Graphics.UI.FLTK.LowLevel.Dial()
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.DoubleWindow()
import Graphics.UI.FLTK.LowLevel.Base.DoubleWindow
import Graphics.UI.FLTK.LowLevel.Draw
import Graphics.UI.FLTK.LowLevel.Base.FileBrowser
import Graphics.UI.FLTK.LowLevel.FileBrowser()
import Graphics.UI.FLTK.LowLevel.Base.FileInput
import Graphics.UI.FLTK.LowLevel.FileInput()
import Graphics.UI.FLTK.LowLevel.FillDial
import Graphics.UI.FLTK.LowLevel.Base.FillSlider
import Graphics.UI.FLTK.LowLevel.FillSlider()
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.GIFImage
import Graphics.UI.FLTK.LowLevel.Base.Group
import Graphics.UI.FLTK.LowLevel.Group()
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Base.HorFillSlider
import Graphics.UI.FLTK.LowLevel.HorFillSlider()
import Graphics.UI.FLTK.LowLevel.Base.HorNiceSlider
import Graphics.UI.FLTK.LowLevel.HorNiceSlider()
import Graphics.UI.FLTK.LowLevel.Base.HorSlider
import Graphics.UI.FLTK.LowLevel.HorSlider()
import Graphics.UI.FLTK.LowLevel.HorValueSlider
import Graphics.UI.FLTK.LowLevel.Image
import Graphics.UI.FLTK.LowLevel.ImageSurface
import Graphics.UI.FLTK.LowLevel.Base.Input
import Graphics.UI.FLTK.LowLevel.Input()
import Graphics.UI.FLTK.LowLevel.JPEGImage
import Graphics.UI.FLTK.LowLevel.Base.LightButton
import Graphics.UI.FLTK.LowLevel.LightButton()
import Graphics.UI.FLTK.LowLevel.LineDial
import Graphics.UI.FLTK.LowLevel.Base.MenuBar
import Graphics.UI.FLTK.LowLevel.MenuBar()
import Graphics.UI.FLTK.LowLevel.Base.MenuButton
import Graphics.UI.FLTK.LowLevel.MenuButton()
import Graphics.UI.FLTK.LowLevel.Base.MenuItem
import Graphics.UI.FLTK.LowLevel.MenuItem()
import Graphics.UI.FLTK.LowLevel.Base.MenuPrim
import Graphics.UI.FLTK.LowLevel.MenuPrim()
import Graphics.UI.FLTK.LowLevel.MultiLabel
import Graphics.UI.FLTK.LowLevel.NativeFileChooser
import Graphics.UI.FLTK.LowLevel.Base.NiceSlider
import Graphics.UI.FLTK.LowLevel.NiceSlider()
import Graphics.UI.FLTK.LowLevel.Base.Output
import Graphics.UI.FLTK.LowLevel.Output()
import Graphics.UI.FLTK.LowLevel.Base.OverlayWindow
import Graphics.UI.FLTK.LowLevel.OverlayWindow()
import Graphics.UI.FLTK.LowLevel.PNGImage
import Graphics.UI.FLTK.LowLevel.PNMImage
import Graphics.UI.FLTK.LowLevel.Base.Pack
import Graphics.UI.FLTK.LowLevel.Pack()
import Graphics.UI.FLTK.LowLevel.Pixmap
import Graphics.UI.FLTK.LowLevel.Base.Positioner
import Graphics.UI.FLTK.LowLevel.Positioner()
import Graphics.UI.FLTK.LowLevel.Base.Progress
import Graphics.UI.FLTK.LowLevel.Progress()
import Graphics.UI.FLTK.LowLevel.RGBImage
import Graphics.UI.FLTK.LowLevel.Base.RadioLightButton
import Graphics.UI.FLTK.LowLevel.RadioLightButton()
import Graphics.UI.FLTK.LowLevel.Base.RepeatButton
import Graphics.UI.FLTK.LowLevel.RepeatButton()
import Graphics.UI.FLTK.LowLevel.Base.ReturnButton
import Graphics.UI.FLTK.LowLevel.ReturnButton()
import Graphics.UI.FLTK.LowLevel.Base.Roller
import Graphics.UI.FLTK.LowLevel.Roller()
import Graphics.UI.FLTK.LowLevel.Base.RoundButton
import Graphics.UI.FLTK.LowLevel.RoundButton()
import Graphics.UI.FLTK.LowLevel.SVGImage
import Graphics.UI.FLTK.LowLevel.Base.Scrollbar
import Graphics.UI.FLTK.LowLevel.Scrollbar()
import Graphics.UI.FLTK.LowLevel.Base.Scrolled
import Graphics.UI.FLTK.LowLevel.Scrolled()
import Graphics.UI.FLTK.LowLevel.SelectBrowser
import Graphics.UI.FLTK.LowLevel.Base.SimpleTerminal
import Graphics.UI.FLTK.LowLevel.SimpleTerminal()
import Graphics.UI.FLTK.LowLevel.Base.SingleWindow
import Graphics.UI.FLTK.LowLevel.SingleWindow()
import Graphics.UI.FLTK.LowLevel.Base.Slider
import Graphics.UI.FLTK.LowLevel.Slider()
import Graphics.UI.FLTK.LowLevel.Base.Spinner
import Graphics.UI.FLTK.LowLevel.Spinner()
import Graphics.UI.FLTK.LowLevel.Base.SysMenuBar
import Graphics.UI.FLTK.LowLevel.SysMenuBar()
import Graphics.UI.FLTK.LowLevel.Base.Table
import Graphics.UI.FLTK.LowLevel.Table()
import Graphics.UI.FLTK.LowLevel.Base.TableRow
import Graphics.UI.FLTK.LowLevel.TableRow()
import Graphics.UI.FLTK.LowLevel.Base.Tabs
import Graphics.UI.FLTK.LowLevel.Tabs()
import Graphics.UI.FLTK.LowLevel.TextBuffer
import Graphics.UI.FLTK.LowLevel.Base.TextDisplay
import Graphics.UI.FLTK.LowLevel.TextDisplay()
import Graphics.UI.FLTK.LowLevel.Base.TextEditor
import Graphics.UI.FLTK.LowLevel.TextEditor()
import Graphics.UI.FLTK.LowLevel.TextSelection()
import Graphics.UI.FLTK.LowLevel.Base.Tile
import Graphics.UI.FLTK.LowLevel.Tile()
import Graphics.UI.FLTK.LowLevel.Base.ToggleButton
import Graphics.UI.FLTK.LowLevel.ToggleButton()
import Graphics.UI.FLTK.LowLevel.Tooltip
import Graphics.UI.FLTK.LowLevel.Base.Tree
import Graphics.UI.FLTK.LowLevel.Tree()
import Graphics.UI.FLTK.LowLevel.TreeItem
import Graphics.UI.FLTK.LowLevel.TreePrefs
import Graphics.UI.FLTK.LowLevel.Base.Valuator
import Graphics.UI.FLTK.LowLevel.Valuator()
import Graphics.UI.FLTK.LowLevel.Base.ValueInput
import Graphics.UI.FLTK.LowLevel.ValueInput()
import Graphics.UI.FLTK.LowLevel.Base.ValueOutput
import Graphics.UI.FLTK.LowLevel.ValueOutput()
import Graphics.UI.FLTK.LowLevel.Base.ValueSlider
import Graphics.UI.FLTK.LowLevel.ValueSlider()
import Graphics.UI.FLTK.LowLevel.Base.Widget
import Graphics.UI.FLTK.LowLevel.Widget()
import Graphics.UI.FLTK.LowLevel.Base.Window
import Graphics.UI.FLTK.LowLevel.Window()
import Graphics.UI.FLTK.LowLevel.Base.Wizard
import Graphics.UI.FLTK.LowLevel.Wizard()
import Graphics.UI.FLTK.LowLevel.XBMImage
import Graphics.UI.FLTK.LowLevel.XPMImage

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
-- I'm also very interested in the user interface renaissance in the programming community,
-- whether the various kinds of functional reactive programming, meta-object protocol UIs,
-- or something like React.js.
--
-- The hope is that a low-cost, hassle-free way of getting a UI up and running
-- without having to deal with browser, authentication, and compilation issues
-- will make it more fun to play around with these great ideas using Haskell.
--
-- == Why a native toolkit?
-- Even in this era of web interfaces, it is still
-- useful to be able to make native apps. They are usually faster and have fewer
-- security issues.
--
-- == Why FLTK?
-- - I chose FLTK because it was small enough that one person could bind the whole thing in an initial
-- pass. Larger toolkits like QT, although much slicker, would require many man-years of effort.
-- - FLTK is quite featureful.
-- - FLTK is mature and maintained. The project is about 20 years old, and I have had good experiences with the community.
-- - FLTK comes with a simple but quite useful GUI builder, <https://en.wikipedia.org/wiki/FLUID Fluid> which is now able to
--   generate Haskell code. See the `Fluid Support` section for more details.
--
-- == What about HsQML\/WxHaskell/Gtk2Hs?
-- These are all great projects and produce really nice UIs, but they all fail
-- at least one of criterion listed under the __Goals__ section below.
--
-- To my knowledge, as of the first quarter of 2019, no other package
-- in the Haskell ecosystem meets all those constraints.
--

-- $Goals
-- The goals of this library are to provide a low-level API to the <http://fltk.org FLTK> that:
--
-- (1) provides full coverage of the toolkit allowing the user to write GUIs in pure Haskell.
-- (2) feels like it has polymorphic dispatch, meaning a single function dispatches to the right implementation based on the type of widget it is given.
-- (3) is /not/ monolithic, meaning new widgets can be incorporated the user's application without needing to recompile this library.
-- (4) is easy to install. This library has a minimum of dependencies and <http://fltk.org FLTK> itself compiles cleanly on most architectures.
--     And now there is a <https://hackage.haskell.org/package/fltkhs/docs/Graphics-UI-FLTK-LowLevel-FLTKHS.html#g:4 bundled option> where Cabal/Stack build FLTK for you behind the scenes.
-- (5) allows the user to produce statically linked binaries with a minimum of external dependencies.
-- (6) includes a lot of <https://github.com/deech/fltkhs-demos complete> <https://github.com/deech/fltkhs-fluid-demos working> demos so that you can get up and running faster.
-- (7) comes with <https://hackage.haskell.org/package/fltkhs/docs/Graphics-UI-FLTK-LowLevel-FLTKHS.html#g:15 GUI builder support> to alleviate the tedium of laying out widgets by hand.
--
-- $FluidSupport
--
-- This package also comes with a utility (fltkhs-fluidtohs) that takes a user
-- interface generated using the <https://en.wikipedia.org/wiki/FLUID Fluid GUI builder>
-- that ships with FLTK and generates Haskell code.
--
-- Now the user can drag and drop widgets into place instead of having to
-- calculate coordinates and sizes by hand. Additionally, arbitrary Haskell code
-- can be inserted into Fluid interfaces, allowing the user to do most of the callback
-- wiring directly from Fluid.
--
-- The quickest way to get started is to download the
-- <https://github.com/deech/fltkhs-fluid-hello-world Fluid/Haskell project template>.
-- The @Setup.hs@ that comes with the skeleton is configured to use
-- the 'fltkhs-fluidtohs' utility to automatically convert any Fluid in 'src'
-- directory into a Haskell module of the same name during the preprocess step.
-- This means using Fluid in a FLTKHS project is as simple as creating a Fluid
-- interface and running 'stack build --flag fltkhs:bundled' or 'stack install --flag fltkhs:bundled'.
--
-- Additionally, the <https://github.com/deech/fltkhs-fluid-demos fltkhs-fluid-demos> package
-- comes with a number of demos that show how Fluid integrates with FLTKS.
--

-- $LookAndFeel
-- Now FLTKHS has a [themes
-- package](https://hackage.haskell.org/package/fltkhs-themes/docs/Graphics-UI-FLTK-Theme-Light.html)
-- which considerably improves look and feel. The documentation for this package
-- still applies because the theme mostly just re-draws widgets to look a little
-- nicer so the fundamentals of the API are not touched.


-- $Obstacles
-- This section attempts to briefly highlight some possible dealbreakers users
-- might want to know about before proceeding. To be clear, building and deploying
-- portable static application binaries works well on all platforms which is why the
-- library is considered usable. And most of these issues are being aggressively
-- addressed but in the interests of full disclosure ...
--
-- == Compile Times
-- Currently a dense app with ~ 160-180 widgets crammed into the same window takes
-- 9-12 seconds to compile with GHC 7.10.3 on a 32GB quad-core machine.
-- The good news is that this is a <https://ghc.haskell.org/trac/ghc/ticket/12506 known issue>.
--
-- $StackTrace
--
-- In a traditional callback-heavy API such as FLTKHS, null pointers happen, which
-- is why FLTKHS supports partial stack traces. All FLTK functions throw an
-- error along with a stack trace when given a null 'Ref'.
--
-- For pre-7.10 GHCs, stack traces will only be shown if the
-- <https://wiki.haskell.org/Debugging#General_usage 'xc'> flag is used when
-- compiling FLTKHS.
--
-- If compiled with GHC > 7.10, a partial stack trace is transparently available
-- to the user. The recently minted
-- <https://hackage.haskell.org/package/base-4.8.1.0/docs/GHC-Stack.html#g:3 'CallStack'>
-- implicit parameter is used to get a trace of the function that
-- made the offending call along with a file name and line number. For
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
-- a button is placed inside a window in the main method, but the first time it is clicked, the callback will delete it and then try
-- to extract the label from the null 'Ref'.
-- The resulting stack trace will look something like:
--
-- @
-- Ref does not exist. ?loc, called at src\/Graphics\/UI\/FLTK\/LowLevel\/Fl_Types.chs:395:58 in fltkh_Cx8029B5VOwKjdT0OwMERC:Graphics.UI.FLTK.LowLevel.Fl_Types
--   toRefPtr, called at src\/Graphics\/UI\/FLTK\/LowLevel\/Fl_Types.chs:403:22 in fltkh_Cx8029B5VOwKjdT0OwMERC:Graphics.UI.FLTK.LowLevel.Fl_Types
--   withRef, called at src\/Graphics\/UI\/FLTK\/LowLevel\/Hierarchy.hs:1652:166 in fltkh_Cx8029B5VOwKjdT0OwMERC:Graphics.UI.FLTK.LowLevel.Hierarchy
--   getLabel, called at src\/Main.hs:11:10 in main:Main
-- @
--
-- It says that the null pointer was originally detected in the library function 'toRefPtr' function, which was called by the library function 'withRef', which
-- was called by 'getLabel' on line 11 of 'src/Main.hs'. Notice, however, that the trace stops there. It does not tell you 'getLabel' was invoked from 'buttonCb'.
-- For a more detailed trace, the 'CallStack' implicit parameter needs to be passed to each function in the chain like:
--
-- @
-- buttonCb :: (?loc :: CallStack) => Ref Button ...
--  ...
-- main :: IO ()
--  ...
-- @
--

-- $InstallationSummary
-- There are two ways to install FLTKHS, building with the bundled build
-- ("Graphics.UI.FLTK.LowLevel.FLTKHS#BundledBuild"), or compiling and
-- installing FLTK from scratch yourself
-- ("Graphics.UI.FLTK.LowLevel.FLTKHS#SelfCompilation"). The bundled way is by
-- far the easiest on all platforms. It is completely self-contained, you don't
-- need any sudo access to your system.
--
-- For now FLTKHS tracks the [1.4 version Github repo](https://github.com/fltk/fltk) instead
-- of the stable releases. The reason is that it's been quite a while the FLTK
-- project cut an official release but the development branch is actually quite
-- stable and has acquired a lot of useful features including HiDPI and SVG
-- support which are exposed via these bindings.
--
-- NOTE: Since we are temporarily using stable releases please don't install FLTK with your package manager.
--
-- $InstallationLinuxBundled
--  The steps are:
--
-- - Make sure to have OpenGL installed if you need it.
-- - Ensure that 'make', 'autoconf' and 'autoheader' are available on your system.
-- - Download & install <http://docs.haskellstack.org/en/stable/README/#how-to-install Stack>.
-- - Download & install the <https://github.com/deech/fltkhs-hello-world/archive/master.tar.gz FLTKHS hello world skeleton>.
-- - Verify the install by running `fltkhs-hello-world`.
--
-- == Download & Install Stack
-- Pick the <http://docs.haskellstack.org/en/stable/README/#how-to-install Stack installer> that matches your distribution and install according to the instructions.
--
-- == Download & Install the FLTKHS Hello World Skeleton
-- === Downloading Without Git
-- If 'git' is not installed, download the latest version of the fltkhs-hello-world application skeleton from <https://github.com/deech/fltkhs-hello-world/archive/master.tar.gz here>.
--
--
-- Extract and rename the archive:
--
-- @
-- > tar -zxvf fltkhs-hello-world-master.tar.gz
-- > mv fltkhs-hello-world-master fltkhs-hello-world
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
-- > stack install --flag fltkhs:bundled
-- or if you need OpenGL support
-- > stack install --flag fltkhs:bundled --flag fltkhs:opengl
-- @
--
-- == Verify The Install
-- Test that the build completed successfully by invoking:
--
-- @
-- > stack exec fltkhs-hello-world
-- @
--
-- You will be greeted by an incredibly boring little window with a button that says "Hello world".
-- If you click it, it will change to "Goodbye world".
--
--
-- $InstallationLinux
--  The steps are:
--
-- - Make sure you have OpenGL installed.
-- - Download & install <http://docs.haskellstack.org/en/stable/README/#how-to-install Stack>.
-- - Download & install <https://github.com/fltk/fltk/archive/master.tar.gz FLTK 1.4>.
-- - Download & install the <https://github.com/deech/fltkhs-hello-world/archive/master.tar.gz FLTKHS hello world skeleton>.
-- - Verify the install by running `fltkhs-hello-world`.
--
-- == Download & Install Stack
-- Pick the <http://docs.haskellstack.org/en/stable/README/#how-to-install Stack installer> that matches your distribution and install according the instructions.
--
-- == Download & Install FLTK-1.4
-- Please make sure to only download version <https://github.com/fltk/fltk/archive/master.tar.gz FLTK 1.4>.
-- It should build and install smoothly with the standard:
--
-- @
-- > ./configure --enable-shared --enable-localjpeg --enable-localzlib --enable-localpng --enable-xft
-- or if you need OpenGL support
-- > ./configure --enable-gl --enable-shared --enable-localjpeg --enable-localzlib --enable-localpng --enable-xft
-- > make
-- > sudo make install
-- @
--
--
-- If you didn't install FLTK from source, you can use the 'fltk-config' tool to ensure that version 1.4 is installed:
--
-- @
-- > fltk-config --version
-- 1.4
-- @
--
-- The FLTK headers should be in the include path, along with
-- the standard FLTK libraries, `fltk_images`, and `fltk_gl`. You will also need
-- the `make`, `autoconf`, and `autoheader` tools to build the Haskell bindings.
--
--
-- The reason we install from source is that some package managers seem to be
-- behind on versions (as of this writing Ubuntu 14.04 is still on 1.3.2) and
-- others put the headers and libraries in nonstandard locations, which will
-- cause the Haskell bindings to throw compilation errors.
--
--
-- == Download & Install the FLTKHS Hello World Skeleton
-- === Downloading Without Git
-- If 'git' is not installed, download the latest version of the `fltkhs-hello-world` application skeleton from <https://github.com/deech/fltkhs-hello-world/archive/master.tar.gz here>.
--
-- Extract and enter the archive:
--
-- @
-- > tar -zxvf fltkhs-hello-world-master.tar.gz
-- > mv fltkhs-hello-world-master fltkhs-hello-world
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
-- or if you need OpenGL support
-- > stack install --flag fltkhs:opengl
-- @
--
-- __Note:__ If the `install` step produces a flood of `undefined reference` errors,
-- please ensure that you have the right version of FLTK (1.4) installed and
-- that the headers are in the expected locations. Some package
-- managers put the libraries and headers in nonstandard places, so it
-- is best to build from source.
--
-- == Verify The Install
-- Test that the build completed successfully by invoking:
--
-- @
-- > stack exec fltkhs-hello-world
-- @
--
-- You will be greeted by an incredibly boring little window with a button that says "Hello world".
-- If you click it, it will change to "Goodbye world."

-- $InstallationMacBundled
-- Mac versions older than El Capitan and Yosemite are not supported.
--
-- The general steps are:
--
-- - Brew Install Stack.
-- - Download & install the <https://github.com/deech/fltkhs-hello-world/archive/master.tar.gz FLTKHS hello world skeleton>.
-- - Verify the install by running `fltkhs-hello-world`.
--
-- == Brew Install Stack
-- This should be as simple as:
--
-- @
-- > brew install haskell-stack
-- @
--
-- == Brew Install Autoconf
-- @
-- > brew install autoconf
-- @
--
--
-- == Download & Install the FLTKHS Hello World Skeleton
-- === Downloading Without Git
-- If 'git' is not installed, download the latest version of the fltkhs-hello-world application skeleton from <https://github.com/deech/fltkhs-hello-world/archive/master.tar.gz here>.
--
-- Extract the archive:
--
-- @
-- > cd \/Users\/\<username\>/Downloads\/
-- > tar -zxvf fltkhs-hello-world-master.tar.gz
-- > mv fltkhs-hello-world-master fltkhs-hello-world
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
-- > stack install --flag fltkhs:bundled
-- or if you need OpenGL support
-- > stack install --flag fltkhs:bundled --flag fltkhs:opengl
-- @
--
-- == Verify The Install
-- Test that the build completed successfully by invoking:
--
-- @
-- > stack exec fltkhs-hello-world
-- @
--
-- You will be greeted by an incredibly boring little window with a button that says "Hello world",
-- if you click it, it will change to "Goodbye world."

-- $InstallationMac
-- Unfortunately Mac versions older than El Capitan and Yosemite are not supported.
--
-- The general steps are:
--
-- - Brew Install Stack.
-- - Download & install the <https://github.com/deech/fltkhs-hello-world/archive/master.tar.gz FLTKHS hello world skeleton>.
-- - Verify the install by running `fltkhs-hello-world`.
--
-- == Brew Install Stack
-- This should be as simple as:
--
-- @
-- > brew install haskell-stack
-- @
--
-- == Brew Install Autoconf
-- @
-- > brew install autoconf
-- @
--
-- == Compile & Install FLTK from Source.
-- The `brew` package for the current stable release of FLTK is broken. Fortunately installing from source is pretty
-- quick and painless.
--
--
-- @
-- > wget https://github.com/fltk/fltk/archive/master.tar.gz
-- > tar -zxf fltk-1.3.4-1-source.tar.gz
-- > cd fltk-master
-- > ./configure --enable-shared --enable-localjpeg --enable-localzlib --enable-localpng --enable-xft
-- or if you need OpenGL support
-- > ./configure --enable-gl --enable-shared --enable-localjpeg --enable-localzlib --enable-localpng --enable-xft
-- > make
-- > sudo make install
-- > fltk-config --version
-- 1.4
-- @
--
-- == Download & Install the FLTKHS Hello World Skeleton
-- === Downloading Without Git
-- If 'git' is not installed, download the latest version of the fltkhs-hello-world application skeleton from <https://github.com/deech/fltkhs-hello-world/archive/master.tar.gz here>.
--
--
-- Extract the archive:
--
-- @
-- > cd \/Users\/\<username\>/Downloads\/
-- > tar -zxvf fltkhs-hello-world-master.tar.gz
-- > mv fltkhs-hello-world-master fltkhs-hello-world
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
-- or if you need OpenGL support
-- > stack install --flag fltkhs:opengl
-- @
--
-- == Verify The Install
-- Test that the build completed successfully by invoking:
--
-- @
-- > stack exec fltkhs-hello-world
-- @
--
-- You will be greeted by an incredibly boring little window with a button that says "Hello world".
-- If you click it, it will change to "Goodbye world".

-- $InstallationWindowsBundled
--
-- This install guide has been tested on a Windows 7, 8 and 10.
--
-- == Install Stack
-- Downloading and following the default instructions for the standard <https://www.stackage.org/stack/windows-x86_64-installer Windows installer> should be enough.
-- If the install succeeded 'stack' should on the PATH. To test run 'cmd.exe' and do:
--
-- @
-- > stack --version
-- @
--
-- Now downloading and setup the latest GHC via 'stack':
--
-- @
-- > stack setup
-- @
--
-- From this point on we can live in the MSYS2 shell that comes with Stack. It is a far superior environment to the command prompt. To open the MSYS2 shell do:
--
-- @
-- > stack exec mintty
-- @
--
-- == Install Necessary Utilities via Pacman
-- In the MSYS2 shell prompt update and upgrade the MSYS2 installation:
--
-- @
-- > pacman -Syy
-- > pacman -Syu
-- @
--
-- ... install packages for download and extracting packages:
--
-- @
-- > pacman -S wget
-- > pacman -S tar
-- > pacman -S unzip
-- > pacman -S zip
-- > pacman -S man
-- @
--
-- ... and building C/C++ programs:
--
-- @
-- > pacman -S autoconf
-- > pacman -S make
-- > pacman -S automake
-- @
--
--
-- == Download And Install The FLTKHS Hello World Skeleton
-- The <https://github.com/deech/fltkhs-hello-world fltkhs-hello-world> skeleton is a simple Hello World GUI which provides the base structure for FLTKHS applications. Please see the 'Demos' section of this document for examples of apps that show off more complex uses of the API.
--
-- @
-- > wget --no-check-certificate https://github.com/deech/fltkhs-hello-world/archive/master.zip
-- > unzip master.zip
-- > mv fltkhs-hello-world-master fltkhs-hello-world
-- > cd fltkhs-hello-world
-- @
--
-- And install with:
--
-- @
-- > stack install --flag fltkhs:bundled
-- or if you need OpenGL support
-- > stack install --flag fltkhs:bundled --flag fltkhs:opengl
-- @
--
-- To test the installation:
--
-- @
-- > stack exec fltkhs-hello-world
-- @
--
-- You will be greeted by an incredibly boring little window with a button that says "Hello world",
-- if you click it, it will change to "Goodbye world."
--
-- == Packaging A Windows Executable
--
-- While the 'fltkhs-hello-world' application is mostly stand-alone the MSYS2 environment bundled with 'stack' seems to require 3 runtime DLLs. The DLLs are bundled with 'stack' so it's easy to zip them up with the executable and deploy. The required DLLs are: 'libstdc++-6.dll', 'libgcc_s_seh-1.dll' and 'libwinpthread-1.dll'.
--
--
--
-- First create the directory that will contain the executable and DLLs:
--
-- @
-- > mkdir \/tmp\/fltkhs-hello-world
-- @
--
-- Copy the executable over to that directory:
--
-- @
-- > cp `which fltkhs-hello-world` \/tmp\/fltkhs-hello-world
-- @
--
-- Copy over the DLLs. They are usually located in '../<ghc-version>/mingw/bin' but to make the process slightly less fragile we specify the directory relative to whatever 'ghc' is currently in 'stack' 's context:
--
-- @
-- > cp `dirname $(which ghc)`..\/mingw\/bin\/libstdc++-6.dll \/tmp\/fltkhs-hello-world
-- > cp `dirname $(which ghc)`..\/mingw\/bin\/libgcc_s_seh-1.dll \/tmp\/fltkhs-hello-world
-- > cp `dirname $(which ghc)`..\/mingw\/bin\/libwinpthread-1.dll \/tmp\/fltkhs-hello-world
-- @
--
-- Zip up archive:
--
-- @
-- > cd /tmp
-- > zip fltkhs-hello-world.zip fltkhs-hello-world/*
-- @
--
-- And that's it! Any Windows 10 user should now be able to extract 'fltkhs-hello-world.zip' and run 'fltkhs-hello-world.exe'.
--

-- $InstallationWindows10
--
-- This install guide has been tested on a Windows 7, 8 and 10.
--
-- == Install Stack
-- Downloading and following the default instructions for the standard <https://www.stackage.org/stack/windows-x86_64-installer Windows installer> should be enough.
-- If the install succeeded 'stack' should on the PATH. To test run 'cmd.exe' and do:
--
-- @
-- > stack --version
-- @
--
-- Now downloading and setup the latest GHC via 'stack':
--
-- @
-- > stack setup
-- @
--
-- From this point on we can live in the MSYS2 shell that comes with Stack. It is a far superior environment to the command prompt. To open the MSYS2 shell do:
--
-- @
-- > stack exec mintty
-- @
--
-- == Install Necessary Utilities via Pacman
-- In the MSYS2 shell prompt update and upgrade the MSYS2 installation:
--
-- @
-- > pacman -Syy
-- > pacmay -Syu
-- @
--
-- ... install packages for download and extracting packages:
--
-- @
-- > pacman -S wget
-- > pacman -S tar
-- > pacman -S unzip
-- > pacman -S zip
-- > pacman -S man
-- @
--
-- ... and building C/C++ programs:
--
-- @
-- > pacman -S autoconf
-- > pacman -S make
-- > pacman -S automake
-- @
--
-- == Download and Install FLTK
--
-- Download the latest stable build of FLTK:
--
-- @
-- > wget --no-check-certificate https://github.com/fltk/fltk/archive/master.tar.gz
-- @
--
-- Untar the FLTK archive and enter the directory:
--
-- @
-- > tar -zxf master.tar.gz
-- > cd fltk-master
-- @
--
-- Configure, make and install:
--
-- @
-- > ./configure --enable-shared --enable-localjpeg --enable-localzlib --enable-localpng --enable-xft
-- or if you need OpenGL support
-- > ./configure --enable-gl --enable-shared --enable-localjpeg --enable-localzlib --enable-localpng --enable-xft
-- > make
-- > make install
-- @
--
-- You can test your installation by running:
--
-- @
-- > fltk-config
-- 1.4
-- @
--
-- == Download And Install The FLTKHS Hello World Skeleton
-- The <https://github.com/deech/fltkhs-hello-world fltkhs-hello-world> skeleton is a simple Hello World GUI which provides the base structure for FLTKHS applications. Please see the 'Demos' section of this document for examples of apps that show off more complex uses of the API.
--
-- @
-- > wget --no-check-certificate https://github.com/deech/fltkhs-hello-world/archive/master.zip
-- > unzip master.zip
-- > mv fltkhs-hello-world-master fltkhs-hello-world
-- > cd fltkhs-hello-world
-- @
--
-- And install with:
--
-- @
-- > stack install
-- or if you need OpenGL support
-- > stack install --flag fltkhs:opengl
-- @
--
-- To test the installation:
--
-- @
-- > stack exec fltkhs-hello-world
-- @
--
-- You will be greeted by an incredibly boring little window with a button that says "Hello world".
-- If you click it, it will change to "Goodbye world".
--
-- == Packaging A Windows Executable #PackagingAWindowsExecutable#
--
-- While the 'fltkhs-hello-world' application can mostly stand alone, the MSYS2 environment bundled with 'stack' seems to require 3 runtime DLLs. The DLLs are bundled with 'stack', so you can zip them up with the executable and deploy. The required DLLs are: 'libstdc++-6.dll', 'libgcc_s_seh-1.dll' and 'libwinpthread-1.dll'.
--
--
--
-- First create the directory that will contain the executable and DLLs:
--
-- @
-- > mkdir \/tmp\/fltkhs-hello-world
-- @
--
-- Copy the executable over to that directory:
--
-- @
-- > cp `which fltkhs-hello-world` \/tmp\/fltkhs-hello-world
-- @
--
-- Copy over the DLLs. They are usually located in '../<ghc-version>/mingw/bin', but to make the process slightly less fragile we specify the directory relative to whatever 'ghc' is currently in Stack's context:
--
-- @
-- > cp `dirname $(which ghc)`..\/mingw\/bin\/libstdc++-6.dll \/tmp\/fltkhs-hello-world
-- > cp `dirname $(which ghc)`..\/mingw\/bin\/libgcc_s_seh-1.dll \/tmp\/fltkhs-hello-world
-- > cp `dirname $(which ghc)`..\/mingw\/bin\/libwinpthread-1.dll \/tmp\/fltkhs-hello-world
-- @
--
-- Zip up the archive:
--
-- @
-- > cd /tmp
-- > zip fltkhs-hello-world.zip fltkhs-hello-world/*
-- @
--
-- And that's it! Any Windows 10 user should now be able to extract 'fltkhs-hello-world.zip' and run 'fltkhs-hello-world.exe'.
--

-- $Demos
--
-- FLTKHS has almost 25 end-to-end demo applications to help you get started. They are
-- split into two sets: those <http://github.com/deech/fltkhs-demos written manually> and those
-- that <http://github.com/deech/fltkhs-fluid-demos show how to use FLUID>.
--
-- The READMEs in the repos have installation instructions, but they assume that you have
-- successfully installed FLTK and the 'fltkhs-hello-world' app (see platform specific instructions above).
--

-- $GettingStarted
--
-- By this point, I assume that you have successfully installed <https://github.com/deech/fltkhs-hello-world hello world>
-- (see above) or one of the <https://github.com/deech/fltkhs-demos demo> <https://github.com/deech/fltkhs-fluid-demos packages>.
--
--
-- = Quick Start
-- The quickest way to get started is to look at the source for the
-- <http://github.com/deech/fltkhs-hello-world FLTKHS project skeleton>. Though it is a
-- simple app, it shows the basics of widget creation and
-- callbacks.
--
-- Other <https://github.com/deech/fltkhs-demos demo> <https://github.com/deech/fltkhs-fluid-demos packages> show more complicated usage of the API.
--
-- Since the API is a low-level binding, code using it takes on the imperative
-- style of the underlying toolkit. Fortunately, it should look pretty familiar
-- to those who have used object-oriented GUI toolkits before.
--
--

-- $guidetothehaddockdocs
--
-- Convenient access to the underlying C++ is achieved using typeclasses and
-- type-level programming to emulate OO classes and multiple dispatch. This approach makes
-- Haddock very unhappy and the generated documentation is frequently unhelpful.
-- For instance, I urge newcomers to this library not to look at
-- "Graphics.UI.FLTK.LowLevel.Dispatch" or
-- "Graphics.UI.FLTK.LowLevel.Hierarchy". The purpose of this guide is to point
-- you in a more useful direction.
--
--
-- The documentation provided with this API is not yet self-contained and is
-- meant to be used in tandem with the <http://www.fltk.org/doc-1.4/classes.html C++ documentation>.
-- The rest of this section is about how the Haskell
-- functions and datatypes map to the C++ ones and how to, in some limited cases, override a C++ function
-- with a Haskell implementations.

-- $widgetconstruction
-- Each widget has its own module, all of which are listed
-- below under the __Widgets__ heading. Most modules include a function named
-- `<widgetName>New` that returns a reference to that widget. Although you
-- do not have to deal with raw pointers directly, it might help to understand
-- that this reference is a pointer to a void pointer to a C++ object.
--
-- For instance, 'windowNew' creates a 'Ref' 'Window', which is a pointer to a
-- C++ object of type <http://www.fltk.org/doc-1.4/classFl__Window.html `Fl_Window`>, the FLTK class that knows how to draw,
-- display, and handle window events.
--
-- This value of type 'Ref' 'Window' is then passed along to various functions
-- which transparently extract the pointer and pass it to the
-- appropriate <http://www.fltk.org/doc-1.4/classFl__Window.html `Fl_Window`> instance method.
--

-- $widgetmethods
--
-- The Haskell functions that bind to the instance methods of an FLTK class are
-- listed under the __Functions__ heading in that widget's module. It's worth
-- remembering that these type signatures associated with the functions listed
-- under the __Functions__ heading are not the real ones but are artifically
-- generated because they are much more helpful to users. For instance, the
-- actual type of 'activate' exposes all the type level arithmetic required so
-- it can be used by subclasses of 'Widget' but is unhelpful as a
-- reference compared to the artificial type under __Functions__ heading of
-- "Graphics.UI.FLTK.LowLevel.Widget".
--
-- Unfortunately to see this more helpful type signature the poor reader has to
-- navigate to the corresponding widget's module, find the __Functions__ header
-- and scroll down to the desired function. Haddock, unfortunately, does not
-- support anchors that link to a named point in the page. I'm /very/
-- open to ideas on how to make this easier.
--
-- Carrying on the previous example from the __Widget Creation__ section, the
-- methods on a 'Ref' 'Window' widget are documented in
-- "Graphics.UI.FLTK.LowLevel.Window" under __Functions__. Each function takes
-- the 'Ref' 'Window' reference as its first argument followed by whatever else
-- it needs and delegates it appropriately.
--
-- As this is a low-level binding, the Haskell functions are kept as close as
-- possible in name and argument list to the underlying C++. This allows users
-- familiar with the FLTK API to use this library with less learning overhead
-- and it lets newcomers to FLTK take advantage of the already extensive
-- <http://www.fltk.org/doc-1.4/classes.html C++ documentation>.
--
-- Functions are named to make it as easy as possible to find the corresponding
-- C++ function, however there are some naming conventions to keep in mind:
--
-- (1) Setters and getters are prefixed with /set/ and /get/ respectively. In
-- C++ both have the same name; the setter takes an argument while the getter
-- does not. Since Haskell does not support overloading, this convention is used.
--
-- (2) In many cases C++ uses overloading to provide default values to
-- arguments. Since Haskell does not support overloading, these arguments are
-- 'Maybe' types, e.g., the `hotspot` function in
-- "Graphics.UI.FLTK.LowLevel.Window". In other cases, where the common use case
-- leaves the default arguments unspecified, the binding provides two functions:
-- a longer less-convenient-to-type one that takes the default argument, and a
-- short one that does not, e.g., `drawBox` and `drawBoxWithBoxtype`, also in
-- "Graphics.UI.FLTK.LowLevel.Window".
--
-- (3) Error codes are 'Either' types.
--
-- (4) Function arguments that are pointers to be filled are not exposed to the
-- API user. For instance, a common C++ idiom is to return a string by taking a
-- pointer to some initialized but empty chunk of memory and filling it up. The
-- corresponding Haskell function just returns a 'Data.Text'.
--
-- (5) Widget destructors can be called explicitly with 'destroy'. The reason it
-- is called 'destroy' instead of 'delete' to match C++ is that it is a mistake
-- and it's too late to change it now.
--
--
-- It is hoped that until the documentation becomes more self-sustaining the
-- user can use these heuristics (and the type signatures) along with the
-- official FLTK documentation to "guess" what the binding functions do.
--


-- $widgethierarchyguide
-- Every widget module in the API has a __Hierarchy__ heading that shows all its parents.
--
-- The design of the API makes all the parent functions transparently available
-- to that widget. This is also the reason why the actual type signatures are so
-- complicated requiring the manual generation of artificial type signatures.
--
-- For instance, the __Functions__ section under
-- "Graphics.UI.FLTK.LowLevel.Window" shows that a 'Ref' 'Window' can be passed
-- to @getModal@ to check if the window is modal, but it can also be passed to
-- @children@ in "Graphics.UI.FLTK.LowLevel.Group" which counts up the number of
-- widgets inside the 'Window' and @getX@ in "Graphics.UI.FLTK.LowLevel.Widget"
-- which returns the X coordinate of the 'Window''s top-left hand corner.
--
-- The hierarchy corresponds almost exactly to the underlying C++ class
-- hierarchy so, again, you should be able to take advantage of the
-- <http://www.fltk.org/doc-1.4/classes.html C++ documentation> to use the
-- binding API.
--

-- $overriding
--
-- The binding API allows a limited but powerful form of "inheritance" allowing
-- users to override certain key FLTK methods with Haskell functions. All GUI
-- elements that derive from the C++ base class
-- <http://www.fltk.org/doc-1.4/classFl__Widget.html Fl_Widget> and the Haskell
-- analog
-- <https://hackage.haskell.org/package/fltkhs/docs/Graphics-UI-FLTK-LowLevel-Base-Widget.html WidgetBase> now allow Haskell
-- <https://hackage.haskell.org/package/fltkhs/docs/Graphics-UI-FLTK-LowLevel-Base-Widget.html#g:2 functions> to be passed at widget construction time that give Haskell
-- complete control over
-- <https://hackage.haskell.org/package/fltkhs/docs/Graphics-UI-FLTK-LowLevel-Base-Widget.html#v:widgetCustom drawing>,
-- <https://hackage.haskell.org/package/fltkhs/docs/Graphics-UI-FLTK-LowLevel-Base-Widget.html#t:CustomWidgetFuncs handling, resizing and other key functions>. This means that the Haskell user
-- can control the look and feel as well as the event loop. The
-- <https://github.com/deech/fltkhs-demos/blob/master/src/Examples/table-as-container.hs#L105 table> demos are an example of drawing in Haskell. An example of taking over
-- the event loop is an FLTKHS <https://github.com/deech/fltkhs-reflex-host proof-of-concept> that
-- <https://github.com/deech/fltkhs-reflex-host/blob/master/src/reflex-host.hs#L33 overrides> the FLTKHS event loop with the
-- <https://hackage.haskell.org/package/reflex Reflex FRP> allowing native
-- functional reactive programming. The sky is the limit!
--
-- When providing custom methods, the object constructor is no longer
-- `<widgetName>New` but `<widgetName>Custom`, which, in addition to the parameters
-- taken by `<widgetName>New` also takes records of Haskell functions which are
-- then passed to the C++ side.
--
-- Much like a callback, the Haskell functions are passed as function pointers
-- to the C++ side and called whenever the event loop deems appropriate. Unlike
-- callbacks, they can be set only on object instantiation.
--
-- An example of this is "Graphics.UI.FLTK.LowLevel.Base.Widget" which, since it is a
-- base class for most widgets and doesn't have much functionality of its own,
-- only allows custom construction using 'widgetCustom'. This constructor takes
-- a 'CustomWidgetFuncs' datatype which is a record of functions which tells a
-- "Graphics.UI.FLTK.LowLevel.Base.Widget" how to handle events and draw, resize and
-- display itself.
--
-- Again "Graphics.UI.FLTK.LowLevel.Base.Window" can be used a motivating example.
-- Its custom constructor 'windowCustom', in fact, takes two records: a
-- 'CustomWidgetFuncs' which allows you to override methods in its
-- "Graphics.UI.FLTK.LowLevel.Base.Widget" parent class, and also a
-- 'CustomWindowFuncs' record which allows you to override @flush@, a
-- method on the Window class which tells the window how to force a redraw. For
-- example, the demo /src\/Examples\/doublebuffer.hs/ (which corresponds to the
-- executable 'ftlkhs-doublebuffer') tells both windows how to draw themselves
-- in a Haskell function that uses low-level FLTK drawing routines by overriding
-- the draw function of their "Graphics.UI.FLTK.LowLevel.Base.Widget" parent.
--
-- Every widget that supports customizing also provides a default function
-- record that can be passed to the constructor. For example,
-- "Graphics.UI.FLTK.LowLevel.Base.Widget" provides 'defaultCustomWidgetFuncs' and
-- "Graphics.UI.FLTK.LowLevel.Base.Window" has 'defaultCustomWindowFuncs'. In the
-- demo mentioned above, the 'singleWindowCustom' function is given
-- 'defaultCustom.WidgetFuncs' but with an overridden 'drawCustom'.
--
-- Another case where customization comes up a lot is when using
-- "Graphics.UI.FLTK.LowLevel.Base.Table" which is a low-level table widget that
-- needs to be told, for example, how to draw its cells. The demo
-- /src\/Examples\/table-simple.hs/ (corresponding to the executable
-- 'fltkhs-table-simple') shows this in action.
--
-- Hopefully the demos just mentioned and others included with this library show
-- that, even though customizing is limited, it is possible to do a lot.

-- $explicitbaseclasscalling
-- A common pattern when overring parent class methods is augment them,
-- some logic followed by an explicit call to the parent method. In C++
-- this is done by explicitly by annotating the call with the parent's class name:
--
-- @
-- void Child::f() {
--   ... some code
--   Parent::f();
-- }
-- @
--
-- In this binding the widget methods that can be overridden have a corresponding
-- explict call to the parent class method in that widget's module. For example,
-- the <https://www.fltk.org/doc-1.4/classFl__Widget.html#a9cb17cc092697dfd05a3fab55856d218 handle> method
-- can be overridden by <https://hackage.haskell.org/package/fltkhs/docs/Graphics-UI-FLTK-LowLevel-Base-Widget.html#t:CustomWidgetFuncs handleCustom>
-- but you can still call the base class 'handle' with <https://hackage.haskell.org/package/fltkhs/Graphics-UI-FLTK-LowLevel-Base-Widget.html#v:handleWidgetBase handleWidgetBase> so
-- a custom handler that just prints console when a widget is minimized but delegates to the parent for all other events could look something like:
--
-- @
-- myHandle :: Ref Widget -> Event -> IO (Either UnknownEvent ())
-- myHandle w e = do
--   case e of
--     Hide -> print "widget has been hidden"
--     _ -> return ()
--   handleWidgetBase (safeCast w) e
-- @
--
-- The 'safeCast' is needed to explicitly cast a widget to it's parent, in this case casting 'Widget' to 'WidgetBase'.
-- The cast is safe because it is statically restricted to only classes in the hierarchy.
--

-- $destructors
-- Most of the <https://hackage.haskell.org/package/fltkhs/docs/Graphics-UI-FLTK-LowLevel-Base-Widget.html#t:CustomWidgetFuncs overrideable methods> correspond to
-- some method in FLTK. <https://hackage.haskell.org/package/fltkhs/docs/Graphics-UI-FLTK-LowLevel-Base-Widget.html#t:CustomWidgetFuncs resizeCustom>, for instance
-- overrides <https://www.fltk.org/doc-1.4/classFl__Widget.html#aca98267e7a9b94f699ebd27d9f59e8bb resize>, but 'destroyCallbacksCustom' does not. This function is called
-- in the widget's C++ destructor and can be used for any Haskell side clean up but exists specifically to release function pointers given to the C++ side by the GHC runtime.
-- This is necessary because any resources closed over by the Haskell function to which we generate a pointer are ignored by the garbage collector until that pointer is
-- explicitly freed. Over time this could cause significant memory bloat. Normally the binding does this for you freeing callbacks set with 'setCallback' and the overriding functions
-- themselves but occasionally there are function pointers the binding does not know about.
--
-- For example <https://hackage.haskell.org/package/fltkhs/Graphics-UI-FLTK-LowLevel-FL.html#v:addTimeout adding a timer>
-- entails passing in a function pointer to a closure that will be invoked at at some specified frequency but the binding has no idea when that needs to be cleaned up
-- so that becomes your responsibility. A custom 'destroyCallbacksCustom' might look something like:
--
-- @
-- myDestroyCallbacks :: FunPtr (IO ()) -> Ref Widget -> [Maybe (FunPtr (IO ())] -> IO ()
-- myDestroyCallbacks myFunptr w cbs = do
--   freeHaskellFunPtr myFunPtr
--   defaultDestroyWidgetCallbacks w cbs
-- @
--
-- The function takes 'myFunPtr', a pointer to the timer's closure, and a widget 'w' and that widget's associated callbacks,  'myFunPtr' is then freed with 'freeHaskellFunPtr'
-- and control passes to 'defaultDestroyWidgetCallbacks' which frees the rest of them. Passing control to 'defaultDestroyWidgetCallbacks' is critical otherwise those callbacks
-- will never be freed.
--

-- $Compilation
--
-- As described above, the API emulates multiple dispatch using type-level
-- programming, closed type families, and typeclasses. While this makes for a
-- nice API, it has also
-- slowed down compilation of executables much more than expected.
--
-- To clarify, the time taken to compile the library itself has not changed, but
-- applications that use the library to create executables are taking a lot
-- longer to compile. To further emphasize, there do not appear to be any
-- runtime performance issues. This is only a compile time problem.
--
-- To preserve your and my sanity, a flag `fastCompile` has been
-- introduced to the <https://github.com/deech/fltkhs-hello-world skeleton>, the <https://github.com/deech/fltkhs-fluid-hello-world projects>, the <https://github.com/deech/fltkhs-demos fltkhs-demos>, and
-- the <https://github.com/deech/fltkhs-fluid-demos fltkhs-fluid-demos>.
-- This flag, which tells the compiler to skip some steps when
-- compiling executables, dramatically decreases compile time but also bloats
-- the resulting executable size and probably makes runtime performance much
-- slower. In this package and <https://github.com/deech/fltkhs-fluid-demos fltkhs-fluid-demos>
-- it is enabled by default since the executables are
-- demos that are not meant to show off performance. To disable this flag, tell
-- Stack to ignore it during the `build` step:
--
-- @
-- > stack build --flag fltkhs:bundled --flag fltkhs-demos:-fastCompile
-- @
--
-- In the <https://github.com/deech/fltkhs-hello-world fltkhs> and the
-- <https://github.com/deech/fltkhs-fluid-hello-world fltkhs-fluid> project
-- skeletons, this flag is /disabled/ by default to provide the best runtime
-- performance. To enable the flag for a smoother development workflow, tell
-- Stack to enable it during the `configure` step:
--
-- @
-- > stack build --flag fltkhs:bundled --flag fltkhs-hello-world:fastCompile
-- @
--
-- =File Layout
-- @
-- Root
--   - c-src                 -- The C bindings
--   - c-examples            -- demos written using the C bindings (not installed)
--   - fltk-\<version\>.tar.gz -- The bundled FLTK library
--   - src
--     - TestPrograms        -- Haskell test programs
--     - Fluid               -- The Fluid file to Haskell conversion utility
--     - Graphics
--       - UI
--         - FLTK
--           - LowLevel      -- Haskell bindings
--   - scripts               -- various helper scripts (probably not interesting to anyone but myself)
-- @

-- $REPL
-- Running GUIs in GHCi is fully supported. Using the <https://github.com/deech/fltkhs-hello-world hello world skeleton> as
-- an example the following steps will run it in the REPL:
--
-- @
-- > git clone http://github.com/deech/fltkhs-hello-world
-- > cd fltkhs-hello-world
-- > stack build --flag fltkhs:bundled
-- > stack ghci --flag fltkhs:bundled fltkhs-hello-world:exe:fltkhs-hello-world
-- [1 of 1] Compiling Main ...
-- Ok, modules loaded: Main ...
-- Loaded GHCi configuration ...
-- Prelude Main> replMain
-- @
--
-- Unfortunately since FLTKHS is hybrid Haskell/C++ there are limitations compared to
-- running a normal Haskell library on the REPL:
--
--    1. The 'stack build ...' is an essential first step before running 'stack
--       ghci ...'. The reason is the REPL uses '-fobject-code' to link in all the C++
--       libraries which must be built first.
--    2. The use of 'replMain' instead of just ':main' as you might expect. This
--       is because
--
--            (1) it allows closing the GUI to correctly return control to
--                the REPL prompt and
--            (2) typing 'Ctrl-C' also correctly hands control back to the REPL.
--
--       With just ':main' (1) works but (2) results in a "ghosted" UI where the
--       GUI window is still visible but unable to accept any keyboard/mouse
--       input. The reason for the ghosted GUI is that ':main' delegates to the
--       FLTK C++ event loop which is unable to listen for user interrupts on
--       the Haskell side and so has no way of knowing that it should destroy
--       itself.'replMain' emulates the event loop on the Haskell side allowing
--       it to stop, clean up and return control when it 'catch'es a
--       'UserInterrupt'. Thus the 'replMain' is slower than the optimized C++
--       event loop but hopefully that's not too big an impediment for REPL
--       work.
