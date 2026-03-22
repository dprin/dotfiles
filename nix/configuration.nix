{
  pkgs,
  config,
  ...
}: {
  config = {
    nixpkgs.config.allowUnfree = true;
    system.stateVersion = "24.11";
    home-manager.users.${config.username}.home.stateVersion = "24.11";

    boot.loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    # Enable networking
    networking.networkmanager.enable = true;

    # Enable bluetooth
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      package = pkgs.bluez-experimental;

      settings = {
        General = {
          Experimental = true;
          AutoEnable = true;
          Enable = "Source,Sink,Media,Socket";
          ControllerMode = "bredr";
          UserspaceHID = true;
        };
      };
    };

    time.timeZone = "Europe/Amsterdam";

    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "nl_NL.UTF-8";
      LC_IDENTIFICATION = "nl_NL.UTF-8";
      LC_MEASUREMENT = "nl_NL.UTF-8";
      LC_MONETARY = "nl_NL.UTF-8";
      LC_NAME = "nl_NL.UTF-8";
      LC_NUMERIC = "nl_NL.UTF-8";
      LC_PAPER = "nl_NL.UTF-8";
      LC_TELEPHONE = "nl_NL.UTF-8";
      LC_TIME = "nl_NL.UTF-8";
    };

    services = {
      displayManager.gdm.enable = true;

      # Configure keymap in X11
      xserver.xkb = {
        layout = "us";
        variant = "";
      };

      # Enable CUPS to print documents.
      printing.enable = true;
      pulseaudio.enable = false;

      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };
    };

    # Enable sound with pipewire.
    security.rtkit.enable = true;
    security.polkit.enable = true;

    programs.appimage.enable = true;

    users.users.${config.username} = {
      isNormalUser = true;
      description = config.username;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      shell = pkgs.fish;
    };

    environment.systemPackages = with pkgs; [
      SDL2
      git
    ];

    nix = {
      settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      optimise.automatic = true;
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };
    };

    systemd = {
      user.services.polkit-gnome-authentication-agent-1 = {
        description = "polkit-gnome-authentication-agent-1";
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
    };
  };
}
