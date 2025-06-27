{ pkgs, ... }: {

        # import host specific packages & configs 
        imports = [
            ../../../modules/desktops/hyprland
        ];
        
        home.packages = with pkgs; [
            firefox
            spotify
        ];

        catppuccin.flavor = "mocha";
}
