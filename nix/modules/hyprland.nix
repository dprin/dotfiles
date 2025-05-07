{
  pkgs,
  lib,
  ...
}:
{
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
  };

  # Set session variables
  environment = {
    variables = {
      # If cursor is not visible, try to set this to "on".
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
    };
  };

  environment.sessionVariables = lib.mkForce {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_DIRS = "/usr/local/share/:/usr/share/";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";

    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
    T_QPA_PLATFORM = "wayland";
    GDK_BACKEND = "wayland";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  programs.hyprlock.enable = true;

  programs.hyprland = {
    enable = true;

    # withUWSM = true;
    xwayland.enable = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  home-manager.users.prin = {
    home.sessionVariables.NIXOS_OZONE_WL = "1";

    programs.walker = {
      enable = true;
      runAsService = true;

      config = {
        ui.fullscreen = true;
      };
    };
  }; 

  # bluetooth
  services.blueman.enable = true;

  hardware.bluetooth.settings = {
    General = {
      Experimental = true;
    };
  };

  users.users.prin.packages = [
    pkgs.swww
    pkgs.waybar
    pkgs.waypaper
    pkgs.dunst
    pkgs.pavucontrol

    pkgs.hyprshot

    pkgs.polkit
    pkgs.ranger
    pkgs.nwg-displays
    pkgs.ueberzugpp

    # screen sharing
    pkgs.kdePackages.xwaylandvideobridge
    pkgs.wireplumber
  ];
}
