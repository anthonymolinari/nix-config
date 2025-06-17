{ config, pkgs, lib, ... }: 

let
  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz;
in
{
    imports = [ 
        (import "${home-manager}/nixos") 
    ];

    home-manager.users.anthony = { config, pkgs, ... }: {

	home.username = "anthony";
	home.homeDirectory = "/home/anthony";
	home.sessionVariables = {
	    EDITOR = "nvim";
	};

    home.packages = with pkgs; [ 
      btop
	  neovim
	  tmux
	  neofetch
	  ranger
	  wget
	  git
	  neofetch
	  zsh
      gh
      lazygit
      tmuxPlugins.sensible
      tmuxPlugins.prefix-highlight
      tmuxPlugins.mode-indicator
	];

    imports = [
        ./git
        ./neofetch
        ./tmux
        ./zsh
    ];

    home.stateVersion = "25.05";
    };
}
