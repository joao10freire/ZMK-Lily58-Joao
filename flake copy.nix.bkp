{
  description = "ZMK build environment for Lily58 João";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";

    zmk = {
      url = "github:zmkfirmware/zmk";
      flake = false;   # ← ESSENCIAL
    };
  };

  outputs = { self, nixpkgs, flake-utils, zmk }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShells.default = pkgs.mkShell {
          name = "zmk-env";

          buildInputs = [
            pkgs.cmake
            pkgs.gcc
            pkgs.gnumake
            pkgs.ninja
            pkgs.git
            pkgs.python3
            pkgs.python3Packages.west
            pkgs.python3Packages.pyelftools
            pkgs.python3Packages.pyyaml
            pkgs.python3Packages.pillow
            pkgs.gcc-arm-embedded
          ];

          ZMK_PATH = "${zmk}";

          shellHook = ''
            echo "ZMK environment loaded with non-flake ZMK source"
          '';
        };
      });
}
