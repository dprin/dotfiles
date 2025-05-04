{
  pkgs,
  ...
}:
{
  programs.steam.enable = true;
  
  users.users.prin.packages = [
    pkgs.nil
    pkgs.nixd

    pkgs.discord
    pkgs.alacritty
    pkgs.spotify
    pkgs.tmux
    pkgs.btop
    pkgs.planify
    pkgs.evince

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
  ];
}
