{ ... }: {

    # the main nix config for genoa
    networking.hostName = "genoa";

    # import modules, desktop environment, services, etc.
    imports = [
        ./system
        ./home # home-manager config
        ../_common
        ../../modules/services/plex
        ../../modules/services/samba
        ../../modules/services/servarr
    ];
}
