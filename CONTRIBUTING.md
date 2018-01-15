# CONTRIBUTING

(this file is a work-in-progress)

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

`fltk` uses `mesa` (for OpenGL only) and `libjpeg` (for JPEG). 

the example executable has been successfully tested with the default flags:

    nix-build shell.nix 
    fltkhs-buttons

... since it doesn't need OpenGL. 
unfortunately, this doesn't work, but it should:

    nix-shell shell.nix --arg opengl true
    cabal configure -fopengl
    # ^^^ fails
    cabal build
    cabal run fltkhs-buttons

