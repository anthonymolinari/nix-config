{ ... }: {

    # the main nix config for milan 
    networking.hostName = "milan";

    # import modules, desktop environment, services, etc.
    imports = [
        ../_common
        ../../modules/services/plex
        ../../modules/services/samba
        ../../modules/services/servarr
    ];
}
