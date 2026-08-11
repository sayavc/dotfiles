{ pkgs, ... }:
{
  gtk = {
    enable = true;

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    gtk4.theme = null;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    gtk3 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
      extraCss = ''
        @define-color accent_color #f3a0c3;
        @define-color accent_bg_color #f3a0c3;
        @define-color accent_fg_color #ffffff;

        @define-color selected_bg_color #f3a0c3;
        @define-color selected_fg_color #ffffff;
        @define-color focus_border_color #f3a0c3;

        @define-color accent_color_rgba rgba(243, 160, 195, 1.0);
        @define-color accent_bg_color_rgba rgba(243, 160, 195, 1.0);
        @define-color selected_bg_color_rgba rgba(243, 160, 195, 1.0);

        @define-color window_bg_color #2d2428;
        @define-color view_bg_color #2d2428;
        @define-color headerbar_bg_color #2d2428;
        @define-color dialog_bg_color #2d2428;

        @define-color window_fg_color #f3e5e5;
        @define-color view_fg_color #f3e5e5;
        @define-color headerbar_fg_color #f3e5e5;
      '';
    };

    gtk4 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
      extraCss = ''
        @define-color accent_color #f3a0c3;
        @define-color accent_bg_color #f3a0c3;
        @define-color accent_fg_color #ffffff;

        @define-color selected_bg_color #f3a0c3;
        @define-color selected_fg_color #ffffff;
        @define-color focus_border_color #f3a0c3;

        @define-color accent_color_rgba rgba(243, 160, 195, 1.0);
        @define-color accent_bg_color_rgba rgba(243, 160, 195, 1.0);
        @define-color selected_bg_color_rgba rgba(243, 160, 195, 1.0);

        @define-color window_bg_color #2d2428;
        @define-color view_bg_color #2d2428;
        @define-color headerbar_bg_color #2d2428;
        @define-color dialog_bg_color #2d2428;

        @define-color window_fg_color #f3e5e5;
        @define-color view_fg_color #f3e5e5;
        @define-color headerbar_fg_color #f3e5e5;
      '';
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };
}

