{ config, lib, pkgs, ... }:
{
fonts.packages = with pkgs; [
dejavu_fonts
nerd-fonts.meslo-lg
meslo-lgs-nf
];
}

