{
  pkgs,
  config,
  ...
}:
{
  environment.systemPackages = [
    pkgs.nerd-fonts.iosevka
  ];
}
