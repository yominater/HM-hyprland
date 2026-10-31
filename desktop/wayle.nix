{
services.wayle.settings = {
  bar = {
    layout = [
      {
        monitor = "*";
        left = [
          "hyprland-workspaces"
        ];
        center = [
          "clock"
        ];
        right = [
          "media"
          "systray"
          "network"
          "volume"
          "storage"
          "notifications"
        ];
      }
    ];

    ### bar settings ###
    location = "top";
    rounding = "none";
    bg = "bg-base";
    button-icon-size = 0.949999988079071;
    button-icon-padding = 0.949999988079071;
    scale = 0.7499999761581421;
    bg-base = "#101010";
    bg-surface = "#1a1a1a";

  };
  modules = {
    clock = {
      format = "%H:%M";
      icon-show = false;
      padding = 0;
    };
    media = {
      icon-show = false;
    };
  };
  styling = {
    palette = {
      bg = "#101010";
      fg = "#fdf6e3";
      primary = "#7aa2f7";
    };
    theme-provider = "wayle";
  };
};
}
