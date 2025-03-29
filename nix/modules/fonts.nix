{
  pkgs,
  ...
}:
{
  environment.systemPackages = [
    pkgs.nerd-fonts.iosevka
    pkgs.font-awesome
  ];
}
