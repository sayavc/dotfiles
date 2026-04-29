{ config, lib, pkgs, inputs, ... }:
{
    nixpkgs.config.allowUnfree = true;
    home.stateVersion = "25.11";
    home.username = "saya";
    home.homeDirectory = "/home/saya";

    imports = [
    ./packages.nix
    ./configs/default.nix 
    ];
    nixpkgs.overlays = import ./overlays.nix;
}
