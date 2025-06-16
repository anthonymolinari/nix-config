{ config, pkgs, ... }: 

let 
    sdd_uuid_1 = "";
    sdd_uuid_2 = "";
    big_storage_uuid_1 = "";
    big_storage_uuid_2 = "";
in
{
    environment.systemPackages = with pkgs; [
        zfs
    ];

    # fast storage for services
    filesSystems."/mnt/500GB-ssd" = {};

    # large storage for media
    filesSystems."/mnt/10TB-media" = {};

}
