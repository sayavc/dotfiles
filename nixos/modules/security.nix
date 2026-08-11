{ config, lib, pkgs, ... }:
{
security.doas.enable = true;
security.sudo.enable = false;
security.doas.extraRules = [{
    users = ["saya"];
    keepEnv = true;
    persist = true;
}];
security.doas.extraConfig = ''
  permit nopass keepenv saya as saya-games cmd /etc/profiles/per-user/saya-games/bin/lutris
'';
security.wrappers.firejail = {
    source = "${pkgs.firejail.out}/bin/firejail";
    owner = "root";
    group = "root";
    setuid = true;
};
}
