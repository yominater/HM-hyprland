{pkgs, ...}: {
  home.pointerCursor = {
   name = "Bibata-Modern-Ice";
   package = pkgs.bibata-cursors;
   size = 24;
   gtk.enable = true;
   hyprcursor.enable = true;
  };
  gtk = {
    enable = true;
    colorScheme = "dark";
    iconTheme.name = "Papirus-Dark";
  };

}
