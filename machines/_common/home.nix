{ ... }: {
    home-manager.users.anthony = { pkgs, ... }: {

        home.username = "anthony";
        home.homeDirectory = "/home/anthony";
        home.sessionVariables = {
            EDITOR = "nvim";
        };

        imports = [
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
            ../../../modules/apps/yazi
            ../../../modules/apps/zsh
        ];
 
        catppuccin.flavor = "mocha";

        programs.home-manager.enable = true;

        home.stateVersion = "25.05";
    };
}
