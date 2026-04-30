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

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    nvf,
    agenix,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    defaultModules = [
      home-manager.nixosModules.default
      nvf.nixosModules.default

      ./options.nix
      ./users/prin
      ./configuration.nix
      ./modules
    ];
  in {
    formatter.${system} = pkgs.nixpkgs-fmt;
    nixosConfigurations."prin" = nixpkgs.lib.nixosSystem {
      modules =
        defaultModules
        ++ [
          agenix.nixosModules.default
        ];
    };

    nixosConfigurations."yousefe" = nixpkgs.lib.nixosSystem {
      modules = defaultModules;
    };
  };
}
