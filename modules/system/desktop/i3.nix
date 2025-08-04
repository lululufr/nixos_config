{ config, pkgs, ... }:

{
  services.xserver.windowManager.i3 = {
    enable = true;
    extraPackages = with pkgs; [
      dmenu
      i3status-rust
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
    settings = {
	refresh-rate = 144;
	  };
  };
}
