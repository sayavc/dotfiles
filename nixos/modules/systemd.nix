{ config, lib, pkgs, ... }:
{
systemd.services.sddm-random-theme = {
    wantedBy = [ "display-manager.service" ];
    before = [ "display-manager.service" ];
    script = ''
     themes=(dog-samurai nier-automata enfield forest last-of-us ninja_gaiden pixel-coffee pixel-dusk-city pixel-emerald pixel-hollowknight pixel-night-city R1999_1 star-rail sword wuwa)
     random_theme=''${themes[$RANDOM % ''${#themes[@]}]}
     mkdir -p /etc/sddm.conf.d 
     echo -e "[Theme]\nCurrent=$random_theme" > /etc/sddm.conf.d/random-theme.conf
     echo -n "$random_theme" > /tmp/current_sddm_theme
  '';
  serviceConfig = {
    Type = "oneshot";
    RemainAfterExit = true;
  };
  path = [ pkgs.bash ];
};
systemd.tmpfiles.rules = [
  "d /run/firejail 0755 root root -"
  "Z /run/firejail 0755 root root -"
  "A+ /home/saya-games - - - - u:saya:rwx"
  "A+ /home/saya-games - - - - d:u:saya:rwx"
  "A+ /home/saya-games - - - - m::rwx"
  "A+ /home/saya-games - - - - d:m::rwx"
];
}
