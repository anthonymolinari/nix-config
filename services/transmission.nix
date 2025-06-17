{ config, pkgs, ... } : {

    services.transmission = {
        enable = true;
        user = "transmission";
        group = "transmission";
    }

}
