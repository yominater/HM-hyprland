{
  description = "My home-manager config";

  inputs = {
    #nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    
    #hyprland.url = "github:hyprwm/Hyprland";
    #hyprland-plugins = {
    #  url = "github:hyprwm/hyprland-plugins";
    #  inputs.hyprland.follows = "hyprland";
    #};
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux"; # change if needed
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      ############
      ### Mint ###
      ############
      homeConfigurations."yominater@Alex-PC-4-Mint" =
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
          ./foot.nix
          ./hypridle.nix
          ./waybar.nix
            {
              home.username = "yominater";
              home.homeDirectory = "/home/yominater";
              home.stateVersion = "24.05";
              programs.home-manager.enable = true;

              wayland.windowManager.hyprland.configType = "lua";
              wayland.windowManager.hyprland = {
                enable = true;
                extraConfig = builtins.readFile ./hyprland.lua;
              };

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
	
      ################
      ### Yomibook ###
      ################
      homeConfigurations."yomi@yomibook" =
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
          ./waybar.nix
          ./foot.nix
          ./sway2.nix
            {
              home.username = "yomi";
              home.homeDirectory = "/home/yomi";
              home.stateVersion = "24.05";
              programs.home-manager.enable = true;

              xdg.configFile."waybar/configSway.jsonc".source = ./waybar/configSway.jsonc;
              xdg.configFile."waybar/styleSway.css".source = ./waybar/styleSway.css;

              #xdg.configFile."waybar/configNiri.jsonc".source = ./waybar/configNiri.jsonc;
              #xdg.configFile."waybar/styleNiri.css".source = ./waybar/styleNiri.css;
              xdg.configFile."niri/config.kdl".source = ./desktop/niri/config.kdl;

              wayland.windowManager.hyprland.configType = "lua";
              wayland.windowManager.hyprland = {
                enable = true;
                extraConfig = builtins.readFile ./laptop-hyprland.lua;
              };


              gtk = {
                enable = true;
                colorScheme = "dark";
                iconTheme.name = "Papirus-Dark";
              };

                programs.chromium = {
                  enable = true;
                  commandLineArgs = [
                    "--enable-features=WebContentsForceDark"
                    "--ozone-platform=wayland"
                    "--render-node-override=/dev/dri/renderD128"
                    "--restart"
                    "--flag-switches-begin"
                    "--close-confirmation=last"
                    "--disable-top-sites"
                    "--extension-mime-request-handling=always-prompt-for-install" 
                    "--hide-fullscreen-exit-ui"
                    "--show-avatar-button=incognito-and-guest"
                    "--enable-features=WebContentsForceDark"
                    "--disable-features=ClearDataOnExit"
                    "--flag-switches-end"
                  ];
                };




              home.packages = with pkgs; [
              awww hyprsunset
               bibata-cursors
               grim
               cliphist
               wl-clipboard
               nerd-fonts.ubuntu
	             libreoffice hunspell hunspellDicts.en-us
	             ranger
	             fastfetch
               pulseaudio
               swayidle swaylock
               niri xwayland-satellite
               noctalia
               papirus-icon-theme
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
        }; # yomi@yomibook config
      ################
      ### Thinkpad ###
      ################
      homeConfigurations."yomi@thinkpad" =
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
          ./waybar.nix
          ./foot.nix
          ./sway2.nix
          ./firefox/firefox.nix
          ./libreoffice.nix
            {
              home.username = "yomi";
              home.homeDirectory = "/home/yomi";
              home.stateVersion = "24.05";
              programs.home-manager.enable = true;

              xdg.configFile."niri/config.kdl".source = ./desktop/niri/configThinkpad.kdl;

              xdg.configFile."noctalia/settings.toml".source = ./desktop/noctalia/settings.toml;

              wayland.windowManager.hyprland.configType = "lua";
              wayland.windowManager.hyprland = {
                enable = true;
                extraConfig = builtins.readFile ./laptop-hyprland.lua;
              };


              gtk = {
                enable = true;
                colorScheme = "dark";
              };


              home.packages = with pkgs; [
              awww hyprsunset
               bibata-cursors
               wofi
               grim
               cliphist
               wl-clipboard
               nerd-fonts.ubuntu
               dmenu
	             libreoffice hunspell hunspellDicts.en-us
	             ranger
	             fastfetch
               pulseaudio
               swayidle swaylock
               # niri xwayland-satellite
               noctalia
               inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
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
        }; # yomi@thinkpad config

      ##############
      ### Fedora ###
      ##############
       homeConfigurations."yomi@fedora" =
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;


          modules = [
          ./wayle.nix
          ./hypridle.nix

            {
              home.username = "yomi";
              home.homeDirectory = "/home/yomi";
              home.stateVersion = "24.05";
              programs.home-manager.enable = true;

              wayland.windowManager.hyprland.configType = "lua";
              wayland.windowManager.hyprland = {
                enable = true;
                #extraConfig = builtins.readFile ./hyprland.lua;
              };



              services.wayle.enable = true;

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
               quickshell
               qt6.qtwayland
               qbittorrent
               jdk

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

