{ config, lib, pkgs, ... }:
{
security.doas.enable = true;
security.sudo.enable = false;
security.doas.extraRules = [{
    users = ["saya"];
    keepEnv = true;
    persist = true;
}];
}
