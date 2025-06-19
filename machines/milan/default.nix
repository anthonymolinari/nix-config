{ ... }: {

    # the main nix config for milan 
    networking.hostName = "milan";

    # import modules, desktop environment, services, etc.
    imports = [
        ./home # home-manager config
        ../_common
        ../../modules/services/plex
        ../../modules/services/samba
        ../../modules/services/servarr
    ];
}
