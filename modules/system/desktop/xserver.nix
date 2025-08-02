{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    xkb = {
      layout = "fr";
      variant = "azerty";
    };
    
    desktopManager.xterm.enable = false;
  };

  services.displayManager.defaultSession = "none+i3";
  environment.pathsToLink = [ "/libexec" ];
}
