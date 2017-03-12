let
  pkgs = import <nixpkgs> { inherit config; };
  stdenv = pkgs.stdenv;
  config = {
    packageOverrides = pkgs: rec {
      haskellPackages = pkgs.haskellPackages.override {
        overrides = haskellPackagesNew: haskellPackagesOld: rec {
          fltkhs = haskellPackagesNew.callPackage ./fltkhs-derivation.nix {};
        };
      };
    };
  };
in
  rec {
    addLibraryPath = pkgs.runCommand "add C bindings to library path" {} ''
      export LD_LIBRARY_PATH=${fltkhs}/c-lib
      export LIBRARY_PATH=${fltkhs}/c-lib
    '';
    fltkhs = pkgs.haskellPackages.fltkhs;
  }