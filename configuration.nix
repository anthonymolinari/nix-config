{ config, pkgs, ... }: {
    
    # enable flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    imports = [ 
        ./hardware-configuration.nix
        ./home-manager
        ./system
        ./services
        ./users/anthony
    ];

    system.stateVersion = "25.05"; 
}
