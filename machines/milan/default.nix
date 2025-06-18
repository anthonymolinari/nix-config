{ ... }: {

    # the main nix config for milan 
   
    # enable flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # import modules, desktop environment, services, etc.
    imports = [
        ../../services
    ];


    system.stateVersion = "25.05"; 
}
