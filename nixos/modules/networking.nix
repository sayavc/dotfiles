{ config, lib, pkgs, ... }:
{
networking.hostName = "saya-nixos";
networking.networkmanager.enable = true;
networking.nftables.enable = true;
networking.firewall.enable = true;
networking.iproute2.enable = true;
networking.networkmanager.wifi.powersave = false;
networking.firewall.allowedTCPPorts = [  59100 22 5900 65530 42243 ];
networking.firewall.allowedUDPPorts = [  59100 22 5900 65530 42243 ];
networking.firewall.allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
networking.firewall.allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];
}
