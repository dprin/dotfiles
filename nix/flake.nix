{
  description = "My system :D";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    walker.url = "github:abenz1267/walker";
  };

  outputs = { nixpkgs, home-manager, walker, ... }: {
    nix.settings = {
      substituters = ["https://walker-git.cachix.org"];
      trusted-public-keys = ["walker-git.cachix.org-1:vmC0ocfPWh0S/vRAQGtChuiZBTAe4wiKDeyyXM0/7pM="];
    };
  
    nixosConfigurations."prin" = nixpkgs.lib.nixosSystem {
      modules = [
        { home-manager.users.prin.imports = [walker.homeManagerModules.default]; }
        ./configuration.nix
        ./modules
        home-manager.nixosModules.default
      ];
    };
  };
}
