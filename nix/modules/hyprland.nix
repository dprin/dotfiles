{
  pkgs,
  ...
}:
{
  environment.systemPackages = [
    pkgs.swww
    pkgs.waybar
    pkgs.waypaper
    pkgs.dunst
    pkgs.pavucontrol

    pkgs.hyprshot
    pkgs.hyprpaper
    pkgs.hyprlock
    pkgs.rofi

    pkgs.polkit
    pkgs.ranger
    pkgs.nwg-displays
  ];
}
