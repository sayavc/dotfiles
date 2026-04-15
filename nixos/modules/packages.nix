{ config, lib, pkgs, ... }:
{
environment.systemPackages = with pkgs; [
     ntfs3g
     wget
     neovim
     nix-search-cli
     git
     sddm-astronaut
     adw-gtk3
     python3
     imagemagick
     pkgs.kdePackages.kde-gtk-config
     kdePackages.qt5compat
     gcc
     appimage-run
     icu
   ];
environment.variables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
};
environment.etc."sddm/themes/qylock" = {
    source = pkgs.fetchFromGitHub {
        owner = "Darkkal44";
        repo = "qylock";
        rev = "main";
        hash = "sha256-DHHQXBxz9bUS7kogFyFiXYRCK88VBduuJQlEUO+oTMI=";
    };
};
}
