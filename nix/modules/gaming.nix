{pkgs, ...}:
with pkgs; let
  patchDesktop = pkg: appName: from: to:
    lib.hiPrio (
      pkgs.runCommand "$patched-desktop-entry-for-${appName}" {} ''
        ${coreutils}/bin/mkdir -p $out/share/applications
        ${gnused}/bin/sed 's#${from}#${to}#g' < ${pkg}/share/applications/${appName}.desktop > $out/share/applications/${appName}.desktop
      ''
    );
  GPUOffloadApp = pkg: desktopName: patchDesktop pkg desktopName "^Exec=" "Exec=nvidia-offload ";
in {
  nixpkgs.config.packageOvverides = pkgs: {
    steam = GPUOffloadApp steam "steam";
  };

  programs.steam = {
    enable = true;

    package = pkgs.steam;
  };

  fonts.fontconfig = {
    enable = true;
    cache32Bit = true;
  };

  users.users.prin.packages = [
    pkgs.vulkan-loader
    pkgs.vulkan-tools
    pkgs.wine64
    pkgs.wineWowPackages.stagingFull
    pkgs.winetricks
    pkgs.lutris
    pkgs.prismlauncher
    pkgs.gzdoom
    pkgs.limo
  ];
}
