{ pkgs, ...}:
{
  imports = [
    ../foot.nix
    ../desktop/hypr/hypridle.nix
    ../desktop/waybar.nix
    ../desktop/gtk.nix
    ]


  home.username = "yominater";
  home.homeDirectory = "/home/yominater";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
  
  wayland.windowManager.hyprland.configType = "lua";
  wayland.windowManager.hyprland = {
   enable = true;
   extraConfig = builtins.readFile ../desktop/hypr/hyprland.lua;
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
  

