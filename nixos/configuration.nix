{ config, lib, pkgs, ... }:
{
  imports = [
      ./hardware-configuration.nix
      ./modules/boot.nix
      ./modules/locale.nix
      ./modules/packages.nix 
      ./modules/services.nix
      ./modules/fonts.nix
      ./modules/networking.nix
      ./modules/security.nix
      ./modules/users.nix
      ./modules/programs.nix
      ./modules/binary-caches.nix
    ];
    programs.nix-ld.enable = true;
    nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11"; # Did you read the comment? yeah
}
