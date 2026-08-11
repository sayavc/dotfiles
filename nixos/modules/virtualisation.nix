{ pkgs, ... }:
{
    virtualisation.libvirtd = {
        enable = true;
        qemu = {
            package = pkgs.qemu_kvm.override {
                cephSupport = false;
                glusterfsSupport = false;
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
}
