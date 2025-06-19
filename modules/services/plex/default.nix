{ config, pkgs, ... } : {

    environment.systemPackages = with pkgs; [ plex ];

    services.plex = {
        enable = true;
        dataDir = "/var/lib/plex";
        openFirewall = true;
        user = "plex";
        group = "plex";
    };
}
