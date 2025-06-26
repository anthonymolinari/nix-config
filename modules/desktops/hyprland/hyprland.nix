{ pkgs, ... }: {

    home.packages = with pkgs; [ 
        hyprpaper
        hypridle
        hyprpicker
        hyprsunset
    ];

    wayland.windowManager.hyprland = {
        enable = true;
        settings = {
            monitor = ",preferred,0x0,1.0";
            "$terminal" = "kitty";
            "$fileManager" = "dolphin";
            "$menu" = "wofi --show drun";
            "$mod" = "SUPER";
            exec-once= [
                " waybar" # start status bar
            ];
            windowrule = [
                "suppressevent maximize, class:.*"
                "nofocus,class:^$,title:^$,xwayland:1,fullscreen:0,pinned:0"
            ];
            bindel = [
                ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
                ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
                ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
                ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
                ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
                ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
            ];
            bind = [
                "$mod, RETURN, exec, kitty"
                "SUPER SHIFT, Q, killactive,"
                "SUPER SHIFT, E, exit,"
                "SUPER SHIFT, P, rofi -show power-menu -modi power-menu:rofi-power-menu"
                "$mod, F, fullscreen,"
                "$mod, E, exec, dolphon"
                "$mod, G, exec, firefox"
                "$mod, D, exec, rofi -show drun"
                "SUPER SHIFT, H, movewindow, l"
                "SUPER SHIFT, L, movewindow, r"
                "SUPER SHIFT, K, movewindow, u"
                "SUPER SHIFT, J, movewindow, d"
                "$mod, H, movefocus, l"
                "$mod, J, movefocus, d"
                "$mod, K, movefocus, u"
                "$mod, L, movefocus, r"
                "$mod, S, togglespecialworkspace, magic"
                "$SUPER SHIFT, S, movetoworkspace, special:magic"
            ]
            ++ (
                builtins.concatLists (builtins.genList (i:
                    let ws = i + 1;
                    in [
                        "$mod, code:1${toString i}, workspace, ${toString ws}"
	                    "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
                    ]
                )
                9)
            );

            general = {
                gaps_in = 2.5;
                gaps_out = 5;
                border_size = 1;
                resize_on_border = false;
                allow_tearing = false;
                layout = "dwindle";
            };

            decoration = {
                rounding = 0;
                rounding_power = 0;

                active_opacity = 1.0;
                inactive_opacity = 1.0;

                shadow = {
                    enabled = true;
                    range = 4;
                    render_power = 3;
                    color = "rgba(1a1a1aee)";
                };

                blur = {
                    enabled = true;
                    size = 3;
                    passes = 1;
                    vibrancy = 0.1696;
                };
            };

            dwindle = {
                pseudotile = true;
                preserve_split = true;
            };

            master = {
                new_status = "master";
            };

            misc = {};
            input = {};
            gestures = {
                workspace_swipe = true;
            };
            device = {};
        };
    };

    catppuccin.hyprland.enable = true;

    services.hyprpaper = {
        enable = true;
        settings = {
            preload = [
                "~/Pictures/wallpapers/wallpaper_2.jpg"
            ];
            wallpaper = [
                "eDP-1, ~/Pictures/wallpapers/wallpaper_2.jpg"
            ];
        };
    };

    services.hypridle = {
        enable = true;
        settings = {
            general = {
                after_sleep_cmd = "hyprctl dispatch dpms on";
                ignore_dbus_inhibit = false;
                lock_cmd = "hyprlock";
            };
            listener = [
                {
                    timeout = 900;
                    on-timeout = "hyprlock";
                }
                {
                    timeout = 1200;
                    on-timeout = "hyprctl dispatch dpms off";
                    on-resume = "hyprctl dispatch dpms on";
                }
            ];
        };
    };

    services.hyprsunset = {
        enable = true;
    };
}
