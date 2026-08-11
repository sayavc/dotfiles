{ config, lib, pkgs, ... }:
{

boot.loader.grub.enable = true;
boot.loader.grub.device = "/dev/sda";
boot.kernelPackages = pkgs.linuxPackages_latest;
boot.kernelModules = [ "ntsync" "bfq" ];

zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 75;
};
swapDevices = [
    {
        device = "/dev/disk/by-uuid/f572e03a-41b3-4cdc-8a08-9008a0342d2c";
    }
];

hardware.enableRedistributableFirmware = true;
hardware.cpu.intel.updateMicrocode = true;
hardware.firmware = [ pkgs.linux-firmware ];
boot.kernel.sysctl = {
    "vm.swappiness" = 10;
};
boot.kernelParams = [ "elevator=bfq" "workqueue.power_efficient=0" "nowatchdog" "mitigations=off" "loglevel=3" "amdgpu.runpm=0" "amdgpu.aspm=0" "pcie_aspm=off" "amdgpu.si_support=1" "radeon.si_support=0" ];
boot.blacklistedKernelModules = [ "radeon" ];
hardware.graphics.enable = true;
}
