{...}: {
  config = {
    gaming = true;
    editor = "nvim";
    username = "prin";

    nix.settings.secret-key-files = ["/etc/nix/prin.sec"];
  };

  imports = [
    ./hardware-configuration.nix
  ];
}
