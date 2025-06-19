{ lib, ... }: {
    
    # bootloader
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/sda"; # change later
    boot.loader.grub.useOSProber = true;

    # filesystems


    # keyboard

    # additional hardware configuration 


    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
