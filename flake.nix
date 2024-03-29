{
  description = "Personal NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixos-hardware,
  } @ inputs: let
    system = "x86_64-linux";
    user = "luis";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in {
    formatter.${system} = pkgs.nixpkgs-fmt;

    devShell.${system} = pkgs.mkShell {
      nativeBuildInputs = with pkgs; [
        nil
      ];
      buildInputs = [];
    };

    nixosConfigurations = {
      lwirth-tp = lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;};
        modules = [
          ./configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.users.${user}.imports = [
              ./home.nix
            ];
          }

          ./hardware-lwirth-tp.nix
          nixos-hardware.nixosModules.lenovo-thinkpad-z
        ];
      };
    };
  };
}
