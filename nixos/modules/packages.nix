{ config, lib, pkgs, xwayland-satellite, ... }:
{
environment.systemPackages = with pkgs; [
     cage
     qt6.qtshadertools
     qt6.qt5compat
     proton-vpn-cli
     ntfs3g
     wget
     neovim
     nix-search-cli
     git
     adw-gtk3
     python3
     imagemagick
     pkgs.kdePackages.kde-gtk-config
     gcc
     appimage-run
     xwayland-satellite.packages.${pkgs.system}.default
#end
   ];
environment.variables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
};
environment.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
};
environment.etc."sddm/themes/qylock" = {
    source = pkgs.fetchFromGitHub {
        owner = "Darkkal44";
        repo = "qylock";
        rev = "6946b53626b4f3c1507ae9a78c287411df5fb36c";
        hash = "sha256-79SHhz9ATD5ZpOjmOyoVZSrqstddJOfHrs+Drw4nvk0=";
        fetchSubmodules = true;
    };
};
}