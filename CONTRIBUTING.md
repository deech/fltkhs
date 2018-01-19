# CONTRIBUTING

(this file is a work-in-progress)

if you know `Nix`, any help would be great.

## Nix 

Currently, the nix file (`default.nix`) is non-standard, 
i.e. not automatically generated from `cabal2nix`. Ideally, 
all information can be specified from the `.cabal`, with an
optional `.nix` wrapper to passthrough the configuration arguments 
(`bundled` and `opengl`). 

FWIW, it's been tested on:

* the latest `nixpkgs-unstable` (Jan 2018),
* Ubuntu LTS 14.04
* `GHC` 8.2.2 
* `cabal-install` (i.e. `Cabal`) 2.0.0.1

On Linux, `fltk` uses `mesa` (for OpenGL only) and `libjpeg` (for JPEG). 
The build script calls `fltk-config` and `autoconf`. 

It's been successfully tested with the default flags:

    nix-build shell.nix 
    fltkhs-buttons

and with the `-fopengl` flag:

    nix-shell shell.nix --arg opengl true
    cabal configure -fopengl
    cabal build
    cabal run fltkhs-example-opengl

