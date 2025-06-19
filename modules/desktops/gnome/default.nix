{ pkgs, ... }: {
    services.xserver = {
        enable = true;
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
    };

    environment.systemPackages = with pkgs; [
        gnomeExtensions.blur-my-shell
        gnomeExtensions.just-perfection
        gnomeExtensions.arc-menu
    ];

    environment.gnome.excludePackages = ( with pkgs; [
        atomix
        epiphany
        evince
        geary
        gedit
        gnome-characters
        gnome-music
        gnome-photos
        gnome-terminal
        gnome-tour
        hitori
        iagno
        tali
        totem
    ]);

}
