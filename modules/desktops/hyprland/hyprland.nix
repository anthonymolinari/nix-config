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
            monitor = "eDP-1, 1920x1080@60, 0x0, 1.0";
            "$mod" = "SUPER";
            exec-once="waybar"; # start status bar
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
                "SUPER SHIFT, S, exec, hyprlock"
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
        };
    };

    services.hyprpaper = {
        enable = true;
        settings = {
            preload = [
                "~/Pictures/wallpapers/wallpaper_1.jpg"
            ];
            wallpaper = [
                "eDP-1, ~/Pictures/wallpapers/wallpaper_1.jpg"
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
