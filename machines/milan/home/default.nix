{ ... }: {
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
            ../../../modules/apps/lazygit
            ../../../modules/apps/neofetch
            ../../../modules/apps/nvim
            ../../../modules/apps/tmux
            ../../../modules/apps/yazi
            ../../../modules/apps/zsh
        ];

        # let home mananger install and manager itself
        programs.home-manager.enable = true;

        home.stateVersion = "25.05";
    };
}
