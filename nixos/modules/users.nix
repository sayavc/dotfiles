{ config, lib, pkgs, ... }:
{
users.users.saya = {
    isNormalUser = true;
    extraGroups = [ "wheel" "keyd" "kvm" ]; 
    shell = pkgs.zsh;
};
users.users.saya-games = {
    isNormalUser = true;
    extraGroups = [ "audio" "video" "input" "render" ];
    packages = with pkgs; [
      lutris
      winetricks
      gamemode
      mangohud
      gamescope
      foot
    ];
};
}
