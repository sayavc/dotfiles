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
    .notification {
      border-radius: 12px;
      background: rgba(30, 30, 46, 0.50);
      color: #cdd6f4;
      padding: 12px;
      margin: 6px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
    }

    .notification-content {
      margin: 5px;
    }

    .control-center {
      background: rgba(30, 30, 46, 0.85);
      border-radius: 16px;
      color: #cdd6f4;
      padding: 15px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
      animation: slideLeft 0.40s cubic-bezier(0.16, 1, 0.3, 1) forwards;
      transition: all 0.2s ease-in-out;
      opacity: 1;
    }
    .control-center.collapsed {
        margin-left: -550px;
        margin-bottom: -100px;
        opacity: 0;
    }

    .widget-title button {
      background: rgba(49, 50, 68, 0.5);
      color: #f38ba8;
      padding: 4px 12px;
      border-radius: 8px;
    }
    .widget-title button:hover {
      background: rgba(69, 71, 90, 0.7);
    }

    .widget-dnd switch {
      border-radius: 12px;
      background: rgba(49, 50, 68, 0.5);
    }
    .widget-dnd switch:checked {
      background: #a6e3a1;
    }
    .widget-mpris {
      background: rgba(49, 50, 68, 0.4);
      padding: 12px;
      margin: 6px;
      border-radius: 12px;
    }
    .widget-mpris-player {
      padding: 6px;
      margin: 2px;
    }
    .widget-mpris-title {
      font-weight: bold;
      color: #cdd6f4;
    }
    .widget-mpris-subtitle {
      color: #a6adc8;
    }
    .widget-mpris-controller button {
      background: transparent;
      color: #cdd6f4;
    }
    .widget-mpris-controller button:hover {
      color: #89b4fa;
    }

    .widget-menubar {
      background: transparent;
      padding: 0;
      margin: 6px;
    }
    .widget-menubar button {
        min-width: 60px;
        min-height: 50px;
        background: rgba(49, 50, 68, 0.5);
        border-radius: 12px;
        margin: 4px;
        padding: 8px;
        transition: all 0.2s ease-in-out;
    }
    .widget-menubar button:hover {
        background: rgba(137, 180, 250, 0.2);
        color: #89b4fa;
    }
    .widget-menubar button label {
        font-size: 18px;
    }
    .widget-menubar button:first-child:hover {
        background: rgba(243, 139, 168, 0.2);
        color: #f38ba8;
    }
  '';
};
}
