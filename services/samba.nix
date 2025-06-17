{ config, pkgs, ... }: {

    services.samba = {
        enable = true;
        settings = {
            "public" = {
                "path" = "/public";
                "read only" = "no";
                "browseable" = "yes";
                "guest ok" = "no";
                "comment" = "public samba share";
            };
        };
    };
}
