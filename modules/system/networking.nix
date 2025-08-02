{ config, pkgs, ... }:

{
  networking.hostName = "tardis-nix";
  networking.networkmanager.enable = true;
}
