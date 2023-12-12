{
  description = "Simple devshell flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system ; };
      in
      {
        devShell = pkgs.mkShellNoCC {
          packages = with pkgs; [
            # browse at https://search.nixos.org/packages or `nix search nixpkgs ${package}`
            # put packages here
            hello
          ];
        };
      }
    );
}
