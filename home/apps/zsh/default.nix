{ config, pkgs, ... }: 
{

    home.packages = with pkgs; [ zsh ];

    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        oh-my-zsh = {
            enable = true;
            plugins = [ "git" ];
            theme = "gallifrey";
        };
        shellAliases = {
            edit = "nvim /etc/nixos/";
            cnvim = "nvim .config/nvim/";
            dev-shell = "bash /etc/nixos/scripts/shell/setup-shell.sh";
        };

        history = {
            size = 10000;
            path = "${config.xdg.dataHome}/zsh/history";
        };
    };

}
