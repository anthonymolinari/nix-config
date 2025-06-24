{ lib, pkgs, ... }: {

    home.packages = with pkgs; [
        yazi
        bat
    ];


    programs.yazi = {
        enable = true;
        settings = {
            manager = {
                sort_by = "natural";
                sort_sensitive = true;
                sort_reverse = false;
                sort_dir_first = true;
                show_hidden = true;
                show_symlink = true;
                linemode = "none";
            };
            keymap = {

            };
            theme = lib.importTOML ./catppuccin-mocha-teal.toml;
        };
    };

}
