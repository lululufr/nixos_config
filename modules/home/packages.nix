{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Applications graphiques
    spotify
    discord
    firefox
    pavucontrol
    networkmanagerapplet
    feh
    maim
    xclip

    # Outils de développement
    postman
    vscode
    lazygit
    coder

    # Outils système et CLI
    vim
    bat
    eza
    ranger
    ncdu
    ripgrep
    fd
    jq
    yq
    htop
    btop
    neofetch
    tree
    tldr
    httpie

    # Fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.ubuntu-mono
    font-awesome

  ];


}
