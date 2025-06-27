{ ... }: {

    # the main nix config for genoa 
    networking.hostName = "genoa"; # Define your hostname.

    # import containerized services
    imports = [
        ../_common
        ./system
        ../../modules/services/podman
#        ../../modules/containers/booklore
#        ../../modules/containers/duckdns
        ../../modules/containers/frigate
        ../../modules/containers/home-assistant
        ../../modules/containers/omada-controller
        ../../modules/containers/openboks
    ];
}
