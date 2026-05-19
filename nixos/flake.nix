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
    walker = {
        url = "github:abenz1267/walker";
        inputs.nixpkgs.follows = "nixpkgs";
        inputs.elephant.follows = "elephant";
    };
    xwayland-satellite = {
        url = "github:Supreeeme/xwayland-satellite";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
        url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    elephant = {
        url = "github:abenz1267/elephant";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
  };

  outputs = { nixpkgs, home-manager, nur, niux, niri, xwayland-satellite, walker, quickshell, ... }: {
    nixosConfigurations.saya-nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit xwayland-satellite; };
      modules = [
        ./configuration.nix
        niri.nixosModules.niri
        ({ pkgs, ...}: { nixpkgs.overlays = [ niri.overlays.niri ]; })
        {
          nixpkgs.overlays = [ 
          nur.overlays.default 
          ];
        }
      ];
    };
    homeConfigurations.saya = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inputs = { inherit niux quickshell; }; };
        modules = [ 
        ./home/default.nix
        walker.homeManagerModules.default
        ];
    };
  };
}
