{ ... }: {
    
    # the main nix config for naples
    networking.hostName = "naples";
 
    # import modules, desktop environment, services, etc.
    imports = [
        ./system
        ./home
        ../_common
    ];
}
