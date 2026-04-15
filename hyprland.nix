{
  wayland.windowManager.hyprland = {
  plugins = [
    # inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprwinwrap
    # inputs.hyprsysteminfo.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  settings= {
    "$mainMod" = "ALT";
    "$WinMod" = "SUPER";
    "$terminal" = "konsole";
    "$fileMan" = "thunar";
    "$menu" = "wofi --show drun";
    "$browser" = "firefox --enable-features=UseOzonePlatform --ozone-platform=wayland";
    "$obsidianX" = "flatpak run md.obsidian.Obsidian";
    "$ss_copy" = "grim -g \"$(slurp -d)\" - | wl-copy";
    "$ss_save" = "slurp | grim -g - $(xdg-user-dir PICTURES)/Screenshots/$(date +'screenshot_%Y-%m-%d-%H%M%S.png')";
    
    exec-once = [
      "systemctl --user start hyprpolkitagent"
      #"hyprctl setcursor $cursor $cursor_size"
      "waybar"
      "awww img ~/images/Wallpapers/Aenami/alena-aenami-horizon-1k.jpg"
      "hyprsunset"
      "blueman-applet"
      "dunst"
      "cliphist"
    ];
    env = [
      "QT_QPA_PLATFORM,wayland"
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
      "QT_QPA_PLATFORMTHEME,qt6ct"
    ];

    general = {
      gaps_in = 0;
      gaps_out = 0;
      border_size = 4;
      layout = "dwindle";
      "col.active_border" = "rgba(ebdbb2aa)";
	    "col.inactive_border" = "rgba(595959aa)";
      resize_on_border = true;
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
      force_split = 2;
      default_split_ratio = 1.3;
    };

    cursor = {
      inactive_timeout = 3;
    };

    decoration = {
      rounding = 0;
      active_opacity = 1.0;
      inactive_opacity = 1.0;
      blur = {
        enabled = true;
        size = 3;
        passes = 3;
        vibrancy = 0.2696;
      };
    };

    input = {
      kb_layout = "us";
      kb_options = caps:escape_shifted_capslock;
      repeat_delay = 200;
      repeat_rate = 32;
      follow_mouse = 1;
    };
    device = {
      name = "roccat-roccat-burst-pro";
      sensitivity = -0.4;
    };

    animations = {
      enabled = true;
      bezier = [
        "easeOutQuint,0.23,1,0.32,1"
        "easeInOutCubic,0.65,0.05,0.36,1"
        "linear,0,0,1,1"
        "almostLinear,0.5,0.5,0.75,1.0"
        "quick,0.15,0,0.1,1"
      ];
      animation = [
        "global, 1, 10, default"
        "border, 1, 5.39, easeOutQuint"
        "windows, 1, 4.79, easeOutQuint"
        "windowsIn, 1, 6.1, easeOutQuint, popin 87%"
        "windowsOut, 1, 2.49, easeOutQuint, popin 87%"
        "fadeIn, 1, 1.73, almostLinear"
        "fadeOut, 1, 1.46, almostLinear"
        "fade, 1, 3.03, quick"
        "layers, 1, 3.81, easeOutQuint"
        "layersIn, 1, 4, easeOutQuint, fade"
        "layersOut, 1, 1.5, linear, fade"
        "fadeLayersIn, 1, 1.79, almostLinear"
        "fadeLayersOut, 1, 1.39, almostLinear"
        "workspaces, 1, 1.94, almostLinear, slide"
        "workspacesIn, 1, 1.21, almostLinear, slide"
        "workspacesOut, 1, 1.94, almostLinear, slide"
      ];
    };

    misc = {
      disable_hyprland_logo = true;
      swallow_regex = "^(Alacritty|Konsole)$";
      enable_swallow = true; # when an app is run by a terminal, make the terminal go away while the app is running
      vfr = true; # always keep on
      vrr = 2; # enable variable refresh rate (0=off, 1=on, 2=fullscreen only, 3 = fullscreen games/media)
    };

    bind =
      [
        "$mainMod, RETURN, exec, $terminal"
        "$mainMod SHIFT, RETURN, exec, $terminal --title floating"
        "$mainMod, F, exec, firefox"
        "$mainMod, P, exec, systemctl suspend"
        "$winMod SHIFT, s, exec, $hyprshot"
        "$winMod, E, exec, $fileManager"
        "$mainMod, D, exec, $menu"
        "$mainMod, O, exec, $obsidianX"

        "$mainMod, TAB,workspace,previous"
        "$mainMod, A, fullscreen,"
        "$mainMod SHIFT, V, togglefloating,"
        "$mainMod SHIFT, M, exit,"
        "$mainMod, Q, killactive"
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        ",F12, exec, wpctl set-volume -l 2 @DEFAULT_AUDIO_SINK@ 10%+"
        ",F11, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%-"
        "$mainMod,F12, exec, wpctl set-volume -l 2 @DEFAULT_AUDIO_SINK@ 1%+"
        "$mainMod,F11, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"
        ", F8, exec, playerctl play-pause"

        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"
        "$mainMod SHIFT, H, movewindow, l"
        "$mainMod SHIFT, L, movewindow, r"
        "$mainMod SHIFT, K, movewindow, u"
        "$mainMod SHIFT, J, movewindow, d"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mainMod, code:1${toString i}, workspace, ${toString ws}"
              "$mainMod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );
      bindm = [
        "$winMod, mouse:272, movewindow"
        "$winMod, mouse:273, resizewindow"
      ];

    windowrule = [
      "float on, match:title ^(Save Files)$"
      "float on, match:title ^(Save As)*$"
      "float on, match:title ^(floating)$"
      "suppress_event = maximise, match:class = .*"
      "float on, match:title ^(Picture-in-Picture)"
    ];

  };
  }; # settings
}
