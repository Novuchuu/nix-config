{
  description = "Austin's Multi-Host NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # This is the actual working repository
    niri.url = "github:sodiboo/niri-flake";
  };

  outputs = { self, nixpkgs, home-manager, niri, ... }@inputs: {
    nixosConfigurations = {
      pipsy = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/pipsy/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.novuchuu = {
              imports = [ 
                ./hosts/pipsy/home.nix
                # Correct attribute path for this flake
                inputs.niri.homeModules.niri
              ];
            };
          }
        ];
      };
    };
  };
}
