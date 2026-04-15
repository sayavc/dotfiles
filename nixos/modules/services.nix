{ config, lib, pkgs, ... }:
{

services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="drm", KERNEL=="card[0-9]*", DRIVERS=="amdgpu", ATTR{device/power_dpm_force_performance_level}="high"
'';
    
services.pipewire = {
    enable = true;
    pulse.enable = true;
};
services.logind.settings.Login = {
    HandlePowerKey = "poweroff";
};
services.keyd = {
    enable = true;
    keyboards.default = {
        ids = [ "*" ];
        settings = {
            main = {
                scrolllock = "toggle(arrows)";
            };
            arrows = {
                w = "up";
                a = "left";
                s = "down";
                d = "right";
            };
        };
    };
};
services.flatpak.enable = true;
services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    wayland.enable = true;
    theme = "";
    extraPackages = with pkgs; [ 
    sddm-astronaut
    kdePackages.qtsvg
    kdePackages.qtmultimedia
    kdePackages.qtvirtualkeyboard
    kdePackages.qt5compat
    pkgs.bibata-cursors
    ];
    settings = {
        General = {
            GreeterEnvironment = "QML2_IMPORT_PATH=${pkgs.kdePackages.qtmultimedia}/lib/qt-6/qml:${pkgs.kdePackages.qt5compat}/lib/qt-6/qml";
        };
        Theme = {
            ThemeDir = "/etc/sddm/themes/qylock/themes";
        };
    };
};
services.openssh.enable = true;
}
