{
  description = "saya's nixos config";

   nixConfig = {
    extra-substituters = [
      "https://attic.xuyh0120.win/lantian"
      "https://cache.garnix.io"
    ];
    extra-trusted-public-keys = [
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niux = {
        url = "github:sayavc/niux";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
        url = "github:sodiboo/niri-flake";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    xwayland-satellite = {
        url = "github:Supreeeme/xwayland-satellite";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    nur.url = "github:nix-community/NUR";
  };

  outputs = { nixpkgs, home-manager, nix-cachyos-kernel, nur, niux, niri, xwayland-satellite, ... }: {
    nixosConfigurations.saya-nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit xwayland-satellite; };
      modules = [
        ./configuration.nix
        niri.nixosModules.niri
        ({ pkgs, ...}: { nixpkgs.overlays = [ niri.overlays.niri ]; })
        {
          nixpkgs.overlays = [ 
          nix-cachyos-kernel.overlays.default
          nur.overlays.default 
          ];
        }
      ];
    };
    homeConfigurations.saya = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inputs = { inherit niux; }; };
        modules = [ ./home/default.nix ];
    };
  };
}
