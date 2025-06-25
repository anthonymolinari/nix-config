{ pkgs, inputs, ... }: {

    home.packages = with pkgs; [
        inputs.hyprdock.packages.${system}.default
    ];

#   programs.hyprdock = {
#       enable = true;
#       settings = {
#           monitor_name = "";
#           open_bar_command = {};
#       };
#   };
}
