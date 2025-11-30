{
  pkgs,
  lib,
  ...
}:
{
  services.gnome.at-spi2-core.enable = true;

  home-manager.users.prin = {
    home.sessionVariables.NIXOS_OZONE_WL = "1";

    gtk = {
      enable = true;
      theme = {
        name = "Nightfox";
        package = pkgs.nightfox-gtk-theme;
      };
      iconTheme = {
        name = "Nightfox";
        package = pkgs.nightfox-gtk-theme;
      };
    };

    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-gtk
      ];

      config.common.default = [ "hyprland" "gtk" ];
    };

    xdg.desktopEntries.yazi = {
      name = "Yazi";
      exec = "alacritty -e ${pkgs.yazi}/bin/yazi";
    };

    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = "yazi.desktop";
        "application/pdf"="zathura.desktop";
        "x-scheme-handler/discord"="vesktop.desktop";
        "x-scheme-handler/mailto"="userapp-Thunderbird-46CN52.desktop";
        "message/rfc822"="userapp-Thunderbird-46CN52.desktop";
        "x-scheme-handler/mid"="userapp-Thunderbird-46CN52.desktop";
        "x-scheme-handler/webcal"="userapp-Thunderbird-6PPM52.desktop";
        "text/calendar"="userapp-Thunderbird-6PPM52.desktop";
        "application/x-extension-ics"="userapp-Thunderbird-6PPM52.desktop";
        "x-scheme-handler/webcals"="userapp-Thunderbird-6PPM52.desktop";
      };
    };

    systemd.user.services."hyprportal" = {
      Unit = {
        Description = "run hyprland desktop portal";
        Before = [ "xdg-desktop-portal.service" ];
      };
      Install = {
        WantedBy = [ "xdg-desktop-portal.service" ];
      };
      Service = {
        ExecStart = "${pkgs.xdg-desktop-portal-hyprland}/libexec/xdg-desktop-portal-hyprland";
      };
    };
  };

  # Set session variables
  environment.variables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
  };

  environment.sessionVariables = lib.mkForce {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_DIRS = "/usr/local/share/:/usr/share/";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_DESKTOP_PORTAL= "xdg-desktop-portal-hyprland";


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
  };

  # bluetooth
  services.blueman.enable = true;

  hardware.bluetooth.settings = {
    General = {
      Experimental = true;
    };
  };

  users.users.prin.packages = [
    pkgs.nightfox-gtk-theme
    pkgs.swww
    pkgs.waybar
    pkgs.waypaper
    pkgs.dunst
    pkgs.pavucontrol

    pkgs.hyprshot

    pkgs.polkit
    (pkgs.yazi.override {
      _7zz = pkgs._7zz-rar;
    })
    pkgs.nwg-displays
    pkgs.ueberzugpp

    pkgs.pipewire
    pkgs.wireplumber

    pkgs.findex
    pkgs.vesktop
  ];
}
