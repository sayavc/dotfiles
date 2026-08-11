{ config, lib, pkgs, ... }:
{
    services.udev.extraRules = ''
        ACTION=="add", SUBSYSTEM=="drm", KERNEL=="card[0-9]*", DRIVERS=="amdgpu", ATTR{device/power_dpm_force_performance_level}="high"
    '';
    
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
    services.yggdrasil = {
        enable = true;

        settings = {
            Peers = [
              "tcp://ip4.01.msk.ru.dioni.su:9002"
              "tls://ip4.01.msk.ru.dioni.su:9003"
              "tcp://45.147.200.202:12402"
              "tls://vix.duckdns.org:36014"
              "tcp://ygg-msk-1.averyan.ru:8363"
              "tcp://vpn.itrus.su:7991"
              "tls://vpn.itrus.su:7992"
            ];
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
    services.wakapi = {
        enable = true;

        environmentFiles = [ "/home/saya/private/wakapi" ];
        database = {
            dialect = "sqlite3";
            name = "wakapi.db";
        };

        settings = {
            server = {
                listen = "127.0.0.1:3000";
                public_url = "http://localhost:3000";
            };
        };
    };
}
