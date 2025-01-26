# /etc/nixos/flake.nix
{
  description = "System config for mini pc";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Further flakes
    #zen-browser.url = "github:MarceColl/zen-browser-flake";
    #fak-fw.url = "github:semickolon/fak";
  };
  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.kea = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      # Inject all inputs into the module, not only nixpkgs:
      #specialArgs = { inherit inputs; };
      #extraSpecialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.js = import ./home.nix;
        }
      ];
    };
  };
}
