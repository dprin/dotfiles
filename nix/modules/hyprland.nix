{
  pkgs,
  ...
}:
{
  environment.systemPackages = [
    pkgs.swww
    pkgs.waypaper
    pkgs.dunst

    pkgs.hyprshot
    pkgs.hyprpaper
    pkgs.hyprlock

    pkgs.ranger
    pkgs.nwg-displays
  ];
}
