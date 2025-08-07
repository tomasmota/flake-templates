{
  description = "tomasmota's flake templates";

  outputs = { self, ... }: {
    templates = {
      terraform-azure = {
        path = ./terraform-azure;
        description = "A terraform flake template for azure";
      };
      go = {
        path = ./go;
        description = "Go project template";
      };
      python = {
        path = ./python;
        description = "Python flake";
      };
      devshell = {
        path = ./devshell;
        description = "Devshell flake";
      };
    };
  };
}
