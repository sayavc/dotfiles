{ config, lib, pkgs, ... }:
{
programs.zsh = {
    enable = true;
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
};
niri-flake.cache.enable = true;
programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
};
programs.kdeconnect.enable = true;
programs.steam.enable = true;
}
