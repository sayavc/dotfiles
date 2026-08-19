{ pkgs, config, ... }:
{
    services.swaync = {
        enable = true;

        settings = {
            positionX = "left";
            positionY = "bottom";
            layer = "overlay";
            control-center-layer = "overlay";
            layer-shell = true;

            "layer-shell-cover-screen" = false;

            fit-to-screen = false;
            control-center-margin-top = 10;
            control-center-margin-bottom = 10;
            control-center-margin-right = 10;
            control-center-margin-left = 0;

            notification-icon-size = 64;
            notification-body-image-height = 100;
            notification-body-image-width = 200;

            timeout = 3;
            timeout-low = 2;
            timeout-critical = 0;

            control-center-width = 400;
            control-center-height = 1000;
            notification-window-width = 500;
            keyboard-shortcuts = true;
            image-visibility = "always";
            transition-time = 200;
            hide-on-clear = true;
            hide-on-touch = true;

            cssPriority = "application";

            widgets = [
                "title"
                    "dnd"
                    "menubar#top"
                    "notifications"
                    "mpris"
                    "menubar#bottom"
            ];

            widget-config = {
                title = {
                    text = "Nya~";
                    clear-all-button = true;
                    button-text = "Clear All";
                };
                dnd = {
                    text = "Don't touch me please";
                };
                mpris = {
                    image-size = 96;
                    image-radius = 12;
                };
                "menubar#top" = {
                    "buttons#system" = {
                        position = "left";
                        actions = [
                        {
                            label = "󰍬";
                            command = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
                        }
                        ];
                    };
                };
                "menubar#bottom" = {
                    "buttons#system" = {
                        position = "left";
                        actions = [
                        {
                            label = "⏻";
                            command = "systemctl poweroff";
                        }
                        {
                            label = "󰜉";
                            command = "systemctl reboot";
                        }
                        ];
                    };
                };
            };
        };

        style = ''
            @keyframes slideLeft {
                from {
                    margin-left: -550px;
                    opacity: 0;
                }
                to {
                    margin-left: 10px;
                    opacity: 1;
                }
            }

        /* Sakura Moon */

        .notification {
            border-radius: 12px;
            background: rgba(45, 36, 40, 0.88);
            color: #f3e5e5;
            padding: 12px;
            margin: 6px;
            border: 1px solid rgba(243, 160, 195, 0.20);
            box-shadow: 0 4px 12px rgba(243, 160, 195, 0.15);
        }

        .notification-content {
            margin: 5px;
        }

        .control-center {
            background: rgba(45, 36, 40, 0.94);
            border-radius: 16px;
            color: #f3e5e5;
            padding: 15px;
            border: 1px solid rgba(243, 160, 195, 0.20);
            box-shadow: 0 4px 20px rgba(243, 160, 195, 0.20);
            animation: slideLeft 0.40s cubic-bezier(0.16, 1, 0.3, 1) forwards;
            transition: all 0.2s ease-in-out;
            opacity: 1;
        }

        .control-center.collapsed {
            margin-left: -550px;
            margin-bottom: -100px;
            opacity: 0;
        }

        /* Title */

        .widget-title {
            color: #f3e5e5;
        }

        .widget-title button {
            background: rgba(74, 58, 66, 0.65);
            color: #fbcce7;
            padding: 4px 12px;
            border-radius: 8px;
        }

        .widget-title button:hover {
            background: rgba(243, 160, 195, 0.20);
            color: #f3e5e5;
        }

        /* Do Not Disturb */

        .widget-dnd {
            color: #f3e5e5;
        }

        .widget-dnd switch {
            border-radius: 12px;
            background: rgba(74, 58, 66, 0.65);
        }

        .widget-dnd switch:checked {
            background: #8fcfa7;
        }

        /* MPRIS */

        .widget-mpris {
            background: rgba(74, 58, 66, 0.45);
            padding: 12px;
            margin: 6px;
            border-radius: 12px;
            border: 1px solid rgba(243, 160, 195, 0.12);
        }

        .widget-mpris-player {
            padding: 6px;
            margin: 2px;
        }

        .widget-mpris-title {
            font-weight: bold;
            color: #f3e5e5;
        }

        .widget-mpris-subtitle {
            color: #d2bfc7;
        }

        .widget-mpris-controller button {
            background: transparent;
            color: #d2bfc7;
        }

        .widget-mpris-controller button:hover {
            color: #8cb2f2;
        }

        /* Menubar */

        .widget-menubar {
            background: transparent;
            padding: 0;
            margin: 6px;
        }

        .widget-menubar button {
            min-width: 60px;
            min-height: 50px;
            background: rgba(74, 58, 66, 0.65);
            color: #f3e5e5;
            border-radius: 12px;
            margin: 4px;
            padding: 8px;
            transition: all 0.2s ease-in-out;
        }

        .widget-menubar button:hover {
            background: rgba(243, 160, 195, 0.18);
            color: #fbcce7;
        }

        .widget-menubar button label {
            font-size: 18px;
        }

        /* Microphone */

        .widget-menubar button:first-child:hover {
             background: rgba(140, 207, 202, 0.18);
             color: #8ecfca;
        }

        /* Power / reboot */

        .widget-menubar button:last-child:hover {
             background: rgba(229, 93, 135, 0.18);
             color: #e55d87;
        }
        '';
    };
}
