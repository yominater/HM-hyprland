{
  programs.hyprlock = {
    enable = true;
    settings = {
        # sample hyprlock.conf
        # for more configuration options, refer https://wiki.hyprland.org/Hypr-Ecosystem/hyprlock
        #
        # rendered text in all widgets supports pango markup (e.g. <b> or <i> tags)
        # ref. https://wiki.hyprland.org/Hypr-Ecosystem/hyprlock/#general-remarks
        #
        # shortcuts to clear password buffer: ESC, Ctrl+U, Ctrl+Backspace
        #
        # you can get started by copying this config to ~/.config/hypr/hyprlock.conf
        #

        "$font" = "Ubuntu Mono";

        general = {
            hide_cursor = false;
        };

        # uncomment to enable fingerprint authentication
        # auth {
        #     fingerprint {
        #         enabled = true
        #         ready_message = Scan fingerprint to unlock
        #         present_message = Scanning...
        #         retry_delay = 250 # in milliseconds
        #     }
        # }

        animations = {
            enabled = true;
            bezier = "linear, 1, 1, 0, 0";
            fadeIn = {
              duration = 300;
              bezier = "linear";
            };
            fadeOut = {
              duration = 300;
              bezier = "linear";
            };
            inputFieldDots = {
              duration = 300;
              bezier = "linear";
            };
        };

        background = {
            monitor = "";
            path = "~/images/wallpapers/Aenami/alena-aenami-eclipse-1k.jpg";
            blur_passes = 3;
        };

        input-field = {
            monitor = "";
            size = "20%, 5%";
            outline_thickness = 3;
            inner_color = "rgba(0, 0, 0, 0.0)"; # no fill

            outer_color = "rgba(ebdbb2aa) rgba(00ff99ee) 45deg";
            check_color = "rgba(00ff99ee) rgba(ff6633ee) 120deg";
            fail_color = "rgba(ff6633ee) rgba(ff0066ee) 40deg";

            font_color = "rgb(143, 143, 143)";
            fade_on_empty = false;
            rounding = 15;

            font_family = "$font";
            placeholder_text = "Input password...";
            fail_text = "$PAMFAIL";

            # uncomment to use a letter instead of a dot to indicate the typed password
            # dots_text_format = *
            # dots_size = 0.4
            dots_spacing = 0.3;

            # uncomment to use an input indicator that does not show the password length (similar to swaylock's input indicator)
            # hide_input = true

            position = "0, -20";
            halign = "center";
            valign = "center";
        };

        # TIME
        label = {
            monitor = "";
            text = "$TIME"; # ref. https://wiki.hyprland.org/Hypr-Ecosystem/hyprlock/#variable-substitution
            font_size = 70;
            font_family = "$font";

            position = "-30, 0";
            halign = "right";
            valign = "top";
        onclick = "systemctl suspend";
        };
#
#        # DATE
#        label = {
#            monitor = "";
#            text = "cmd[update:60000] date +%A, %d %B %Y"; # update every 60 seconds
#            font_size = 25;
#            font_family = "$font";
#
#            position = "-20, -150";
#            halign = "right";
#            valign = "top";
#        onclick = s"ystemctl suspend";
#        };
#        # User
#        label = {
#            monitor = ""'
#            text = "$USER";
#            font_size = 32;
#            font_family = "$font";
#            position = "0, 45";
#            halign = "center";
#            valigh = "top";
#        };
    }; # settings
}; # hyprlock
}
