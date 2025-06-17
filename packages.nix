{ config, pkgs, ... } : 

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
	zfs
	neovim
	git
	plex
	openvpn3
	sonarr
	radarr
	prowlarr
	exportarr
  ];
}
