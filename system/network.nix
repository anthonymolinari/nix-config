{ config, pkgs, ...}: {

    networking.hostName = "fragile"; # Define your hostname.

    networking.networkmanager.enable = false;

    networking = {
        enableIPv6 = false;
        interfaces.ens18 = {
            ipv4.addresses = [{
                address = "172.24.10.20";
                prefixLength = 24;
            }];
        };
        defaultGateway = {
            address = "172.24.10.1";
            interface = "ens18";
        };
        nameservers = [ "1.1.1.1" "8.8.8.8" ];
        firewall = {
            enable = true;
            allowedTCPPorts = [ 22 80 443 32400 ];
        };
    };

}
