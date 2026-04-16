# Run with `nix-shell shell.nix`
let
  pkgs = import <nixpkgs> {};
  unstable = import <nixos-unstable> {};
in
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    pkg-config
    wrapGAppsHook4
    cargo
    nodejs # require for vite
    deno   # optional
    rustc
  ] ++ (with unstable; [
    cargo-tauri
  ]);

  buildInputs = with pkgs; [
    librsvg
  ] ++ (with unstable; [
    webkitgtk_4_1
  ]);

  shellHook = ''
    export XDG_DATA_DIRS="$GSETTINGS_SCHEMAS_PATH"
  '';
}
