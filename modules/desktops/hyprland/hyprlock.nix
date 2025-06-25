{ pkgs, ... }: {

    home.packages = with pkgs; [ hyprlock ];

    programs.hyprlock = {
        enable = true;
#       settings = {
#           general = {
#               disable_loading_bar = true;
#               grace = 300;
#               hide_cursor = true;
#               no_fade_in = false;
#           };
#           background = [{
#               blur_passes = 3;
#               blur_size = 8;
#           }];
#           input-fields =[{
#           }];
#       };
    };
}
