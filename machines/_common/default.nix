{ ... }: {

    # enable flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # import shared modules
    imports = [
        ../../users/anthony
    ];

    system.stateVersion = "25.05"; 
}
