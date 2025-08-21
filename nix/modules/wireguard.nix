{
  pkgs,
  ...
}:
{
  environment.systemPackages = [ pkgs.wireguard-tools ];

  networking.firewall.checkReversePath = "loose";
}

