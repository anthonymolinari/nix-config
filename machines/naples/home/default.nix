{ pkgs, ... }: {

    # additional packages w/ config 
    home.packages = with pkgs; [
        firefox    
        steam
        spotify
    ];

}
