# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.kernelModules = [ "kvm-amd" "mt7921e" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/10a16375-974e-42f4-97b4-83d36c998680";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-5bed133c-e06f-42ec-aa69-19a763197b8f".device = "/dev/disk/by-uuid/5bed133c-e06f-42ec-aa69-19a763197b8f";

  fileSystems."/boot/efi" =
    {
      device = "/dev/disk/by-uuid/46A0-BCE2";
      fsType = "vfat";
    };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/3c0da030-1fd0-485a-87ec-84261568a07c"; }];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp104s0f4u1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}