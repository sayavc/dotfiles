{ config, lib, pkgs, ... }:
{
environment.systemPackages = with pkgs; [
     wget
     neovim
     nix-search-cli
     git
     sddm-astronaut
     adw-gtk3
     python3
     imagemagick
     pkgs.kdePackages.kde-gtk-config
     gcc
     appimage-run
     icu
   ];
environment.variables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
};
}
