{ pkgs, lib, ...}:
{
    xdg.desktopEntries.sway = {
        name = "Sway";
        comment = "Sway Wayland Compositor";
        exec = "sway";
        type = "Application";
    };

    wayland.windowManager.sway = {
        enable = true;
        systemd.enable = true;
        package = pkgs.sway;

        config = {
            modifier = "Mod4";
            terminal = "foot";
            bars = [];

            input = {
                "type:keyboard" = {
                    xkb_layout = "us,ru";
                    xkb_options = "grp:caps_toggle,caps:none";
                };
            };
            output = {
                "VGA-1" = {
                    scale = "0.7";
                };
            };

            window = {
                border = 2;
                titlebar = false;
            };

            colors = {
                focused = {
                    border = "#596377"; background = "#596377"; text = "#ffffff"; indicator = "#596377"; childBorder = "#596377";
                };
                unfocused = {
                    border = "#2e3440"; background = "#2e3440"; text = "#888888"; indicator = "#2e3440"; childBorder = "#2e3440";
                };
            };

            keybindings = let
              mod = "Mod4";
              alt = "Mod1";
              ctrl = "Control";
              shift = "Shift";
            in {
                "${alt}+t" = "exec foot";
                "${alt}+space" = "exec nc -U /run/user/1000/walker/walker.sock";
                "${mod}+F1" = "exec swaync-client -t -sw";
                "${mod}+F2" = "exec swaync-client -d -sw";
                "XF86Back" = "exec librewolf";
                "XF86Forward" = "exec lutris";
                "Cancel" = "exec materialgram";
                "XF86Reload" = "exec steam";
                "${mod}+e" = "exec nautilus";

                "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
                "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
                "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

                "${mod}+q" = "kill";

                "${alt}+a" = "focus left";
                "${alt}+s" = "focus right";
                "${alt}+z" = "workspace next";
                "${alt}+x" = "workspace prev";

                "${alt}+${shift}+a" = "move left";
                "${alt}+${shift}+s" = "move right";
                "${alt}+${shift}+z" = "move container to workspace next";
                "${alt}+${shift}+x" = "move container to workspace prev";

                "${alt}+${ctrl}+s" = "resize shrink width 10 px";
                "${alt}+${ctrl}+a" = "resize grow width 10 px";
                "${alt}+${ctrl}+x" = "resize shrink height 10 px";
                "${alt}+${ctrl}+z" = "resize grow height 10 px";

                "${mod}+Tab" = "workspace back_and_forth";
                "${alt}+p" = "exec wtype 💜";
                "${mod}+t" = "floating toggle";
                "${mod}+f" = "fullscreen toggle";

                "${mod}+z" = "exec grim -g \"$(slurp)\" - | wl-copy";
                # Исправлена опечатка с '=' вместо '-'
                "${shift}+${mod}+z" = "exec grim -i $(swaymsg -t get_tree | jq -r '.. | select(.focused? == true).id') - | wl-copy";

                "${ctrl}+${alt}+Delete" = "exec swaymsg exit";
                "${mod}+${shift}+x" = "exec swaymsg 'output * power off'";
            }
            // lib.listToAttrs (builtins.concatMap (i: let
              targetWorkspace = toString (i + 1);
            in [
              {
                name = "${alt}+${toString i}";
                value = "workspace number ${targetWorkspace}";
              }
              {
                name = "${alt}+${shift}+${toString i}";
                value = "move container to workspace number ${targetWorkspace}";
              }
            ]) (lib.range 1 9));
        };
    };
}
