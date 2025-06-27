{ ... }: {

    dconf = {
        enable = true;
        settings = {
            "org/gnome/desktop/interface" = {
                color-scheme = "prefer-dark";
                accent-color = "teal";
            };
            "org/gnome/desktop/applications/terminal" = {
                exec = "kitty";
            };
        };
    };
}
