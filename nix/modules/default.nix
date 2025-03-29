{
  lib,
  config,
  home-manager,
  ...
}:
{
  imports = [
    ./fonts.nix
    ./other.nix
    ./hyprland.nix
  ];
}
