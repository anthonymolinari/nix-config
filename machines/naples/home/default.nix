{ pkgs, ... }: {
    home-manager.users.anthony = { ... }: {

        home.username = "anthony";
        home.homeDirectory = "/home/anthony";
        home.sessionVariables = {
            EDITOR = "nvim";
        };

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
        
        # additional packages w/ config 
        home.packages = with pkgs; [
            firefox    
            steam
            spotify
        ];
    };
}
