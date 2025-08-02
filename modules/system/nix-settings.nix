{ config, pkgs, ... }:

{
  programs.dconf.enable = true;
  services.dbus.packages = [ pkgs.dconf ];
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = "nix-command flakes";
}
