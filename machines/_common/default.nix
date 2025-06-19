{ pkgs, ... }: 

{

    # enable flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # set splash screen
    #boot.loader.grub.splashImage = ./nix_splash.png;

    # import shared modules
    imports = [
        ../../users/anthony
    ];

    environment.systemPackages = with pkgs; [
        just
        wget
    ];

    system.stateVersion = "25.05"; 
}
