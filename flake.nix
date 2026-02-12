{
  description = "A very basic flake";

  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, nur, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { 
      inherit system; 
      overlays = [
        (final: prev: { stable = import nixpkgs-stable { inherit system; config.allowUnfree = true; };})
	nur.overlays.default
      ];
      config.allowUnfree = true;
    };
  in
  {
      nixosConfigurations.initask = nixpkgs.lib.nixosSystem {

	specialArgs = { inherit inputs system pkgs; };
        modules = [
	  ./configuration.nix
	];
      };
  };
}

