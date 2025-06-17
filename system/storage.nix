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
        btrfs-progs
    ];

    # fast storage for services
    #filesSystems."/mnt/500GB-ssd" = {
#        device = "/dev/disk/by-uuid/"
#        fstype = "btrfs"
#        };

    # large storage for media
    #filesSystems."/mnt/10TB-media" = {};
#        device = "/dev/disk/by-uuid/"
#        fstype = "zfs"
#        };


}
