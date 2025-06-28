{ config, lib, pkgs, modulesPath, ... }:

{
    imports =
        [ (modulesPath + "/installer/scan/not-detected.nix")
        ];

    boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" "sdhci_pci" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-intel" ];
    boot.extraModulePackages = [ ];

    fileSystems."/" =
    { device = "/dev/disk/by-uuid/394396fc-6245-4621-87bd-d82133c8da1e";
        fsType = "ext4";
    };

    fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/5B18-5DDB";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" ];
    };

    swapDevices =[ { device = "/dev/disk/by-uuid/556d0e60-5fc7-406a-ad16-eafbc61e7576"; }
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

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

    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
