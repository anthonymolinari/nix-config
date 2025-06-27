{ pkgs, ... }: 

{
    home-manager.useGlobalPkgs = true;

    # enable flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    time.timeZone = "America/Los_Angeles";

    nixpkgs.config.allowUnfree = true;

    # set splash screen
    #boot.loader.grub.splashImage = ./nix_splash.png;

    # import shared modules
    imports = [
        ../../users/anthony
    ];

    environment.systemPackages = with pkgs; [
        just
        wget
        direnv
    ];
    programs.direnv.enable = true;

    system.stateVersion = "25.05"; 
}
