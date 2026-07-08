{ config, pkgs, ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;
    config = {
      modifier = "Mod1";
      terminal = "foot";
      menu = "wofi --show drun";

      fonts = {
        names = [
        "Ubuntu"
        ];
        size = 9.1;
      };
      seat = {
        "seat0".xcursor_theme = "Bibata-Modern-Ice 25";
      };

      startup = [
        { command = "waybar --config ${config.home.homeDirectory}/.config/waybar/configSway.jsonc --style ${config.home.homeDirectory}/.config/waybar/styleSway.css"; }
        { command = "hyprsunset"; }
        { command = "nm-applet --indicator"; }
        { command = "blueman-applet"; }
        { command = "dbus-update-activation-environment --systemd WAYLAND_DISPLAY DISPLAY XAUTHORITY"; }
        { command = "systemctl --user import-environment WAYLAND_DISPLAY DISPLAY XAUTHORITY"; }
        {
          command = ''
            swayidle -w \
              timeout 600 'swaymsg "output * power off"' \
                resume 'swaymsg "output * power on"' \
              timeout 800 'systemctl suspend' \
              before-sleep 'swaylock -f -e -l -c 000000 --indicator-idle-visible'
          '';
        }
      ];

      input = {
        "*" = {
          repeat_delay = "200";
          repeat_rate = "30";
          xkb_options = "caps:escape_shifted_capslock";
          pointer_accel = "0.01";
        };

        "ROCCAT ROCCAT Burst Pro" = {
          accel_profile = "flat";
          pointer_accel = "-1";
        };

        "type:touchpad" = {
          scroll_factor = ".15";
        };
      };

      output = {
        "eDP-1" = {
          mode = "1920x1080";
          position = "1920 0";
        };

        "*" = {
          background = "${config.home.homeDirectory}/images/wallpapers/current/alena-aenami-quiet-1px.jpg fill";
        };
      };

      gaps.inner = 0;
      gaps.smartGaps = true;
      window.hideEdgeBorders = "smart";
      window.border = 0;
      window.titlebar = false;

      keybindings = {
        "F10" = "exec wpctl set-volume -l 2 @DEFAULT_AUDIO_SINK@ 10%+";
        "F9" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%-";
        "Mod1+XF86AudioRaiseVolume" = "exec wpctl set-volume -l 2 @DEFAULT_AUDIO_SINK@ 1%+";
        "Mod1+XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-";
        "XF86AudioNext" = "exec playerctl next";
        "XF86AudioPrev" = "exec playerctl previous";
        "F8" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "F7" = "exec brightnessctl set +5%";
        "F6" = "exec brightnessctl set 5%-";
        "Mod1+q" = "kill";
        "Mod1+Return" = "exec foot";
        "Mod1+w" = "exec foot";
        "Mod1+f" = "exec chromium";
        "Mod1+o" = "exec obsidian";
        "Mod1+d" = "exec wofi --show drun";
        "Mod1+Shift+s" = "move scratchpad";
        "Mod1+s" = "scratchpad show";
        "Mod1+p" = "exec systemctl suspend -i";
        "Mod1+h" = "focus left";
        "Mod1+j" = "focus down";
        "Mod1+k" = "focus up";
        "Mod1+l" = "focus right";
        "Mod1+Left" = "focus left";
        "Mod1+Down" = "focus down";
        "Mod1+Up" = "focus up";
        "Mod1+Right" = "focus right";
        "Mod1+Shift+h" = "move left";
        "Mod1+Shift+j" = "move down";
        "Mod1+Shift+k" = "move up";
        "Mod1+Shift+l" = "move right";
        "Mod1+Shift+Left" = "move left";
        "Mod1+Shift+Down" = "move down";
        "Mod1+Shift+Up" = "move up";
        "Mod1+Shift+Right" = "move right";
        "Mod1+v" = "split h";
        "Mod1+c" = "split v";
        "Mod1+a" = "fullscreen toggle";
        "F4" = "fullscreen toggle";
        "Mod1+Shift+e" = "layout tabbed";
        "Mod1+e" = "layout toggle split";
        "Mod1+Shift+space" = "floating toggle";
        "Mod1+space" = "focus mode_toggle";
        "Mod1+Tab" = "workspace back_and_forth";
        "Mod1+1" = "workspace number 1";
        "Mod1+2" = "workspace number 2";
        "Mod1+3" = "workspace number 3";
        "Mod1+4" = "workspace number 4";
        "Mod1+5" = "workspace number 5";
        "Mod1+6" = "workspace number 6";
        "Mod1+7" = "workspace number 7";
        "Mod1+8" = "workspace number 8";
        "Mod1+9" = "workspace number 9";
        "Mod1+0" = "workspace number 10";
        "Mod1+Shift+1" = "move container to workspace number 1; workspace number 1";
        "Mod1+Shift+2" = "move container to workspace number 2; workspace number 2";
        "Mod1+Shift+3" = "move container to workspace number 3; workspace number 3";
        "Mod1+Shift+4" = "move container to workspace number 4; workspace number 4";
        "Mod1+Shift+5" = "move container to workspace number 5; workspace number 5";
        "Mod1+Shift+6" = "move container to workspace number 6; workspace number 6";
        "Mod1+Shift+7" = "move container to workspace number 7; workspace number 7";
        "Mod1+Shift+8" = "move container to workspace number 8; workspace number 8";
        "Mod1+Shift+9" = "move container to workspace number 9; workspace number 9";
        "Mod1+Shift+0" = "move container to workspace number 10; workspace number 10";
        "Mod1+n" = "exec i3-input -F 'rename workspace to \"%s\"' -P 'New name for this workspace: '";
        "Mod1+Shift+c" = "reload";
        "Mod1+Shift+r" = "reload";
        "Mod1+Shift+XF86PowerOff" = "exec swaymsg exit";
        "Mod1+r" = "mode resize";
      };

      modes.resize = {
        k = "resize grow height 10 px or 10 ppt";
        j = "resize shrink height 10 px or 10 ppt";
        h = "resize grow width 10 px or 10 ppt";
        l = "resize shrink width 10 px or 10 ppt";
        Left = "resize shrink width 10 px or 10 ppt";
        Down = "resize grow height 10 px or 10 ppt";
        Up = "resize shrink height 10 px or 10 ppt";
        Right = "resize grow width 10 px or 10 ppt";
        Return = "mode default";
        Escape = "mode default";
        "Mod1+r" = "mode default";
      };

      bars = [];
    };
  };
}
