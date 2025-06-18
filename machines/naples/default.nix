{ ... }: {
    
    # the main nix config for naples
 
    # enable flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # import modules, desktop environment, services, etc.
    imports = [

    ];


    system.stateVersion = "25.05"; 

}
