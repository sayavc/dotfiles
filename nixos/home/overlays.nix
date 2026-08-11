# overlays.nix
[
 (final: prev: {
    openldap = prev.openldap.overrideAttrs (_: {
        doCheck = false;
        doInstallCheck = false;
        });
    })
 (final: prev: {
     fastfetch-unwrapped = prev.fastfetch-unwrapped.override {
         zfs = null;
         rpm = null;
         libpulseaudio = null;

     };
  })
]

