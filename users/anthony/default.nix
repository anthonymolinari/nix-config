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

    # passwordless sudo
    security.sudo.extraRules = [{
        users = [ "anthony" ];
        commands = [ { command = "ALL"; options = [ "NOPASSWD" ]; } ];
    }];
}
