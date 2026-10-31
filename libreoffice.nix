{ config, pkgs, ... }: {
  home.file.".config/libreoffice" = {
    source = ./libreoffice;
    recursive = true;
    force = true;
  };
  home.packages = with pkgs; [
    libreoffice hunspell hunspellDicts.en-us
  ];
}
