{
  description = "My home-manager config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux"; # change if needed
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."yominater" =
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
          ./hyprland.nix
          ./waybar.nix
            {
              home.username = "yominater";
              home.homeDirectory = "/home/yominater";
              home.stateVersion = "24.05";
              programs.home-manager.enable = true;

              wayland.windowManager.hyprland.enable = true;


              home.packages = with pkgs; [
               hyprland-qtutils
               hyprpolkitagent
               bibata-cursors
               hyprpaper
               hyprsunset
               awww
               wofi
               grim
               hyprshot
               cliphist
               wl-clipboard
               nerd-fonts.ubuntu
               #hyprlandPlugins.hyprexpo
              ];

      	      home.pointerCursor = {
      	       name = "Bibata-Modern-Ice";
      	       package = pkgs.bibata-cursors;
      	       size = 24;
      	       gtk.enable = true;
      	       hyprcursor.enable = true;
      	      };

            }
          ];
        };
    };
}

