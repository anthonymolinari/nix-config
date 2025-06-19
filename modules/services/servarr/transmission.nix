{ config, pkgs, ... } : {
    environment.systemPackages = with pkgs; [ transmission_4 ];

    services.transmission = {
        enable = true;
        user = "transmission";
        group = "transmission";
    };

}
