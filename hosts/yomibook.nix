{pkgs, ...}:
{
imports = [
../desktop/waybar.nix
../foot.nix
../desktop/sway2.nix
../chromium.nix
../desktop/gtk.nix
{
  home.username = "yomi";
  home.homeDirectory = "/home/yomi";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  xdg.configFile."waybar/configSway.jsonc".source = ../desktop/waybar/configSway.jsonc;
  xdg.configFile."waybar/styleSway.css".source = ../desktop/waybar/styleSway.css;

  #xdg.configFile."waybar/configNiri.jsonc".source = ./waybar/configNiri.jsonc;
  #xdg.configFile."waybar/styleNiri.css".source = ./waybar/styleNiri.css;
  xdg.configFile."niri/config.kdl".source = ../desktop/niri/config.kdl;

  wayland.windowManager.hyprland.configType = "lua";
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ../desktop/hypr/laptop-hyprland.lua;
  };

  home.packages = with pkgs; [
  awww hyprsunset
   bibata-cursors
   grim
   cliphist
   wl-clipboard
   nerd-fonts.ubuntu
   ranger
   fastfetch
   pulseaudio
   swayidle swaylock
   niri xwayland-satellite
   noctalia
   papirus-icon-theme
  ];

