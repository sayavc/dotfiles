{ config, lib, pkgs, ... }:
{
networking.hostName = "saya-nixos";
networking.networkmanager.enable = true;
networking.firewall.allowedTCPPorts = [  59100 22 ];
networking.firewall.allowedUDPPorts = [  59100 22 ];
networking.firewall.allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
networking.firewall.allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];
}
