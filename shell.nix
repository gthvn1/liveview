let
  pkgs = import <nixpkgs> {};
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    # Elixir stack
    erlang
    elixir
    elixir-ls

    tailwindcss_4
    esbuild

    zellij
    inotify-tools
    watchman
  ];

  shellHook = ''
    echo "⚡ Liveview ready"
    elixir --version

    export TAILWIND_PATH="${pkgs.tailwindcss_4}/bin/tailwindcss"
    export ESBUILD_PATH="${pkgs.esbuild}/bin/esbuild"

    TAILWIND_VERSION=$("${pkgs.tailwindcss_4}/bin/tailwindcss" --version 2>/dev/null | head -1 | grep -oP '\d+\.\d+\.\d+')
    ESBUILD_VERSION=$("${pkgs.esbuild}/bin/esbuild" --version 2>/dev/null)

    echo ""
    echo "┌─────────────────────────────────────────────────────────────┐"
    echo "│  Asset tool versions (NixOS)                                │"
    echo "├─────────────────────────────────────────────────────────────┤"
    printf "│  tailwindcss : %-44s │\n" "$TAILWIND_VERSION"
    printf "│  esbuild     : %-44s │\n" "$ESBUILD_VERSION"
    echo "├─────────────────────────────────────────────────────────────┤"
    echo "│  Make sure config/config.exs matches:                       │"
    echo "│                                                             │"
    printf "│  config :tailwind, version: \"%-30s │\n" "$TAILWIND_VERSION\","
    printf "│  config :esbuild,  version: \"%-30s │\n" "$ESBUILD_VERSION\","
    echo "└─────────────────────────────────────────────────────────────┘"
    echo ""
  '';
}
