{ pkgs, ... }: {

    # the main nix config for bari
    networking.hostName = "bari"; # Define your hostname.

    # enable flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # import modules, desktop environment, services, etc.
    imports = [
        ../_common
        ./system
    ];

    networking.networkmanager.enable = true;

    environment.systemPackages = with pkgs; [
        catppuccin-sddm
    ];

    hardware.bluetooth.enable = true;
    services.blueman.enable = true;

    programs.zsh.enable = true;

    programs.hyprland.enable = true;

    services.displayManager.sddm = {
        wayland.enable = true;
        enable = true;
        theme = "catppuccin-mocha";
        package = pkgs.kdePackages.sddm;
    };

    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };
}
