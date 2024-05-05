# A flake that gets the right version of tectonic and biber.
# tectonic  v0.14.0
# biber     v2.17
# biblatex  v3.17

{
  description = "Tectonic and Biber";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
    biber-2-17.url = "nixpkgs/80c24eeb9ff46aa99617844d0c4168659e35175f";
  };
  outputs = { self, nixpkgs, flake-utils, biber-2-17 }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
        biberPkgs = import biber-2-17 {
          inherit system;
        };
      in
      {
        devShells.default = pkgs.mkShellNoCC {
          buildInputs = [
            pkgs.tectonic
            biberPkgs.biber
          ];
        };
      }
    );
}
