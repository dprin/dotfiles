{
  description = "My system :D";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    yt-x = {
      url = "github:Benexl/yt-x";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, yt-x, ... } @ inputs: {
    nixosConfigurations."prin" = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
        ./modules
        ({ ... }: {
          _module.args.yt-x = yt-x;
        })
        home-manager.nixosModules.default
      ];
    };
  };
}
