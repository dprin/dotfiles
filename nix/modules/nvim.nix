{
  config,
  lib,
  ...
}:
  let
    enabled = config.nvim;
  in
{
  config = lib.mkIf enabled {
    home-manager.users.prin = {
      programs.neovim.enable = true;
    };    
  };
}
