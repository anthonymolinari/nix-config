{ pkgs, ... }: {

    # enable flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # import shared modules
    imports = [
        ../../users/anthony
    ];

    environment.systemPackages = with pkgs; [
        just
        wget
    ];

    system.stateVersion = "25.05"; 
}
