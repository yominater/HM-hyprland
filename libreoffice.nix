{ config, pkgs, ... }: {
  home.file.".config/libreoffice" = {
    source = ./libreoffice;
    recursive = true;
  };
}
