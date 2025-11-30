{lib, ...}: {
  options.editor = lib.mkOption {
    type = lib.types.enum ["helix" "nvim"];
    default = "nvim";
    description = "Editor of choice";
  };
}
