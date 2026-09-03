{ config, lib, pkgs, ... }:
{

boot.loader.limine = {
    enable = true;
    efiInstallAsRemovable = true;
};
boot.loader.efi.canTouchEfiVariables = false;
boot.kernelPackages = pkgs.linuxPackages_latest;
boot.kernelModules = [ "ntsync" ];

zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 75;
};

hardware.enableRedistributableFirmware = true;
hardware.cpu.amd.updateMicrocode = true;
boot.kernelParams = [ "amd_pstate=active" "quiet" "loglevel=3" "nmi_watchdog=0" "amdgpu.abmlevel=0" "ideapad_laptop.allow_v4_dytc=1" "amd_pmc.enable_stb=1" "mem_sleep_default=deep" ];
boot.blacklistedKernelModules = [ "tpm_rng" ];
hardware.graphics.enable = true;
}
