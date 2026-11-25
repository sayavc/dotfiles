{ pkgs, ... }:
{
    virtualisation.libvirtd = {
        enable = true;
        qemu = {
            package = pkgs.qemu_kvm.override {
                cephSupport = false;
                libiscsiSupport = false;
                smartcardSupport = false;
                usbredirSupport = false;
            };
            runAsRoot = false;
            swtpm.enable = false;
        };
        extraConfig = ''
            storage_driver = "dir"
        '';
    };
        virtualisation.waydroid.enable = true;
}
