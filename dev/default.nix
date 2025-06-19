{ pkgs, ... }: {

    home.packages = with pkgs; [
        nodejs_24
        python310
        go
    ];
}
