# /etc/nixos/flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };
  # outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
  outputs = inputs@{ self, nixpkgs, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./configuration.nix ];
    };
    # nixosConfigurations = {
    #   hostname = nixpkgs.lib.nixosSystem {
    #     system = "x86_64-linux";
    #     modules = [ 
    #       ./configuration.nix
    #       home-manager.nixosModules.home-manager
    #       {
    #         home-manager.useGlobalPkgs = true;
    #         home-manager.useUserPackages = true;
    #         home-manager.users.js = import ./home.nix;
    #       }
    #     ];
    #   };
    # };
  };
}
