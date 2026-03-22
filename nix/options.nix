{lib, ...}: {
  options = {
    editor = lib.mkOption {
      type = lib.types.enum ["helix" "nvim"];
      default = "nvim";
      description = "Editor of choice";
    };

    gaming = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable gaming related software";
    };

    username = lib.mkOption {
      type = lib.types.str;
      description = "Username for the configuration";
    };
  };
}
