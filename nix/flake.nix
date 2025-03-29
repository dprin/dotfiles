{
  description = "My system :D";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };


  outputs = { nixpkgs, home-manager, ... }: {
    nixosConfigurations."prin" = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
        ./modules
        home-manager.nixosModules.default
      ];
    };
  };
}
