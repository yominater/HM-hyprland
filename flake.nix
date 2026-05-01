{
  description = "My home-manager config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux"; # change if needed
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."yominater@Alex-PC-4-Mint" =
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
               dmenu
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
      homeConfigurations."yomi@nixos" =
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
          ./laptop-hyprland.nix
          ./windowRules.nix
          ./waybar.nix
          ./foot.nix
            {
              home.username = "yomi";
              home.homeDirectory = "/home/yomi";
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
               dmenu
               #hyprlandPlugins.hyprexpo
	       libreoffice
	       ranger
	       fastfetch
              ];

              home.sessionVariables = {
                EDITOR = "nvim";
              };

      	      home.pointerCursor = {
      	       name = "Bibata-Modern-Ice";
      	       package = pkgs.bibata-cursors;
      	       size = 30;
      	       gtk.enable = true;
      	       hyprcursor.enable = true;
      	      };

            }
          ];
        }; # yomi@nixos config
              homeConfigurations."yomi@fedora" =
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
          ./hyprland.nix
          ./waybar.nix
          ./windowRules.nix
            {
              home.username = "yomi";
              home.homeDirectory = "/home/yomi";
              home.stateVersion = "24.05";
              programs.home-manager.enable = true;

              wayland.windowManager.hyprland = {
                enable = true;
                package = null;
              };




              home.packages = with pkgs; [
               hyprland-qtutils
               bibata-cursors
               hyprpaper
               hyprsunset
               awww
               wofi
               grim
               hyprshot
               cliphist
               wl-clipboard
               dmenu

               #hyprlandPlugins.hyprexpo
              ];
       	      home.pointerCursor = {
      	       name = "Bibata-Modern-Ice";
      	       package = pkgs.bibata-cursors;
      	       size = 30;
      	       gtk.enable = true;
      	       hyprcursor.enable = true;
      	      };



            }
          ];
        }; # fedora config


    }; # in
} # flake

