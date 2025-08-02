{ config, pkgs, ... }:

{
  # Configuration spécifique au développement
  # Variables d'environnement, configurations d'outils, etc.
  
  home.sessionVariables = {
    NODE_OPTIONS = "--max-old-space-size=4096";
  };
}
