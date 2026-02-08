{...}: {
  config = {
    editor = "nvim";
  };

  imports = [
    ./hyprland.nix
    ./fish.nix
    ./fonts.nix
    ./wireguard.nix
    ./nvim
    ./other.nix
    ./gaming.nix
  ];
}
