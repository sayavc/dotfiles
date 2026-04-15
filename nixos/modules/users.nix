{ config, lib, pkgs, ... }:
{
users.users.saya = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; 
};
users.users.saya.shell = pkgs.zsh;
}
