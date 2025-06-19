{ pkgs, ...} : {

    # Set your time zone.
    time.timeZone = "America/Los_Angeles";

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # import modules   
    imports = [
        ./boot.nix
        ./keyboard.nix
        ./network.nix
        ./storage.nix
        ./hardware-configuration.nix
    ];

    # enable programs & services
    programs.zsh.enable = true;
    services.openssh.enable = true;

    # extra system packages
    environment.systemPackages = with pkgs; [ 
        rsync 
        wget 
    ];
}
