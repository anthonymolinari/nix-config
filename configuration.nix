{ config, pkgs, ... }: {
    
    imports = [ 
        ./hardware-configuration.nix
        ./home-manager
        ./system
        ./services
        ./users/anthony
    ];

    system.stateVersion = "25.05"; 
}
