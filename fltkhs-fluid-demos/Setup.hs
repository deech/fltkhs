module Main (main) where

import Distribution.Simple
import Distribution.Simple.PreProcess.Fluid

main :: IO ()
main = defaultMainWithHooks (simpleUserHooks { hookedPreProcessors = [("fl", ppFluidToHaskell)] })
