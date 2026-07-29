{pkgs, ...}: let
  name = "yousefe";
in {
  config = {
    gaming = false;
    username = name;
    editor = "nvim";
    hyprland = {
      monitors = ''
        monitor=desc:Sharp Corporation 0x1515,1920x1200@59.95,345x1583,1.0
        monitor=desc:Samsung Electric Company LC27G5xT HNMT401170,1920x1080@143.98,2265x1703,1.0
        monitor=desc:Iiyama North America PL3480WQ 1222541000744,2560x1080@100.0,0x503,1.0
        monitor=desc:Iiyama North America PL3480WQ 1222541000739,2560x1080@100.0,0x503,1.0
      '';
    };

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
