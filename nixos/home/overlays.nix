# overlays.nix
[
 (final: prev: {
    openldap = prev.openldap.overrideAttrs (_: {
        doCheck = false;
        doInstallCheck = false;
        });
    })
]

