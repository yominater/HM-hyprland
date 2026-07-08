{
  wayland.windowManager.sway = {
    enable = true;
    extraConfig = "
    set $browser chromium
    set $terminal foot
    set $obsidian obsidian
    set $files thunar
    set $menu wofi --show drun
    set $bar waybar --config /home/yomi/.config/waybar/configSway.jsonc --style /home/yomi/.config/waybar/styleSway.css
    ";
      config = {
        output = {
          eDP-1 = {
          mode = "1920x1080";
          pos = "1920 0";
          };
          "*" = {
            bg = "/home/yomi/images/wallpapers/current/* fill";
          };
            
        }; # output
        seat = {
          seat0 = "xcursor_theme Bibata-Modern-Ice 25";
        }; # seat0
        font = "pango:Ubuntu 9";
        input = {
          * = {
            repeat_delay = "200";
            repeat_rate = "30";
            xkb_otpions caps:escape_shifted_capslock


    

#######################
## NixOS Sway Config ##
#######################

set $browser chromium
set $terminal foot
set $obsidian obsidian
set $files thunar
set $menu wofi --show drun
set $bar waybar --config /home/yomi/.config/waybar/configSway.jsonc --style /home/yomi/.config/waybar/styleSway.css


#########
# Input #
#########

# Keyboard
input * {
	repeat_delay 200
	repeat_rate 30
  xkb_options caps:escape_shifted_capslock
}
input "ROCCAT ROCCAT Burst Pro" {
	accel_profile "flat"
	pointer_accel -1
}
# Pointer
input * {
  pointer_accel 0.01
}
input type:touchpad {
  scroll_factor .15
}

#################
# Main Settings #
#################

gaps inner 0
smart_gaps on
hide_edge_borders smart

# no title bar
default_border pixel 0
default_floating_border pixel 1
for_window [class="^.*"] border pixel 3


#############
# Autostart #
#############

exec --no-startup-id $bar
exec --no-startup-id hyprsunset
exec --no-startup-id nm-applet --indicator
exec --no-startup-id blueman-applet

exec dbus-update-activation-environment --systemd WAYLAND_DISPLAY DISPLAY XAUTHORITY
exec systemctl --user import-environment WAYLAND_DISPLAY DISPLAY XAUTHORITY

exec --no-startup-id swayidle -w \
  timeout 600 'swaymsg "output * power off"' \
    resume 'swaymsg "output * power on"' \
  timeout 800 'systemctl suspend' \
  before-sleep 'swaylock -f -e -l -c 000000 --indicator-idle-visible'

# exec --no-startup-id mako
# for notify-send

############
# KEYBINDS #
############
set $mod Mod1

bindsym F10 exec --no-startup-id wpctl set-volume -l 2 @DEFAULT_AUDIO_SINK@ 10%+
bindsym F9 exec --no-startup-id wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%-
bindsym $mod+XF86AudioRaiseVolume exec --no-startup-id wpctl set-volume -l 2 @DEFAULT_AUDIO_SINK@ 1%+
bindsym $mod+XF86AudioLowerVolume exec --no-startup-id wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-
bindsym XF86AudioNext exec --no-startup-id playerctl next
bindsym XF86AudioPrev exec --no-startup-id playerctl previous

bindsym F8 exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
# bindsym XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

# play and pause audio with playerctl
#bindsym F8 exec playerctl play-pause

# Brightness
bindsym F7 exec --no-startup-id brightnessctl set +5%
bindsym F6 exec --no-startup-id brightnessctl set 5%-

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# move tiling windows via drag & drop by left-clicking into the title bar,
# or left-clicking anywhere into the window while holding the floating modifier.
tiling_drag modifier

# kill focused window
bindsym --no-repeat $mod+q kill

bindsym --no-repeat $mod+Return exec $terminal
bindsym --no-repeat $mod+w exec $terminal
bindsym --no-repeat $mod+f exec $browser
bindsym --no-repeat $mod+o exec $obsidian

# start dmenu (a program launcher)
#bindsym $mod+d exec --no-startup-id dmenu_run
# A more modern dmenu replacement is rofi:
bindsym --no-repeat $mod+d exec $menu

# scatchpad
bindsym --no-repeat $mod+Shift+s move scratchpad
bindsym --no-repeat $mod+s scratchpad show

# System commands
bindsym --no-repeat $mod+p exec systemctl suspend -i

# change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right


# move focused window
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right


bindsym $mod+v split h
bindsym $mod+c split v

# enter fullscreen mode for the focused container
bindsym --no-repeat $mod+a fullscreen toggle
bindsym --no-repeat F4 fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
#bindsym $mod+Shift+w layout tabbed
bindsym --no-repeat $mod+Shift+e layout tabbed
bindsym --no-repeat $mod+e layout toggle split

# toggle tiling / floating
bindsym --no-repeat $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym --no-repeat $mod+space focus mode_toggle

# focus the child container
#bindsym $mod+d focus child

# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

# switch recent workspace
bindsym --no-repeat $mod+Tab workspace back_and_forth 

# switch to workspace
bindsym $mod+1 workspace number $ws1
bindsym $mod+2 workspace number $ws2
bindsym $mod+3 workspace number $ws3
bindsym $mod+4 workspace number $ws4
bindsym $mod+5 workspace number $ws5
bindsym $mod+6 workspace number $ws6
bindsym $mod+7 workspace number $ws7
bindsym $mod+8 workspace number $ws8
bindsym $mod+9 workspace number $ws9
bindsym $mod+0 workspace number $ws10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace number $ws1; workspace number $ws1
bindsym $mod+Shift+2 move container to workspace number $ws2; workspace number $ws2
bindsym $mod+Shift+3 move container to workspace number $ws3; workspace number $ws3
bindsym $mod+Shift+4 move container to workspace number $ws4; workspace number $ws4
bindsym $mod+Shift+5 move container to workspace number $ws5; workspace number $ws5
bindsym $mod+Shift+6 move container to workspace number $ws6; workspace number $ws6
bindsym $mod+Shift+7 move container to workspace number $ws7; workspace number $ws7
bindsym $mod+Shift+8 move container to workspace number $ws8; workspace number $ws8
bindsym $mod+Shift+9 move container to workspace number $ws9; workspace number $ws9
bindsym $mod+Shift+0 move container to workspace number $ws10; workspace number $ws10

bindgesture --exact swipe:3:left workspace next
bindgesture --exact swipe:3:right workspace prev
bindgesture --exact swipe:3:up move scratchpad
bindgesture --exact swipe:3:down scratchpad show
bindgesture --exact swipe:4:down move window to workspace current

bindsym $mod+n exec i3-input -F 'rename workspace to "%s"' -P 'New name for this workspace: '

# reload the configuration file
bindsym $mod+Shift+c reload
# restart sway inplace (preserves your layout/session, can be used to upgrade sway)
bindsym $mod+Shift+r reload
# exit sway (logs you out of your Wayland session)
#bindsym $mod+Shift+m exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit Sway? This will end your Wayland session.' -B 'Yes, exit Sway' 'i3-msg exit'"

# force quit sway
bindsym $mod+Shift+XF86PowerOff exec "swaymsg exit"

mode "resize" {
        bindsym k resize grow height 10 px or 10 ppt
        bindsym j resize shrink height 10 px or 10 ppt
        bindsym l resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape or $mod+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+r mode "default"
}

bindsym $mod+r mode "resize"
