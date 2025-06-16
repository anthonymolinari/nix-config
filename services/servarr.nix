{ config, pkgs, ... }: {

   services.sonarr = {
       enable = true;
       dataDir = "/var/lib/sonarr";
       openFirewall = true;
       user = "servarr";
       group = "servarr";
   };

   services.radarr = {
       enable = true;
       dataDir = "/var/lib/radarr";
       openFirewall = true;
       user = "servarr";
       group = "servarr";
   };

   services.prowlarr = {
       enable = true;
       dataDir = "/var/lib/prowlarr";
       openFirewall = true;
       user = "servarr";
       group = "servarr";
   };

}

