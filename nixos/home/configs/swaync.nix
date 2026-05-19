{ pkgs, config, ... }:
{
    services.swaync = {
  enable = true;
  
  # Настройки самого конфига (автоматически конвертируются в config.json)
  settings = {
    positionX = "left";
    positionY = "bottom";
    layer = "overlay";
    control-center-layer = "overlay";
    layer-shell = true;
    cssPriority = "application";
    
    control-center-margin-top = 10;
    control-center-margin-bottom = 10;
    control-center-margin-right = 10;
    control-center-margin-left = 10;
    
    notification-icon-size = 64;
    notification-body-image-height = 100;
    notification-body-image-width = 200;
    
    timeout = 3;
    timeout-low = 2;
    timeout-critical = 0;
    
    fit-to-screen = true;
    control-center-width = 500;
    control-center-height = 600;
    notification-window-width = 500;
    keyboard-shortcuts = true;
    image-visibility = "always";
    transition-time = 200;
    hide-on-clear = true;
    hide-on-touch = true;
    
    widgets = [
      "title"
      "dnd"
      "notifications"
    ];
    
    widget-config = {
      title = {
        text = "Notifications";
        clear-all-button = true;
        button-text = "Clear all";
      };
      dnd = {
        text = "Do Not Disturb";
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
  '';
};
}
