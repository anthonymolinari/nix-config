{ pkgs, lib, modulesPath, ... }: 
let 
    diskid = "";
in
{
    imports =[ (modulesPath + "/profiles/qemu-guest.nix") ];

    # bootloader
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/sda"; # change later
    boot.loader.grub.useOSProber = true;
    boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "virtio_pci" "virtio_scsi" "sd_mod" "sr_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ ];
    boot.extraModulePackages = [ ];

    # filesystems
    environment.systemPackages = with pkgs; [
        btrfs-progs
    ];
    # mount fs 
    filesystems."/" = {
        device = "/dev/disk/by-uuid/${diskid}";
        fsType = "btrfs";
    };

    # network
    networking.networkmanager.enable = false;
    networking = {
        enableIPv6 = false;
        interfaces.ens18 = {
            ipv4.addresses = [{
                address = "172.24.10.22";
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

    # keyboard
    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
    };

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
