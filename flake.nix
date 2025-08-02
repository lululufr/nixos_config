{
  description = "NixOS system with Zen Browser, Stylix and NixVim";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
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
  
  outputs = { self, nixpkgs, flake-utils, zen-browser, stylix, nixvim, home-manager, ... }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
    in
    flake-utils.lib.eachSystem supportedSystems
      (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          packages.zen-browser = zen-browser.packages.${system}.default;
          apps.zen-browser = flake-utils.lib.mkApp {
            drv = self.packages.${system}.zen-browser;
          };
          devShell = pkgs.mkShell {
            packages = [ pkgs.git self.packages.${system}.zen-browser ];
          };
          defaultPackage = self.packages.${system}.zen-browser;
        }) // {
      nixosConfigurations."tardis-nix" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit self; };
        modules = [
          stylix.nixosModules.stylix
          nixvim.nixosModules.nixvim
          home-manager.nixosModules.home-manager
          ./configuration.nix
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              # Passer des arguments spéciaux à home-manager
              extraSpecialArgs = {
                # On passera l'image stylix ici après qu'elle soit définie
              };
              users.lucas = import ./home.nix;
            };
          }
          ({ pkgs, ... }: {
            environment.systemPackages = [
              self.packages.${pkgs.system}.zen-browser
            ];
          })
        ];
      };
    };
}
