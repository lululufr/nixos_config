{ config, pkgs, ... }:

{
  services.xserver.windowManager.i3 = {
    enable = true;
    extraPackages = with pkgs; [
      dmenu
      polybar
      i3status
      rofi
      picom
      feh
      dunst
      zoxide
      maim
      brightnessctl
    ];
  };

  programs.i3lock.enable = true;

  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;
  };
}
