{
  lib,
  ...
} :
{
  # TODO: figure out if i can make an enum maybe?
  options.nvim = lib.mkEnableOption "Enable neovim configuration";
  options.helix = lib.mkEnableOption "Enable helix configuration";
}
