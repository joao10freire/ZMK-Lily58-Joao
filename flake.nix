{
  description = "ZMK firmware for Lily58 Joao";

  inputs = {
    # ZMK não é flake — precisa flake=false para funcionar
    zmk = {
      url = "github:zmkfirmware/zmk/main";
      flake = false;
    };

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
            pkgs.git
            pkgs.west
            pkgs.ninja
            pkgs.dt-schema
            pkgs.gcc
            pkgs.python3
            pkgs.zephyr-sdk
          ];

          ZMK_PATH = "${zmk}";
        };
    };
}
