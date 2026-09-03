{pkgs, config, lib, ...}:
{
    programs.waybar = {
        enable = true;

        settings = {
            mainBar = {
                layer = "top";
                exclusive = false;

                modules-left = [ "cpu" ];
                modules-center = [ "clock" ];
                modules-right = [
                    "battery"
                ];

                cpu = {
                    format = "CPU {usage}%";
                };
                clock = {
                    format = "{:%H:%M}";
                };
                battery = {
                    format = "BAT {capacity}%";
                };
            };
        };

        style = ''
            * {
              font-family: monospace;
              font-size: 14px;
              color: #fbcce7;
            }

            window#waybar {
                background: rgba(243, 160, 195, 0.18);
            }

            #cpu,
            #clock,
            #battery {
                background: rgba(80, 45, 65, 0.55);

                padding: 2px 8px;
                margin: 2px;
                border-radius: 10px;
            }
            '';
    };
}
