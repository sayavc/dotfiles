{ config, lib, pkgs, ... }:
{
programs.zsh = {
    enable = true;
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
};
programs.nano.enable = false;
niri-flake.cache.enable = true;
programs.firejail.enable = true;
programs.direnv.enable = true;
programs.direnv.nix-direnv.enable = true;
programs.gpu-screen-recorder.enable = true;
programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
};
programs.lazygit.enable = true;
programs.kdeconnect.enable = true;
programs.steam.enable = true;
programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
};
}
