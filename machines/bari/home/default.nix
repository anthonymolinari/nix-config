{... }: {
    home-manager.users.anthony = { pkgs, ... }: {

        home.username = "anthony";
        home.homeDirectory = "/home/anthony";
        home.sessionVariables = {
            EDITOR = "nvim";
        };

        # import packages & configs managed by home-manager
        imports = [
            ../../../modules/desktops/hyprland
            ../../../modules/apps/btop
            ../../../modules/apps/fzf
            ../../../modules/apps/git
            ../../../modules/apps/kitty
            ../../../modules/apps/lazygit
            ../../../modules/apps/neofetch
            ../../../modules/apps/nvim
            ../../../modules/apps/ranger
            ../../../modules/apps/rofi
            ../../../modules/apps/tmux
            ../../../modules/apps/zsh
        ];
        

        home.packages = with pkgs; [
            firefox
            spotify
        ];

        # let home mananger install and manager itself
        programs.home-manager.enable = true;

        home.stateVersion = "25.05";
    };
}
