{
  pkgs,
  config,
  ...
}: {
  xdg.mime.defaultApplications = {
    "application/pdf" = "zathura.desktop";
    "x-scheme-handler/discord" = "discord.desktop";
  };

  programs.firefox.enable = true;

  users.users.${config.username}.packages = [
    pkgs.nil
    pkgs.nixd

    pkgs.unzip
    pkgs.unar

    pkgs.discord
    pkgs.signal-desktop

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

    pkgs.fastfetch
  ];
}
