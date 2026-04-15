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
  '';
  serviceConfig = {
    Type = "oneshot";
    RemainAfterExit = true;
  };
  path = [ pkgs.bash ];
};
}
