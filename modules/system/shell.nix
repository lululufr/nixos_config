{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      update = "sudo nixos-rebuild switch --upgrade --flake /etc/nixos#tardis-nix";
      update-git = "cd /etc/nixos && git pull ; sudo git add -A && sudo git commit -m 'Update NixOS configuration $(date +%Y-%m-%d)' && sudo git push";
      update-full = "cd /etc/nixos && git pull ; sudo git add -A && sudo git commit -m 'Full-update NixOS configuration $(date +%Y-%m-%d)' && sudo git push && sudo nixos-rebuild switch --upgrade --flake /etc/nixos#tardis-nix && cd && echo 'Full upgrade DONE !'";
      list-gen = "nixos-rebuild list-generations";
      del-gen = "sudo nix-collect-garbage -d && sudo nixos-rebuild switch --flake /etc/nixos#tardis-nix";
      
    };

    histSize = 10000;
    histFile = "$HOME/.zsh_history";
    setOptions = [
      "HIST_IGNORE_ALL_DUPS"
    ];
  };
}
