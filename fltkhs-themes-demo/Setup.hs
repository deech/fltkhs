module Main (main) where

import Distribution.Simple
import Distribution.Simple.Setup
import Distribution.Simple.LocalBuildInfo
import Distribution.PackageDescription
import Distribution.InstalledPackageInfo as InstalledPackageInfo
import qualified Distribution.Simple.AssetBundle as Bundle (postCopy, depsWithData)

main :: IO ()
main = defaultMainWithHooks (simpleUserHooks { postCopy = myPostCopy })

myPostCopy :: Args -> CopyFlags -> PackageDescription -> LocalBuildInfo -> IO ()
myPostCopy args copyFlags pd localBuildInfo = do
  (postCopy simpleUserHooks) args copyFlags pd localBuildInfo
  deps <- Bundle.depsWithData localBuildInfo
  Bundle.postCopy Nothing [] deps args copyFlags pd localBuildInfo
