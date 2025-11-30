{
  description = "My system :D";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    nvf,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    formatter.${system} = pkgs.nixpkgs-fmt;

    nixosConfigurations."prin" = nixpkgs.lib.nixosSystem {
      modules = [
        home-manager.nixosModules.default
        nvf.nixosModules.default

        ./options.nix
        ./configuration.nix
        ./modules
      ];
    };
  };
}
