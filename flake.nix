{
  description = "NixOS system with Zen Browser, Stylix, community NixVim modules, and Mikael Fangel’s pre-built NixVim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    # ─── External flakes ────────────────────────────────────────────
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Community NixVim (expose modules/home integration)
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
        packages = {
          zen-browser   = zen-browser.packages.${system}.default;
        };

        apps.zen-browser = flake-utils.lib.mkApp {
          drv = self.packages.${system}.zen-browser;
        };

        devShell = pkgs.mkShell {
          packages = [
            pkgs.git
            self.packages.${system}.zen-browser
            self.packages.${system}.nixvimConfig
          ];
        };

        defaultPackage = self.packages.${system}.zen-browser;
      })
    // {

      # ─── NixOS host definition ────────────────────────────────────
      nixosConfigurations."tardis-nix" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = { inherit self inputs; };

        modules = [
          # Generic Nix settings & dconf
          ./modules/system/nix-settings.nix

          ./configuration.nix               # main system config

          stylix.nixosModules.stylix         # Stylix at system scope
          home-manager.nixosModules.home-manager

          # Extra system packages (Zen-Browser + Fangel’s NixVim build)
          ({ pkgs, inputs, self, ... }: {
            environment.systemPackages = [
              self.packages.${pkgs.system}.zen-browser
            ];
          })

          # ─── Home-Manager configuration block ────────────────────
          {
            home-manager = {
              useUserPackages     = true;  # HM gets its own pkgs
		backupFileExtension = "backup-$(date +%Y%m%d-%H%M%S)";

              sharedModules = [
                stylix.homeModules.stylix      # Stylix for HM
                nixvim.homeModules.nixvim      # community NixVim module
                ({ ... }: {
                  nixpkgs.config.allowUnfree = true;
                })
              ];

              extraSpecialArgs = inputs;
              users.lucas = import ./home.nix;
            };
          }
        ];
      };
    };
}

