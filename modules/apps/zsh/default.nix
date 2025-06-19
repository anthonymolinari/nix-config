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
            theme = "";
        };
        shellAliases = {
 #           update = "sudo nixos-rebuild switch --flake .#${host} --impure";
            edit = "nvim /etc/nixos/";
        };

        history = {
            size = 10000;
            path = "${config.xdg.dataHome}/zsh/history";
        };
    };

}
