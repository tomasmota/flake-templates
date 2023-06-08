{
  description = "tomasmota's flake templates";

  outputs = { self, ... }: {
    templates = {
      terraform-azuread = {
        path = ./terraform-azuread;
        description = "A terraform flake template";
      };
    };
  };
}
