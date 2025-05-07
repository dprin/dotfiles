{
  pkgs,
  ...
}:
with pkgs; let
  patchDesktop = pkg: appName: from: to: lib.hiPrio (
    pkgs.runCommand "$patched-desktop-entry-for-${appName}" {} ''
      ${coreutils}/bin/mkdir -p $out/share/applications
      ${gnused}/bin/sed 's#${from}#${to}#g' < ${pkg}/share/applications/${appName}.desktop > $out/share/applications/${appName}.desktop
      '');
  GPUOffloadApp = pkg: desktopName: patchDesktop pkg desktopName "^Exec=" "Exec=nvidia-offload ";
in
{
  nixpkgs.config.packageOvverides = pkgs: {
    steam = (GPUOffloadApp steam "steam");
  };

  programs.steam = {
    enable = true;

    package = pkgs.steam;
  };
  
  users.users.prin.packages = [
    pkgs.nil
    pkgs.nixd

    pkgs.discord
    pkgs.alacritty
    pkgs.spotify
    pkgs.tmux
    pkgs.btop
    pkgs.planify
    pkgs.evince

    pkgs.piper
    pkgs.libratbag

    pkgs.thunderbird

    pkgs.bluez

    pkgs.udiskie

    pkgs.libreoffice-qt6
    pkgs.qalculate-qt

    pkgs.ani-cli
    pkgs.mpv
    pkgs.qbittorrent

    pkgs.poppler_utils

    pkgs.fastfetch
  ];
}
