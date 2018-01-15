{ nixpkgs ? import <nixpkgs> {}
, compiler ? "default" 
, bundled ? false  
, opengl ? false   
}:

let

  inherit (nixpkgs) pkgs;

  f = import ./default.nix;
  ps = { inherit bundled opengl; };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  drv = haskellPackages.callPackage f ps;

in

  if pkgs.lib.inNixShell then drv.env else drv
