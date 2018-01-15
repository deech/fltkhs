{ nixpkgsPath  ? <nixpkgs> 
, overlays ? []

, compiler ? "default" 

, opengl ? false
, demo   ? true
}:

/* Usage:

A.
    cabal clean
    nix-build shell.nix
    fltkhs-buttons

B.
    nix-shell 
    cabal clean
    cabal configure 
    cabal build
    cabal run fltkhs-buttons

C.
    nix-shell --arg opengl 'true'
    cabal clean
    cabal configure -fopengl
    cabal build
    cabal run fltkhs-example-opengl

*/

/*
This file is written manually, not generated automatically, 
to lift the package's `.cabal` flags into `.nix` flags.
*/

let

  # defaultNixpkgs = import nixpkgsPath {};

  customNixpkgs  = import nixpkgsPath { inherit overlays; };
  # by default:
  #    customNixpkgs = import <nixpkgs> {};

  /*
  $ echo $NIX_PATH
  nixpkgs=/home/sboo/.nix-defexpr/channels/nixpkgs
  */

  inherit (customNixpkgs) pkgs;

  flags = { cabalFlags = { inherit demo opengl; }; };
          # same names/defaults as the `.cabal` flags

  f = import ./default.nix;

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  drv = haskellPackages.callPackage f flags;

in

  if pkgs.lib.inNixShell then drv.env else drv
