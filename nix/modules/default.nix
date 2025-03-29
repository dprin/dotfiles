{
  lib,
  config,
  home-manager,
  ...
}:
{
  imports = [
    ./fish.nix
    ./fonts.nix
    ./other.nix
    ./hyprland.nix
  ];
}
