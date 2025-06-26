{ pkgs, ... }: {
    home-manager.users.anthony = { ... }: {

        home.username = "anthony";
        home.homeDirectory = "/home/anthony";
        home.sessionVariables = {
            EDITOR = "nvim";
        };

        # import packages & configs managed by home-manager
        imports = [
            ../../../modules/apps/btop
            ../../../modules/apps/fzf
            ../../../modules/apps/git
            ../../../modules/apps/kitty
            ../../../modules/apps/lazygit
            ../../../modules/apps/neofetch
            ../../../modules/apps/nvim
            ../../../modules/apps/ranger
            ../../../modules/apps/yazi
            ../../../modules/apps/tmux
            ../../../modules/apps/zsh
        ];

        dconf = {
            enable = true;
            settings = {
                "org/gnome/desktop/interface" = {
                    color-scheme = "prefer-dark";
                    accent-color = "teal";
                };
                "org/gnome/desktop/applications/terminal" = {
                    exec = "kitty"
                };
            };
        };
        
        # additional packages w/ config 
        home.packages = with pkgs; [
            firefox    
            steam
            spotify
        ];

        # let home mananger install and manager itself
        programs.home-manager.enable = true;
        home.stateVersion = "25.05";
    };
}
