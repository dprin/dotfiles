{
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.editor == "nvim") {
    environment.variables.EDITOR = "nvim";

    programs.nvf = {
      enable = true;
      enableManpages = true;

      settings = {
        vim = {
          autocomplete.blink-cmp = import ./blink-cmp.nix;

          theme = {
            enable = true;
            name = "catppuccin";
            style = "auto";
          };

          enableLuaLoader = true;
          syntaxHighlighting = true;
          lineNumberMode = "relNumber";
          viAlias = true;
          vimAlias = true;
          preventJunkFiles = true;

          undoFile.enable = true;
          notify.nvim-notify.enable = true;
          presence.neocord.enable = true;
          projects.project-nvim.enable = true;
          globals.editorconfig = true;

          options = {
            tabstop = 2;
            shiftwidth = 2;
            expandtab = true;
            autoindent = true;
            exrc = true;
            secure = true;
            mouse = "";
            winborder = "solid";
            ignorecase = true;
          };

          lsp = {
            enable = true;
            formatOnSave = true;
          };

          languages = {
            enableFormat = true;

            # actual languages
            svelte = {
              enable = true;
            };
            nix = {
              enable = true;
            };
            tailwind = {
              enable = true;
            };
          };

          autopairs.nvim-autopairs = {
            enable = true;
          };

          binds = {
            cheatsheet.enable = true;
            whichKey.enable = true;
          };

          dashboard = {
            dashboard-nvim.enable = false;
            alpha.enable = true;
          };

          visuals = {
            nvim-cursorline.enable = true;
            fidget-nvim.enable = true;
            indent-blankline.enable = true;
            nvim-web-devicons.enable = true;
          };
        };
      };
    };
  };
}
