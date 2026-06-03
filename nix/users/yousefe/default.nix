{pkgs, ...}: let
  name = "yousefe";
in {
  config = {
    gaming = false;
    username = name;
    editor = "nvim";

    users.users.${name} = {
      packages = [
        pkgs.teams-for-linux
        pkgs.jetbrains.rider
        pkgs.nautilus
        pkgs.yubioath-flutter
        pkgs.google-chrome
      ];

      extraGroups = [
        "docker"
      ];
    };

    fonts.packages = [
      pkgs.corefonts
      pkgs.liberation_ttf
      pkgs.carlito
      pkgs.vista-fonts
    ];
    services.pcscd.enable = true;

    virtualisation.docker.enable = true;

    programs.virt-manager.enable = true;

    users.groups.libvirtd.members = ["yousefe"];

    virtualisation.libvirtd.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;
  };

  imports = [
    ./hardware-configuration.nix
  ];
}
