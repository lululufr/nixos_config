{ config, pkgs, ... }:

{
  stylix = {
    enable = true;
    polarity = "dark";
    
    # Utiliser un chemin absolu pour le wallpaper
    #image = ../../wallpaper.png;
    
    # Ou si vous préférez utiliser un thème sans wallpaper :
    base16Scheme = "${pkgs.base16-schemes}/share/themes/github-dark.yaml";

    fonts = {
      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };
    };
    
    targets = {
      gtk.enable = true;
      i3.enable = true; 
      nixvim.enable = true;
      alacritty.enable = true;
      neovim.enable = true;
      vim.enable = true;
      firefox.enable = true;
      bat.enable = true;
      dunst.enable = true;
      nixos-icons.enable = true;
      rofi.enable = true;

    };

    opacity = {
      terminal = 0.95;
    };

    fonts.sizes = {
      terminal = 8;
      applications = 8;
      desktop = 8;
    };
  };
}
