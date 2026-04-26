{
  programs.waybar = {
  enable = true;
  settings = {

  mainBar = {
	layer = "top";
	position = "top";
  height = 26;
  reload_style_on_change = true;

	modules-left = [
		"hyprland/workspaces"
		"custom/right-arrow-dark"
    "wlr/taskbar"
	];
	modules-center = [
		"custom/left-arrow-dark"
		"clock#2"
		"custom/right-arrow-dark"
	];
	modules-right = [
		"tray"
		"custom/left-arrow-dark"
		"cpu"
		"custom/left-arrow-light"
		"custom/left-arrow-dark"
		"memory"
		"custom/left-arrow-light"
		"custom/left-arrow-dark"
		"pulseaudio"
		"custom/left-arrow-light"
		"custom/left-arrow-dark"
		"disk"
		"custom/left-arrow-light"
		"custom/left-arrow-dark"
		"battery"
		"custom/left-arrow-light"
		"custom/arch"
	];

  "wlr/taskbar" = {
    format = "{icon}";
    icon-size = 14;
    icon-theme = "Numix-Circle";
    tooltip-format = "{title}";
    on-click = "activate";
    on-click-middle = "close";
    ignore-list = [
       "Alacritty"
    ];
    };
    rewrite = {
        "Firefox Web Browser" = "Firefox";
        "Foot Server" = "Terminal";
        ".*(steam_app_[0-9]+).*" = "Game";

    };

	"custom/left-arrow-dark" = {
		format = "";
		tooltip = false;
    background = "#1a1a1a";
	};
	"custom/left-arrow-light" = {
		format = "";
		tooltip = false;
	};
	"custom/right-arrow-dark" = {
		format = "";
		tooltip = false;
	};
	"custom/right-arrow-light" = {
		format = "";
		tooltip = false;
	};
"bluetooth" = {
	# "controller" = "controller1"; // specify the alias of the controller if there are more than 1 on the system
	"format" = "󰂲";
	"format-disabled" = ""; # an empty format will hide the module
	"format-connected" = "";
	"tooltip-format" = "{controller_alias}\t{controller_address}";
	"tooltip-format-connected" = "{controller_alias} {device_battery_percentage}%\t{controller_address}\n\n{device_enumerate}";
	"tooltip-format-enumerate-connected" = "{device_alias}\t{device_address}";
};
"custom/gpu-usage" = {
  "exec" = "cat /sys/class/hwmon/hwmon2/device/gpu_busy_percent";
  "format" = "{}%";
  "return-type" = "";
  "interval" = 1;
};
  "custom/arch" = {
    "format" = "";
    "on-click" = "pkill waybar; waybar &";
    "tooltip" =false;
    "icon-size" = 16;
  };
  "tray" = {
        "icon-size" = 16;
        "rotate" = 0;
        "spacing" = 8;
    };

	"hyprland/workspaces" = {
		"disable-scroll" = true;
		"format" = "{name}";
	};

	"clock#1" = {
		"format" = "{ =%a}";
		"tooltip" = false;
	};
	"clock#2" = {
		"format" = "{:%H:%M}";
		"tooltip" = true;
    "tooltip-format" ="{:%Y-%m-%d}";
	};
	"clock#3" = {
		"format" = "{ =%m-%d}";
		"tooltip" = false;
	};
	# 
	"memory" = {
		"interval" = 5;
		"format" = "  {}%/{swapPercentage}%";
	};
	# 
	"cpu" = {
		"interval" = 5;
		"format" = "  {usage}%";
	};
	"battery" = {
		"states" = {
			"good" = 95;
			"warning" = 30;
			"critical" = 15;
		};
		"format" = "{icon}  {capacity}%";
		"format-icons" = [
			""
			""
			""
			""
			""
		];
    on-click = "pkill waybar; waybar &";
    format-charging = "󱐋 {icon}  {capacity}%";
	};
	# 
	"disk" = {
		"interval" = 5;
		"format" = "  {specific_free:0.1f}";
		"path" = "/";
    "unit" = "GB";
	};

  "pulseaudio" = {
  	"format" = "{icon}  {volume:2}%";
  	"format-bluetooth" = "  {volume}%";
  	"format-muted" = "󰝟  {volume}";
  	"format-icons" = {
  		"headphones" = "";
  		"default" = [
  			""
  			""
  		];
  	};
  	"scroll-step" = 5;
  	"on-click" = "pamixer -t";
  	"on-click-right" = "terminator -e pavucontrol";
  };
}; # mian bar
}; # waybar settings

  style = ''
    * {
    	font-family: "UbuntuMono Nerd Font Mono", "UbuntuMono Nerd Font Propo", sans-serif;
    	font-weight: 700;
    	padding: 0 0px;
      font-size: 14px;
    }
    
    window#waybar {
    	background: #101010;
    	color: #fdf6e3;
      margin: 0;
      margin-top: 0;
      padding: 0;
    }
    
    #custom-right-arrow-dark,
    #custom-left-arrow-dark {
    	color: #1a1a1a;
    }
    #custom-right-arrow-light,
    #custom-left-arrow-light {
    	color: #101010;
    	background: #1a1a1a;
    }
    #custom-arch {
      color: #1793d1;
      padding: 2px;
      padding-right: 8px;
      font-size: 16px;
    }
    
    #custom-gpu-usage {
    	color: #6c71c4;
    	background: #1a1a1a;
    	padding: 0 8px;
      min-width: 10px;
    }
    
    #workspaces,
    #bluetooth,
    #clock.1,
    #clock.2,
    #clock.3,
    #pulseaudio,
    #memory,
    #battery,
    #disk {
    	background: #1a1a1a;
    }
    #cpu {
    	background: #1a1a1a;
      min-width: 10px;
    }
    #tray {
      background: #101010;
    }
    
    #workspaces button {
    	padding: 0 0px;
      margin: 0;
      min-width: 0px;
    	color: #268bd2;
    	padding-top: 2px;
    	padding-bottom: 2px;
    	padding-left: 6px;
    	padding-right: 6px;
    }
    #workspaces button.active {
    	color: #fdf6e3;
    }
    #workspaces button:hover {
    }
    #workspaces button:hover {
    }
    
    #memory {
    	color: #268bd2;
    }
    #cpu {
    	color: #A957C2;
    }
    #battery {
    	color: #b58900;
    }
    #disk {
    	color: #859900;
    }
    
    #clock,
    #pulseaudio,
    #memory,
    #cpu,
    #battery,
    #disk {
    	padding: 0 8px;
    	padding-top: 2px;
    }
    #taskbar button {
      padding: 0;
      padding-left: 4;
      padding-right: 4;
    	margin: 0;
    	min-width: 0;
    }
    #pulseaudio {
    	color: #2aa198;
    }
  ''; # end of stylesheet



};
}
