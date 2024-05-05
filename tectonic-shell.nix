# A simple nix shell for using tectonic on systems without flakes support.
# tectonic  v0.15.0

let
  # TODO use `fetchGit` instead of `fetchTarball` it looks clean.
  pkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/92d295f588631b0db2da509f381b4fb1e74173c5.tar.gz";
  }) {};
in
pkgs.mkShellNoCC {
  buildInputs = with pkgs; [
    tectonic
  ];
}
