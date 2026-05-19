{ pkgs, ... }:
{ 
    programs.walker = {
        enable = true;
        runAsService = true;
        theme = null;

        config = {
          placeholder = "Поиск...";
          show_all = true;
          ignore_case = true;
          close_when_open = true;
          as_window = true;

          ui = {
            fullscreen = false;
            window_box = true;
            width = 480;
            height = 350;
          };
          default = [ "desktopapplications" "runner" "calc" "websearch"];
        };
    };

    xdg.configFile."walker/style.css" = {
        text = ''
          window {
            background: transparent;
          }

          box#box {
            background: rgba(30, 30, 46, 0.96);
            border-radius: 22px;
            border: 2px solid rgba(137, 180, 250, 0.45);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.7);
            padding: 8px;
          }

          entry {
            background: rgba(17, 17, 27, 0.95);
            border: 1px solid rgba(137, 180, 250, 0.5);
            border-radius: 16px;
            color: #cdd6f4;
            padding: 14px 20px;
            font-size: 1.25rem;
            margin: 12px;
          }

          row {
            padding: 10px 18px;
            border-radius: 12px;
            color: #cdd6f4;
            font-size: 1.1rem;
          }

          row:selected {
            background: rgba(137, 180, 250, 0.32);
          }

          image {
            margin-right: 12px;
          }
        '';
    };
}

