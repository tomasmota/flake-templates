{
  description = "tomasmota's flake templates";

  outputs = { self, ... }: {
    templates = {
      terraform-azure = {
        path = ./terraform-azure;
        description = "A terraform flake template for azure";
      };
    };
    templates = {
      go = {
        path = ./go;
        description = "Go project template";
      };
    };
  };
}
