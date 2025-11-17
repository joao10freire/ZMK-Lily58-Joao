{
  description = "ZMK build flake for Lily58 Joao";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    zmk.url = "github:zmkfirmware/zmk";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, zmk, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShells.zmk = pkgs.mkShell {
          buildInputs = [
            pkgs.python3 pkgs.cmake pkgs.gcc pkgs.gnumake pkgs.ninja pkgs.git pkgs.west pkgs.openocd
          ];
          shellHook = ''
            echo "ZMK devShell ready (minimal). Use 'west' to init/build"
          '';
        };
      });
}
