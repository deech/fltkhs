{-|
Module: Graphics.UI.FLTK.Theme.Light

A `Light` theme for [FLTKHS](http://hackage.haskell.org/package/fltkhs/docs/Graphics-UI-FLTK-LowLevel-FLTKHS.html).
-}
module Graphics.UI.FLTK.Theme.Light
  (
    -- * Motivation
    --
    -- $Motivation

    -- * Inspiration
    --
    -- $Inspiration

    -- * Installation #Installation#
    --
    -- $Installation

    -- * Getting Started #GettingStarted#
    --
    -- $GettingStarted

    -- * Running In the REPL
    --
    -- $RunningInTheREPL

    -- * Deployment #Deployment#
    --
    -- $Deployment

    -- * Demo #Demo#
    --
    -- $Demo

    -- * What's Missing
    --
    -- $WhatsMissing

    -- * Assets
    --
    -- $ThemeAssets
    module Graphics.UI.FLTK.Theme.Light.Assets,

    -- * Banners
    --
    -- | Some banners
    module Graphics.UI.FLTK.Theme.Light.Misc,

    -- * Themed Widgets
    module Graphics.UI.FLTK.Theme.Light.Browser,
    module Graphics.UI.FLTK.Theme.Light.Button,
    module Graphics.UI.FLTK.Theme.Light.Clock,
    module Graphics.UI.FLTK.Theme.Light.ColorChooser,
    module Graphics.UI.FLTK.Theme.Light.Common,
    module Graphics.UI.FLTK.Theme.Light.Counter,
    module Graphics.UI.FLTK.Theme.Light.Dial,
    module Graphics.UI.FLTK.Theme.Light.Group,
    module Graphics.UI.FLTK.Theme.Light.Input,
    module Graphics.UI.FLTK.Theme.Light.Menu,
    module Graphics.UI.FLTK.Theme.Light.Positioner,
    module Graphics.UI.FLTK.Theme.Light.Progress,
    module Graphics.UI.FLTK.Theme.Light.Slider,
    module Graphics.UI.FLTK.Theme.Light.Spinner,
    module Graphics.UI.FLTK.Theme.Light.Tabs,
    module Graphics.UI.FLTK.Theme.Light.Table,
    module Graphics.UI.FLTK.Theme.Light.TextDisplay,
    module Graphics.UI.FLTK.Theme.Light.TextEditor,
    module Graphics.UI.FLTK.Theme.Light.Tree,
    module Graphics.UI.FLTK.Theme.Light.Valuator,
    module Graphics.UI.FLTK.Theme.Light.Window,
    module Graphics.UI.FLTK.Theme.Light.Wizard,
    -- * Haddock barf
    --
    -- $HaddockBarf
    module Graphics.UI.FLTK.LowLevel.FLTKHS
  )
where
import Graphics.UI.FLTK.LowLevel.FLTKHS hiding
  (
    adjusterNew
  , browserNew
  , buttonNew
  , checkButtonNew
  , choiceNew
  , clockNew
  , colorChooserNew
  , counterNew
  , dialNew
  , doubleWindowNew
  , fileInputNew
  , fileBrowserNew
  , fillDialNew
  , fillSliderNew
  , flcColorChooser
  , groupNew
  , horFillSliderNew
  , horNiceSliderNew
  , horSliderNew
  , horValueSliderNew
  , inputNew
  , lightButtonNew
  , lineDialNew
  , menuButtonNew
  , outputNew
  , positionerNew
  , progressNew
  , returnButtonNew
  , roundButtonNew
  , selectBrowserNew
  , scrolledNew
  , singleWindowNew
  , sliderNew
  , spinnerNew
  , sysMenuBarNew
  , tabsNew
  , tableCustom
  , tableRowNew
  , textDisplayNew
  , textEditorNew
  , toggleButtonNew
  , treeNew
  , valueInputNew
  , valueOutputNew
  , valueSliderNew
  , windowNew
  , wizardNew
  )
import Graphics.UI.FLTK.Theme.Light.Assets
import Graphics.UI.FLTK.Theme.Light.Browser
import Graphics.UI.FLTK.Theme.Light.Button
import Graphics.UI.FLTK.Theme.Light.Clock
import Graphics.UI.FLTK.Theme.Light.ColorChooser
import Graphics.UI.FLTK.Theme.Light.Common
import Graphics.UI.FLTK.Theme.Light.Counter
import Graphics.UI.FLTK.Theme.Light.Dial
import Graphics.UI.FLTK.Theme.Light.Group
import Graphics.UI.FLTK.Theme.Light.Input
import Graphics.UI.FLTK.Theme.Light.Menu
import Graphics.UI.FLTK.Theme.Light.Misc
import Graphics.UI.FLTK.Theme.Light.Positioner
import Graphics.UI.FLTK.Theme.Light.Progress
import Graphics.UI.FLTK.Theme.Light.Slider
import Graphics.UI.FLTK.Theme.Light.Spinner
import Graphics.UI.FLTK.Theme.Light.Tabs
import Graphics.UI.FLTK.Theme.Light.Table
import Graphics.UI.FLTK.Theme.Light.TextDisplay
import Graphics.UI.FLTK.Theme.Light.TextEditor
import Graphics.UI.FLTK.Theme.Light.Tree
import Graphics.UI.FLTK.Theme.Light.Valuator
import Graphics.UI.FLTK.Theme.Light.Window
import Graphics.UI.FLTK.Theme.Light.Wizard

-- $Motivation
-- This package tries to make it easy to write nice consistent-looking
-- [FLTKHS](http://hackage.haskell.org/package/fltkhs-0.5.4.5/docs/Graphics-UI-FLTK-LowLevel-FLTKHS.html)
-- applications by providing drop-in light themed replacement widgets to the
-- standard ones with minimal performance and memory overhead. While
-- [FLTK](http://fltk.org) itself has very good performance and memory usage the
-- default look of the widgets is quite dated; this package aims to bridge that
-- gap by providing a more modern interface while retaining the responsiveness.
--
-- NOTE: This is not a theme in the same sense as CSS; the look is achieved
-- simply providing a custom drawing routine for each widget.

-- $Inspiration
-- The Light theme is massively indebted to and steals shamelessly from the
-- excellent [Qooxdoo](http://qooxdoo.org) project which manages to create a
-- [very slick](http://www.qooxdoo.org/current/widgetbrowser/) interface which
-- is at the same time production-grade /and/ easy to understand and use.

-- $GettingStarted
-- The underlying widget API has not been touched so all of the existing
-- [FLTK](http://www.fltk.org/doc-1.4/index.html) and
-- [FLTKHS](http://hackage.haskell.org/package/fltkhs-0.5.4.5/docs/Graphics-UI-FLTK-LowLevel-FLTKHS.html)
-- documentation still applies which makes switching over from an existing
-- codebase, not entirely but mostly, frictionless.
--
-- The simplest app skeleton to get started with this theme is as follows:
--
-- @
-- {-\# LANGUAGE ImplicitParams \#-}      -- (1)
-- module Main where
-- ...
-- import Graphics.UI.FLTK.Theme.Light  -- (2)
-- ...
-- main :: IO ()
-- main = do
--   assets <- configureTheme           -- (3)
--   let ?assets = assets               -- (3)
--   ui
--   FL.run
--   FL.flush
--
-- ui :: (?assets :: Assets) => IO ()   -- (4)
-- ui = ...
-- @
--
-- It involves only (1) enabling the /ImplicitParams/ extension, (2) importing
-- this module (3) doing some minor setup before the actual app code and (4)
-- threading the implicit constraint to whatever function uses this theme.
-- "Graphics.UI.FLTK.Theme.Light.Assets#AssetsDescriptionAndUsage" has more information.
--
-- The /ImplicitParams/ requirement is so that widgets have access to the
-- resources needed by this theme (icons, images, fonts etc.). See
-- "Graphics.UI.FLTK.Theme.Light.Assets#WhyImplicitParams" for more information.

-- $WhatsMissing
-- While most of the widgets and functionality in
-- [FLTKHS](hackage.haskell.org/package/fltkhs/docs/Graphics-UI-FLTK-LowLevel-FLTKHS.html#g:21)
-- have and themed analogs but some do not mostly because, in my view, they don't fit into app
-- development much nowadays and so weren't worth porting. If there's a
-- pressing need let me know.
--
--   * Fill and "Nice" Sliders - here they fallback to the slider provided by the theme.
--   * [FLTK's Pre-Made Modal Dialogs](https://hackage.haskell.org/package/fltkhs/docs/Graphics-UI-FLTK-LowLevel-Ask.html)
--   * [FLTK's Square Clock](https://hackage.haskell.org/package/fltkhs/docs/Graphics-UI-FLTK-LowLevel-Clock.html)
--   * Fluid integration - FLTK ships with [FLUID](https://en.wikipedia.org/wiki/FLUID) GUI builder and the default FLTKHS <http://hackage.haskell.org/package/fltkhs/docs/Graphics-UI-FLTK-LowLevel-FLTKHS.html#g:16 integrates> with it quite well but currently there is no support for using it
--     to create themed apps. This is definitely on the roadmap and should be resolved in the near future.

-- $HaddockBarf
-- There is no reason to read anything below, this module hides the default
-- widgets it overrides and then re-exports what it doesn't. The re-exported
-- module from
-- [FLTKHS](http://hackage.haskell.org/package/fltkhs-0.5.4.5/docs/Graphics-UI-FLTK-LowLevel-FLTKHS.html)
-- in turn re-exports modules from that package. Instead of just showing the
-- exported module as a link Haddock insists on flattening and barfing out all
-- of its contents here. Sorry, didn't know how to get around it.
--

-- $ThemeAssets
-- The resources bundled with the theme, see the module documentation for more information.

-- $Installation
-- Installation follows the same basic procedure as
-- <http://hackage.haskell.org/package/fltkhs/docs/Graphics-UI-FLTK-LowLevel-FLTKHS.html#g:5 FLTKHS>. The only difference is that
-- those instructions use the default [hello world
-- skeleton](https://github.com/deech/fltkhs-hello-world) whereas for themed UIs
-- you'll want the [themed
-- skeleton](https://github.com/deech/fltkhs-light-theme-skeleton), so wherever
-- the original instructions tell you to use the default skeleton use the latter
-- instead. And to run it, instead of:
--
-- @
-- > stack exec fltkhs-hello-world
-- @
--
-- do
--
-- @
-- > stack exec fltkhs-light-theme-skeleton
-- @
--

-- $Deployment
-- This package bundles a lot of local assets, images and especially fonts so
-- deploying a themed application is not as simple as just adding an executable
-- file to your path. To help with this the [skeleton
-- project](https://github.com/deech/fltkhs-light-theme-skeleton) uses the
-- [asset-bundle](http://hackage.haskell.org/package/asset-bundle) package to
-- create a ZIP archive of all the assets the application needs at runtime. The
-- [package
-- docs](http://hackage.haskell.org/package/asset-bundle/docs/Distribution-Simple-AssetBundle.html)
-- have a lot more info but in a nutshell when you build the skeletop app a ZIP
-- archive, @fltkhs-light-theme-skeleton_bundled.zip@, is generated for you
-- and placed deep inside your @.stack-work@ (or @dist-new@ if you're using
-- Cabal) directory. It contains all the assets and a runner script (@run.sh@ on
-- Linux and OSX and @run.bat@ on Windows) which invokes the executable, passes
-- along all command line arguments and sets up the environment so it
-- can find the assets at runtime.

-- $Demo
-- In addition to the [skeleton
-- project](https://github.com/deech/fltkhs-light-theme-skeleton) there is a
-- also a small but steadily growing [showcase
-- app](https://github.com/deech/fltkhs-themes-demo) that gives a better idea of
-- the look-and-feel of this theme. More will be added as time permits.

-- $RunningInTheREPL
-- Assuming you're using the [skeleton project](https://github.com/deech/fltkhs-light-theme-skeleton) getting a GUI running in
-- GHCi is pretty much the same <http://hackage.haskell.org/package/fltkhs/docs/Graphics-UI-FLTK-LowLevel-FLTKHS.html#g:20 FLTKHS> except the command to run the REPL is:
--
-- @
-- stack ghci --flag fltkhs:bundled fltkhs-light-theme-skeleton:exe:fltkhs-light-theme-skeleton
-- @
