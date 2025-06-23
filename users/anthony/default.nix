{ pkgs, ... }: {
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.anthony = {
        isNormalUser = true;
        description = "anthony";
        extraGroups = [ 
            "networkmanager" 
            "wheel" 
        ];
        shell = pkgs.zsh;
    };
}
