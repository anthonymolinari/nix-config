{ pkgs, ... }: {

    home.packages = with pkgs; [ hyprlock ];

    programs.hyprlock = {
        enable = true;
    };
    catppuccin.hyprlock.enable = true;
}
