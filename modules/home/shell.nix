{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    history = {
      size = 100000;
      save = 100000;
      extended = true;
      ignoreDups = true;
      share = true;
    };

    shellAliases = {
      # Navigation
      ls = "eza --icons --group-directories-first";
      ll = "eza -la --icons --group-directories-first";
      la = "eza -la --icons --group-directories-first";
      lt = "eza --tree --icons";

      # Éditeurs
      v = "nvim";
      vim = "nvim";
      code = "code .";

      # Python
      py = "python";
      venv = "python -m venv";

      # Divers
      ports = "ss -tulanp";
    };

    oh-my-zsh = {
      enable = true;
      theme = "nicoulaj";
      plugins = [
        "git" "docker" "docker-compose" "node" "npm"
        "python" "rust" "sudo" "command-not-found"
        "colored-man-pages" "extract" "z"
      ];
    };

    initContent = ''
      # Activer la complétion
      autoload -U compinit && compinit

      # Options ZSH utiles
      setopt AUTO_CD GLOB_DOTS HIST_VERIFY
      setopt INC_APPEND_HISTORY INTERACTIVE_COMMENTS
      setopt NO_BEEP PROMPT_SUBST


      # FZF key bindings
      source "${pkgs.fzf}/share/fzf/key-bindings.zsh"
      source "${pkgs.fzf}/share/fzf/completion.zsh"
    '';
  };

  # Autres outils shell
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "fd --type f --hidden --follow --exclude .git";
    defaultOptions = [
      "--height 40%"
      "--layout=reverse"
      "--border"
      "--preview 'bat --color=always --style=numbers --line-range=:500 {}'"
    ];
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [ "--cmd cd" ];
  };

  programs.bat = {
    enable = true;
    config = {
      number = true;
      line-range = ":500";
      wrap = "never";
    };
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    icons = "auto";
    git = true;
  };

  programs.btop = {
    enable = true;
    settings = {
      theme_background = false;
      update_ms = 1000;
      proc_tree = true;
      proc_gradient = true;
    };
  };
}
