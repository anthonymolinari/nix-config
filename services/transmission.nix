{ config, pkgs, ... } : {
    environment.systemPackages = with pkgs; [ transmission ];

    services.transmission = {
        enable = true;
        user = "transmission";
        group = "transmission";
    }

}
