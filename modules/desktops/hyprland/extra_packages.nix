{ pkgs, ... }: {

    home.packages = with pkgs; [
        brightnessctl
        kdePackages.dolphin
        overskride
        wl-clipboard
    ];
}
