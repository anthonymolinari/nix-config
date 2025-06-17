{ config, pkgs, ... }: {

    environment.systemPackages = with pkgs; [
        sonarr
        radarr
        prowlarr
    ];  

    services.sonarr = {
        enable = true;
        openFirewall = true;
        dataDir = "/var/lib/sonarr";
    };

    services.radarr = {
        enable = true;
        openFirewall = true;
        dataDir = "/var/lib/radarr";
    };

    services.prowlarr = {
        enable = true;
        openFirewall = true;
    };

}

