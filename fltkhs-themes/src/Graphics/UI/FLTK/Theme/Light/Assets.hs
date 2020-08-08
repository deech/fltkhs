{-# LANGUAGE ImplicitParams, ScopedTypeVariables, OverloadedStrings #-}
{-|
Module: Graphics.UI.FLTK.Theme.Assets

A module that allows access to the resources (fonts, images, etc.) bundled with this theme. Clients of this package should not need to directly include this module since @Graphics.UI.FLTK.Theme.Light@ re-exports it.
-}
module Graphics.UI.FLTK.Theme.Light.Assets
  (
    -- * Assets
    -- ** Description & Usage #AssetsDescriptionAndUsage#
    -- $Assets
    --

    -- ** Why ImplicitParams? #WhyImplicitParams#
    --
    -- $WhyImplicitParams
    Assets
  , loadAssets

    -- * Fonts
    --
    -- $Fonts
  , dejaVuSans
  , josefinSlabSemiBold
  , yanoneKaffesatz

    -- * Images
    --
    -- $Images
  , cancelButtonImage
  , downSmallImage
  , forwardImage
  , leftImage
  , okButtonImage
  , returnButtonImage
  , rewindImage
  , rightImage
  , upSmallImage
  )
where
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.FLTKHS
import qualified Data.Text as T
import Data.List
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import qualified Data.ByteString as B
import Control.Exception
import Graphics.UI.Font.Load
import Data.Maybe
import Control.Monad
import Paths_fltkhs_themes
import Control.Applicative

-- | An opaque type that contains all of the resources needed by this theme.
-- Getting to the resources requires threading something of the type as an implicit
-- parameter to the accessors below, eg. 'dejaVuSans'.
data Assets =
  Assets
  {
    _dejaVuSans :: Font
  , _yanoneKaffesatz :: Font
  , _josefinSlabSemiBold :: Font
  , _returnButtonImage :: Ref PNGImage
  , _okButtonImage :: Ref PNGImage
  , _cancelButtonImage :: Ref PNGImage
  , _downSmallImage :: Ref PNGImage
  , _upSmallImage :: Ref PNGImage
  , _forwardImage :: Ref PNGImage
  , _rewindImage :: Ref PNGImage
  , _leftImage :: Ref PNGImage
  , _rightImage :: Ref PNGImage
  } deriving Show

-- | The [standard font](https://www.fontsquirrel.com/fonts/dejavu-sans) used for most labels, titles, output etc.
dejaVuSans :: (?assets :: Assets) => Font
dejaVuSans = _dejaVuSans ?assets

-- | Currently unused but a [nice font](https://www.yanone.de/fonts/kaffeesatz/) around for the future ...
yanoneKaffesatz :: (?assets :: Assets) => Font
yanoneKaffesatz = _yanoneKaffesatz ?assets

-- | A nice [banner font](https://www.fontsquirrel.com/fonts/josefin-slab).
josefinSlabSemiBold :: (?assets :: Assets) => Font
josefinSlabSemiBold = _josefinSlabSemiBold ?assets

-- | <<doc/images/return-image-example.png>>
returnButtonImage :: (?assets :: Assets) => Ref PNGImage
returnButtonImage = _returnButtonImage ?assets

-- | <<doc/images/ok-button-example.png>>
okButtonImage :: (?assets :: Assets) => Ref PNGImage
okButtonImage = _okButtonImage ?assets
-- | <<doc/images/cancel-button-example.png>>
cancelButtonImage :: (?assets :: Assets) => Ref PNGImage
cancelButtonImage = _cancelButtonImage ?assets
-- | The down arrow.
--
-- <<doc/images/small-up-down-arrow-example.png>>
downSmallImage :: (?assets :: Assets) => Ref PNGImage
downSmallImage = _downSmallImage ?assets
-- | The up arrow.
--
-- <<doc/images/small-up-down-arrow-example.png>>
upSmallImage :: (?assets :: Assets) => Ref PNGImage
upSmallImage = _upSmallImage ?assets
-- | <<doc/images/forward-image-example.png>>
forwardImage :: (?assets :: Assets) => Ref PNGImage
forwardImage = _forwardImage ?assets
-- | <<doc/images/rewind-image-example.png>>
rewindImage :: (?assets :: Assets) => Ref PNGImage
rewindImage = _rewindImage ?assets
-- | <<doc/images/left-image-example.png>>
leftImage :: (?assets :: Assets) => Ref PNGImage
leftImage = _leftImage ?assets
-- | <<doc/images/right-image-example.png>>
rightImage :: (?assets :: Assets) => Ref PNGImage
rightImage = _rightImage ?assets

fonts :: [FilePath]
fonts =
  [
    "fonts/DejaVuSans.ttf"
  , "fonts/YanoneKaffeesatz-Regular.ttf"
  , "fonts/JosefinSlab-SemiBold.ttf"
  ]

fontNames :: [T.Text]
fontNames =
  [
    "DejaVu Sans"
  , "Yanone Kaffeesatz Regular"
  , "Josefin Slab SemiBold"
  ]

imagePaths :: [FilePath]
imagePaths =
  [
    "images/dialog-ok.png"
  , "images/dialog-apply.png"
  , "images/dialog-cancel.png"
  , "images/down-small.png"
  , "images/up-small.png"
  , "images/forward.png"
  , "images/rewind.png"
  , "images/left.png"
  , "images/right.png"
  ]

-- | Used at app start time to load the resources of this theme into memory.
-- This should never be called directly, but through
-- 'Graphics.UI.FLTK.Theme.Light.Common.configureTheme' which does some other
-- setup.
loadAssets :: IO Assets
loadAssets = do
  fontPaths <- mapM getDataFileName fonts
  loaded <- mapM loadFont fontPaths
  let errors = catMaybes (Data.List.map (\p -> case p of { Left err -> Just err; _ -> Nothing}) loaded)
  when (not (Data.List.null errors))
    (ioError (userError ("loadAssets (fatal error): unable to load font assets for the Light theme:\n" ++
                        (Data.List.concat (Data.List.intersperse "\n" errors)))))
  ips <- mapM getDataFileName imagePaths
  images <- mapM
              (\p -> do
                  bytes <- B.readFile p `catch`
                            (\(_ :: SomeException) -> ioError
                                 (userError ("loadAssets (fatal error): image does not exist at path: " ++ p)))
                  iE <- pngImageNewWithData (T.pack "") bytes
                  case iE of
                    Left _ -> ioError (userError ("loadAssets (fatal error): unable to read image data into a PNGImage:\n" ++ p))
                    Right i -> return i)
              ips
  numFaces <- FL.setFonts Nothing
  let fonts = Prelude.map Font [0 .. numFaces - 1 ]
  withFaces <- mapM
               (
                  \f -> do
                    (face,_) <- FL.getFontName f
                    return (face,f)
                )
                fonts
  let fontNumbers = catMaybes (Data.List.map (\fName ->
                                                  -- OSX Mojave sees this font as "Josefin Slab SemiBold" while Linux and Windows
                                                  -- see it as "Josefin Slab"
                                                  if (fName == "Josefin Slab SemiBold")
                                                  then (Prelude.lookup fName withFaces) <|> (Prelude.lookup "Josefin Slab" withFaces)
                                                  else Prelude.lookup fName withFaces)
                                             fontNames)
  _ <- FL.setScheme "gtk+"
  let addImages as = as (images !! 0)
                        (images !! 1)
                        (images !! 2)
                        (images !! 3)
                        (images !! 4)
                        (images !! 5)
                        (images !! 6)
                        (images !! 7)
                        (images !! 8)
      assets =
       if (Data.List.length fontNumbers /= Data.List.length fontNames)
          then addImages (Assets helvetica helvetica helvetica )
          else addImages (Assets (fontNumbers !! 0) (fontNumbers !! 1) (fontNumbers !! 2))
  return assets

-- $Assets
-- This module mediates access to fonts, images and whatever other data is needed
-- by this theme. To provide a consistent look-and-feel across platforms the theme
-- bundles whatever it needs and loads them when a user's app is started. The
-- loaded assets should not interfere with any other process thread. For example,
-- when a user's application starts up the 'dejaVuSansMono' font is loaded into the
-- font cache, but it should be isolated to the app's process.
--
--
-- To use the assets in an FLTK app you need to enable the @ImplicitParams@
-- pragma and then pass the 'Assets' implicit constraint to every function that
-- needs the resources:
--
-- @
-- {-\# LANGUAGE ImplicitParams ...\#-}
-- ...
-- myAwesomeUI :: (?assets :: Assets) => ...
-- myAwesomeUI = do
--   ...
--   b <- buttonNew ...
--   setLabelFont b dejaVuSansMono
--   ...
-- @
--
-- For more extensive documentation on how to use assets in the context of a
-- full application see "Graphics.UI.FLTK.Theme.Light#GettingStarted".

-- $WhyImplicitParams
-- [ImplicitParams](https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/glasgow_exts.html#implicit-parameters)
-- is a fairly contentious extension because of how it interacts with
-- [recursion](https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/glasgow_exts.html#implicit-parameters-and-polymorphic-recursion)
-- and the dangers of accidental name-shadowing. The two alternatives are
-- [Reader](http://hackage.haskell.org/package/mtl-2.2.2/docs/Control-Monad-Reader.html)
-- and [reflection](http://hackage.haskell.org/package/reflection). While both
-- are more principled the first requires all UI functions have a 'MonadReader'
-- constraint which makes the API way uglier and harder to use, and the second
-- incurs a dependency on
-- [template-haskell](http://hackage.haskell.org/package/template-haskell) which
-- I also did not want. /ImplicitParams/ are easier to use and have been in GHC
-- since 6.8.1 and since we're just threading through some fonts and images
-- hopefully the downsides won't become a big deal in practice.

-- $Fonts
-- The fonts required by this theme, all are TTF.
