{
  wayland.windowManager.hyprland = {
    settings = {
      # length x height
      "$windowSize" = "600 350";
    };
    extraConfig = ''
    workspace = w[tv1], gapsout:0, gapsin:0
    workspace = f[1], gapsout:0, gapsin:0
        windowrule {
        name = no-gaps-wtv1
        match:float = false
        match:workspace = w[tv1]
        border_size = 0
        rounding = 0
    }
    windowrule {
        name = no-gaps-f1
        match:float = false
        match:workspace = f[1]
        border_size = 0
        rounding = 0
    }
    windowrule {
      name = suppress
      match:title = .*

      suppress_event =  maximize
    }
    
    # Fix some dragging issues with XWayland
    # windowrule = nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0
    windowrule {
      name = XWayland
      match:title = ^$
      match:class = ^$
      match:xwayland = true
    
      float = 1
      fullscreen = 0
      pin = 0
    }
    
    # Make some windows start floating
    #windowrule = float true,size 800 400, move center,match:title ^(floating)$
    windowrule {
      name = floating windows
      match:title = ^(floating)$
      float = on
      size = 800 400
      move = center
    }
    windowrule {
      name = Floating Save Windows
      match:title = ^(Save File)$
      float = on
      size = 350 350
      move = center
    }
    windowrule {
      name = Floating Save Windows
      match:title = ^(Open.*)$
      float = on
      size = 350 350
      move = center
    }
    windowrule {
      name = Floating Save Windows
      match:title = ^(Open Files)$
      float = on
      size = 350 350
      move = center
    }
    windowrule {
      name = Floating Save Windows
      match:title = ^(Save File)$
      float = on
      size = 350 350
      move = center
    }
    windowrule {
      name = Save
      match:title =^(Save)$
      float = on
      size = 350 350
      move = center
    }
    windowrule {
      name = Save
      match:title =^(Save.*)$
      float = on
      size = 350 350
      move = center
    }
    windowrule {
      name = Save
      match:title =^File Upload.*$
      float = on
      size = $windowSize
      move = center
    }
    '';
  };
}
