# Boost v1.81

let
  pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/c2e511861a8f2f866a0a07149b7ec795d33f5591.tar.gz") {};
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    boost
  ];
}
