{
  description = "tomasmota's flake templates";

  outputs = { self, ... }: {
    templates = {
      terraform = {
        path = ./terraform;
        description = "A terraform flake template";
      };
    };
  };
}
