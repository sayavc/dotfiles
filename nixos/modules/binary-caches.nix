{ config, pkgs, ... }:
{
  nix.settings = {
      trusted-users = [ "root" "saya" ];
      substituters = [
          "https://cache.nixos.org"
          "https://nix-community.cachix.org"
          "https://niri.cachix.org"
          "https://chaotic-nyx.cachix.org"
      ];
      trusted-public-keys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "niri.cachix.org-1:WGWzld6viVvuNyRKYrA0LJuURF530872E5RH9ywwIYU="
          "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
      ];
  };
}

