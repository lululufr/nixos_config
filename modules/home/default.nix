{ config, pkgs, lib, ... }:
{
  
  home = {
    username = "lucas";
    homeDirectory = "/home/lucas";
    stateVersion = "24.11";
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      BROWSER = "firefox";
      TERMINAL = "alacritty";
      PAGER = "less -R";
      MANPAGER = "nvim +Man!";
    };
    file.".gitignore_global".text = ''
      *.swp
      *.swo
      *~
      .DS_Store
      .idea/
      .vscode/
      node_modules/
      **pycache**/
      *.pyc
      .env
      .env.local
    '';
  };
  
  # Configuration de base
  programs.home-manager.enable = true;
  
  # XDG
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      documents = "$HOME/Documents";
      download = "$HOME/Downloads";
      music = "$HOME/Music";
      pictures = "$HOME/Pictures";
      videos = "$HOME/Videos";
      desktop = "$HOME/Desktop";
      publicShare = "$HOME/Public";
      templates = "$HOME/Templates";
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "application/pdf" = "org.gnome.Evince.desktop";
        "image/*" = "feh.desktop";
        "video/*" = "mpv.desktop";
        "audio/*" = "mpv.desktop";
      };
    };
  };
  
  # GTK
  gtk = {
    enable = true;
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
  };
}
