{
  ...
}:
{
  config = {
    nvim = true;
  };
  
  imports = [
    ./hyprland.nix
    ./fish.nix
    ./fonts.nix
    ./wireguard.nix
    ./nvim
    ./other.nix
  ];
}
