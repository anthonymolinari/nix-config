{ lib, ... }: {

    networking.networkmanager.enable = lib.mkDefault true;

    networking.useDHCP = true;
    networking.dhcpcd.enable = true;
}
