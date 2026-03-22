{
  pkgs,
  config,
  ...
}: {
  environment.etc."xdg/mimeapps.list" = {
    text = ''
      [Default Applications]
      application/pdf=zathura.desktop;
    '';
  };

  services.tailscale.enable = true;
  programs.firefox.enable = true;

  users.users.${config.username}.packages = [
    pkgs.nil
    pkgs.nixd

    pkgs.unzip
    pkgs.unar

    pkgs.fluffychat
    pkgs.discord
    pkgs.signal-desktop

    pkgs.alacritty
    pkgs.ghostty
    pkgs.spotify
    pkgs.tmux
    pkgs.btop
    pkgs.zathura

    pkgs.piper
    pkgs.libratbag

    pkgs.thunderbird

    pkgs.bluez

    pkgs.udiskie

    pkgs.libreoffice-qt6
    pkgs.qalculate-qt

    pkgs.ani-cli
    pkgs.mpv
    pkgs.qbittorrent

    pkgs.poppler-utils

    pkgs.logmein-hamachi
    pkgs.haguichi

    pkgs.fastfetch

    pkgs.shadps4
  ];

  programs.nix-ld = {
    enable = true;
    libraries = [
      pkgs.svelte-language-server
    ];
  };
}
