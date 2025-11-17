{
  description = "ZMK build environment for Lily58 João";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
    zmk.url = "github:zmkfirmware/zmk";
  };

  outputs = { self, nixpkgs, flake-utils, zmk }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShells.default = pkgs.mkShell {
          name = "zmk";

          buildInputs = [
            pkgs.cmake
            pkgs.gcc
            pkgs.gnumake
            pkgs.ninja
            pkgs.gcc-arm-embedded
            pkgs.dt-toolchain
            pkgs.python3
            pkgs.python3Packages.west
            pkgs.python3Packages.pyelftools
            pkgs.python3Packages.pyyaml
            pkgs.python3Packages.pillow
            pkgs.git
          ];

          shellHook = ''
            echo "ZMK environment loaded!"
          '';
        };
      });
}
