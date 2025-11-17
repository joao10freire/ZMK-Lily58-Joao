{
  description = "ZMK build environment for Lily58 João (non-flake ZMK)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";

    # ZMK is not a flake: fetch as a plain repo
    zmk = {
      url = "github:zmkfirmware/zmk";
      flake = false;
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
            pkgs.git
            pkgs.ninja
            pkgs.gcc
            pkgs.gnumake
            pkgs.python3
            pkgs.python3Packages.west
            pkgs.python3Packages.pyelftools
            pkgs.python3Packages.pyyaml
            pkgs.python3Packages.pillow
            pkgs.gcc-arm-embedded
            # zephyr-sdk is sometimes heavy in nixpkgs; west will handle fetching Zephyr as configured by config/west.yml
          ];

          shellHook = ''
            echo "ZMK devshell ready."
          '';
        };
      });
}
