{
  description = "ZMK firmware for Lily58 Joao";

  inputs = {
    # Usa a única branch do ZMK que possui flake.nix
    zmk.url = "github:zmkfirmware/zmk/feat/bluetooth-rewrite";

    # Versão estável do NixOS com pacotes modernos
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  };

  outputs = { self, zmk, nixpkgs, ... }:
    let
      # Ambiente para GitHub Actions (x86_64-linux)
      pkgs = nixpkgs.legacyPackages.x86_64-linux;

    in {
      # Ambiente de desenvolvimento usado pelo GitHub Actions
      devShells = {
        zmk = pkgs.mkShell {
          nativeBuildInputs = [
            # Ferramentas do ZMK
            zmk.packages.x86_64-linux.toolchain
            zmk.packages.x86_64-linux.zephyr-sdk

            # Dependências necessárias do Zephyr
            pkgs.cmake
            pkgs.ninja
            pkgs.dtc

            # ARM toolchain
            pkgs.gcc-arm-embedded

            # Python para west
            pkgs.python3
          ];
        };
      };

      # Exporta outputs do ZMK
      packages = zmk.packages;
    };
}
