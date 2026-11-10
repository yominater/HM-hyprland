{ pkgs, ...}: {
  imports = [
  ../desktop/wayle.nix
  ../desktop/hypr/hypridle.nix
  ];
    home.username = "yomi";
    home.homeDirectory = "/home/yomi";
    home.stateVersion = "24.05";
    programs.home-manager.enable = true;

    wayland.windowManager.hyprland.configType = "lua";
    wayland.windowManager.hyprland = {
      enable = false;
      #extraConfig = builtins.readFile ./hyprland.lua;
    };



    services.wayle.enable = false;

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
     yazi
     beammp-launcher
     ];
}
