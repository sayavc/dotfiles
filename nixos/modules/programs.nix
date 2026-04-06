{ config, lib, pkgs, ... }:
{
programs.zsh = {
    enable = true;
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
};
programs.niri.enable = true;
programs.kdeconnect.enable = true;
programs.steam.enable = true;
}
