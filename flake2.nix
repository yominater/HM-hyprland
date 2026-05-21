{
  description = "Multi-host Nix + Home Manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    username = "alice";
  in {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      system = system;
      modules = [
        ./hosts/laptop/default.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${username} = import ./home/laptop.nix;
        }
      ];
    };

    homeConfigurations.desktop = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [
        ./common/home.nix
        ./home/desktop.nix
        {
          home.username = username;
          home.homeDirectory = "/home/${username}";
        }
      ];
    };
  };
}