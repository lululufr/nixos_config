{
  description = "NixOS system with Zen Browser, Stylix and NixVim";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    # ─── External flakes ──────────────────────────────────────────────
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";  # garde Stylix sur la même branche que nixpkgs
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, flake-utils, zen-browser, stylix, nixvim, home-manager, ... }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
    in
    flake-utils.lib.eachSystem supportedSystems (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        # ─── Packages & devShell specific to this system ────────────
        packages.zen-browser = zen-browser.packages.${system}.default;

        apps.zen-browser = flake-utils.lib.mkApp {
          drv = self.packages.${system}.zen-browser;
        };

        devShell = pkgs.mkShell {
          packages = [ pkgs.git self.packages.${system}.zen-browser ];
        };

        defaultPackage = self.packages.${system}.zen-browser;
      }
    ) // {

      # ─── NixOS host definition ────────────────────────────────────
      nixosConfigurations."tardis-nix" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        # Pass any needed values into the module graph
        specialArgs = {
          inherit self inputs;
        };

        modules = [
          # Import generic Nix settings (allowUnfree, experimental‑features…)
          ./modules/system/nix-settings.nix
          ./configuration.nix                       # main system config

          stylix.nixosModules.stylix                # Stylix (system scope)
          nixvim.nixosModules.nixvim                # NixVim
          home-manager.nixosModules.home-manager    # HM integration

          # ─── Home‑Manager configuration block ────────────────────
          {
            home-manager = {
                            useUserPackages     = true;
              backupFileExtension = "backup";

              # Stylix pour Home Manager (nouveau nom homeModules ≥26.05)
              sharedModules = [
                stylix.homeModules.stylix
                # Autorise les paquets unfree (Spotify) côté Home Manager
                ({ ... }: {
                  nixpkgs.config.allowUnfree = true;
                })];

              # Rendez tous les inputs disponibles aux modules HM si besoin
              extraSpecialArgs = inputs;

              # Déclare l'utilisateur principal géré par HM
              users.lucas = import ./home.nix;
            };
          }

          # Ajoute Zen Browser aux paquets globaux du système
          ({ pkgs, ... }: {
            environment.systemPackages = [ self.packages.${pkgs.system}.zen-browser ];
          })
        ];
      };
    };
}

