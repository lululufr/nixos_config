{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    xclip
    firefox
    librewolf
    alacritty
    nodejs
    gcc
    zip
    unzip
    python313
    (python311.withPackages (ps: with ps; [
      requests
      pip
    ]))
    pyright
    pipx
    killall
    gnome-themes-extra
    nix-template
    fzf
    lazygit
    fd

    xorg-xhost
  ];
}
