{ config, lib, pkgs, ... }:
{
    services.pipewire = {
        enable = true;
        pulse.enable = true;

        extraConfig.pipewire = {
            "10-phone-sink" = {
                "context.objects" = [
                {
                    factory = "adapter";
                    args = {
                        "factory.name" = "support.null-audio-sink";
                        "node.name" = "phone";
                        "node.description" = "Phone";
                        "media.class" = "Audio/Sink";
                        "audio.position" = [ "FL" "FR" ];
                        "monitor.channel-volumes" = true;
                        "monitor.passthrough" = true;
                        "priority.driver" = 2000;
                        "priority.session" = 2000;
                        "device.description" = "Phone";
                        "device.class" = "sound";
                        "device.icon-name" = "audio-card";
                    };
                }
                ];
            };
        };
    };
    services.upower.enable = true;
    services.logind.settings.Login = {
        HandlePowerKey = "poweroff";
    };
    services.fwupd.enable = true;
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
        wayland = {
            enable = true;
            compositor = "kwin";
        };
        theme = "";
        extraPackages = with pkgs; [ 
        kdePackages.qtsvg
        kdePackages.qtmultimedia
        kdePackages.qtvirtualkeyboard
        kdePackages.qt5compat
        pkgs.bibata-cursors
        ];
        settings = {
            Theme.CursorTheme = "Bibata-Modern-Classic";
            Theme.CursorSize = "12";
            General = {
                GreeterEnvironment = "QML2_IMPORT_PATH=${pkgs.kdePackages.qtmultimedia}/lib/qt-6/qml:${pkgs.kdePackages.qt5compat}/lib/qt-6/qml";
            };
            Theme = {
                ThemeDir = "/etc/sddm/themes/qylock/themes";
            };
        };
    };
    services.openssh.enable = true;
    services.power-profiles-daemon.enable = true;
}
