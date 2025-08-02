{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "lululufr";
    userEmail = "lucas.lm.miller@proton.me";

    aliases = {
      co = "checkout";
      ci = "commit";
      st = "status";
      br = "branch";
      hist = "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short";
      type = "cat-file -t";
      dump = "cat-file -p";
      undo = "reset --soft HEAD~1";
      amend = "commit --amend";
      unstage = "reset HEAD --";
      last = "log -1 HEAD";
      visual = "!gitk";
    };

    extraConfig = {
      init.defaultBranch = "main";
      core = {
        editor = "nvim";
        excludesfile = "~/.gitignore_global";
      };
      pull.rebase = true;
      merge.tool = "vimdiff";
      diff.colorMoved = "zebra";
      fetch.prune = true;
      rebase.autoStash = true;
    };

    delta = {
      enable = true;
      options = {
        navigate = true;
        light = false;
        side-by-side = true;
        line-numbers = true;
      };
    };
  };
}
