{...}: {
  home-manager.users.prin = {
    programs.zoxide.enable = true;
    programs.starship.enable = true;

    programs.direnv.enable = true;
    programs.direnv.nix-direnv.enable = true;

    programs.fish = {
      enable = true;

      interactiveShellInit = ''
        set fish_greeting
        enable_transience # (from starship)
      '';

      shellAbbrs = {
        c = "clear";
        e = "\$EDITOR";

        gc = "git commit";
        gp = "git push";
        gP = "git pull";
        gs = "git status";
        nr = "sudo nixos-rebuild switch --flake ~/.config/nix/#prin";
      };
    };
  };
}
