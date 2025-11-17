# zmk-lily58-joao

Repositório preparado para compilar ZMK para Lily58 Pro (Feather nRF52840 clones).

## Como funciona
- Workflow GitHub Actions (Nix) compila left & right e gera `*.uf2` em Artifacts.
- Use `Actions → Build ZMK Firmware → Run workflow` para iniciar.

## Flash
1. Coloque a placa em modo bootloader (double reset). Ela aparece como unidade UF2.
2. Baixe artifacts left/right do run do Actions.
3. Copie `lily58_left.uf2` para a unidade do lado esquerdo; `lily58_right.uf2` para a unidade do lado direito.

## Observações
- Se algum pino da matrix estiver diferente do esperado, envie fotos e eu corrijo `lily58_joao.dtsi`.
- Para ajustes de keymap, edite `config/keymap.keymap`.
