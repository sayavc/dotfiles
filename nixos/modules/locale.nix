{ config, lib, pkgs, ... }:
{
time.timeZone = "Europe/Kiev";
i18n.defaultLocale = "en_US.UTF-8";
console = {
   # font = "Lat2-Terminus16";
   keyMap = "us";
   # useXkbConfig = true;
};
}

