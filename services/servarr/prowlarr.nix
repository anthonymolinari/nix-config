{ config, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        prowlarr
    ];  

    services.prowlarr = {
        enable = true;
        openFirewall = true;
    };


}

