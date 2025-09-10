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
    vlc

    coder

    #python
    python3
    poetry


    jetbrains.pycharm-community
    jetbrains.rust-rover
    #jetbrains-toolbox

    # Fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.ubuntu-mono
    font-awesome

  ];
}
