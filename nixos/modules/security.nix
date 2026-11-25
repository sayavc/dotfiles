{ config, lib, pkgs, ... }:
{
security.doas.enable = true;
security.sudo.enable = false;
security.doas.extraConfig = ''
  permit nopass keepenv saya as saya-games cmd /etc/profiles/per-user/saya-games/bin/lutris
'';
security.wrappers.firejail = {
    source = "${pkgs.firejail.out}/bin/firejail";
    owner = "root";
    group = "root";
    setuid = true;
};

security.doas.extraRules = [
  {
      users = ["saya"];
      keepEnv = true;
      persist = true;
  }
  {
    users = [ "saya" ];
    noPass = true;
    cmd = "/run/current-system/sw/bin/iw";
    args = [ "dev" "wlp2s0" "set" "power_save" "off" ];
  }
  {
    users = [ "saya" ];
    noPass = true;
    cmd = "/run/current-system/sw/bin/iw";
    args = [ "dev" "wlp2s0" "set" "power_save" "on" ];
  }
];
}
