{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/system/boot.nix
    ./modules/system/networking.nix
    ./modules/system/locale.nix
    ./modules/system/users.nix
    ./modules/system/packages.nix
    ./modules/system/docker.nix
    ./modules/system/nix-settings.nix
    ./modules/system/desktop/xserver.nix
    ./modules/system/desktop/i3.nix
    ./modules/system/desktop/nvidia.nix
    ./modules/system/shell.nix


  ];


  system.stateVersion = "25.05";
}
