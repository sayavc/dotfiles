{ config, lib, pkgs, ... }:
{

boot.loader.grub.enable = true;
boot.loader.grub.device = "/dev/sda";
boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;

zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 75;
};
hardware.enableRedistributableFirmware = true;
hardware.cpu.intel.updateMicrocode = true;
hardware.firmware = [ pkgs.linux-firmware ];
boot.kernelParams = [ "nowatchdog" "mitigations=off" "loglevel=3" "amdgpu.runpm=0" "amdgpu.aspm=0" "pcie_aspm=off" "amdgpu.si_support=1" "radeon.si_support=0" ];
hardware.graphics.enable = true;
}
