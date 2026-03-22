{...}: {
  config = {
    gaming = true;
    editor = "nvim";
    username = "prin";
  };

  imports = [
    ./hardware-configuration.nix
  ];
}
