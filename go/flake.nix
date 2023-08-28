{
  description = "Simple go flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    gitignore = {
      url = "github:hercules-ci/gitignore.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, gitignore }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system ; };
      in
      rec {
        packages.main = pkgs.buildGoModule {
          name = "main";
          src = gitignore.lib.gitignoreSource ./.;
          vendorHash = null;
        };

        packages.default = packages.main;

        devShell = pkgs.mkShellNoCC {
          packages = with pkgs; [
            go_1_21
            gotools
            gopls
            golangci-lint
          ];
        };
      }
    );
}
