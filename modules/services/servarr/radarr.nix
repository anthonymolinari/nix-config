{ config, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        radarr
    ];  

    services.radarr = {
        enable = true;
        openFirewall = true;
        dataDir = "/var/lib/radarr";
    };


}
