{ config, lib, pkgs, ... }:
{
programs.zsh = {
    enable = true;
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
};
programs.nano.enable = false;
programs.firejail.enable = true;
programs.direnv.enable = true;
programs.direnv.nix-direnv.enable = true;
programs.gpu-screen-recorder.enable = true;
programs.niri = {
    enable = true;
    package = pkgs.niri;
};
programs.lazygit.enable = true;
programs.kdeconnect.enable = true;
programs.steam.enable = true;
}
