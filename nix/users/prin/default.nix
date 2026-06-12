{pkgs, ...}: {
  config = rec {
    gaming = true;
    editor = "nvim";
    username = "prin";
    hyprland = {
      monitors = ''
        monitor=desc:California Institute of Technology 0x1506,1920x1080@59.93,640x1440,1.0
        monitor=desc:Philips Consumer Electronics Company PHL 275V8 UK02321025542,2560x1440@74.97,0x0,1.0
        monitor=desc:Samsung Electric Company LC27G5xT HNMT401170,1920x1080@143.98,2560x810,1.0
      '';
    };

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
