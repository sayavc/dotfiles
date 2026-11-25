# overlays.nix 
[
  (final: prev: {
    libvirt = prev.libvirt.override {
      enableZfs = false;
    };
  })
]
