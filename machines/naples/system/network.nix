{ lib, ... }: {

    networking.networkmanager.enable = lib.mkForce true;

    networking.useDHCP = true;
    networking.dhcpcd.enable = true;
}
