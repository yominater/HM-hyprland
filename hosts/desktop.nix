{pkgs, ...}:
{
 imports = [
  ../desktop/waybar.nix
  ../desktop/niri/niri.nix
  ../foot.nix
  ../sway2.nix
  ../firefox/firefox.nix
  ../libreoffice.nix
  ../nixvim.nix
  ../desktop/gtk.nix
 home.username = "yomi";
 home.homeDirectory = "/home/yomi";
 home.stateVersion = "24.05";
 programs.home-manager.enable = true;


 wayland.windowManager.hyprland.configType = "lua";
 wayland.windowManager.hyprland = {
   enable = true;
   extraConfig = builtins.readFile ../desktop/hypr/laptop-hyprland.lua;
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
   normcap # OCR
 ];


 home.sessionVariables = {
   EDITOR = "nvim";
 };

}
