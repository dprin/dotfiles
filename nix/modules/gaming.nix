{
  pkgs,
  config,
  lib,
  ...
}:
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
  config = lib.mkIf (config.gaming) {
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

    services.joycond.enable = true;
    services.udev.packages = [pkgs.game-devices-udev-rules];

    users.users.${config.username}.packages = [
      pkgs.vulkan-loader
      pkgs.vulkan-tools
      pkgs.wine64
      pkgs.wineWow64Packages.stagingFull
      pkgs.winetricks
      pkgs.lutris
      pkgs.prismlauncher
      pkgs.gzdoom
      pkgs.limo
      pkgs.ckan
    ];
  };
}
