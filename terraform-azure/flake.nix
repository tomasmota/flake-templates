{
  description = "Flake for terraform development against azuread";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system ; };
      in
      {
        devShell = pkgs.mkShellNoCC {
          buildInputs = [
            (pkgs.terraform.withPlugins (p: with p; [
              azuread
              azurerm
            ]))
          ];
          packages = with pkgs; [
            tflint
            terraform-docs
          ];
          shellHook = ''
            # Set some useful aliases
            alias tfi="terraform init"
            alias tfp="terraform plan"
            alias tfa="terraform apply"
            alias tfp="terraform destroy"
            alias tfs="terraform show"
            alias tfv="terraform validate"
          '';
        };
      }
    );
}

