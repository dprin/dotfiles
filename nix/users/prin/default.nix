{pkgs, ...}: {
  config = rec {
    gaming = true;
    editor = "nvim";
    username = "prin";

    nix.settings.secret-key-files = ["/etc/nix/prin.sec"];

    services.teamviewer.enable = true;

    users.users.${username}.packages = [
      pkgs.solaar
    ];
  };

  imports = [
    ./hardware-configuration.nix
  ];
}
