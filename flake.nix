{
  description = "ZMK firmware for Lily58";

  inputs = {
    # Usa a branch main oficial
    zmk.url = "github:zmkfirmware/zmk/main";

    # Nixpkgs estável
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, zmk }:
    flake-utils.lib.simpleFlake {
      inherit self nixpkgs;
      name = "zmk-lily58";

      shell = { pkgs }:
        pkgs.mkShell {
          nativeBuildInputs = [
            pkgs.cmake
            pkgs.gcc
            pkgs.git
            pkgs.west
            pkgs.dt-schema
            pkgs.zephyr-sdk
            pkgs.ninja
            pkgs.python3
          ];
        };
    };
}
