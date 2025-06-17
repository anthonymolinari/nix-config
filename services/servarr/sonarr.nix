{ config, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        sonarr
    ];  

    services.sonarr = {
        enable = true;
        openFirewall = true;
        dataDir = "/var/lib/sonarr";
    };


}
