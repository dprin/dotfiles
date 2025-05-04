{
  pkgs,
  ...
}:
{
  fonts.packages = [
    pkgs.nerd-fonts.iosevka
    pkgs.font-awesome
  ];
}
