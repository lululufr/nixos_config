{ config, pkgs, lib, ... }:

{




imports = [

	./modules/home/default.nix
	./modules/home/development.nix
	./modules/home/packages.nix
	./modules/home/scripts.nix
	./modules/home/shell.nix
	./modules/home/terminal.nix
	./modules/home/git.nix


	./modules/home/desktop/i3.nix
	./modules/home/desktop/rofi.nix
	./modules/home/desktop/services.nix

  ./modules/home/desktop/stylix.nix
];


}
