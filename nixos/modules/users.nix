{ config, lib, pkgs, ... }:
{
users.users.saya = {
    isNormalUser = true;
    extraGroups = [ "wheel" "keyd" ]; 
};
users.users.saya.shell = pkgs.zsh;
}
