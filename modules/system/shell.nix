{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      update = "sudo nixos-rebuild switch --upgrade --flake /etc/nixos#tardis-nix";
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
