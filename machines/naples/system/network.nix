{ lib, ... }: {

    networking.networkmanager.enable = lib.mkForce true;

    networking.useDHCP = lib.mkForce true;
    networking.dhcpcd.enable = true;
}
