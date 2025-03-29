{
  pkgs,
  ...
}:
{
  programs.steam.enable = true;
  
  environment.systemPackages = [
    pkgs.nil
    pkgs.nixd

    pkgs.discord
    pkgs.alacritty
    pkgs.spotify
    pkgs.tmux
    pkgs.btop
    pkgs.planify
    pkgs.evince

    pkgs.thunderbird
    pkgs.blueman

    pkgs.udiskie
  ];
}
