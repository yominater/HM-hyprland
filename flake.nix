{
  description = "My home-manager config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      mkHome = hostModule:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          extraSpecialArgs = {
            inherit inputs;
          };

          modules = [ hostModule ];
        };
    in
    {
      homeConfigurations = {
        "yominater@Alex-PC-4-Mint" = mkHome ./hosts/mint.nix;
        "yomi@yomibook" = mkHome ./hosts/yomibook.nix;
        "yomi@thinkpad" = mkHome ./hosts/thinkpad.nix;
        "yomi@fedora" = mkHome ./hosts/fedora.nix;
        "clifton@abbyd-OptiPlex-7010" = mkHome ./hosts/abbyd-optiPlex-7010.nix;
      };
    };
}
