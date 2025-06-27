# shared home manager config - extended by machines/<host>/home
{ ... }: {

   home.username = "anthony";
   home.homeDirectory = "/home/anthony";
   home.sessionVariables = {
       EDITOR = "nvim";
   };

   imports = [
       ./apps/btop
       ./apps/fzf
       ./apps/git
       ./apps/kitty
       ./apps/lazygit
       ./apps/neofetch
       ./apps/nvim
       ./apps/ranger
       ./apps/rofi
       ./apps/tmux
       ./apps/yazi
       ./apps/zsh
   ];

    catppuccin.flavor = "mocha";
 
    programs.home-manager.enable = true;

    home.stateVersion = "25.05";
}
