{ pkgs, inputs, ...}:
{
  imports = [
  ../desktop/waybar.nix
  ../foot.nix
  ../desktop/sway2.nix
  ../firefox/firefox.nix
  ../libreoffice.nix
  ../nixvim.nix
    ../desktop/gtk.nix
  #../yazi
  ];
  home.username = "yomi";
  home.homeDirectory = "/home/yomi";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
  
  xdg.configFile."niri/config.kdl".source = ../desktop/niri/configThinkpad.kdl;

  xdg.configFile."noctalia/settings.toml".source = ../desktop/noctalia/settings.toml;

  
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    #extraConfig = builtins.readFile ../desktop/hypr/laptop-hyprland.lua;
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
   ranger
   fastfetch
   pulseaudio
   swayidle swaylock
   # niri xwayland-satellite
   noctalia
   #inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}

