{ config, lib, pkgs, ... }:
{
systemd.services.sddm-random-theme = {
    wantedBy = [ "display-manager.service" ];
    before = [ "display-manager.service" ];
    script = ''
     themes=(dog-samurai nier-automata enfield forest last-of-us R1999_1 R1999_2 star-rail sword wuwa)
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

  "Z /home/saya-games 0770 saya-games users -"
  "a+ /home/saya-games - - - - u:saya:rwx,g::rwx,m::rwx,d:u:saya:rwx,d:m::rwx" 
  "w /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode - - - - 1"
];
powerManagement.powertop.enable = true;

systemd.services.powertop.postStart = ''
  for f in /sys/bus/usb/devices/*/product; do
    [ -f "$f" ] || continue
    read -r prod < "$f"
    case "$prod" in
      *[Mm][Oo][Uu][Ss][Ee]*)
        echo on > "''${f%/product}/power/control"
        ;;
    esac
  done
'';
}
