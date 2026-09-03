{
  description = "saya's nixos config";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://niri.cachix.org"
      "https://chaotic-nyx.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "niri.cachix.org-1:Wv00m07PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
      "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
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
        #url = "github:sodiboo/niri-flake";
        url = "github:bugeats/niri-flake/7e196a5ce0bf209d3aca844bb31edce5284d6484";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    xwayland-satellite = {
        url = "github:Supreeeme/xwayland-satellite";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
        url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    rip2 = {
        url = "github:MilesCranmer/rip2";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    concord = {
        url = "github:chojs23/concord";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
  };

  outputs = { nixpkgs, home-manager, nur, niux, niri, xwayland-satellite, quickshell, rip2, concord, ... }: {
    nixosConfigurations.saya-nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit xwayland-satellite; };
      modules = [
        ./configuration.nix
        niri.nixosModules.niri
        ({ pkgs, ...}: { nixpkgs.overlays = [ niri.overlays.niri ]; })
        {
          nixpkgs.overlays = [ 
	  niri.overlays.niri
          nur.overlays.default 
          ];
        }
      ];
    };
    homeConfigurations.saya = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
	    system = "x86_64-linux";
	    config.allowUnfree = true;
	    overlays = [
	    niri.overlays.niri
	    nur.overlays.default
	    ];
	};
        extraSpecialArgs = { inputs = { inherit niux quickshell rip2 concord; }; };
        modules = [ 
        ./home/default.nix
        ];
    };
  };
}

