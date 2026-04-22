{...}: {
  config = {
    gaming = true;
    editor = "nvim";
    username = "prin";

    nix.settings.secret-key-files = ["/etc/nix/prin.sec"];

    services.teamviewer.enable = true;
  };

  imports = [
    ./hardware-configuration.nix
  ];
}
